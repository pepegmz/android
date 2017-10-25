package com.quickmatch;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.loopj.android.http.JsonHttpResponseHandler;
import com.loopj.android.http.RequestParams;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import components.SignupActivity.DatePickerFragment;
import components.SignupActivity.EstadosArrayAdapter;
import components.SignupActivity.MunicipiosArrayAdapter;
import components.SignupActivity.PaisesArrayAdapter;
import cz.msebera.android.httpclient.Header;
import data.AsyncHttpClientManagement;
import data.HttpHandler;
import models.Estado;
import models.Municipio;
import models.Negocio;
import models.Pais;
import models.Usuario;

public class SignupActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    private static final String TAG = "SignupActivity";

    EditText _nameText, _emailText, _passwordText, _confimPassword;
    Button _signupButton;
    TextView _loginLink;
    Spinner sp_paises, sp_estados, sp_municipios;
    private ProgressDialog pDialog;

    PaisesArrayAdapter paisesArrayAdapter;
    EstadosArrayAdapter estadosArrayAdapter;
    MunicipiosArrayAdapter municipiosArrayAdapter;

    ArrayList<Negocio> tipoNegociosList;
    ArrayList<Pais> listaPaises;
    ArrayList<Estado> listaEstados;
    ArrayList<Municipio> listaMunicipios;

    public static String MUNICIPIO_ID;
    Usuario usuario;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);

        _nameText = (EditText) findViewById(R.id.input_name);
        _emailText = (EditText) findViewById(R.id.input_email);
        _passwordText = (EditText) findViewById(R.id.input_password);
        _confimPassword = (EditText) findViewById(R.id.confirm_input_password);
        _signupButton = (Button) findViewById(R.id.btn_signup);
        _loginLink = (TextView) findViewById(R.id.link_login);

        tipoNegociosList = new ArrayList<>();

        // Spinner element
        sp_paises = (Spinner) findViewById(R.id.cbx_pais);
        sp_estados = (Spinner) findViewById(R.id.cbx_edos);
        sp_municipios = (Spinner) findViewById(R.id.cbx_mun);

        sp_paises.setEnabled(false);
        sp_estados.setEnabled(false);
        sp_municipios.setEnabled(false);


        _signupButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                signup();
            }
        });

        _loginLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Finish the registration screen and return to the Login activity
                finish();
            }
        });

        getPaises();

    }

    public void getPaises(){

        listaPaises = new ArrayList<Pais>();

        AsyncHttpClientManagement.get(Vars.GET_PAISES, null, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                try {
                    JSONArray paises = response.getJSONArray("paises");

                    for (int i=0;i<paises.length();i++){
                        JSONObject pais = paises.getJSONObject(i);

                        String idPais = pais.getString("idpais");
                        String namePais = pais.getString("nom_pais");


                        //Toast.makeText(SignupActivity.this, namePais,Toast.LENGTH_LONG).show();

                        listaPaises.add(new Pais(idPais, namePais));

                    }

                    paisesArrayAdapter = new PaisesArrayAdapter(SignupActivity.this,
                            android.R.layout.simple_spinner_item,
                            listaPaises);
                    sp_paises.setAdapter(paisesArrayAdapter);

                    sp_paises.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                        @Override
                        public void onItemSelected(AdapterView<?> adapterView, View view,
                                                   int position, long id) {
                            // Here you get the current item (a User object) that is selected by its position
                            Pais pais = paisesArrayAdapter.getItem(position);

                            sp_paises.setEnabled(true);

                            getEstados(pais.getID());

                            // Here you can do the action you want to...
                            //Toast.makeText(SignupActivity.this, "ID: " + pais.getID() + "\nName: " + pais.getNombre(),
                                    //Toast.LENGTH_SHORT).show();
                        }
                        @Override
                        public void onNothingSelected(AdapterView<?> adapter) {  }
                    });


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }


            @Override
            public void onFailure(int statusCode, Header[] headers, String responseString, Throwable throwable) {
                super.onFailure(statusCode, headers, responseString, throwable);
                Toast.makeText(SignupActivity.this, "Status Code: " + statusCode,Toast.LENGTH_LONG).show();

            }
        });
    }

    public void getEstados(String paisID){

        listaEstados = new ArrayList<Estado>();

        RequestParams params = new RequestParams();
        params.put("id_pais", paisID);

        AsyncHttpClientManagement.get(Vars.GET_ESTADOS, params, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                try {
                    JSONArray estados = response.getJSONArray("estados");

                    for (int i = 0; i < estados.length(); i++) {
                        JSONObject estado = estados.getJSONObject(i);

                        String idEstado = estado.getString("idestado");
                        String idPais = estado.getString("idpais");
                        String nameEstado = estado.getString("nom_est");

                        //Toast.makeText(SignupActivity.this, namePais,Toast.LENGTH_LONG).show();

                        listaEstados.add(new Estado(idEstado, nameEstado, idPais));

                    }

                    estadosArrayAdapter = new EstadosArrayAdapter(SignupActivity.this,
                            android.R.layout.simple_spinner_item,
                            listaEstados);
                    sp_estados.setAdapter(estadosArrayAdapter);

                    sp_estados.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                        @Override
                        public void onItemSelected(AdapterView<?> adapterView, View view,
                                                   int position, long id) {
                            // Here you get the current item (a User object) that is selected by its position
                            Estado estado = estadosArrayAdapter.getItem(position);
                            sp_estados.setEnabled(true);

                            getMunicipios(estado.getID());
                            // Here you can do the action you want to...
                            //Toast.makeText(SignupActivity.this, "ID: " + pais.getID() + "\nName: " + pais.getNombre(),
                            //Toast.LENGTH_SHORT).show();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> adapter) {
                        }
                    });


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
    }



    public void getMunicipios(String estadoID){

        listaMunicipios = new ArrayList<Municipio>();

        RequestParams params = new RequestParams();
        params.put("id_estado", estadoID);

        AsyncHttpClientManagement.get(Vars.GET_MUNICIPIOS, params, new JsonHttpResponseHandler() {
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                try {
                    JSONArray municipios = response.getJSONArray("municipios");

                    for (int i = 0; i < municipios.length(); i++) {
                        JSONObject municipio = municipios.getJSONObject(i);

                        String idMunicipio = municipio.getString("idmun");
                        String idEstado = municipio.getString("idestado");
                        String nameMunicipio = municipio.getString("nom_mun");

                        //Toast.makeText(SignupActivity.this, namePais,Toast.LENGTH_LONG).show();


                        listaMunicipios.add(new Municipio(idMunicipio, nameMunicipio, idEstado));

                    }





                    municipiosArrayAdapter = new MunicipiosArrayAdapter(SignupActivity.this,
                            android.R.layout.simple_spinner_item,
                            listaMunicipios);
                    sp_municipios.setAdapter(municipiosArrayAdapter);

                    sp_municipios.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {

                        @Override
                        public void onItemSelected(AdapterView<?> adapterView, View view,
                                                   int position, long id) {
                            // Here you get the current item (a User object) that is selected by its position
                            Municipio municipio = municipiosArrayAdapter.getItem(position);

                            MUNICIPIO_ID = municipio.getID();

                            sp_municipios.setEnabled(true);
                            // Here you can do the action you want to...
                            //Toast.makeText(SignupActivity.this, "ID: " + pais.getID() + "\nName: " + pais.getNombre(),
                            //Toast.LENGTH_SHORT).show();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> adapter) {
                        }
                    });


                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public void signup() {
        Log.d(TAG, "Signup");

        if (!validate()) {
            onSignupFailed();
            return;
        }

        _signupButton.setEnabled(false);

        final ProgressDialog progressDialog = new ProgressDialog(SignupActivity.this,
                R.style.AppTheme_Dark_Dialog);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Creating Account...");
        progressDialog.show();

        String name = _nameText.getText().toString();
        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();

        // TODO: Implement your own signup logic here.

        RequestParams params = new RequestParams();
        params.put("name", name);
        params.put("email", email);
        params.put("telephone", "12344567890");
        params.put("password", password);
        params.put("idgusto", "1");
        params.put("idrol", "2");
        params.put("idmun", MUNICIPIO_ID);

        AsyncHttpClientManagement.post(Vars.REGISTER, params, new JsonHttpResponseHandler(){
            @Override
            public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
                super.onSuccess(statusCode, headers, response);

                try
                {
                    String status = response.getString("status");
                    String message = response.getString("message");
                    usuario = new Usuario(response.getJSONObject("usuario"));

                    Log.i("UResponse", usuario.toString());

                    Toast.makeText(getApplicationContext(), status + " " + message, Toast.LENGTH_LONG).show();
                    onSignupSuccess();
                    progressDialog.dismiss();

                }
                catch (Exception e)
                {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Error", Toast.LENGTH_LONG).show();
                    onSignupFailed();
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


    public void onSignupSuccess() {
        _signupButton.setEnabled(true);
        setResult(RESULT_OK, null);
        new GetTipoNegocios().execute();
        //startActivity(new Intent(SignupActivity.this, SelectPreferencesActivity.class));
        //finish();
    }

    public void onSignupFailed() {
        //Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();

        _signupButton.setEnabled(true);
    }

    public boolean validate() {
        boolean valid = true;

        String name = _nameText.getText().toString();
        String email = _emailText.getText().toString();
        String password = _passwordText.getText().toString();
        String retrypassword = _confimPassword.getText().toString();

        if (name.isEmpty() || name.length() < 3) {
            _nameText.setError("Tu nombre de usuario tener por lo menos 3 caracteres");
            valid = false;
        } else {
            _nameText.setError(null);
        }

        if (email.isEmpty() || !android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            _emailText.setError("Ingresa una direccion de correo valida");
            valid = false;
        } else {
            _emailText.setError(null);
        }

        if (password.isEmpty() || password.length() < 4 || password.length() > 10) {
            _passwordText.setError("La contraseña debe tener de 4 a 10 caracteres alphanumericos");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        if (!password.equals(retrypassword)){
            _confimPassword.setError("Las contraseñas no coinciden.");
            valid = false;
        }

        //return valid;
        return true;
    }

    public void showDatePickerDialog(View v) {
        DialogFragment newFragment = new DatePickerFragment();
        newFragment.show(getSupportFragmentManager(), "datePicker");
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
        String item = adapterView.getItemAtPosition(i).toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }


    private class GetTipoNegocios extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            // Showing progress dialog
            pDialog = new ProgressDialog(SignupActivity.this);
            pDialog.setMessage("Please wait...");
            pDialog.setCancelable(false);
            pDialog.show();

        }

        @Override
        protected Void doInBackground(Void... arg0) {
            HttpHandler sh = new HttpHandler();

            // Making a request to url and getting response
            String jsonStr = sh.makeServiceCall(Vars.GET_NEGOCIOS);

            Log.e(TAG, "Response from url: " + jsonStr);

            if (jsonStr != null) {
                try {
                    JSONObject jsonObj = new JSONObject(jsonStr);
                    // Getting JSON Array node
                    JSONArray tipoNegociosArray = jsonObj.getJSONArray("tipoNegocios");

                    // looping through All Contacts
                    for (int i = 0; i < tipoNegociosArray.length(); i++) {
                        JSONObject c = tipoNegociosArray.getJSONObject(i);

                        String id_negocio = c.getString("idtiponeg");
                        String negocio_name = c.getString("tipo");

                        // tmp hash map for single contact
                        Negocio negocio = new Negocio(id_negocio, negocio_name);

                        tipoNegociosList.add(negocio);
                    }
                } catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG)
                                    .show();
                        }
                    });

                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG)
                                .show();
                    }
                });

            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);
            // Dismiss the progress dialog
            if (pDialog.isShowing())
                pDialog.dismiss();


            Intent intent = new Intent(SignupActivity.this, SelectPreferencesActivity.class);
            intent.putParcelableArrayListExtra("tipoNegociosList", tipoNegociosList);
            intent.putExtra("user", usuario);
            startActivity(intent);
            SignupActivity.this.finish();



            /**
             * Updating parsed JSON data into ListView
             *
            ListAdapter adapter = new SimpleAdapter(
                    MainActivity.this, contactList,
                    R.layout.list_item, new String[]{"name", "email",
                    "mobile"}, new int[]{R.id.name,
                    R.id.email, R.id.mobile});

            lv.setAdapter(adapter);

             */
        }



    }
}
