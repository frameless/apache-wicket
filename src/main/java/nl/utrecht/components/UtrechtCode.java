package nl.utrecht.components;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;

public class UtrechtCode extends Panel {

    public static final String SLOT_ID = "slot";
    private final Label label;

	public UtrechtCode(String id,IModel<String> textContent) {
		super(id);
		label = new Label(SLOT_ID, textContent);
        add(label);
	}
}