package models;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;

/**
 * Created by eitdev on 03/09/17.
 */

public class Category implements Parcelable {
    public String id_categoria;
    public String id_negocio;
    public String categoria_name;
    public String tipo_negocio;



    public int generatedFacesIDS[];
    public int categoryValue = 1;


    public Category(String id_categoria, String id_negocio, String categoria_name, String tipo_negocio) {
        this.id_categoria = id_categoria;
        this.id_negocio = id_negocio;
        this.categoria_name = categoria_name;
        this.tipo_negocio = tipo_negocio;
        generatedFacesIDS = new int[5];
    }

    protected Category(Parcel in) {
        id_categoria = in.readString();
        id_negocio = in.readString();
        categoria_name = in.readString();
        tipo_negocio = in.readString();
    }

    public static final Creator<Category> CREATOR = new Creator<Category>() {
        @Override
        public Category createFromParcel(Parcel in) {
            return new Category(in);
        }

        @Override
        public Category[] newArray(int size) {
            return new Category[size];
        }
    };

    public String getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(String id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getId_negocio() {
        return id_negocio;
    }

    public void setId_negocio(String id_negocio) {
        this.id_negocio = id_negocio;
    }

    public String getCategoria_name() {
        return categoria_name;
    }

    public void setCategoria_name(String categoria_name) {
        this.categoria_name = categoria_name;
    }

    public String getTipo_negocio() {
        return tipo_negocio;
    }

    public void setTipo_negocio(String tipo_negocio) {
        this.tipo_negocio = tipo_negocio;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(id_categoria);
        parcel.writeString(id_negocio);
        parcel.writeString(categoria_name);
        parcel.writeString(tipo_negocio);
    }

    public int[] getGeneratedFacesIDS() {
        return generatedFacesIDS;
    }

    public void setGeneratedFacesIDS(int[] generatedFacesIDS) {
        this.generatedFacesIDS = generatedFacesIDS;
    }

}
