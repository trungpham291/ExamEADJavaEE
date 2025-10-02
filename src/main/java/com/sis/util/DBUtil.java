package com.sis.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String URL =
            "jdbc:mysql://localhost:3306/sis?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
    private static final String USER = "root"; // hoặc root
    private static final String PASS = ""; // hoặc mật khẩu root

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
