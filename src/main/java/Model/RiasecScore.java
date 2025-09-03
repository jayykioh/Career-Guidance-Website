
package Model;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import java.util.Map;
import java.util.stream.Collectors;

public class RiasecScore {
    private int realistic;
    private int investigative;
    private int artistic;
    private int social;
    private int enterprising;
    private int conventional;
    private String userName;
    private Date testDate;
    
    // Constructor
    public RiasecScore() {
        this.testDate = new Date();
    }
    
    public RiasecScore(int realistic, int investigative, int artistic, 
                      int social, int enterprising, int conventional) {
        this.realistic = realistic;
        this.investigative = investigative;
        this.artistic = artistic;
        this.social = social;
        this.enterprising = enterprising;
        this.conventional = conventional;
        this.testDate = new Date();
    }
    
      public int getRealisticScore() {
        return realistic;
    }

    public void setRealisticScore(int realisticScore) {
        this.realistic = realisticScore;
    }
    // Getters và Setters
    public int getRealistic() { return realistic; }
    public void setRealistic(int realistic) { this.realistic = realistic; }
    
    public int getInvestigative() { return investigative; }
    public void setInvestigative(int investigative) { this.investigative = investigative; }
    
    public int getArtistic() { return artistic; }
    public void setArtistic(int artistic) { this.artistic = artistic; }
    
    public int getSocial() { return social; }
    public void setSocial(int social) { this.social = social; }
    
    public int getEnterprising() { return enterprising; }
    public void setEnterprising(int enterprising) { this.enterprising = enterprising; }
    
    public int getConventional() { return conventional; }
    public void setConventional(int conventional) { this.conventional = conventional; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public Date getTestDate() { return testDate; }
    public void setTestDate(Date testDate) { this.testDate = testDate; }
    
    // Phương thức tìm loại có điểm cao nhất
    public String getDominantType() {
        int maxScore = Math.max(realistic, Math.max(investigative, 
                       Math.max(artistic, Math.max(social, 
                       Math.max(enterprising, conventional)))));
        
        if (maxScore == realistic) return "R";
        if (maxScore == investigative) return "I";
        if (maxScore == artistic) return "A";
        if (maxScore == social) return "S";
        if (maxScore == enterprising) return "E";
        if (maxScore == conventional) return "C";
        
        return "R"; // default
    }
    
    // Lấy 2 loại có điểm cao nhất
    public String getHollandCode() {
        Map<String, Integer> scores = new HashMap<>();
        scores.put("R", realistic);
        scores.put("I", investigative);
        scores.put("A", artistic);
        scores.put("S", social);
        scores.put("E", enterprising);
        scores.put("C", conventional);
        
        return scores.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .limit(2)
                .map(Map.Entry::getKey)
                .collect(Collectors.joining(""));
    }
    
    // Tính tổng điểm
    public int getTotalScore() {
        return realistic + investigative + artistic + social + enterprising + conventional;
    }
    
    // Lấy tất cả điểm dưới dạng Map
    public Map<String, Integer> getAllScores() {
        Map<String, Integer> allScores = new LinkedHashMap<>();
        allScores.put("Realistic", realistic);
        allScores.put("Investigative", investigative);
        allScores.put("Artistic", artistic);
        allScores.put("Social", social);
        allScores.put("Enterprising", enterprising);
        allScores.put("Conventional", conventional);
        return allScores;
    }
    
    // Phương thức để hiển thị kết quả
    @Override
    public String toString() {
        return String.format(
            "RIASEC Score: R=%d, I=%d, A=%d, S=%d, E=%d, C=%d (Code: %s)",
            realistic, investigative, artistic, social, enterprising, conventional,
            getHollandCode()
        );
    }
    
    
}