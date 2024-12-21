package dao;

import config.ConnectionDB;
import model.Authorities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthoritiesDAO {
    ConnectionDB connectionDB = new ConnectionDB();
    Connection connection = connectionDB.ConnectionDB();
    PreparedStatement preparedStatement;
    ResultSet resultSet;


    public List<Authorities> getAllRoles(){
        List<Authorities> authoritiesList = new ArrayList<>();
        String sql = "SELECT * FROM circuitsdb.authorities";

        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            preparedStatement.executeQuery();
            while (resultSet.next()) {
                authoritiesList.add(getAuthorities());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        try {
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



        return authoritiesList;
    }

    private Authorities getAuthorities() throws SQLException {
        return Authorities.builder()
                .nid(resultSet.getInt("nid"))
                .authority(resultSet.getString("authority"))
                .build();
    }
}
