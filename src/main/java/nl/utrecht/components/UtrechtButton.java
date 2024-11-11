package nl.utrecht.components;

import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.ajax.markup.html.AjaxLink;
import org.apache.wicket.behavior.AttributeAppender;
import org.apache.wicket.markup.ComponentTag;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.panel.Panel;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

public class UtrechtButton extends Panel {
    private static final long serialVersionUID = 1L;
    
    public enum ButtonStyle {
        PRIMARY_ACTION("utrecht-button--primary-action"),
        SECONDARY_ACTION("utrecht-button--secondary-action"),
        SUBTLE("utrecht-button--subtle"),
        SUCCESS("utrecht-button--ready"),
        DANGER("utrech-button--danger"),
        WARNING("utrech-button--warning");
        
        private final String cssClass;
        
        ButtonStyle(String cssClass) {
            this.cssClass = cssClass;
        }
        
        public String getCssClass() {
            return cssClass;
        }
    }
    private final AjaxLink<Void> button;
    private final Label label;
    private boolean isDisabled = false;
    
    public UtrechtButton(String id, IModel<String> labelModel) {
        this(id, labelModel, ButtonStyle.PRIMARY_ACTION);
    }
    
    public UtrechtButton(String id, IModel<String> labelModel, ButtonStyle style) {
        super(id);
        
        button = new AjaxLink<Void>("button") {
            @Override
            public void onClick(AjaxRequestTarget target) {
                if (!isDisabled) {
                    UtrechtButton.this.onClick(target);
                }
            }
            
            @Override
            protected void onComponentTag(ComponentTag tag) {
                super.onComponentTag(tag);
                tag.put("class", "utrecht-button " + style.getCssClass() + " " + (isDisabled ? "utrecht-button--disabled": ""));
                if (isDisabled) {
                    tag.put("disabled", "disabled");
                }
            }
        };
        
        label = new Label("label", labelModel);
        button.add(label);
        add(button);
    }
    
    protected void onClick(AjaxRequestTarget target) {
        // Override this method to handle click events
    }
    
    public UtrechtButton setDisabled(boolean disabled) {
        this.isDisabled = disabled;
        return this;
    }
    
    public UtrechtButton addCssClass(String cssClass) {
        button.add(new AttributeAppender("class", Model.of(cssClass), " "));
        return this;
    }
}