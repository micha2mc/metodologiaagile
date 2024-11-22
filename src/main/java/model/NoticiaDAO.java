package model;

import config.ConnectionDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticiaDAO {

    ConnectionDB connectionDB = new ConnectionDB();
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    public List<Noticia> getTodasNoticias() {
        List<Noticia> noticias = new ArrayList<>();
        String sql = "SELECT * FROM noticias";


        try {
            connection = connectionDB.ConnectionDB();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                noticias.add(getNoticia());
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticias;
    }


    public Noticia getNoticiaById(final Integer nid) {

        Noticia noticia = new Noticia();
        String sql = "SELECT * FROM noticias WHERE nid = ?";


        try {
            connection = connectionDB.ConnectionDB();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, nid);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                noticia = getNoticia();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticia;
    }


    private Noticia getNoticia() throws SQLException {
        return Noticia.builder()
                .nid(resultSet.getInt("nid"))
                .titulo(resultSet.getString("titulo"))
                .imagen(resultSet.getString("imagen"))
                .texto(resultSet.getString("texto"))
                .fecha(resultSet.getDate("fecha").toLocalDate())
                .build();
    }
}
