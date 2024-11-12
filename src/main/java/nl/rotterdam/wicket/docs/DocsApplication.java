package nl.rotterdam.wicket.docs;

import org.apache.wicket.csp.CSPDirective;
import org.apache.wicket.csp.CSPDirectiveSrcValue;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.protocol.http.WebApplication;
import org.apache.wicket.settings.ExceptionSettings;

public class DocsApplication extends WebApplication
{
	@Override
	public void init()
	{
		super.init();

		// Avoid <wicket:panel> in the output HTML
		getMarkupSettings().setStripWicketTags(true);

		// Configure our own fance error page
		getApplicationSettings().setInternalErrorPage( ErrorPage.class );
		getExceptionSettings().setUnexpectedExceptionDisplay(ExceptionSettings.SHOW_INTERNAL_ERROR_PAGE);

		getCspSettings().blocking().clear()
				.add(CSPDirective.STYLE_SRC, CSPDirectiveSrcValue.SELF)
				.add(CSPDirective.STYLE_SRC, CSPDirectiveSrcValue.UNSAFE_INLINE)
				.add(CSPDirective.SCRIPT_SRC, CSPDirectiveSrcValue.SELF)
				.add(CSPDirective.SCRIPT_SRC, CSPDirectiveSrcValue.UNSAFE_EVAL)
				.add(CSPDirective.SCRIPT_SRC, CSPDirectiveSrcValue.UNSAFE_INLINE);
	}

	@Override
	public Class<? extends WebPage> getHomePage()
	{
		return Components.class;
	}
}
