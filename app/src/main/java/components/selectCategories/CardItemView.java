package components.selectCategories;


import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.widget.FrameLayout;

import com.quickmatch.R;

/**
 * Created by eitdev on 22/08/17.
 */

public class CardItemView extends FrameLayout{

    public CardItemView(@NonNull Context context) {
        super(context);
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);
        addView(inflater.inflate(R.layout.list_item_card, null));
    }
}
