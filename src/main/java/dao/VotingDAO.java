package dao;

import config.ConnectionDB;
import model.Voting;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VotingDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    public Voting findById(final int id) {

        List<Voting> listTeam = new ArrayList<>();

        String query = """
                SELECT * FROM votacion WHERE nid = ?
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return getVoting(resultSet);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return null;
    }

    //Create Voting
    public void createVoting(final Voting voting, List<Integer> listIdPilotos) {

        String query = """
                INSERT INTO circuitsdb.votacion
                (titulo, descripcion, fecha_limite)
                VALUES(?, ?, ?); 
                """;
        String query2 = """
                INSERT INTO votaciones_pilotos (id_votacion, id_piloto) VALUES (?, ?)
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, voting.getTitulo());
            preparedStatement.setString(2, voting.getDescripcion());
            preparedStatement.setDate(3, Date.valueOf(voting.getFechaLimite()));
            preparedStatement.executeUpdate();
            try (PreparedStatement preparedStat = connection.prepareStatement(query2);
                 ResultSet rs = preparedStatement.getGeneratedKeys()) {
                if (rs.next()) {
                    int idVotacion = rs.getInt(1);
                    for (int idPiloto : listIdPilotos) {
                        preparedStat.setInt(1, idVotacion);
                        preparedStat.setInt(2, idPiloto);
                        preparedStat.addBatch();

                    }
                    preparedStat.executeBatch();
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //Update Voting
    public void updateVoting(final Voting voting) {

        String query = """
                UPDATE circuitsdb.votacion
                SET titulo=?, descripcion=?, fecha_limite=?
                WHERE nid=?;
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, voting.getTitulo());
            preparedStatement.setString(2, voting.getDescripcion());
            preparedStatement.setDate(3, Date.valueOf(voting.getFechaLimite()));
            preparedStatement.setInt(4, voting.getNid());
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //delete Team
    public void deleteVoting(final int id) {

        String query = """
                DELETE FROM circuitsdb.votacion
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

    private Voting getVoting(final ResultSet resultSet) throws SQLException {

        return Voting.builder()
                .nid(resultSet.getInt("nid"))
                .titulo(resultSet.getString("titulo"))
                .descripcion(resultSet.getString("descripcion"))
                .fechaLimite(resultSet.getDate("fecha_limite").toLocalDate())
                .build();
    }
}
