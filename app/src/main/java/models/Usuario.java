package models;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;

/**
 * Created by eitdev on 24/10/17.
 */

public class Usuario implements Serializable {

    public String id_usuario;
    public String nombre;
    public String correo;
    public String telefono;
    public String pass;
    public String id_gusto;
    public String id_tipous;
    public String idmun;

    public Usuario(JSONObject json) throws JSONException {
        this.id_usuario = json.getString("id_usuario");
        this.nombre = json.getString("nombre");
        this.correo = json.getString("correo");
        this.telefono = json.getString("telefono");
        this.pass = json.getString("pass");
        this.id_gusto = json.getString("id_gusto");
        this.id_tipous = json.getString("id_tipous");
        this.idmun = json.getString("idmun");
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getPass() {
        return pass;
    }

    public String getId_gusto() {
        return id_gusto;
    }

    public String getId_tipous() {
        return id_tipous;
    }

    public String getIdmun() {
        return idmun;
    }

    /*

    protected Usuario(Parcel in) {
        id_usuario = in.readString();
        nombre = in.readString();
        correo = in.readString();
        telefono = in.readString();
        pass = in.readString();
        id_gusto = in.readString();
        id_tipous = in.readString();
        idmun = in.readString();
    }

    public static final Creator<Usuario> CREATOR = new Creator<Usuario>() {
        @Override
        public Usuario createFromParcel(Parcel in) {
            return new Usuario(in);
        }

        @Override
        public Usuario[] newArray(int size) {
            return new Usuario[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(id_usuario);
        parcel.writeString(nombre);
        parcel.writeString(correo);
        parcel.writeString(telefono);
        parcel.writeString(pass);
        parcel.writeString(id_gusto);
        parcel.writeString(id_tipous);
        parcel.writeString(idmun);
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getId_gusto() {
        return id_gusto;
    }

    public void setId_gusto(String id_gusto) {
        this.id_gusto = id_gusto;
    }

    public String getId_tipous() {
        return id_tipous;
    }

    public void setId_tipous(String id_tipous) {
        this.id_tipous = id_tipous;
    }

    public String getIdmun() {
        return idmun;
    }

    public void setIdmun(String idmun) {
        this.idmun = idmun;
    }
    */
}
