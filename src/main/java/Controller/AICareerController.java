/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AICareerService;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.AICareerResponse;

/**
 *
 * @author mac
/
*/


@WebServlet("/api/ai-careers")
public class AICareerController extends HttpServlet {
    private AICareerService aiCareerService;
    private ObjectMapper objectMapper;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.aiCareerService = new AICareerService();
        this.objectMapper = new ObjectMapper();
    }
    
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    ObjectMapper objectMapper = new ObjectMapper();  // ✅ Đã thêm

    try {
        HttpSession session = request.getSession();
        Object scoreObj = session.getAttribute("score");

        String majorInput = request.getParameter("majors");
        if (majorInput == null || majorInput.trim().isEmpty()) {
            if (scoreObj != null) {
                majorInput = generateMajorsFromScore(scoreObj);
            } else {
                sendErrorResponse(response, "Không tìm thấy thông tin để phân tích");
                return;
            }
        }

        List<AICareerResponse> aiSuggestions = aiCareerService.suggestCareers(majorInput);

        // Debug log chỉ in ra console, không vào response
        for (AICareerResponse ai : aiSuggestions) {
            System.out.println(ai);  // ✅ OK
        }

        session.setAttribute("aiCareerSuggestions", aiSuggestions);

        String json = objectMapper.writeValueAsString(aiSuggestions);
        response.getWriter().write(json);  // ✅ Đúng

    } catch (Exception e) {
        e.printStackTrace();
        sendErrorResponse(response, "Lỗi khi xử lý yêu cầu: " + e.getMessage());
    }
}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            List<AICareerResponse> aiSuggestions = 
                (List<AICareerResponse>) session.getAttribute("aiCareerSuggestions");
            
            PrintWriter out = response.getWriter();
            if (aiSuggestions != null) {
                out.print(objectMapper.writeValueAsString(aiSuggestions));
            } else {
                out.print("[]");
            }
            out.flush();
            
        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(response, "Lỗi khi lấy dữ liệu: " + e.getMessage());
        }
    }
    
    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        PrintWriter out = response.getWriter();
        out.print("{\"error\": \"" + message + "\"}");
        out.flush();
    }
    
    private String generateMajorsFromScore(Object scoreObj) {
        // Giả sử scoreObj có các phương thức để lấy điểm số
        // Bạn cần điều chỉnh theo cấu trúc thực tế của score object
        try {
            // Ví dụ: sử dụng reflection hoặc cast về đúng type
            // String hollandCode = ((Score) scoreObj).getHollandCode();
            // return convertHollandCodeToMajors(hollandCode);
            
            // Tạm thời return một chuỗi mặc định
            return "Công nghệ thông tin, Kỹ thuật, Kinh doanh";
        } catch (Exception e) {
            return "Các ngành phổ biến";
        }
    }
}

