package com.quickmatch;

        import android.app.ProgressDialog;
        import android.os.Bundle;
        import android.support.v7.app.AppCompatActivity;
        import android.util.Log;

        import android.content.Intent;
        import android.view.View;
        import android.widget.Button;
        import android.widget.EditText;
        import android.widget.TextView;
        import android.widget.Toast;

        import com.loopj.android.http.AsyncHttpResponseHandler;
        import com.loopj.android.http.JsonHttpResponseHandler;
        import com.loopj.android.http.RequestParams;

        import org.json.JSONArray;
        import org.json.JSONObject;

        import java.util.ArrayList;

        import components.selectCategories.SuggestionsList;
        import cz.msebera.android.httpclient.Header;
        import data.AsyncHttpClientManagement;
        import models.Sugerencia;
        import models.Usuario;


public class LoginActivity extends AppCompatActivity {
    private static final String TAG = "LoginActivity";
    private static final int REQUEST_SIGNUP = 0;


    public EditText _emailText;
    public EditText _passwordText;
    public Button _loginButton;
    public TextView _signupLink;


    ArrayList<Sugerencia> listaSuggestions;

    String jsonPreferences;
    Usuario usuario;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        _emailText =  (EditText)findViewById(R.id.input_email);
         _passwordText =  (EditText)findViewById(R.id.input_password);
         _loginButton =  (Button)findViewById(R.id.btn_login);
         _signupLink =  (TextView)findViewById(R.id.link_signup);


        _loginButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                login();
            }
        });

        _signupLink.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {

                // Start the Signup activity
                Intent intent = new Intent(getApplicationContext(), SignupActivity.class);
                startActivity(intent);
                //startActivityForResult(intent, REQUEST_SIGNUP);
            }
        });
    }

    public void login() {
        Log.d(TAG, "Login");

        if (!validate()) {
            onLoginFailed();
            return;
        }

        _loginButton.setEnabled(false);

        final ProgressDialog progressDialog = new ProgressDialog(LoginActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Authenticating...");
        progressDialog.show();

        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        // TODO: Implement your own authentication logic here.

        RequestParams params = new RequestParams();
        params.put("email", email);
        params.put("password", password);

        AsyncHttpClientManagement.post(Vars.LOGIN, params, new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                if (statusCode == 200) {

                    Log.i("Status", statusCode + "");

                    try {

                        Log.i("Status json:", response.toString());

                        String status = response.getString("status");
                        String message = response.getString("message");
                        usuario = new Usuario(response.getJSONObject("user"));
                        //userID = response.getJSONObject("user").getString("id_usuario");
                        //userName = response.getJSONObject("user").getString("nombre");
                        jsonPreferences = response.getJSONObject("preferences").getString("json_preferences");


                        Toast.makeText(getApplicationContext(), status + " " + message, Toast.LENGTH_LONG).show();
                        //onLoginSuccess();
                        progressDialog.dismiss();

                        getPlaces();

                    } catch (Exception e) {
                        e.printStackTrace();
                        Toast.makeText(getApplicationContext(), "Error", Toast.LENGTH_LONG).show();
                        onLoginFailed();
                        progressDialog.dismiss();
                    }
                }
            }

            @Override
            public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse) {
                super.onFailure(statusCode, headers, throwable, errorResponse);

                Log.i("Status:", statusCode + "");
            }
        });
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_SIGNUP) {
            if (resultCode == RESULT_OK) {

                // TODO: Implement successful signup logic here
                // By default we just finish the Activity and log them in automatically



                this.finish();
            }
        }
    }

    @Override
    public void onBackPressed() {
        // disable going back to the MainActivity
        moveTaskToBack(true);
    }


    public void getPlaces(){

        listaSuggestions = new ArrayList<>();

        final ProgressDialog progressDialog = new ProgressDialog(LoginActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Get Places...");
        progressDialog.show();

        RequestParams params = new RequestParams();
        params.put("order", jsonPreferences);

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
                    onLoginSuccess();
                    progressDialog.dismiss();

                }
                catch (Exception e)
                {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Error", Toast.LENGTH_LONG).show();
                    onLoginFailed();
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

    public void onLoginSuccess() {
        _loginButton.setEnabled(true);

        Intent intent = new Intent(LoginActivity.this, MenuActivity.class);
        intent.putParcelableArrayListExtra("listaSuggestions", listaSuggestions);
        intent.putExtra("user", usuario);
        //intent.putExtra("id_user", userID);
        //intent.putExtra("user_name", userName);
        startActivity(intent);

        finish();
    }

    public void onLoginFailed() {
        Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();

        _loginButton.setEnabled(true);
    }

    public boolean validate() {
        boolean valid = true;

        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        if (email.isEmpty() || !android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            _emailText.setError("enter a valid email address");
            valid = false;
        } else {
            _emailText.setError(null);
        }

        if (password.isEmpty() || password.length() < 4 || password.length() > 10) {
            _passwordText.setError("between cat4 and 10 alphanumeric characters");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        return valid;
    }
}



