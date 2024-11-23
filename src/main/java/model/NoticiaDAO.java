package model;

import config.ConnectionDB;
import org.apache.commons.lang3.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
                noticias.add(getNoticia(Boolean.TRUE));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticias.stream().sorted(Comparator.comparing(Noticia::getNid).reversed())
                .collect(Collectors.toList());
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
                noticia = getNoticia(Boolean.FALSE);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticia;
    }


    private Noticia getNoticia(boolean isListNews) throws SQLException {
        return Noticia.builder()
                .nid(resultSet.getInt("nid"))
                .titulo(resultSet.getString("titulo"))
                .imagen(resultSet.getString("imagen"))
                .texto(isListNews ? StringUtils.join("", resultSet.getString("texto").substring(0, 255), "...") :
                        resultSet.getString("texto"))
                .fecha(resultSet.getDate("fecha").toLocalDate())
                .build();
    }
}
