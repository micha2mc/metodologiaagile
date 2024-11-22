package utils;

public enum RolEnum {
    ROLE_ADMIN(1, "ROLE_ADMIN"),
    ROLE_RESPON(2, "ROLE_RESPON");

    private int id;
    private String descr;


    RolEnum(int id, String descr) {
        this.id = id;
        this.descr = descr;
    }


    public int getId() {
        return id;
    }

    public String getDescr() {
        return descr;
    }
}
