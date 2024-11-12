package nl.rotterdam.wicket.docs;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.model.Model;

import nl.utrecht.components.UtrechtButton;

public abstract class EmptyPage extends WebPage
{
    public EmptyPage()
    {
        add( new UtrechtButton( "footer", Model.of("Secondary Action Button"), UtrechtButton.ButtonStyle.SECONDARY_ACTION) );
    }
}
