package components.selectCategories;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.quickmatch.MenuActivity;
import com.quickmatch.R;

import models.Usuario;

/**
 * Created by eitdev on 10/10/17.
 */

public class EditPerfil extends Fragment {

    EditText input_name, input_email, input_password, confirm_pass;
    Button btn_signup;
    Usuario usuario;

    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //returning our layout file
        //change R.layout.yourlayoutfilename for each of your fragments
        View view = inflater.inflate(R.layout.activity_signup, container, false);

        input_name = view.findViewById(R.id.input_name);
        input_email = view.findViewById(R.id.input_email);
        input_password = view.findViewById(R.id.input_password);
        confirm_pass = view.findViewById(R.id.confirm_input_password);
        btn_signup = view.findViewById(R.id.btn_signup);

        usuario = ((MenuActivity)getActivity()).usuario;

        input_name.setText(usuario.getNombre());
        input_email.setText(usuario.getCorreo());
        input_password.setText(usuario.getPass());
        confirm_pass.setText(usuario.getPass());
        btn_signup.setText("Actualizar");

        btn_signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getContext(), "Los campos no pueden estar vacios", Toast.LENGTH_SHORT).show();
            }
        });

        return view;

    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Editar Perfil");
    }
}
