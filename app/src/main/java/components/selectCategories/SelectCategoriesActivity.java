package components.selectCategories;

        import android.app.Activity;
        import android.content.Intent;
        import android.os.Bundle;
        import android.support.design.widget.FloatingActionButton;
        import android.support.design.widget.Snackbar;
        import android.view.View;
        import android.widget.AdapterView;
        import android.widget.CheckBox;
        import android.widget.ImageView;
        import android.widget.LinearLayout;
        import android.widget.ListView;
        import android.widget.ScrollView;

        import com.quickmatch.MenuActivity;
        import com.quickmatch.R;

        import models.Card;

public class SelectCategoriesActivity extends Activity {

    private static final String TAG = "CardListActivity";
    private CardArrayAdapter cardArrayAdapter;
    private LinearLayout content;

    ImageView imageView;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.select_categories_2);
        content = (LinearLayout) findViewById(R.id.content);


        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.done);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(SelectCategoriesActivity.this, MenuActivity.class));
            }
        });

        for (int i=0;i<20;i++){
            content.addView(new CardItemView(getApplicationContext()));
        }

        content.addView(new CardItemSpace(getApplicationContext()));
    }
}

