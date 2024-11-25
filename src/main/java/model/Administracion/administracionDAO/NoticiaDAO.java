/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Administracion.administracionDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Administracion.NoticiaModelo;

/**
 *
 * @author Home
 */
public class NoticiaDAO {

    private Connection connection;

    public NoticiaDAO(Connection connection) {
        this.connection = connection;
        int filasafectadas;

    }

    public boolean crearNoticia(NoticiaModelo noticia) throws SQLException {

        String sql = "INSERT INTO noticia ( permalink,titulo, imagen, texto, fecha ) VALUES(?,?,?,?,?,?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

         statement.setString(1, noticia.getPermalink());
            statement.setString(2, noticia.getTitulo());
          statement.setString(3, noticia.getImagen());
            statement.setString(4, noticia.getTexto());
          statement.setString(5, noticia.getFecha());
            
             int filasafectadas = statement.executeUpdate();
            return filasafectadas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean eliminarNoticia(String permalink) throws SQLException {

        String sql = "DELETE FROM noticia WHERE permalink=? ";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, permalink);
            
            int filasafectadas=statement.executeUpdate();
            return filasafectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
