package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Circuit {

    private int nid;
    private String nombre;
    private String ciudad;
    private String pais;
    private String trazadoImagen;
    private int longitud;
    private int curvasLentas;
    private int curvasMedias;
    private int curvasRapidas;
    private boolean calendar;
}
