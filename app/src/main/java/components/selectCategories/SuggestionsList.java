package components.selectCategories;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.quickmatch.MenuActivity;
import com.quickmatch.R;

import components.selectTipoNeg.tipoNegocioView;
import models.Category;
import models.Sugerencia;

/**
 * Created by eitdev on 19/09/17.
 */

public class SuggestionsList extends Fragment {


    private LinearLayout content;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        //returning our layout file
        //change R.layout.yourlayoutfilename for each of your fragments
        return inflater.inflate(R.layout.suggestions_list, container, false);

    }


    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Sugerencias");

        content = (LinearLayout) view.findViewById(R.id.content_suggestions);

        for (final Sugerencia item: ((MenuActivity)getActivity()).listaSuggestions) {
            SuggestionView suggestion = new SuggestionView(getContext(), item);
            content.addView(suggestion);

            suggestion.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {

                    ((MenuActivity)getActivity()).currentSugerencia = item;
                    ((MenuActivity) getActivity()).viewDetailsPlace();

                }
            });
        }


    }
}