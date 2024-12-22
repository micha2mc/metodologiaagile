package dao;

import config.ConnectionDB;
import model.Circuit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CircuitDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    //Create
    public void createCircuit(final Circuit circuit) {

        String sql = """
                INSERT INTO circuitsdb.circuitos
                (nombre, ciudad, pais, trazado_imagen, longitud, curvas_lentas, curvas_medias, curvas_rapidas)
                VALUES(?, ?, ?, ?, ?, ?, ?, ?);
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, circuit.getNombre());
            statement.setString(2, circuit.getCiudad());
            statement.setString(3, circuit.getPais());
            statement.setString(4, circuit.getTrazadoImagen());
            statement.setInt(5, circuit.getLongitud());
            statement.setInt(6, circuit.getCurvasLentas());
            statement.setInt(7, circuit.getCurvasMedias());
            statement.setInt(8, circuit.getCurvasRapidas());

            statement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Circuit> getAllCircuits() {
        List<Circuit> allCircuits = new ArrayList<>();
        String query = """
                SELECT *
                FROM circuitsdb.circuitos""";
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                allCircuits.add(setParameterCircuit(resultSet));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return allCircuits;
    }

    private Circuit setParameterCircuit(ResultSet resultSet) throws SQLException {
        return Circuit.builder()
                .nid(resultSet.getInt("nid"))
                .nombre(resultSet.getString("nombre"))
                .ciudad(resultSet.getString("ciudad"))
                .pais(resultSet.getString("pais"))
                .trazadoImagen(resultSet.getString("trazado_imagen"))
                .longitud(resultSet.getInt("longitud"))
                .curvasLentas(resultSet.getInt("curvas_lentas"))
                .curvasMedias(resultSet.getInt("curvas_medias"))
                .curvasRapidas(resultSet.getInt("curvas_rapidas"))
                .calendar(resultSet.getBoolean("calendar"))
                .build();
    }

    public Circuit getCircuitById(final int nid) {
        String sql = "SELECT * FROM circuitsdb.circuitos WHERE nid = ?";
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, nid);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return setParameterCircuit(resultSet);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateCalendarStatus(Circuit circuit) {
        String query = """
                UPDATE circuitsdb.circuitos
                SET calendar=?
                WHERE nid=?;
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setBoolean(1, circuit.isCalendar());
            preparedStatement.setInt(2, circuit.getNid());
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
