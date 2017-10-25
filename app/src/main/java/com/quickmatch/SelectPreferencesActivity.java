package com.quickmatch;

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
        import com.loopj.android.http.JsonHttpResponseHandler;
        import com.loopj.android.http.RequestParams;

        import org.json.JSONArray;
        import org.json.JSONObject;

        import java.util.ArrayList;
        import java.util.Arrays;
        import java.util.Comparator;

        import components.selectTipoNeg.tipoNegocioView;
        import cz.msebera.android.httpclient.Header;
        import data.AsyncHttpClientManagement;
        import models.Negocio;
        import models.Sugerencia;
        import models.Usuario;

/*
@Inputs :
{
    ArrayList<Negocio> tipoNegociosList,
    id_user : string,
    user_name : string,

}
@Outputs : {
    ArrayList<Sugerencia> listaSuggestions,
    id_user : string,
    user_name : string,
}
 */
public class SelectPreferencesActivity extends Activity {

    private static final String TAG = "CardListActivity";
    ImageView btn_done, btn_help;
    ArrayList<Negocio>tipoNegociosList;
    public ArrayList<Sugerencia> listaSuggestions;
    private LinearLayout content;
    public String getter_username;


    Usuario usuario;
    String preferencesString = "";


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.select_tiponeg);
        content = (LinearLayout) findViewById(R.id.contentTipoNeg);

        Intent intent = getIntent();
        tipoNegociosList = intent.getParcelableArrayListExtra("tipoNegociosList");
        usuario = (Usuario)intent.getSerializableExtra("user");

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
        //mandar lista categories
        getPlaces();
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


        Negocio[] arrayNegocios = new Negocio[tipoNegociosList.size()];

        for (int i=0;i<tipoNegociosList.size();i++){
            arrayNegocios[i] = tipoNegociosList.get(i);
        }


        Arrays.sort(arrayNegocios, new Comparator<Negocio>() {
            @Override
            public int compare(Negocio negocio1, Negocio negocio2) {
                if(negocio1.getPreferenceValue() < negocio2.getPreferenceValue()) return 1;
                else if(negocio1.getPreferenceValue() > negocio2.getPreferenceValue()) return -1;
                else return 0;
            }
        });


        for (int i=0;i<arrayNegocios.length;i++){
            if (i==0)
            {
               preferencesString += arrayNegocios[i].getId_negocio();
            }
            else
            {
                preferencesString += ", " + arrayNegocios[i].getId_negocio();
            }
        }



        //String jsonPreferences = android.text.TextUtils.join(",", arrayNegocios);

        RequestParams params = new RequestParams();
        params.put("id_user", usuario.getId_usuario());
        params.put("jsonPreferences", preferencesString);



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

    public void getPlaces(){

        listaSuggestions = new ArrayList<>();

        final ProgressDialog progressDialog = new ProgressDialog(SelectPreferencesActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Get Places...");
        progressDialog.show();

        RequestParams params = new RequestParams();
        params.put("order", preferencesString);

        AsyncHttpClientManagement.get(Vars.GET_PLACES, params, new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                try
                {
                    JSONArray places = response.getJSONArray("places");

                    for (int i=0;i<places.length();i++){
                        JSONObject p = places.getJSONObject(i);

                        String idSucursal = p.getString("idsucursal");
                        String nombreSucursal = p.getString("nom_sucursal");
                        String direccion = p.getString("direccion");
                        String horario = p.getString("horario");
                        String idTipoNegocio = p.getString("idtiopneg");
                        String idMunicipio = p.getString("idmun");
                        String tipoNegocio = p.getString("tipo");
                        String idCategoria = p.getString("idcateg");
                        String nombreCategoria = p.getString("categ");

                        Sugerencia sugerencia = new Sugerencia(idSucursal,nombreSucursal,direccion,horario,idTipoNegocio,idMunicipio,tipoNegocio,idCategoria,nombreCategoria);

                        listaSuggestions.add(sugerencia);

                    }


                    String message = response.getString("message");
                    String status = response.getString("status");

                    Toast.makeText(getApplicationContext(), status + " " + message, Toast.LENGTH_LONG).show();
                    Success();
                    progressDialog.dismiss();

                }
                catch (Exception e)
                {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Error", Toast.LENGTH_LONG).show();
                    Failed();
                    progressDialog.dismiss();
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                super.onFailure(statusCode, headers, responseString, throwable);

                Toast.makeText(getApplicationContext(), "Error code: " + statusCode, Toast.LENGTH_LONG).show();


            }
        });
    }

    public void Success(){

        Intent intent = new Intent(SelectPreferencesActivity.this, MenuActivity.class);
        intent.putParcelableArrayListExtra("listaSuggestions", listaSuggestions);
        intent.putExtra("user", usuario);
        startActivity(intent);

        //startActivity(new Intent(SelectPreferencesActivity.this, MenuActivity.class));
        SelectPreferencesActivity.this.finish();
    }

    public void Failed(){

    }

}

