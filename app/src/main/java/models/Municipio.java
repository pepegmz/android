package models;

/**
 * Created by eitdev on 18/09/17.
 */

public class Municipio {

    public String ID;
    public String Nombre;
    public String ID_ESTADO;

    public Municipio(String ID, String nombre, String ID_ESTADO) {
        this.ID = ID;
        Nombre = nombre;
        this.ID_ESTADO = ID_ESTADO;
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

    public String getID_ESTADO() {
        return ID_ESTADO;
    }

    public void setID_ESTADO(String ID_ESTADO) {
        this.ID_ESTADO = ID_ESTADO;
    }
}
