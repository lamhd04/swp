package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <title>RegistrationForm_v1 by Colorlib</title>\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("\r\n");
      out.write("        <!-- MATERIAL DESIGN ICONIC FONT -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"fonts/material-design-iconic-font/css/material-design-iconic-font.min.css\">\r\n");
      out.write("\r\n");
      out.write("        <!-- STYLE CSS -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style1.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"wrapper\" style=\"background-image: url('images/banner/banner_2.jpg');\">\r\n");
      out.write("            <div class=\"inner\">\r\n");
      out.write("                <div class=\"image-holder\">\r\n");
      out.write("                    <img src=\"images/blog/blog_3.jpg\" alt=\"\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <form action=\"login\" method=\"post\">\r\n");
      out.write("                    <h3>Login Form</h3>\r\n");
      out.write("\r\n");
      out.write("                    <font color=\"red\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${msg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</font>\r\n");
      out.write("                    <div class=\"form-wrapper\">\r\n");
      out.write("\r\n");
      out.write("                        <input type=\"text\" placeholder=\"Email Address\" class=\"form-control\" name =\"email\">\r\n");
      out.write("                        <i class=\"zmdi zmdi-email\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"form-wrapper\">\r\n");
      out.write("\r\n");
      out.write("                        <input type=\"password\" placeholder=\"Password\" class=\"form-control\" name = \"password\">\r\n");
      out.write("                        <i class=\"zmdi zmdi-lock\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div>\r\n");
      out.write("                        <a style=\"text-decoration: none;\" href=\"ForgotPassword.jsp\"> Forgotten Password?</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <button>Login\r\n");
      out.write("                        <i class=\"zmdi zmdi-arrow-right\"></i>\r\n");
      out.write("                    </button>\r\n");
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->\r\n");
      out.write("\r\n");
      out.write("</html>");
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
