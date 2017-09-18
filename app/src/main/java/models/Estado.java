package models;

/**
 * Created by eitdev on 18/09/17.
 */

public class Estado {

    public String ID;
    public String Nombre;
    public String ID_PAIS;

    public Estado(String ID, String nombre, String ID_PAIS) {
        this.ID = ID;
        Nombre = nombre;
        this.ID_PAIS = ID_PAIS;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public String getID_PAIS() {
        return ID_PAIS;
    }

    public void setID_PAIS(String ID_PAIS) {
        this.ID_PAIS = ID_PAIS;
    }


}
