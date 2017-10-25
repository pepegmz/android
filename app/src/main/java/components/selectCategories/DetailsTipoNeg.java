package components.selectCategories;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.quickmatch.MenuActivity;
import com.quickmatch.R;

import models.Sugerencia;

/**
 * Created by eitdev on 24/09/17.
 */

public class DetailsTipoNeg extends Fragment {

    public CollapsingToolbarLayout collapsingToolbarLayout;
    public TextView tiponeg, tipocat, location, horario, telephone;


    @Nullable
    @Override

    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //returning our layout file
        //change R.layout.yourlayoutfilename for each of your fragments
        View view = inflater.inflate(R.layout.details_tiponeg, container, false);

        tiponeg = view.findViewById(R.id.txt_tiponeg_details);
        tipocat = view.findViewById(R.id.txt_tipocateg);
        location = view.findViewById(R.id.txt_location);
        horario = view.findViewById(R.id.txt_horario);
        telephone = view.findViewById(R.id.txt_telephone);
        collapsingToolbarLayout = view.findViewById(R.id.toolbar_layout);

        tiponeg.setText( ((MenuActivity)getActivity()).currentSugerencia.getTipoNegocio());
        tipocat.setText( ((MenuActivity)getActivity()).currentSugerencia.getNombreCategoria());
        location.setText( ((MenuActivity)getActivity()).currentSugerencia.getDireccion());
        horario.setText( ((MenuActivity)getActivity()).currentSugerencia.getHorario());
        telephone.setText( ((MenuActivity)getActivity()).currentSugerencia.getTelephone());
        changeImage(((MenuActivity)getActivity()).currentSugerencia.getIdCategoria());

        return view;

    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Detalles");
    }

    public void changeImage(String idCategoria){
        String imageName = getImageName(idCategoria);
        int id = getResources().getIdentifier("com.quickmatch:drawable/" + imageName , null, null);
        collapsingToolbarLayout.setBackgroundResource(id);
    }

    public String getImageName (String idCategoria){
        switch (idCategoria){
            case "1" :
                return "img_birria";
            case "2" :
                return "img_buffette";
            case "3" :
                return "img_carnesycortes";
            case "4" :
                return "img_cochinitapibil";
            case "5" :
                return "img_comidachina";
            case "6" :
                return "img_comidaitaliana";
            case "7" :
                return "img_comidajaponesa";
            case "8" :
                return "img_comidamexicana";
            case "9" :
                return "img_comidarapida";
            case "10" :
                return "img_comidaregional";
            case "11" :
                return "img_gastronomiainternacional";
            case "12" :
                return "img_gorditas";
            case "13" :
                return "img_mariscos";
            case "14" :
                return "img_panaderiaartesanal";
            case "15" :
                return "img_parrilla";
            case "16" :
                return "img_pizza";
            case "17" :
                return "img_restaurante";
            case "18" :
                return "img_pollo";
            case "19" :
                return "img_saludable";
            case "20" :
                return "img_tortas";
            default:
                return "img_restaurante";
        }
    }

    public void setTiponeg(String tiponeg) {
        this.tiponeg.setText(tiponeg);
    }
}
