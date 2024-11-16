/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author micha
 */
public class ConnectionDB {

    private static final String URL = "jdbc:mysql://localhost:3306/circuitsdb?"
            + "useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private static final String USER = "root";
    private static final String PSW = "";

    private Connection connection;

    public Connection ConnectionDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PSW);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return connection;
    }

}
