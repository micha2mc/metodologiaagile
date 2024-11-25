/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Administracion;

/**
 *
 * @author Home
 */
public class NoticiaModelo {
    private int id;
    private String permalink;
    private String titulo;
    private String imagen;
    private String texto;
    private String fecha;
    
    public NoticiaModelo(int id, String permalink, String titulo, String imagen,String texto, String fecha){
        this.id=id;
        this.permalink=permalink;
        this.titulo=titulo;
        this.texto=texto;
        this.imagen=imagen;
        this.fecha=fecha;
    
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPermalink() {
        return permalink;
    }

    public void setPermalink(String permalink) {
        this.permalink = permalink;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}
