package Controller;

import DAO.RiasecDAO;
import Model.Career;
import Model.Question;
import Model.RiasecScore;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class RiasecTestServlet extends HttpServlet {

    private RiasecDAO dao = new RiasecDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị form câu hỏi
        List<Question> questions = null;
        try {
            questions = getQuestionsFromDB();
        } catch (Exception ex) {
            Logger.getLogger(RiasecTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("dashboard/test_Riasec.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RiasecScore score = calculateScore(request);

        try {
            saveResult(score); // Lưu vào test_result nếu cần
            int userId = 1; // Hoặc lấy từ session nếu có đăng nhập
            String userName = score.getUserName();
            dao.saveHistory(userId, userName, "RIASEC", score); // ⬅️ THÊM DÒNG NÀY
        } catch (Exception ex) {
            Logger.getLogger(RiasecTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        List<Career> suggestedCareers = null;
        try {
            suggestedCareers = getSuggestedCareers(score);
        } catch (Exception ex) {
            Logger.getLogger(RiasecTestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("score", score);
        request.setAttribute("careers", suggestedCareers);
        request.getRequestDispatcher("dashboard/result.jsp").forward(request, response);
    }

    // Method lấy câu hỏi từ database
    private List<Question> getQuestionsFromDB() throws Exception {
        return dao.getAllQuestions();
    }

    // Method tính điểm từ form
    private RiasecScore calculateScore(HttpServletRequest request) {
        RiasecScore score = new RiasecScore();

        // Lấy tên người dùng
        String userName = request.getParameter("userName");
        score.setUserName(userName);

        // Tính điểm cho từng loại RIASEC
        int realisticScore = 0;
        int investigativeScore = 0;
        int artisticScore = 0;
        int socialScore = 0;
        int enterprisingScore = 0;
        int conventionalScore = 0;

        // Giả sử có 60 câu hỏi, mỗi loại 10 câu
        // Câu hỏi 1-10: Realistic
        for (int i = 1; i <= 10; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                realisticScore += Integer.parseInt(answer);
            }
        }

        // Câu hỏi 11-20: Investigative
        for (int i = 11; i <= 20; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                investigativeScore += Integer.parseInt(answer);
            }
        }

        // Câu hỏi 21-30: Artistic
        for (int i = 21; i <= 30; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                artisticScore += Integer.parseInt(answer);
            }
        }

        // Câu hỏi 31-40: Social
        for (int i = 31; i <= 40; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                socialScore += Integer.parseInt(answer);
            }
        }

        // Câu hỏi 41-50: Enterprising
        for (int i = 41; i <= 50; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                enterprisingScore += Integer.parseInt(answer);
            }
        }

        // Câu hỏi 51-60: Conventional
        for (int i = 51; i <= 60; i++) {
            String answer = request.getParameter("q" + i);
            if (answer != null) {
                conventionalScore += Integer.parseInt(answer);
            }
        }

        // Set điểm vào object
        score.setRealistic(realisticScore);
        score.setInvestigative(investigativeScore);
        score.setArtistic(artisticScore);
        score.setSocial(socialScore);
        score.setEnterprising(enterprisingScore);
        score.setConventional(conventionalScore);

        return score;
    }

    // Method lưu kết quả vào database
    private void saveResult(RiasecScore score) throws Exception {
        dao.saveTestResult(score);
    }

    // Method lấy gợi ý nghề nghiệp
    private List<Career> getSuggestedCareers(RiasecScore score) throws Exception {
        return dao.getSuggestedCareers(score);
    }
}
