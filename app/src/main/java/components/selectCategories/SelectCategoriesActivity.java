package components.selectCategories;

        import android.app.Activity;
        import android.os.Bundle;
        import android.view.View;
        import android.widget.AdapterView;
        import android.widget.CheckBox;
        import android.widget.LinearLayout;
        import android.widget.ListView;
        import android.widget.ScrollView;

        import com.quickmatch.R;

        import models.Card;

public class SelectCategoriesActivity extends Activity {

    private static final String TAG = "CardListActivity";
    private CardArrayAdapter cardArrayAdapter;
    private LinearLayout content;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.select_categories);
        content = (LinearLayout) findViewById(R.id.content);

        for (int i=0;i<20;i++){
            content.addView(new CardItemView(getApplicationContext()));
        }
    }
}

