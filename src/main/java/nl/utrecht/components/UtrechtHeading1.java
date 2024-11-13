package nl.utrecht.components;

import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;

public class UtrechtHeading1 extends Panel {    
    private final Label label;
    
    public UtrechtHeading1(String id, IModel<String> labelModel) {
        super(id);
        
        label = new Label("slot", labelModel);
        add(label);
    }
}