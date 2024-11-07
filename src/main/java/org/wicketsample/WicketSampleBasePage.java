/*
 * © 2023 iamfortress.net
 */
package org.wicketsample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.wicket.ajax.AjaxRequestTarget;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.html.link.BookmarkablePageLink;
import org.apache.wicket.markup.html.link.Link;
import org.apache.wicket.model.Model;

import nl.utrecht.components.UtrechtButton;
import jakarta.servlet.http.HttpServletRequest;

public abstract class WicketSampleBasePage extends WebPage
{
    public WicketSampleBasePage()
    {
        add( new BookmarkablePageLink( "wspage1.link", Page1.class ) );
        add( new BookmarkablePageLink( "wspage2.link", Page2.class ) );
        add( new BookmarkablePageLink( "wspage3.link", Page3.class ) );
        final Link actionLink = new Link( "logout.link" )
        {
            @Override
            public void onClick()
            {
                setResponsePage(LogoutPage.class);
            }
        };
        add( actionLink );
        // add( new Label( "footer", "© 2023 iamfortress.net" ) );
        add( new UtrechtButton( "footer", Model.of("Primary Action Button"), UtrechtButton.ButtonStyle.PRIMARY_ACTION) );
        // add( new UtrechtButton( "footer2", Model.of("Secondary Action Button"), UtrechtButton.ButtonStyle.SECONDARY_ACTION) );
        // add( new UtrechtButton( "footer3", Model.of("Subtle Button"), UtrechtButton.ButtonStyle.SUBTLE) );

        // add( new UtrechtButton( "footer4", Model.of("Primary Action Button (disabled)")) );
        // add( new UtrechtButton( "footer5", Model.of("Secondary Action Button (disabled)")) );
        // add( new UtrechtButton( "footer6", Model.of("Subtle Button (disabled)")) );
    }

    /**
     * Used by the child pages.
     *
     * @param target for modal panel
     * @param msg to log and display user info
     */
    protected void logIt(AjaxRequestTarget target, String msg)
    {
        info( msg );
        LOG.info( msg );
        target.appendJavaScript(";alert('" + msg + "');");
    }

    protected static final Logger LOG = LoggerFactory.getLogger( WicketSampleBasePage.class.getName() );
}
