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
import model.Car;

/**
 *
 * @author asd
 */
public class CarDAO {

    public static final String add_Car = "INSERT INTO Cars (nombre, codigo, ers_curvas_lentas, ers_curvas_medias, ers_curvas_rapidas, consumo)VALUES (?, ?, ?, ?, ?, ?)";
    public static final String get_ALL_Cars = "SELECT * FROM Cars";
    public static final String get_Car = "SELECT * FROM Car WHERE id=?";
    public static final String update_Car_By_Id = "UPDATE Cars SET nombre = ?, codigo = ?, ers_curvas_lentas = ?, ers_curvas_medias = ?, ers_curvas_rapidas = ?, consumo = ? WHERE id = ?";
    public static final String delet_Car_By_Id = "DELETE FROM Cars WHERE id = ?";

    ConnectionDB connectionBD = new ConnectionDB();

    public CarDAO() {
        this.connectionBD = new ConnectionDB();
    }

    public boolean createdCar(Car car) throws SQLException {

        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(add_Car)) {
            statement.setString(1, car.getNombre());
            statement.setString(2, car.getCodigo());
            statement.setInt(3, car.getErs_curvas_lentas());
            statement.setInt(4, car.getErs_curvas_medias());
            statement.setInt(5, car.getErs_curvas_rapidas());
            statement.setInt(6, car.getConsumo());

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    public List<Car> getAllCars() throws SQLException {
        List<Car> carList = new ArrayList<>();

        try (Connection connection = connectionBD.ConnectionDB(); Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(get_ALL_Cars)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String codigo = resultSet.getString("codigo");
                int ers_curvas_lentas = resultSet.getInt("ers_curvas_lentas");
                int ers_curvas_medias = resultSet.getInt("ers_curvas_medias");
                int ers_curvas_rapidas = resultSet.getInt("ers_curvas_rapidas");
                int consumo = resultSet.getInt("consumo");
                carList.add(new Car(id, nombre, codigo, ers_curvas_lentas, ers_curvas_medias, ers_curvas_rapidas, consumo));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carList;
    }

    public Car getById(int id) throws SQLException {
        Car car = new Car();

        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(get_Car)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {

                car = new Car(
                        resultSet.getInt("id"),
                        resultSet.getString("nombre"),
                        resultSet.getString("codigo"),
                        resultSet.getInt("ers_curvas_lentas"),
                        resultSet.getInt("ers_curvas_medias"),
                        resultSet.getInt("ers_curvas_rapidas"),
                        resultSet.getInt("consumo")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return car;
    }

    public boolean updateCar(int id, Car car) throws SQLException {

        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(update_Car_By_Id)) {

            statement.setString(1, car.getNombre());
            statement.setString(2, car.getCodigo());
            statement.setInt(3, car.getErs_curvas_lentas());
            statement.setInt(4, car.getErs_curvas_medias());
            statement.setInt(5, car.getErs_curvas_rapidas());
            statement.setInt(6, car.getConsumo());
            statement.setInt(7, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;

        }
    }

    public boolean carDeleteById(int id) throws SQLException {

        try (Connection connection = connectionBD.ConnectionDB(); PreparedStatement statement = connection.prepareStatement(delet_Car_By_Id)) {

            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
