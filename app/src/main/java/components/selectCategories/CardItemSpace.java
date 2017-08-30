package components.selectCategories;

import android.content.Context;
import android.support.annotation.NonNull;
import android.view.LayoutInflater;
import android.widget.FrameLayout;

import com.quickmatch.R;

/**
 * Created by eitdev on 30/08/17.
 */

public class CardItemSpace extends FrameLayout {

    public CardItemSpace(@NonNull Context context) {
        super(context);
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);
        addView(inflater.inflate(R.layout.list_item_card_space, null));
    }
}