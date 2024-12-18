package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Voting {
    private int nid;
    private String titulo;
    private String descripcion;
    private LocalDate fechaLimite;
     
    // Relación Muchos a Muchos: Pilotos
    private List<Pilot> pilot;
}
