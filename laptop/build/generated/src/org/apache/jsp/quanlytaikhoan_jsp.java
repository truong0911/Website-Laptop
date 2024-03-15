package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class quanlytaikhoan_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Quản Lý Tài Khoản</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"fcss/quanlysanphamCss.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"main\">\n");
      out.write("        <div class=\"tieude\">\n");
      out.write("            <ul class=\"danhsachtieude\">\n");
      out.write("                <li class=\"cacmuc\"><a href=\"\" class=\"link\">Trang Chủ</a></li>\n");
      out.write("                \n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"banggiohang\">\n");
      out.write("            <table>\n");
      out.write("                <thead>\n");
      out.write("                  <tr>\n");
      out.write("                    <th>Mã</th>\n");
      out.write("                    <th>Tài Khoản</th>\n");
      out.write("                    <th>Mật Khẩu</th>\n");
      out.write("                    <th>SĐT</th>\n");
      out.write("                    <th>Địa Chỉ</th>\n");
      out.write("                    <th>Hủy Đơn</th>\n");
      out.write("                  </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                  <tr>\n");
      out.write("                    <td>Some text</td>\n");
      out.write("                    <td>Some text</td>\n");
      out.write("                    <td>Some text</td>\n");
      out.write("                    <td>Some text</td>\n");
      out.write("                    <td>Some text</td>\n");
      out.write("                    <td><a href=\"\" class=\"chitiet\">Hủy</a></td>\n");
      out.write("                  </tr>\n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                </tbody>\n");
      out.write("              </table>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
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
