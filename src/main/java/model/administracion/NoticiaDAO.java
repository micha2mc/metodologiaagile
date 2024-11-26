/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.administracion;

import config.ConnectionDB;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Home
 */
public class NoticiaDAO {


    ConnectionDB connectionDB = new ConnectionDB();
    Connection connection = connectionDB.ConnectionDB();
    PreparedStatement preparedStatement;
    ResultSet resultSet;


    public List<NoticiaModel> getTodasNoticias() {
        List<NoticiaModel> noticiaModels = new ArrayList<>();
        String sql = "SELECT * FROM noticias";

        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                noticiaModels.add(getNoticia(Boolean.TRUE));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticiaModels.stream().sorted(Comparator.comparing(NoticiaModel::getNid).reversed())
                .collect(Collectors.toList());
    }


    public NoticiaModel getNoticiaById(final Integer nid) {

        NoticiaModel noticiaModel = new NoticiaModel();
        String sql = "SELECT * FROM noticias WHERE nid = ?";


        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, nid);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                noticiaModel = getNoticia(Boolean.FALSE);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return noticiaModel;
    }

    public void crearNoticia(NoticiaModel noticia) throws SQLException {

        String sql = "INSERT INTO noticias ( titulo, imagen, texto, fecha ) VALUES(?,?,?,?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, noticia.getTitulo());
            statement.setString(2, noticia.getImagen());
            statement.setString(3, noticia.getTexto());
            statement.setDate(4, Date.valueOf(noticia.getFecha()));

            statement.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /*public boolean eliminarNoticia(String permalink) throws SQLException {

        String sql = "DELETE FROM noticia WHERE permalink=? ";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, permalink);

            int filasafectadas = statement.executeUpdate();
            return filasafectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }*/


    private NoticiaModel getNoticia(boolean isListNews) throws SQLException {
        return NoticiaModel.builder()
                .nid(resultSet.getInt("nid"))
                .titulo(resultSet.getString("titulo"))
                .imagen(resultSet.getString("imagen"))
                .texto(isListNews ? StringUtils.join("", resultSet.getString("texto").substring(0, 255), "...") :
                        resultSet.getString("texto"))
                .fecha(resultSet.getDate("fecha").toLocalDate())
                .build();
    }

   /* public boolean actualizarnoticia(NoticiaModelo noticia) throws SQLException {

        String sql = "UPDATE noticia SET permalink=?,titulo=?,imagen=?,texto=?,fecha=? WHERE id=?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, noticia.getPermalink());
            statement.setString(2, noticia.getTitulo());
            statement.setBytes(3, noticia.getImagen());
            statement.setString(4, noticia.getTexto());
            statement.setString(5, noticia.getFecha());
            statement.setInt(6, noticia.getId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;

        }
    }*/
}
