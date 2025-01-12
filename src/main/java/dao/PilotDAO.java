package dao;

import config.ConnectionDB;
import model.Pilot;
import model.Team;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author asd
 */
public class PilotDAO {


    public static final String add_Pilot_SQL = """
            INSERT INTO circuitsdb.piloto (nombre, apellidos,siglas, dorsal,imagen,pais, twitter, nid_team)
            VALUES (?,?,?,?,?,?,?, ?) 
            """;
    public static final String delet_Pilot_SQL = """
            DELETE FROM circuitsdb.piloto WHERE nid = ?
            """;

    public static final String get_Pilot_ById_SQL = "SELECT * FROM circuitsdb.piloto WHERE nid = ?";
    public static final String update_Pilot_By_Id_SQL = """
            UPDATE circuitsdb.piloto SET nombre=?,apellidos=?,siglas=? ,dorsal=?,imagen=?,pais=?,twitter=?,idEquipo=? WHERE nid=?
            """;

    ConnectionDB connectionBD = new ConnectionDB();

    public boolean createPilot(final Pilot pilot, int nidTeam) throws SQLException {
        if (pilot == null || pilot.getNombre() == null || pilot.getApellidos() == null) {
            throw new IllegalArgumentException("Datos del Piloto no validos ");
        }

        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(add_Pilot_SQL)) {
            statement.setString(1, pilot.getNombre());
            statement.setString(2, pilot.getApellidos());
            statement.setString(3, pilot.getSiglas());
            statement.setInt(4, pilot.getDorsal());
            statement.setString(5, pilot.getImagen());
            statement.setString(6, pilot.getPais());
            statement.setString(7, pilot.getTwitter());
            statement.setInt(8, nidTeam);

            System.out.println(statement);

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Error al crear un piloto: " + e.getMessage());
            return false;
        }

    }

    public boolean deletePilot(int id) throws SQLException {
        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(delet_Pilot_SQL)) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            System.err.print("No fue eliminado el piloto" + e.getMessage());
            return false;
        }

    }

    public List<Pilot> getAllPilot() {
        String get_All_Pilot_SQL = """
                SELECT * FROM circuitsdb.piloto """;
        List<Pilot> pilots = new ArrayList<>();
        try (Connection connection = connectionBD.ConnectionDB();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(get_All_Pilot_SQL)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("nid");
                String nombre = resultSet.getString("nombre");
                String apellidos = resultSet.getString("apellidos");
                String siglas = resultSet.getString("siglas");
                int dorsal = resultSet.getInt("dorsal");
                String imagen = resultSet.getString("imagen");
                String pais = resultSet.getString("pais");
                String twitter = resultSet.getString("twitter");

                Pilot pilot = Pilot.builder()
                        .nid(id)
                        .nombre(nombre)
                        .apellidos(apellidos)
                        .siglas(siglas)
                        .dorsal(dorsal)
                        .imagen(imagen)
                        .pais(pais)
                        .twitter(twitter)

                        .build();

                pilots.add(pilot);
            }

        } catch (SQLException e) {
            System.err.println("No se pudo extraer el listado de pilotos" + e.getMessage());

        }
        return pilots;
    }

    public List<Pilot> getAllPilotForTeam(final int idTeam) throws SQLException {
        String get_All_Pilot_SQL = """
                SELECT 
                    p.nid AS id_pilot, p.nombre AS nom_pilot, apellidos, siglas, dorsal, imagen, pais, p.twitter AS twit_pilot,
                    e.nid AS id_team, e.nombre AS nom_equipo, e.twitter AS twit_equipo 
                FROM 
                    circuitsdb.piloto p
                LEFT JOIN
                    circuitsdb.equipo e
                ON 
                    p.nid_team = e.nid
                WHERE
                    nid_team = ?
                """;
        List<Pilot> pilots = new ArrayList<>();
        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(get_All_Pilot_SQL)) {
            statement.setInt(1, idTeam);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                pilots.add(getPilotObject(resultSet));
            }

        } catch (SQLException e) {
            System.err.println("No se pudo extraer el listado de pilotos" + e.getMessage());

        }
        return pilots;
    }

    private Pilot getPilotObject(final ResultSet resultSet) throws SQLException {
        Team team = Team.builder()
                .nid(resultSet.getInt("id_team"))
                .nombre(resultSet.getString("nom_equipo"))
                .twitter(resultSet.getString("twit_equipo"))
                .build();
        return Pilot.builder()
                .nid(resultSet.getInt("id_pilot"))
                .nombre(resultSet.getString("nom_pilot"))
                .apellidos(resultSet.getString("apellidos"))
                .siglas(resultSet.getString("siglas"))
                .dorsal(resultSet.getInt("dorsal"))
                .imagen(resultSet.getString("imagen"))
                .pais(resultSet.getString("pais"))
                .twitter(resultSet.getString("twit_pilot"))
                .team(team)
                .build();
    }

    public Pilot getPilotById(int id) throws SQLException {
        Pilot pilot = null;
        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(get_Pilot_ById_SQL)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                pilot = Pilot.builder()
                        .nid(resultSet.getInt("id"))
                        .nombre(resultSet.getString("nombre"))
                        .apellidos(resultSet.getString("apellidos"))
                        .siglas(resultSet.getString("siglas"))
                        .dorsal(resultSet.getInt("dorsal"))
                        .imagen(resultSet.getString("imagen"))
                        .pais(resultSet.getString("pais"))
                        .twitter(resultSet.getString("twitter"))

                        .build();


            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pilot;
    }

    public boolean updatePilot(int id, Pilot pilot) throws SQLException {
        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(update_Pilot_By_Id_SQL)) {

            statement.setString(1, pilot.getNombre());
            statement.setString(2, pilot.getApellidos());
            statement.setString(3, pilot.getSiglas());
            statement.setInt(4, pilot.getDorsal());
            statement.setString(5, pilot.getImagen());
            statement.setString(6, pilot.getPais());
            statement.setString(7, pilot.getTwitter());

            statement.setInt(9, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        }
    }
}
