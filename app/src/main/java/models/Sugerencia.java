package models;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by eitdev on 20/09/17.
 */

public class Sugerencia implements Parcelable {

    public String idSucursal;
    public String nombreSucursal;
    public String direccion;
    public String horario;
    public String idTipoNegocio;
    public String idMunicipio;
    public String tipoNegocio;
    public String idCategoria;
    public String nombreCategoria;
    public String telephone = "449 123 456 789";


    public Sugerencia(){

    }

    public Sugerencia(String idSucursal, String nombreSucursal, String direccion, String horario, String idTipoNegocio, String idMunicipio, String tipoNegocio, String idCategoria, String nombreCategoria) {
        this.idSucursal = idSucursal;
        this.nombreSucursal = nombreSucursal;
        this.direccion = direccion;
        this.horario = horario;
        this.idTipoNegocio = idTipoNegocio;
        this.idMunicipio = idMunicipio;
        this.tipoNegocio = tipoNegocio;
        this.idCategoria = idCategoria;
        this.nombreCategoria = nombreCategoria;
    }

    protected Sugerencia(Parcel in) {
        idSucursal = in.readString();
        nombreSucursal = in.readString();
        direccion = in.readString();
        horario = in.readString();
        idTipoNegocio = in.readString();
        idMunicipio = in.readString();
        tipoNegocio = in.readString();
        idCategoria = in.readString();
        nombreCategoria = in.readString();
    }

    public String getTelephone() {
        return telephone;
    }

    public String getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(String idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getNombreSucursal() {
        return nombreSucursal;
    }

    public void setNombreSucursal(String nombreSucursal) {
        this.nombreSucursal = nombreSucursal;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getIdTipoNegocio() {
        return idTipoNegocio;
    }

    public void setIdTipoNegocio(String idTipoNegocio) {
        this.idTipoNegocio = idTipoNegocio;
    }

    public String getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(String idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public String getTipoNegocio() {
        return tipoNegocio;
    }

    public void setTipoNegocio(String tipoNegocio) {
        this.tipoNegocio = tipoNegocio;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public static final Creator<Sugerencia> CREATOR = new Creator<Sugerencia>() {
        @Override
        public Sugerencia createFromParcel(Parcel in) {
            return new Sugerencia(in);
        }

        @Override
        public Sugerencia[] newArray(int size) {
            return new Sugerencia[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(idSucursal);
        parcel.writeString(nombreSucursal);
        parcel.writeString(direccion);
        parcel.writeString(horario);
        parcel.writeString(idTipoNegocio);
        parcel.writeString(idMunicipio);
        parcel.writeString(tipoNegocio);
        parcel.writeString(idCategoria);
        parcel.writeString(nombreCategoria);
    }


}
