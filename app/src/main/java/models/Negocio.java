package models;

import android.os.Parcel;
import android.os.Parcelable;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by eitdev on 11/09/17.
 */

public class Negocio implements Parcelable {

    public String id_negocio;
    public String negocio_name;

    public int generatedFacesIDS[];
    public int preferenceValue = 1;


    public Negocio(String id_negocio, String negocio_name) {
        this.id_negocio = id_negocio;
        this.negocio_name = negocio_name;
        generatedFacesIDS = new int[5];

    }


    protected Negocio(Parcel in) {
        id_negocio = in.readString();
        negocio_name = in.readString();
    }

    public static final Creator<Negocio> CREATOR = new Creator<Negocio>() {
        @Override
        public Negocio createFromParcel(Parcel in) {
            return new Negocio(in);
        }

        @Override
        public Negocio[] newArray(int size) {
            return new Negocio[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(id_negocio);
        parcel.writeString(negocio_name);
    }

    public String getId_negocio() {
        return id_negocio;
    }

    public void setId_negocio(String id_negocio) {
        this.id_negocio = id_negocio;
    }

    public String getNegocio_name() {
        return negocio_name;
    }

    public void setNegocio_name(String negocio_name) {
        this.negocio_name = negocio_name;
    }

    public int[] getGeneratedFacesIDS() {
        return generatedFacesIDS;
    }

    public void setGeneratedFacesIDS(int[] generatedFacesIDS) {
        this.generatedFacesIDS = generatedFacesIDS;
    }

    public int getPreferenceValue() {
        return preferenceValue;
    }

    public void setPreferenceValue(int preferenceValue) {
        this.preferenceValue = preferenceValue;
    }

    public String toJSON() {

        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("id", getId_negocio());
            jsonObject.put("value", getPreferenceValue());

            return jsonObject.toString();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "";
        }
    }
}
