package components.selectCategories;

        import android.app.Activity;
        import android.app.ProgressDialog;
        import android.content.Intent;
        import android.os.Bundle;
        import android.view.LayoutInflater;
        import android.view.View;
        import android.view.ViewGroup;
        import android.widget.CheckBox;
        import android.widget.ImageView;
        import android.widget.LinearLayout;
        import android.widget.Toast;

        import com.loopj.android.http.AsyncHttpResponseHandler;
        import com.loopj.android.http.RequestParams;
        import com.quickmatch.LoginActivity;
        import com.quickmatch.MenuActivity;
        import com.quickmatch.R;
        import com.quickmatch.Vars;

        import org.json.JSONArray;

        import java.util.ArrayList;

        import cz.msebera.android.httpclient.Header;
        import data.AsyncHttpClientManagement;
        import models.Category;
        import models.Negocio;

        import static com.loopj.android.http.AsyncHttpClient.log;

public class SelectPreferencesActivity extends Activity {

    private static final String TAG = "CardListActivity";
    ImageView btn_done, btn_help;
    ArrayList<Negocio>tipoNegociosList;
    private LinearLayout content;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.select_categories);
        content = (LinearLayout) findViewById(R.id.content);

        Intent intent = getIntent();
        tipoNegociosList = intent.getParcelableArrayListExtra("tipoNegociosList");



        for(Negocio item : tipoNegociosList) {
            tipoNegocioView tipoNegocioView = new tipoNegocioView(getApplicationContext(), item);
            content.addView(tipoNegocioView);
            item.setGeneratedFacesIDS(tipoNegocioView.getFaceValues());

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
                savePreferences();

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

        for(Negocio item : tipoNegociosList) {
            for (int i= 0;i<5;i++) {
                if (item.generatedFacesIDS[i] == view.getId()){
                    for (int y= 0;y<5;y++) {
                        CheckBox checkBox = findViewById(item.generatedFacesIDS[y]);
                        if (item.generatedFacesIDS[y] != view.getId()){
                            checkBox.setChecked(false);
                        }else{
                            checkBox.setChecked(true);
                            item.setPreferenceValue(y + 1);
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

    public void OnSavePreferencesSuccess(){
        startActivity(new Intent(SelectPreferencesActivity.this, MenuActivity.class));
        SelectPreferencesActivity.this.finish();
    }

    public void OnSavePreferencesFailed(){
       Toast.makeText(getApplicationContext(), "Save Preferences Failed!", Toast.LENGTH_LONG).show();
    }

    public void savePreferences(){

        final ProgressDialog progressDialog = new ProgressDialog(SelectPreferencesActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Saving Preferences...");
        progressDialog.show();

        JSONArray jsArray = new JSONArray();

        for (Negocio item: tipoNegociosList) {
            jsArray.put(item.toJSON());
        }

        RequestParams params = new RequestParams();
        params.put("id_user", "1");
        params.put("jsonPreferences", jsArray);



        AsyncHttpClientManagement.post(Vars.SAVE_PREFERENCES, params, new AsyncHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, byte[] responseBody) {
                if (statusCode == 200)
                    OnSavePreferencesSuccess();
                else
                    Toast.makeText(getApplicationContext(), "Error inesperado al guardar las preferencias statusCode: " + statusCode, Toast.LENGTH_SHORT).show();
                progressDialog.dismiss();
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, byte[] responseBody, Throwable error) {
                Toast.makeText(getApplicationContext(), "Error inesperado al guardar las preferencias statusCode: " + statusCode, Toast.LENGTH_SHORT).show();
                OnSavePreferencesFailed();
                progressDialog.dismiss();
            }
        });

    }


}

