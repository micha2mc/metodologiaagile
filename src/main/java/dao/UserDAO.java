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
    private final String queryCommon = """
                     SELECT u.nid AS nid_u, username, email, password, a.nid AS nid_a, authority, valid 
                     FROM users u 
                     LEFT JOIN authorities a ON u.nid_auth = a.nid
            """;

    ConnectionDB connectionDB = new ConnectionDB();
    Connection connection = connectionDB.ConnectionDB();


    public User validar(final String pass, final String email) {

        String sql = queryCommon.concat("""
                 WHERE u.PASSWORD = ? AND u.EMAIL = ?
                """);

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, pass);
            preparedStatement.setString(2, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                if (resultSet.next()) {
                    return getSingleUser(resultSet);
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

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.execute();
            return Boolean.TRUE;
        } catch (Exception e) {
            return Boolean.FALSE;
        }
    }

    public List<User> getAllUsers() {
        List<User> listUser = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(queryCommon)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listUser.add(getSingleUser(resultSet));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return listUser;
    }

    public void validateUserForAdmin(final int nid, final int idAuthority) {
        String queryUpdateUser = """
                UPDATE circuitsdb.users SET valid = ?, nid_auth = ? WHERE nid = ?
                """;
        try (PreparedStatement preparedStatement = connection.prepareStatement(queryUpdateUser)) {
            preparedStatement.setBoolean(1, Boolean.TRUE);
            preparedStatement.setInt(2, idAuthority);
            preparedStatement.setInt(3, nid);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public User findById(final int nid) {

        String query = queryCommon.concat("""
                 WHERE u.nid = ?
                """);
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, nid);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getSingleUser(resultSet);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return null;
    }


    private User getSingleUser(final ResultSet resultSet) throws SQLException {
        Authorities authorities = Authorities.builder()
                .nid(resultSet.getInt("nid_a"))
                .authority(resultSet.getString("authority"))
                .build();
        return User.builder()
                .nid(resultSet.getInt("nid_u"))
                .userName(resultSet.getString("username"))
                .email(resultSet.getString("email"))
                .password(resultSet.getString("password"))
                .valid(resultSet.getBoolean("valid"))
                .authorities(authorities)
                .build();
    }

    public void deleteUser(final int nid) {
        String queryUser = """
                DELETE FROM circuitsdb.users
                WHERE nid= ?;
                """;
        try (PreparedStatement preparedStatement = connection.prepareStatement(queryUser)) {
            preparedStatement.setInt(1, nid);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
