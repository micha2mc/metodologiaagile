package dao;

import config.ConnectionDB;
import model.Pilot;
import model.Team;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.*;

public class TeamDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    public List<Team> getAllTeam() {

        List<Team> listTeam = new ArrayList<>();

        String query = """
                SELECT 
                    e.nid AS equipo_id,
                    e.nombre AS equipo_nombre,
                    logo_imagen,
                    e.twitter AS equipo_twitter,
                    p.nid AS piloto_id,
                    p.nombre AS piloto_nombre,
                    apellidos,
                    siglas,
                    dorsal,
                    imagen,
                    pais,
                    p.twitter AS piloto_twiter
                FROM
                    equipo e
                LEFT JOIN
                    piloto p
                ON
                    e.nid = p.nid_team;
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            Map<Integer, Team> mapTeam = new HashMap<>();
            while (resultSet.next()) {
                int teamId = resultSet.getInt("equipo_id");
                Team team = mapTeam.getOrDefault(teamId, new Team());
                if (!mapTeam.containsKey(teamId)) {
                    team.setNid(teamId);
                    team.setNombre(resultSet.getString("equipo_nombre"));
                    team.setLogoImage(resultSet.getString("logo_imagen"));
                    team.setTwitter(resultSet.getString("equipo_twitter"));
                    team.setPilot(new ArrayList<>());
                    mapTeam.put(teamId, team);
                }
                int pilotId = resultSet.getInt("piloto_id");
                if (pilotId != 0) {
                    Pilot pilot = Pilot.builder()
                            .nid(pilotId)
                            .nombre(resultSet.getString("piloto_nombre"))
                            .apellidos(resultSet.getString("apellidos"))
                            .siglas(resultSet.getString("siglas"))
                            .dorsal(resultSet.getInt("dorsal"))
                            .imagen(resultSet.getString("imagen"))
                            .pais(resultSet.getString("pais"))
                            .twitter(resultSet.getString("piloto_twiter"))
                            .build();
                    team.getPilot().add(pilot);
                }
            }
            listTeam.addAll(mapTeam.values());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return listTeam;
    }

    public Team getTeamByIdAndPilots(final int idTeam) {

        String query = """
                SELECT 
                    e.nid AS equipo_id,
                    e.nombre AS equipo_nombre,
                    logo_imagen,
                    e.twitter AS equipo_twitter,
                    p.nid AS piloto_id,
                    p.nombre AS piloto_nombre,
                    apellidos,
                    siglas,
                    dorsal,
                    imagen,
                    pais,
                    p.twitter AS piloto_twiter
                FROM
                    equipo e
                LEFT JOIN
                    piloto p
                ON
                    e.nid = p.nid_team
                WHERE e.nid = ?
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, idTeam);
            ResultSet resultSet = preparedStatement.executeQuery();
            Team team = null;
            List<Pilot> pilotList = new ArrayList<>();
            while (resultSet.next()) {
                if (Objects.isNull(team)) {
                    team = Team.builder()
                            .nid(resultSet.getInt("equipo_id"))
                            .nombre(resultSet.getString("equipo_nombre"))
                            .logoImage(resultSet.getString("logo_imagen"))
                            .twitter(resultSet.getString("equipo_twitter"))
                            .pilot(new ArrayList<>())
                            .build();
                }
                int pilotId = resultSet.getInt("piloto_id");
                if (pilotId != 0) {
                    Pilot pilot = Pilot.builder()
                            .nid(pilotId)
                            .nombre(resultSet.getString("piloto_nombre"))
                            .apellidos(resultSet.getString("apellidos"))
                            .siglas(resultSet.getString("siglas"))
                            .dorsal(resultSet.getInt("dorsal"))
                            .imagen(resultSet.getString("imagen"))
                            .pais(resultSet.getString("pais"))
                            .twitter(resultSet.getString("piloto_twiter"))
                            .build();
                    pilotList.add(pilot);
                }
            }
            if (Objects.nonNull(team)) {
                team.setPilot(pilotList);

            }
            return team;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
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
    public int createTeam(final Team team) {

        String query = """
                INSERT INTO circuitsdb.equipo
                (nombre, logo_imagen, twitter)
                VALUES(?, ?, ?); 
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, team.getNombre());
            preparedStatement.setString(2, team.getLogoImage());
            preparedStatement.setString(3, team.getTwitter());
            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                        /*return Team.builder()
                                .nid(generatedId)
                                .nombre(team.getNombre())
                                .logoImage(team.getLogoImage())
                                .twitter(team.getTwitter())
                                .build();*/
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return 0;

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

    public Team findByName(String nombre) {
        String query = """
                SELECT *
                FROM circuitsdb.equipo
                WHERE nombre like ?
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, StringUtils.join("%", nombre, "%"));
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getTeam(resultSet);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
