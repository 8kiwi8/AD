package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <title>Main Navigation</title>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"bootstrap.min.css\">\n");
      out.write("  <script src=\"jquery-1.11.3.min.js\"></script>\n");
      out.write("  <script>\n");
      out.write("      document.onclick = function (e) {\n");
      out.write("        e = e ||  window.event;\n");
      out.write("        var element = e.target || e.srcElement;\n");
      out.write("        if (element.tagName == 'A') {\n");
      out.write("          processAjaxData(element.href);\n");
      out.write("          return false; // prevent default action and stop event propagation\n");
      out.write("        }\n");
      out.write("      };\n");
      out.write("      window.onpopstate = function(e){\n");
      out.write("            if(e.state){\n");
      out.write("                $(\"#content\").load(e.state.html);\n");
      out.write("                document.title = e.state.pageTitle;\n");
      out.write("            }\n");
      out.write("        };\n");
      out.write("        function processAjaxData(urlPath){\n");
      out.write("            var title;\n");
      out.write("            $(\"#content\").load(urlPath,\"\" , function(obj) {\n");
      out.write("                document.title = (obj.match(/<title[^>]*>([^<]+)<\\/title>/)[1]);\n");
      out.write("            });\n");
      out.write("            window.history.pushState({\"html\":urlPath,\"pageTitle\":document.title}, document.title, \"?path=\" + urlPath);\n");
      out.write("        }\n");
      out.write("        $.urlParam = function(name){\n");
      out.write("            var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);\n");
      out.write("            if (results==null){\n");
      out.write("               return null;\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("               return results[1] || 0;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        $(document).ready(function() {\n");
      out.write("            if($.urlParam(\"path\") != \"\"){\n");
      out.write("                processAjaxData($.urlParam(\"path\"));\n");
      out.write("            }            \n");
      out.write("        })\n");
      out.write("  </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<nav class=\"navbar navbar-default\">\n");
      out.write("  <div class=\"container-fluid\">\n");
      out.write("    <div class=\"navbar-header\">\n");
      out.write("      <a class=\"navbar-brand\" href=\"#\">WebSiteName</a>\n");
      out.write("    </div>\n");
      out.write("    <div>\n");
      out.write("      <ul class=\"nav navbar-nav\">\n");
      out.write("        <li class=\"active\"><a href=\"#\">Home</a></li>\n");
      out.write("        <li><a href=\"/Assignment_2/FormLabExerciseMenu.jsp\">Form information posting</a></li>\n");
      out.write("        <li><a href=\"/Assignment_3/survey.html\">Survey Form</a></li>\n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</nav>\n");
      out.write("<div class=\"container\" id='content'>\n");
      out.write("  <h3>Basic Navbar Example</h3>\n");
      out.write("  <p>A navigation bar is a navigation header that is placed at the top of the page.</p>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
