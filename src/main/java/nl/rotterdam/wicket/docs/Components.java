package nl.rotterdam.wicket.docs;

import nl.utrecht.components.UtrechtButton;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.model.Model;

public class Components extends WebPage
{
    public Components()
    {
        add( new UtrechtButton( "footer", Model.of("Secondary Action Button"), UtrechtButton.ButtonStyle.SECONDARY_ACTION) );
    }
}
