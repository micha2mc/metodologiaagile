package model;

import config.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    ConnectionDB connectionDB = new ConnectionDB();


    public User validar(final String userName, final String email) {

        String sql = """
                SELECT u.nid AS nid_u, username, email, a.nid AS nid_a, authority FROM users u
                JOIN users_has_authorities ua ON u.nid = ua.id_user_fk
                JOIN authorities a ON ua.id_authorities_fk = a.nid WHERE u.USERNAME = ? AND u.EMAIL = ?
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                if (resultSet.next()) {
                    Authorities authorities = Authorities.builder()
                            .nid(resultSet.getInt("nid_a"))
                            .authority(resultSet.getString("authority"))
                            .build();
                    return User.builder()
                            .nid(resultSet.getInt("nid_u"))
                            .userName(resultSet.getString("username"))
                            .email(resultSet.getString("email"))
                            .authorities(authorities)
                            .build();
                }

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }
}
