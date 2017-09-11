package com.quickmatch;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.util.Log;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import components.selectCategories.SelectPreferencesActivity;
import data.HttpHandler;
import models.Category;

public class MenuActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

        @Override
        protected void onCreate(Bundle savedInstanceState) {
                super.onCreate(savedInstanceState);
                setContentView(R.layout.menu_activity);
                Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
                setSupportActionBar(toolbar);

                FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
                fab.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                                Snackbar.make(view, "En construccion", Snackbar.LENGTH_LONG)
                                        .setAction("Action", null).show();
                        }
                });

                DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                        this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
                drawer.setDrawerListener(toggle);
                toggle.syncState();

                NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
                navigationView.setNavigationItemSelectedListener(this);
        }

        @Override
        public void onBackPressed() {
                DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                if (drawer.isDrawerOpen(GravityCompat.START)) {
                        drawer.closeDrawer(GravityCompat.START);
                } else {
                        super.onBackPressed();
                }
        }

        @Override
        public boolean onCreateOptionsMenu(Menu menu) {
                // Inflate the menu; this adds items to the action bar if it is present.
                getMenuInflater().inflate(R.menu.main, menu);
                return true;
        }

        @Override
        public boolean onOptionsItemSelected(MenuItem item) {
                // Handle action bar item clicks here. The action bar will
                // automatically handle clicks on the Home/Up button, so long
                // as you specify a parent activity in AndroidManifest.xml.
                int id = item.getItemId();

                //noinspection SimplifiableIfStatement
                if (id == R.id.action_settings) {
                        return true;
                }

                return super.onOptionsItemSelected(item);
        }

        @SuppressWarnings("StatementWithEmptyBody")
        @Override
        public boolean onNavigationItemSelected(MenuItem item) {
                // Handle navigation view item clicks here.
                int id = item.getItemId();

                if (id == R.id.nav_camera) {
                        // Handle the camera action
                } else if (id == R.id.nav_gallery) {

                } else if (id == R.id.nav_slideshow) {

                } else if (id == R.id.nav_manage) {

                } else if (id == R.id.nav_share) {

                } else if (id == R.id.nav_send) {

                }

                DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
                drawer.closeDrawer(GravityCompat.START);
                return true;
        }

        /*
        private class GetCategories extends AsyncTask<Void, Void, Void> {

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
                        String jsonStr = sh.makeServiceCall(Vars.GET_CATEGORIES);

                        Log.e(TAG, "Response from url: " + jsonStr);

                        if (jsonStr != null) {
                                try {
                                        JSONObject jsonObj = new JSONObject(jsonStr);
                                        // Getting JSON Array node
                                        JSONArray categories = jsonObj.getJSONArray("categorias");

                                        // looping through All Contacts
                                        for (int i = 0; i < categories.length(); i++) {
                                                JSONObject c = categories.getJSONObject(i);

                                                String id_categoria = c.getString("idcateg");
                                                String id_negocio = c.getString("idtiponeg");
                                                String categoria_name = c.getString("categ");
                                                String negocio_name = c.getString("tipo");

                                                // tmp hash map for single contact
                                                Category category = new Category(id_categoria, id_negocio, categoria_name, negocio_name);

                                                categoriesList.add(category);
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
                        intent.putParcelableArrayListExtra("categoriesList", categoriesList);
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

                         *//*
                }

        }
        */
}
