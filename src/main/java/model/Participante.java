package model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Participante {
    private int nid;
    private String userName;
    private String email;
    private boolean corresponsal;
    private int id_team;
}
