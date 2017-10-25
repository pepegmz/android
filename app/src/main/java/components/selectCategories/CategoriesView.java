package components.selectCategories;

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

/**
 * Created by eitdev on 19/09/17.
 */

public class CategoriesView extends FrameLayout {

    Context context;

    public CategoriesView(@NonNull final Context context, Category category) {
        super(context);
        this.context = context;
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);

        addView(inflater.inflate(R.layout.suggestion_view, null));

        TextView textView =  (TextView)findViewById(R.id.category_name);
        textView.setText(category.categoria_name);

        ImageView image = (ImageView)findViewById(R.id.img_category);
        String imageName = getImageName(category);
        int id = getResources().getIdentifier("com.quickmatch:drawable/" + imageName , null, null);
        image.setImageResource(id);

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
