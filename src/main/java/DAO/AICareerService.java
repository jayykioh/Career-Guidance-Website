package DAO;


import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.List;
import java.util.ArrayList;
import Model.AICareerResponse;

public class AICareerService {
    private static final String OPENAI_API_URL = "https://api.openai.com/v1/chat/completions";

    // ✅ Load API key from environment variable instead of hardcoding
    private static final String API_KEY = System.getenv("OPENAI_API_KEY");

    private static final ObjectMapper mapper = new ObjectMapper();
    private static final HttpClient client = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(30))
            .build();

    /**
     * Generate the prompt for OpenAI API
     */
    private String generateCareerPrompt(String majors) {
        return String.format(
            "Tôi có danh sách ngành học sau: %s\n\n" +
            "Hãy phân tích và trả về một danh sách JSON với thông tin nghề nghiệp chi tiết. " +
            "Mỗi phần tử trong array phải có đúng 3 trường sau:\n\n" +
            "{\n" +
            "  \"carrie\": \"Tên nghề nghiệp cụ thể (ví dụ: Kỹ sư phần mềm, Nhà thiết kế UX/UI)\",\n" +
            "  \"paidment\": \"Mức lương chi tiết (VD: 15-30 triệu VNĐ/tháng tại VN, $50k-80k/năm tại Mỹ)\",\n" +
            "  \"futureNote\": \"Triển vọng và xu hướng phát triển (50-100 từ)\"\n" +
            "}\n\n" +
            "Yêu cầu:\n" +
            "- Trả về 3-5 nghề nghiệp phù hợp nhất\n" +
            "- Thông tin lương phải thực tế và cập nhật\n" +
            "- Triển vọng tương lai phải dựa trên xu hướng thị trường\n" +
            "- Chỉ trả về JSON array, không có text giải thích thêm\n" +
            "- Đảm bảo JSON format đúng chuẩn",
            majors
        );
    }

    /**
     * Call OpenAI API
     */
    public List<AICareerResponse> suggestCareers(String majorInput) throws IOException, InterruptedException {
        if (majorInput == null || majorInput.trim().isEmpty()) {
            throw new IllegalArgumentException("Major input không được trống");
        }

        // 🔒 Safety: check key before sending request
        if (API_KEY == null || API_KEY.isBlank()) {
            throw new IllegalStateException("❌ Missing OPENAI_API_KEY environment variable");
        }

        try {
            String prompt = generateCareerPrompt(majorInput.trim());
            String payload = createRequestPayload(prompt);

            HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(OPENAI_API_URL))
                .header("Content-Type", "application/json")
                .header("Authorization", "Bearer " + API_KEY)
                .timeout(Duration.ofSeconds(60))
                .POST(HttpRequest.BodyPublishers.ofString(payload))
                .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            return handleResponse(response);

        } catch (Exception e) {
            System.err.println("❌ Lỗi khi gọi OpenAI API: " + e.getMessage());
            return getFallbackSuggestions(majorInput);
        }
    }
    
    /**
     * Tạo JSON payload cho OpenAI request
     */
    private String createRequestPayload(String prompt) throws IOException {
        return String.format(
            "{\n" +
            "  \"model\": \"gpt-4o\",\n" +
            "  \"messages\": [\n" +
            "    {\n" +
            "      \"role\": \"system\",\n" +
            "      \"content\": \"Bạn là chuyên gia hướng nghiệp và phân tích thị trường lao động tại Việt Nam và quốc tế. Bạn có kiến thức sâu về mức lương, triển vọng nghề nghiệp và xu hướng tuyển dụng.\"\n" +
            "    },\n" +
            "    {\n" +
            "      \"role\": \"user\",\n" +
            "      \"content\": %s\n" +
            "    }\n" +
            "  ],\n" +
            "  \"temperature\": 0.3,\n" +
            "  \"max_tokens\": 2500,\n" +
            "  \"top_p\": 1.0,\n" +
            "  \"frequency_penalty\": 0.0,\n" +
            "  \"presence_penalty\": 0.0\n" +
            "}", mapper.writeValueAsString(prompt)
        );
    }
    
    /**
     * Xử lý response từ OpenAI API
     */
    private List<AICareerResponse> handleResponse(HttpResponse<String> response) throws IOException {
        if (response.statusCode() != 200) {
            String errorMsg = String.format("OpenAI API failed with status: %d, body: %s", 
                response.statusCode(), response.body());
            throw new RuntimeException(errorMsg);
        }
        
        try {
            String content = mapper
                .readTree(response.body())
                .get("choices")
                .get(0)
                .get("message")
                .get("content")
                .asText();
            
            return parseAIResponse(content);
            
        } catch (Exception e) {
            System.err.println("❌ Lỗi parse response: " + e.getMessage());
            System.err.println("Response body: " + response.body());
            throw new RuntimeException("Không thể parse response từ OpenAI", e);
        }
    }
    
    /**
     * Parse và clean JSON response từ AI
     */
    private List<AICareerResponse> parseAIResponse(String content) throws IOException {
        try {
            // Clean JSON - loại bỏ markdown formatting
            String cleanJson = content
                .replaceAll("(?s)^```json\\s*", "")
                .replaceAll("(?s)```\\s*$", "")
                .replaceAll("(?s)^```\\s*", "")
                .trim();
            
            // Log để debug
            System.out.println("🔍 Cleaned JSON: " + cleanJson);
            
            List<AICareerResponse> results = mapper.readValue(
                cleanJson, 
                new TypeReference<List<AICareerResponse>>() {}
            );
            
            // Validate results
            return validateAndFilterResults(results);
            
        } catch (Exception e) {
            System.err.println("❌ Lỗi parse JSON content: " + content);
            throw new IOException("Không thể parse JSON từ AI response", e);
        }
    }
    
    /**
     * Validate và filter kết quả từ AI
     */
    private List<AICareerResponse> validateAndFilterResults(List<AICareerResponse> results) {
        List<AICareerResponse> validResults = new ArrayList<>();
        
        for (AICareerResponse result : results) {
            if (isValidResponse(result)) {
                validResults.add(result);
            }
        }
        
        return validResults;
    }
    
    /**
     * Kiểm tra response có hợp lệ không
     */
    private boolean isValidResponse(AICareerResponse response) {
        return response != null && 
               response.getCarrie() != null && !response.getCarrie().trim().isEmpty() &&
               response.getPaidment() != null && !response.getPaidment().trim().isEmpty() &&
               response.getFutureNote() != null && !response.getFutureNote().trim().isEmpty();
    }
    
    /**
     * Fallback data khi API fail
     */
    private List<AICareerResponse> getFallbackSuggestions(String majorInput) {
        List<AICareerResponse> fallback = new ArrayList<>();
        
        fallback.add(new AICareerResponse(
            "Kỹ sư phần mềm",
            "15-35 triệu VNĐ/tháng tại VN, $60k-120k/năm tại Mỹ",
            "Nhu cầu cao trong kỷ nguyên số hóa. Cơ hội phát triển về AI, cloud computing, mobile app."
        ));
        
        fallback.add(new AICareerResponse(
            "Chuyên viên phân tích dữ liệu",
            "12-28 triệu VNĐ/tháng tại VN, $55k-95k/năm tại Mỹ",
            "Ngành hot với big data và AI. Triển vọng tốt trong fintech, e-commerce, marketing."
        ));
        
        fallback.add(new AICareerResponse(
            "Product Manager",
            "20-45 triệu VNĐ/tháng tại VN, $80k-150k/năm tại Mỹ",
            "Vị trí then chốt trong các công ty tech. Cần kỹ năng kết hợp business và technical."
        ));
        
        System.out.println("⚠️ Sử dụng dữ liệu fallback do API không khả dụng");
        return fallback;
    }
}