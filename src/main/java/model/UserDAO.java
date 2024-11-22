package model;

import config.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    ConnectionDB connectionDB = new ConnectionDB();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public User validar(final String userName, final String email) {
        User user = new User();
        String sql = "SELECT * FROM users WHERE USERNAME = ? AND EMAIL = ?";


        try {
            connection = connectionDB.ConnectionDB();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, email);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                user.setNid(resultSet.getInt("nid"));
                user.setUserName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return user;
    }
}
