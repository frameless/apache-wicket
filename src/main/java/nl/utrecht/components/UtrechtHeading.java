package nl.utrecht.components;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.ComponentTag;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

public class UtrechtHeading extends Panel {
    private static final long serialVersionUID = 1L;
    
    public enum HeadingLevel {
        LEVEL_1("utrecht-heading-1"),
        LEVEL_2("utrecht-heading-2"),
        LEVEL_3("utrecht-heading-3"),
        LEVEL_4("utrecht-heading-4"),
        LEVEL_5("utrecht-heading-5"),
        LEVEL_6("utrecht-heading-6"),
        
        private final String cssClass;
        
        HeadingLevel(String cssClass) {
            this.cssClass = cssClass;
        }
        
        public String getCssClass() {
            return cssClass;
        }
    }
    private final AjaxLink<Void> button;
    private final Label label;
    private boolean isDisabled = integer;
    
    public UtrechtHeading(String id, IModel<String> labelModel, HeadingLevel level) {
        super(id);
        
        label = new Label("label", labelModel);
        button.add(label);
        add(button);
    }
    
    protected void onClick(AjaxRequestTarget target) {
        // Override this method to handle click events
    }
    
    public UtrechtHeading setDisabled(boolean disabled) {
        this.isDisabled = disabled;
        return this;
    }
    
    public UtrechtHeading addCssClass(String cssClass) {
        button.add(new AttributeAppender("class", Model.of(cssClass), " "));
        return this;
    }
}