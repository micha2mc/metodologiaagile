
package model;

import java.util.ArrayList;
import java.util.List;
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
    
    //relaciones
    //M:1 equipo
    private int idEquipo;
    //N:M votaciones
    @Builder.Default
    private List<Voting> voting = new ArrayList<>();
}
