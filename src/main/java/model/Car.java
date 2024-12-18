
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
public class Car {
    private int nid;
    private String nombre;
    private String codigo;
    private int ers_curvas_lentas;
    private int ers_curvas_medias;
    private int ers_curvas_rapidas;
    private int consumo;
    
     // Relación Muchos a Muchos: Equipos
    @Builder.Default
    private List<Team> teams= new ArrayList<>();
}
