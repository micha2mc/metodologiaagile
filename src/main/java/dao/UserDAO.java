package dao;

import config.ConnectionDB;
import model.Authorities;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<User> getUserForAdmin() {
        List<User> listUser = new ArrayList<>();
        String query = """
                SELECT *
                FROM circuitsdb.users
                WHERE valid=FALSE;
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                listUser.add(getSingleUser(resultSet));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return listUser;
    }

    public void validateUserForAdmin(final User user, final int idAuthority) {
        String queryUpdateUser = """
                UPDATE circuitsdb.users SET valid = ? WHERE nid = ?
                """;
        String queryRelationship = """
                SELECT COUNT(*) FROM users_has_authorities WHERE id_user_fk = ? AND id_authorities_fk = ?
                """;
        String insertRelationship = """
                INSERT INTO users_has_authorities (id_user_fk, id_authorities_fk) VALUES (?, ?)
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(queryUpdateUser)) {
            preparedStatement.setBoolean(1, Boolean.TRUE);
            preparedStatement.setInt(2, user.getNid());
            preparedStatement.executeUpdate();
            //relacion entre user y Authority existe?
            try (PreparedStatement preStRelation = connection.prepareStatement(queryRelationship)) {
                preStRelation.setInt(1, user.getNid());
                preStRelation.setInt(2, idAuthority);
                // Si la relación no existe, la insertamos
                if (preStRelation.executeQuery().next()) {
                    PreparedStatement preStRelationInsert = connection.prepareStatement(insertRelationship);
                    preStRelationInsert.setInt(1, user.getNid());
                    preStRelationInsert.setInt(2, idAuthority);
                    preStRelationInsert.executeUpdate();

                }
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private User getSingleUser(final ResultSet resultSet) throws SQLException {
        return User.builder()
                .nid(resultSet.getInt("nid"))
                .userName(resultSet.getString("username"))
                .email(resultSet.getString("email"))
                .password(resultSet.getString("password"))
                .valid(resultSet.getBoolean("valid"))
                .build();
    }
}
