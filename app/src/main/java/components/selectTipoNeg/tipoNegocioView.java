package components.selectTipoNeg;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.quickmatch.R;

import models.Category;
import models.Negocio;

/**
 * Created by eitdev on 11/09/17.
 */

public class tipoNegocioView extends FrameLayout {

    Context context;
    int[] faceValues;


    public tipoNegocioView(@NonNull final Context context, Negocio negocio) {
        super(context);
        this.context = context;
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);

        faceValues = new int[5];

        addView(inflater.inflate(R.layout.list_item_card, null));

        TextView textView =  (TextView)findViewById(R.id.lbl_tiponeg);
        textView.setText(negocio.negocio_name);

        ImageView image = (ImageView)findViewById(R.id.thumbnail);
        String imageName = getImageName(negocio);
        int id = getResources().getIdentifier("com.quickmatch:drawable/" + imageName , null, null);
        image.setImageResource(id);

        CheckBox face1 = findViewById(R.id.face1);
        int id_face1 = View.generateViewId();
        faceValues[0] = id_face1;
        face1.setId(id_face1);

        CheckBox face2 = findViewById(R.id.face2);
        int id_face2 = View.generateViewId();
        faceValues[1] = id_face2;
        face2.setId(id_face2);

        CheckBox face3 = findViewById(R.id.face3);
        int id_face3 = View.generateViewId();
        faceValues[2] = id_face3;
        face3.setId(id_face3);

        CheckBox face4 = findViewById(R.id.face4);
        int id_face4 = View.generateViewId();
        faceValues[3] = id_face4;
        face4.setId(id_face4);

        CheckBox face5 = findViewById(R.id.face5);
        int id_face5 = View.generateViewId();
        faceValues[4] = id_face5;
        face5.setId(id_face5);

    }

    public int[] getFaceValues() {
        return faceValues;
    }

    public String getImageName (Negocio negocio){
        switch (negocio.id_negocio){
            case "1" :
                return "img_tn_restaurante";
            case "2" :
                return "img_tn_bar";
            case "3" :
                return "img_tn_platicar";
            case "4" :
                return "img_tn_musiclive";
            case "5" :
                return "img_tn_antro";
            case "6" :
                return "img_tn_concierto";
            case "7" :
                return "img_tn_cultura";
            case "8" :
                return "img_tn_aventura";
            case "9" :
                return "img_tn_botanas";
            case "10" :
                return "img_tn_cine";
            case "11" :
                return "img_tn_desayuno";
            case "12" :
                return "img_tn_pasear";
            default:
                return "img_tn_restaurante";
        }
    }


}
