package dao;

import config.ConnectionDB;
import model.Team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeamDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    public List<Team> getAllTeam() {

        List<Team> listTeam = new ArrayList<>();

        String query = """
                SELECT * FROM equipo
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                listTeam.add(getTeam(resultSet));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return listTeam;
    }

    public Team findById(final int nid) {

        String query = """
                SELECT * FROM equipo WHERE nid = ?
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             preparedStatement.setInt(1, nid);
             ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getTeam(resultSet);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return null;
    }

    //Create Team
    public void createTeam(final Team team) {

        String query = """
                INSERT INTO circuitsdb.equipo
                (nombre, logo_imagen, twitter)
                VALUES(?, ?, ?); 
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, team.getNombre());
            preparedStatement.setString(2, team.getLogoImage());
            preparedStatement.setString(3, team.getTwitter());
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //Update Team
    public void updateTeam(final Team team) {

        String query = """
                UPDATE circuitsdb.equipo
                SET nombre=?, logo_imagen=?, twitter=?
                WHERE nid=?; 
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, team.getNombre());
            preparedStatement.setString(2, team.getLogoImage());
            preparedStatement.setString(3, team.getTwitter());
            preparedStatement.setInt(4, team.getNid());
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //delete Team
    public void deleteTeam(final int id) {

        String query = """
                DELETE FROM circuitsdb.equipo
                WHERE nid= ?;
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }


    private Team getTeam(final ResultSet resultSet) throws SQLException {
        return Team.builder()
                .nid(resultSet.getInt("nid"))
                .nombre(resultSet.getString("nombre"))
                .logoImage(resultSet.getString("logo_imagen"))
                .twitter(resultSet.getString("twitter"))
                .build();
    }
}
