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
public class News {
    private int nid;
    private String titulo;
    private String imagen;
    private String texto;
    private LocalDate fecha;
}
