package DAO;

import Model.Universities;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UniversitiesDAO {

    public Universities getUniversitiesByCode(String university_code) {
        Universities university = null;

        String sql = "SELECT \n"
                + "    university_id,\n"
                + "    university_code,\n"
                + "    university_name,\n"
                + "    location,\n"
                + "    url_pattern,\n"
                + "    CASE \n"
                + "        WHEN region_id = 1 THEN 'Miền Bắc'\n"
                + "        WHEN region_id = 2 THEN 'Miền Trung'\n"
                + "        WHEN region_id = 3 THEN 'Miền Nam'\n"
                + "        ELSE 'Không xác định'\n"
                + "    END AS region_name\n"
                + "FROM universities\n"
                + "WHERE university_code = ?";

        try (Connection con = DBContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, university_code);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                university = new Universities();
                university.setUniversity_id(rs.getInt("university_id"));
                university.setUniversity_code(rs.getString("university_code"));
                university.setUniversity_name(rs.getString("university_name"));
                university.setLocation(rs.getString("location"));
                university.setUrl_pattern(rs.getString("url_pattern"));
                university.setRegion_name(rs.getString("region_name"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return university;
    }

    public List<Universities> getAllUniversities() {
        List<Universities> list = new ArrayList<>();
        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT \n"
                    + "    university_id,\n"
                    + "    university_code,\n"
                    + "    university_name,\n"
                    + "    location,\n"
                    + "    url_pattern,\n"
                    + "    CASE \n"
                    + "        WHEN region_id = 1 THEN 'Miền Bắc'\n"
                    + "        WHEN region_id = 2 THEN 'Miền Trung'\n"
                    + "        WHEN region_id = 3 THEN 'Miền Nam'\n"
                    + "        ELSE 'Không xác định'\n"
                    + "    END AS region_name\n"
                    + "FROM universities;";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Universities universities = new Universities();
                universities.setUniversity_id(rs.getInt("university_id"));
                universities.setUniversity_code(rs.getString("university_code"));
                universities.setUniversity_name(rs.getString("university_name"));
                universities.setLocation(rs.getString("location"));
                universities.setUrl_pattern(rs.getString("url_pattern"));
                universities.setRegion_name(rs.getString("region_name"));
                list.add(universities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Universities> getAllUniversitiesWithMajor(int majorId) {
        List<Universities> list = new ArrayList<>();
        try (Connection con = DBContext.getConnection()) {
            String sql = "SELECT DISTINCT \n"
                    + "    u.university_id,\n"
                    + "	u.university_name,\n"
                    + "    u.location,\n"
                    + "    u.url_pattern\n"
                    + "FROM university_majors um\n"
                    + "JOIN universities u ON um.university_id = u.university_id\n"
                    + "JOIN majors m ON um.major_id = m.major_id\n"
                    + "WHERE m.major_id = ?\n";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, majorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Universities universities = new Universities();
                universities.setUniversity_id(rs.getInt("university_id"));
                universities.setUniversity_name(rs.getString("university_name"));
                universities.setLocation(rs.getString("location"));
                universities.setUrl_pattern(rs.getString("url_pattern"));
                list.add(universities);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
