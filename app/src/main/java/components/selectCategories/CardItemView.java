package components.selectCategories;


import android.content.Context;
import android.media.Image;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.quickmatch.R;

import java.util.ArrayList;

import models.Category;

/**
 * Created by eitdev on 22/08/17.
 */

public class CardItemView extends FrameLayout{

    Context context;
    int[] faceValues;


    public CardItemView(@NonNull final Context context, Category category) {
        super(context);
        this.context = context;
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);

        faceValues = new int[5];

        addView(inflater.inflate(R.layout.list_item_card, null));

        TextView textView =  (TextView)findViewById(R.id.category_name);
        textView.setText(category.categoria_name);

        ImageView image = (ImageView)findViewById(R.id.thumbnail);
        String imageName = getImageName(category);
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

    public String getImageName (Category category){
        switch (category.id_categoria){
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


}
