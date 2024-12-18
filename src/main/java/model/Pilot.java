
package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Pilot {
    private int nid;
    private String nombre;
    private String apellidos;
    private String siglas;
    private int dorsal;
    private String imagen;
    private String pais;
    private String twitter;
    private int idEquipo;
}
