package models;

/**
 * Created by eitdev on 18/09/17.
 */

public class Pais {
    public String ID;
    public String Nombre;

    public Pais(String ID, String nombre) {
        this.ID = ID;
        Nombre = nombre;
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
}
