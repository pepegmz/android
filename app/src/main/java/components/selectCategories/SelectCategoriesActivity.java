package components.selectCategories;

        import android.app.Activity;
        import android.content.Intent;
        import android.os.Bundle;
        import android.view.LayoutInflater;
        import android.view.View;
        import android.view.ViewGroup;
        import android.widget.CheckBox;
        import android.widget.ImageView;
        import android.widget.LinearLayout;
        import android.widget.Toast;

        import com.quickmatch.MenuActivity;
        import com.quickmatch.R;

        import java.util.ArrayList;

        import models.Category;

public class SelectCategoriesActivity extends Activity {

    private static final String TAG = "CardListActivity";
    ImageView btn_done, btn_help;
    ArrayList<Category>categoriesList;
    private LinearLayout content;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.select_categories);
        content = (LinearLayout) findViewById(R.id.content);

        Intent intent = getIntent();
        categoriesList = intent.getParcelableArrayListExtra("categoriesList");



        for(Category item : categoriesList) {
            CardItemView cardItemView = new CardItemView(getApplicationContext(), item);
            content.addView(cardItemView);
            item.setGeneratedFacesIDS(cardItemView.getFaceValues());

            for (int i= 0;i<5;i++){

                CheckBox face = findViewById(item.generatedFacesIDS[i]);
                face.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        //Toast.makeText(getApplicationContext(), "Hola" + view.getId(), Toast.LENGTH_SHORT).show();
                        toogleFaces(view);
                    }
                });


            }

        }

        btn_done = findViewById(R.id.img_done);
        btn_help = findViewById(R.id.img_help);

        btn_done.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(SelectCategoriesActivity.this, MenuActivity.class));
                SelectCategoriesActivity.this.finish();
            }
        });

        btn_help.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showToastHelp();
            }
        });
    }

    public void toogleFaces(View view){

        for(Category item : categoriesList) {
            for (int i= 0;i<5;i++) {
                if (item.generatedFacesIDS[i] == view.getId()){
                    for (int y= 0;y<5;y++) {
                        if (item.generatedFacesIDS[y] != view.getId()){
                            CheckBox checkBox = findViewById(item.generatedFacesIDS[y]);
                            checkBox.setChecked(false);

                        }
                    }
                    return;
                }
            }
        }
    }

    public void showToastHelp(){
        LayoutInflater inflater = getLayoutInflater();
        View layout = inflater.inflate(R.layout.toast_help,
                (ViewGroup) findViewById(R.id.toast_layout_root));

        Toast toast = new Toast(getApplicationContext());
        //toast.setGravity(Gravity.CENTER_VERTICAL, 0, 0);
        toast.setDuration(Toast.LENGTH_LONG);
        toast.setView(layout);
        toast.show();
    }


}

