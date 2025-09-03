package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3307/PRJ301_WEB?zeroDateTimeBehavior=CONVERT_TO_NULL";
        String user = "root";
        String password = "12345";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
