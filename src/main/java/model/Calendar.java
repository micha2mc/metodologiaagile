package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Calendar {
    private int nid;
    private LocalDate fecha; // Fecha en el calendario.
    private String nombre;
    private String ubicacion;
    private String estado;// Indica si el circuito se ha corrido (past), se corre actualmente (current), o en el futuro (upcoming).
}
