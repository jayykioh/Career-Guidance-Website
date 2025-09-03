/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author FPT
 */
public class UserDAO {

    public User checkLogin(String username, String password) {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password); // Nếu có hash, xử lý ở đây

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date expiry = rs.getDate("membership_expiry");
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        (expiry != null) ? expiry.toLocalDate() : null
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void insertToken(int userId, String token, LocalDateTime expiry) {
        String sql = "INSERT INTO remember_tokens (user_id, token, expiry_time) VALUES (?, ?, ?)";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, token);
            ps.setTimestamp(3, Timestamp.valueOf(expiry));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserByToken(String token) {
        String sql = "SELECT u.* FROM users u JOIN remember_tokens t ON u.id = t.user_id "
                + "WHERE t.token = ? AND t.expiry_time > NOW()";

        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, token);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date expiry = rs.getDate("membership_expiry");
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        (expiry != null) ? expiry.toLocalDate() : null
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public void deleteToken(String token) {
        String sql = "DELETE FROM remember_tokens WHERE token = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, token);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateMembershipExpiry(int userId, LocalDate newExpiryDate) {
        String sql = "UPDATE users SET membership_expiry = ? WHERE id = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setDate(1, Date.valueOf(newExpiryDate));
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date expiry = rs.getDate("membership_expiry");
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        (expiry != null) ? expiry.toLocalDate() : null
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

  public boolean extendMembership(int userId, int days) {
        String sql = "UPDATE users SET membership_expiry = ? WHERE id = ?";
        LocalDate expiry = LocalDate.now().plusDays(days);
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, expiry.toString());
            ps.setInt(2, userId);
            
            int rowsAffected = ps.executeUpdate();
            
            // Return true if at least one row was updated
            return rowsAffected > 0;
            
        } catch (Exception e) {
            System.err.println("Error extending membership for user " + userId + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean isUsernameTaken(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }
    
    
    public boolean registerUser(String username, String password, String fullName, String email) {
    String sql = "INSERT INTO users (username, password, full_name, email, membership_expiry) VALUES (?, ?, ?, ?, NULL)";
    try (Connection conn = DBContext.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, username);
        ps.setString(2, password); 
        ps.setString(3, fullName);
        ps.setString(4, email);

        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
    
    
    
}

    
    
    
  

}
