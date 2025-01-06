package dao;

import config.ConnectionDB;
import model.Pilot;
import model.Voting;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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

    public Voting getAllVoting() throws SQLException {
        Voting voting = null;
        String query = """
                SELECT
                    v.nid AS votacion_nid,
                    titulo,
                    descripcion,
                    fecha_limite,
                    p.nid AS piloto_nid,
                    nombre,
                    imagen,
                    apellidos,
                    vp.puntos AS puntos
                FROM
                    votacion v
                LEFT JOIN
                    votaciones_pilotos vp
                ON
                    v.nid = vp.id_votacion
                LEFT JOIN
                    piloto p
                ON
                    vp.id_piloto = p.nid
                WHERE
                    active = TRUE
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet rs = preparedStatement.executeQuery()) {
            List<Pilot> pilotos = new ArrayList<>();
            while (rs.next()) {
                if (Objects.isNull(voting)) {
                    voting = Voting.builder()
                            .nid(rs.getInt("votacion_nid"))
                            .titulo(rs.getString("titulo"))
                            .descripcion(rs.getString("descripcion"))
                            .fechaLimite(rs.getDate("fecha_limite").toLocalDate())
                            .build();
                }
                int idPiloto = rs.getInt("piloto_nid");
                if (!rs.wasNull()) {
                    Pilot pilot = Pilot.builder()
                            .nid(idPiloto)
                            .imagen(rs.getString("imagen"))
                            .nombre(rs.getString("nombre"))
                            .apellidos(rs.getString("apellidos"))
                            .puntos(rs.getInt("puntos"))
                            .build();
                    pilotos.add(pilot);
                }
            }
            if (Objects.nonNull(voting)) {
                voting.setPilots(pilotos);
            }

        }
        return voting;
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

    public void updateScore(final Integer idPilot, final Integer idVotacion) throws SQLException {
        String query = """
                UPDATE circuitsdb.votaciones_pilotos
                SET puntos=puntos+5
                WHERE id_votacion=? AND id_piloto=?;
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, idVotacion);
            ps.setInt(2, idPilot);
            ps.executeUpdate();
        }
    }
}
