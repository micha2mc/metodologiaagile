
package model;

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
    private String imagen;
    private int ers_curvas_lentas;
    private int ers_curvas_medias;
    private int ers_curvas_rapidas;
    private int consumo;
    private Team team;
}
