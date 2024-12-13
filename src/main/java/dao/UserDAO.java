package dao;

import config.ConnectionDB;
import model.Authorities;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    ConnectionDB connectionDB = new ConnectionDB();


    public User validar(final String pass, final String email) {

        String sql = """
                SELECT u.nid AS nid_u, username, email, a.nid AS nid_a, authority, valid 
                     FROM users u
                JOIN users_has_authorities ua ON u.nid = ua.id_user_fk
                JOIN authorities a ON ua.id_authorities_fk = a.nid WHERE u.PASSWORD = ? AND u.EMAIL = ?
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, pass);
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
                            .valid(resultSet.getBoolean("valid"))
                            .authorities(authorities)
                            .build();
                }

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    //Create

    public boolean createUser(final User user) {
        String query = """
                INSERT INTO circuitsdb.users
                (username, email, password)
                VALUES(?, ?, ?);
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.execute();
            return Boolean.TRUE;
        } catch (Exception e) {
            //throw new RuntimeException(e);
            return Boolean.FALSE;
        }
    }
}
