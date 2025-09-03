/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.admission_scores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mac
 */
public class AdmissionScoreDAO {

    public List<admission_scores> getAdmissionScoresByMajor(int majorId) {
        List<admission_scores> list = new ArrayList<>();

        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT \n"
                    + "            u.university_id,\n"
                    + "            u.university_name,\n"
                    + "            u.location,\n"
                    + "            admission_scores.admission_scores_year,\n"
                    + "            admission_scores.score,\n"
                    + "            cs.combination_code\n"
                    + "        FROM admission_scores \n"
                    + "        JOIN university_majors um ON admission_scores.university_majors_id = um.university_majors_id\n"
                    + "        JOIN universities u ON um.university_id = u.university_id\n"
                    + "        JOIN combination_subject cs ON um.combination_subject_id = cs.combination_subject_id\n"
                    + "        JOIN majors m ON um.major_id = m.major_id    \n"
                    + "        WHERE m.major_id = ?\n"
                    + "        ORDER BY u.university_id, admission_scores.admission_scores_id;";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, majorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                admission_scores score = new admission_scores();
                score.setUniversityId(rs.getInt("university_id"));
                score.setUniversityName(rs.getString("university_name"));
                score.setLocation(rs.getString("location"));
                score.setYear(rs.getInt("admission_scores_year"));
                score.setScore(rs.getDouble("score"));
                score.setCombinationCode(rs.getString("combination_code"));
                list.add(score);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

}
