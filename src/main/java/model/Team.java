package model;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Team {
    private int nid;
    private String nombre;
    private String logoImage;
    private String twitter;
    
    //relaciones
    // Relación Uno a Muchos: Pilotos
    private List <Pilot> pilot;
    // Relación uno a Muchos: Coches
    //private List<Car> car;

}
