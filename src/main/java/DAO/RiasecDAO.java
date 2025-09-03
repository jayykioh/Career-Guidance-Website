package DAO;

import Model.Career;
import Model.RiasecScore;
import Model.Question;
import Model.TestHistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RiasecDAO {

    public List<Career> getSuggestedCareers(RiasecScore score) throws Exception {
        List<Career> careers = new ArrayList<>();
        String dominantType = score.getDominantType();

        try (Connection conn = DBContext.getConnection()) {
            String sql = "SELECT * FROM careers WHERE primary_type = ? OR secondary_type = ? ORDER BY career_name";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, dominantType);
            stmt.setString(2, dominantType);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Career career = new Career();
                career.setName(rs.getString("career_name"));
                career.setDescription(rs.getString("description"));
                careers.add(career);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return careers;
    }

    public List<Question> getAllQuestions() throws Exception {
        List<Question> questions = new ArrayList<>();
        String sql = "SELECT * FROM questions ORDER BY id";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("id"));
                question.setQuestionText(rs.getString("question_text"));
                question.setCategory(rs.getString("category"));
                questions.add(question);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }

    public void saveTestResult(RiasecScore score) throws Exception {
        String sql = "INSERT INTO test_results (user_name, realistic_score, investigative_score, "
                + "artistic_score, social_score, enterprising_score, conventional_score) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, score.getUserName());
            stmt.setInt(2, score.getRealistic());
            stmt.setInt(3, score.getInvestigative());
            stmt.setInt(4, score.getArtistic());
            stmt.setInt(5, score.getSocial());
            stmt.setInt(6, score.getEnterprising());
            stmt.setInt(7, score.getConventional());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // RiasecDAO.java (phần bổ sung)
    public void saveHistory(int userId, String userName, String testName, RiasecScore sc) throws Exception {
        String sql = "INSERT INTO test_history (user_id, user_name, test_name, test_date, realistic_score, investigative_score, artistic_score, social_score, enterprising_score, conventional_score, holland_code) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection c = DBContext.getConnection(); PreparedStatement st = c.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setString(2, userName);
            st.setString(3, testName);
            st.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
            st.setInt(5, sc.getRealistic());
            st.setInt(6, sc.getInvestigative());
            st.setInt(7, sc.getArtistic());
            st.setInt(8, sc.getSocial());
            st.setInt(9, sc.getEnterprising());
            st.setInt(10, sc.getConventional());
            st.setString(11, sc.getHollandCode());
            st.executeUpdate();
        }
    }

    public List<TestHistory> getHistoryByUser(int userId) throws Exception {
        List<TestHistory> list = new ArrayList<>();
        String sql = "SELECT * FROM test_history "
                + "WHERE user_id = ? "
                + "ORDER BY test_date DESC";

        try (Connection c = DBContext.getConnection(); PreparedStatement st = c.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TestHistory h = new TestHistory();
                h.setHistoryId(rs.getInt("history_id"));
                h.setUserId(rs.getInt("user_id"));
                h.setUserName(rs.getString("user_name"));
                h.setTestName(rs.getString("test_name"));
                h.setTestDate(rs.getTimestamp("test_date").toLocalDateTime());
                h.setRealisticScore(rs.getInt("realistic_score"));
                h.setInvestigativeScore(rs.getInt("investigative_score"));
                h.setArtisticScore(rs.getInt("artistic_score"));
                h.setSocialScore(rs.getInt("social_score"));
                h.setEnterprisingScore(rs.getInt("enterprising_score"));
                h.setConventionalScore(rs.getInt("conventional_score"));
                h.setHollandCode(rs.getString("holland_code"));

                list.add(h);
            }
        }
        return list;
    }
}
