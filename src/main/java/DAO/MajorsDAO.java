package DAO;

import Model.admission_scores;
import Model.majors;
import Model.parent_major;
import Model.university_majors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MajorsDAO {

    public majors getMajorById(int majorId) {
        majors major = null;
        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT * FROM majors WHERE major_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, majorId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                major = new majors();
                major.setId(rs.getInt("major_id"));
                major.setName(rs.getString("major_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return major;
    }

    public List<parent_major> getAllParentMajorsWithMajors() {
        List<parent_major> parentMajors = new ArrayList<>();
        Map<Integer, parent_major> parentMajorMap = new HashMap<>();

        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT \n"
                    + "    pm.parent_major_id,\n"
                    + "    pm.parent_major_name,\n"
                    + "    m.major_id,\n"
                    + "    m.major_name\n"
                    + "FROM parent_major pm\n"
                    + "JOIN combination_parent_major cpm ON pm.parent_major_id = cpm.parent_major_id\n"
                    + "JOIN majors m ON cpm.major_id = m.major_id\n"
                    + "ORDER BY pm.parent_major_id, m.major_id;";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int parentMajorId = rs.getInt("parent_major_id");
                String parentMajorName = rs.getString("parent_major_name");
                int majorId = rs.getInt("major_id");
                String majorName = rs.getString("major_name");

                // Tạo hoặc lấy parent_major từ map
                parent_major parentMajor = parentMajorMap.get(parentMajorId);
                if (parentMajor == null) {
                    parentMajor = new parent_major();
                    parentMajor.setId(parentMajorId);
                    parentMajor.setName(parentMajorName);
                    parentMajor.setMajors(new ArrayList<>());
                    parentMajorMap.put(parentMajorId, parentMajor);
                    parentMajors.add(parentMajor);
                }

                // Tạo và thêm major vào parent_major
                majors major = new majors();
                major.setId(majorId);
                major.setName(majorName);
                parentMajor.getMajors().add(major);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return parentMajors;
    }

    // Method để search ngành theo tên chính xác (cho kết quả hiển thị)
    public List<parent_major> searchMajorsByExactName(String majorName) {
        List<parent_major> parentMajors = new ArrayList<>();
        Map<Integer, parent_major> parentMajorMap = new HashMap<>();

        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT \n"
                    + "    pm.parent_major_id,\n"
                    + "    pm.parent_major_name,\n"
                    + "    m.major_id,\n"
                    + "    m.major_name\n"
                    + "FROM parent_major pm\n"
                    + "JOIN combination_parent_major cpm ON pm.parent_major_id = cpm.parent_major_id\n"
                    + "JOIN majors m ON cpm.major_id = m.major_id\n"
                    + "WHERE m.major_name = ?\n"
                    + "ORDER BY pm.parent_major_id, m.major_id;";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, majorName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int parentMajorId = rs.getInt("parent_major_id");
                String parentMajorName = rs.getString("parent_major_name");
                int majorId = rs.getInt("major_id");
                String majorNameResult = rs.getString("major_name");

                // Tạo hoặc lấy parent_major từ map
                parent_major parentMajor = parentMajorMap.get(parentMajorId);
                if (parentMajor == null) {
                    parentMajor = new parent_major();
                    parentMajor.setId(parentMajorId);
                    parentMajor.setName(parentMajorName);
                    parentMajor.setMajors(new ArrayList<>());
                    parentMajorMap.put(parentMajorId, parentMajor);
                    parentMajors.add(parentMajor);
                }

                // Tạo và thêm major vào parent_major
                majors major = new majors();
                major.setId(majorId);
                major.setName(majorNameResult);
                parentMajor.getMajors().add(major);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return parentMajors;
    }

    public List<majors> getMajorsByUniversityCode(String universityCode) {
        List<majors> list = new ArrayList<>();

        String sql = "SELECT DISTINCT m.major_id, m.major_name "
                + "FROM majors m "
                + "JOIN university_majors um ON m.major_id = um.major_id "
                + "JOIN universities u ON um.university_id = u.university_id "
                + "WHERE u.university_code = ?";

        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, universityCode);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                majors major = new majors();
                major.setId(rs.getInt("major_id"));
                major.setName(rs.getString("major_name"));
                list.add(major);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
