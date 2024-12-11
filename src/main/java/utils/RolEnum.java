package utils;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum RolEnum {
    ROLE_ADMIN(1, "ROLE_ADMIN");
    //ROLE_RESPON(2, "ROLE_RESPON");

    private int id;
    private String descr;
}
