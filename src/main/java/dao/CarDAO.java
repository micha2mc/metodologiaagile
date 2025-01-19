/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.ConnectionDB;
import model.Car;
import model.Team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author asd
 */
public class CarDAO {

    public static final String get_Car = "SELECT * FROM `circuitsdb`.`coche` WHERE id=?";
    public static final String update_Car_By_Id = """
            UPDATE `circuitsdb`.`coche` SET nombre = ?, codigo = ?, ers_curvas_lentas = ?, ers_curvas_medias = ?, 
            ers_curvas_rapidas = ?, consumo = ? WHERE id = ?""";
    public static final String delet_Car_By_Id = "DELETE FROM `circuitsdb`.`coche` WHERE id = ?";

    ConnectionDB connectionBD = new ConnectionDB();

    public void createdCar(Car car, final int idTeam) {
        String add_Car = """
                INSERT INTO circuitsdb.coche
                (nombre, imagen, codigo, ers_curvas_lentas, ers_curvas_medias, ers_curvas_rapidas, consumo, nid_team)
                VALUES(?, ?, ?, ?, ?, ?, ?, ?)
                """;
        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(add_Car)) {
            statement.setString(1, car.getNombre());
            statement.setString(2, car.getImagen());
            statement.setString(3, car.getCodigo());
            statement.setInt(4, car.getErs_curvas_lentas());
            statement.setInt(5, car.getErs_curvas_medias());
            statement.setInt(6, car.getErs_curvas_rapidas());
            statement.setInt(7, car.getConsumo());
            statement.setInt(8, idTeam);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Car> getAllCarsByTeam(final int idTeam, final boolean perfil) {
        String get_ALL_Cars = """
                SELECT 
                    * 
                FROM 
                    `circuitsdb`.`coche`
                """;
        String clause = """
                WHERE
                    nid_team = ?
                """;
        List<Car> carList = new ArrayList<>();

        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement preparedStatement = connection.prepareStatement(perfil ? get_ALL_Cars.concat(clause) : get_ALL_Cars)) {
            if (perfil) {
                preparedStatement.setInt(1, idTeam);
            }

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Car car = Car.builder()
                        .nid(resultSet.getInt("nid"))
                        .nombre(resultSet.getString("nombre"))
                        .imagen(resultSet.getString("imagen"))
                        .codigo(resultSet.getString("codigo"))
                        .ers_curvas_lentas(resultSet.getInt("ers_curvas_lentas"))
                        .ers_curvas_medias(resultSet.getInt("ers_curvas_medias"))
                        .ers_curvas_rapidas(resultSet.getInt("ers_curvas_rapidas"))
                        .consumo(resultSet.getInt("consumo"))
                        .team(Team.builder()
                                .nid(resultSet.getInt("nid_team"))
                                .build())
                        .build();
                carList.add(car);
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

                car = Car.builder()
                        .nid(resultSet.getInt("id"))
                        .nombre(resultSet.getString("nombre"))
                        .codigo(resultSet.getString("codigo"))
                        .ers_curvas_lentas(resultSet.getInt("ers_curvas_lentas"))
                        .ers_curvas_medias(resultSet.getInt("ers_curvas_medias"))
                        .ers_curvas_rapidas(resultSet.getInt("ers_curvas_rapidas"))
                        .consumo(resultSet.getInt("consumo"))
                        .build();

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

        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(delet_Car_By_Id)) {

            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void delete(int nidCar) {
        String query = """
                DELETE FROM circuitsdb.coche
                WHERE nid=?;
                """;

        try (Connection connection = connectionBD.ConnectionDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, nidCar);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
