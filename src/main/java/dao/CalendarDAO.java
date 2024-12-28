package dao;

import config.ConnectionDB;
import model.Calendar;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CalendarDAO {
    ConnectionDB connectionDB = new ConnectionDB();

    public List<Calendar> getAllCalendarItem() {

        List<Calendar> listCalendar = new ArrayList<>();

        String query = """
                SELECT * FROM circuitsdb.calendar
                """;
        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                listCalendar.add(getCalentar(resultSet));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return listCalendar;
    }
    public void createCalendar(final Calendar calendar) {
        String query = """
                INSERT INTO circuitsdb.calendar
                (fecha, nombre, ubicacion, estado)
                VALUES(?, ?, ?, ?); 
                """;

        try (Connection connection = connectionDB.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setDate(1, Date.valueOf(calendar.getFecha()));
            preparedStatement.setString(2, calendar.getNombre());
            preparedStatement.setString(3, calendar.getUbicacion());
            preparedStatement.setString(4, calendar.getEstado());
            preparedStatement.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private Calendar getCalentar(ResultSet resultSet) throws SQLException {
        return Calendar.builder()
                .nid(resultSet.getInt("nid"))
                .fecha(resultSet.getDate("fecha").toLocalDate())
                .nombre(resultSet.getString("nombre"))
                .ubicacion(resultSet.getString("ubicacion"))
                .estado(resultSet.getString("estado"))
                .build();
    }


}
