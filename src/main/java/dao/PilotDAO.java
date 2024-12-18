/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Pilot;

/**
 *
 * @author asd
 */
public class PilotDAO {

    public static final String add_Pilot_SQL = "INSERT INTO pilot (nombre, apellidos,siglas, dorsal,imagen,pais, twitter)VALUES (?,?,?,?,?,?,?) ";
    public static final String delet_Pilot_SQL = "DELETE FROM pilot WHERE id = ?";
    public static final String get_All_Pilot_SQL = "SELECT * FROM pilot ";
    public static final String get_Pilot_ById_SQL = "SELECT * FROM pilot WHERE id = ?";
    public static final String update_Pilot_By_Id_SQL = "UPDATE Pilot SET nombre=?,apellidos=?,siglas=? ,dorsal=?,imagen=?,pais=?,twitter=?,idEquipo=? WHERE id=?";
    private final ConnectionDB connectionBD;

    public PilotDAO() {
        this.connectionBD = new ConnectionDB();
    }

    public boolean createPilot(Pilot pilot) throws SQLException {
        if (pilot == null || pilot.getNombre() == null || pilot.getApellidos() == null) {
            throw new IllegalArgumentException("Datos del Piloto no validos ");
        }

        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(add_Pilot_SQL)) {
            statement.setString(1, pilot.getNombre());
            statement.setString(2, pilot.getApellidos());
            statement.setString(3, pilot.getSiglas());
            statement.setInt(4, pilot.getDorsal());
            statement.setString(5, pilot.getImagen());
            statement.setString(6, pilot.getPais());
            statement.setString(7, pilot.getTwitter());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Error al crear un piloto: " + e.getMessage());
            return false;
        }

    }

    public boolean deletePilot(int id) throws SQLException {
        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(delet_Pilot_SQL)) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {

            System.err.print("No fue eliminado el piloto" + e.getMessage());
            return false;
        }

    }

    public List<Pilot> getAllPilot() throws SQLException {
        List<Pilot> pilots = new ArrayList<>();
        try (Connection connection = connectionBD.ConnectionDB(); Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(get_All_Pilot_SQL)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellidos = resultSet.getString("apellidos");
                String siglas = resultSet.getString("siglas");
                int dorsal = resultSet.getInt("dorsal");
                String imagen = resultSet.getString("imagen");
                String pais = resultSet.getString("pais");
                String twitter = resultSet.getString("twitter");
                int id_equipo = resultSet.getInt("id_equipo");

                Pilot pilot = Pilot.builder()
                        .nid(id)
                        .nombre(nombre)
                        .apellidos(apellidos)
                        .siglas(siglas)
                        .dorsal(dorsal)
                        .imagen(imagen)
                        .pais(pais)
                        .twitter(twitter)
                        .idEquipo(id_equipo)
                        .build();

                pilots.add(pilot);
            }

        } catch (SQLException e) {
            System.err.println("No se pudo extraer el listado de pilotos" + e.getMessage());

        }
        return pilots;
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
                        .idEquipo(resultSet.getInt("id_equipo"))
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
            statement.setInt(8, pilot.getIdEquipo());
            statement.setInt(9, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        }
    }
}
