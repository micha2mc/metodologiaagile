package dao;

import config.ConnectionDB;
import model.Participante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ParticipanteDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    public Participante getParticipanteByEmail(final String email) {
        String query = """
                SELECT 
                    *
                FROM 
                    circuitsdb.participantes
                WHERE 
                    email = ?
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return Participante.builder()
                        .nid(resultSet.getInt("nid"))
                        .userName(resultSet.getString("username"))
                        .email(resultSet.getString("email"))
                        .build();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void createParticipante(final Participante partic) {
        String query = """
                INSERT INTO circuitsdb.participantes
                (username, email, corresponsal, id_team)
                VALUES(?, ?, ?, ?);
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, partic.getUserName());
            statement.setString(2, partic.getEmail());
            statement.setBoolean(3, partic.isCorresponsal());
            statement.setInt(4, partic.getId_team());
            statement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Participante> getCorresponsalesByTeam(final int nid) {
        List<Participante> participanteList = new ArrayList<>();
        String query = """
                SELECT *
                FROM circuitsdb.participantes
                WHERE id_team = ?;
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, nid);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Participante participante = Participante.builder()
                        .nid(resultSet.getInt("nid"))
                        .userName(resultSet.getString("username"))
                        .email(resultSet.getString("email"))
                        .build();
                participanteList.add(participante);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return participanteList;
    }

    public void delete(final Integer nid) {

        String query = """
                DELETE FROM circuitsdb.participantes
                WHERE nid = ?;
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, nid);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
