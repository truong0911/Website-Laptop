package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;
  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_end_begin;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _jspx_tagPool_c_forEach_var_end_begin = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
    _jspx_tagPool_c_if_test.release();
    _jspx_tagPool_c_forEach_var_end_begin.release();
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    \n");
      out.write("        <link rel=\"stylesheet\" href=\"./owlcarousel/assets/owl.carousel.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./owlcarousel/assets/owl.theme.default.min.css\">  \n");
      out.write("        <link rel=\"stylesheet\" href=\"./fcss/reset.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./fcss/homestyle.css\">  \n");
      out.write("        <link rel=\"stylesheet\" href=\"./fcss/grid.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css\" integrity=\"sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("        <title>Trang Chủ</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"khung\">\n");
      out.write("            <div class=\"ttruot\">\n");
      out.write("                <div class=\"owl-carousel owl-theme\">\n");
      out.write("                    <div><img src=\"./img/b4.jpg\" alt=\"\"></div>\n");
      out.write("                    <div><img src=\"./img/b2.jpg\" alt=\"\"></div>\n");
      out.write("                    <div><img src=\"./img/b5.jpg\" alt=\"\"></div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"tieude-ttruot\">   \n");
      out.write("                    <div class=\"bieutuong\">\n");
      out.write("                        <a href=\" \" class=\"bieutuong-kn\">NHÓM9</a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div>\n");
      out.write("                        <ul class=\"thanhcongcu\">\n");
      out.write("                            <li class=\"congcu\"><a href=\"#\" class=\"kn bien-phai\">GIỚI THIỆU</a></li>\n");
      out.write("                            <li class=\"congcu\"><a href=\"#\" class=\"kn bien-phai\">LAPTOP</a></li>\n");
      out.write("                            <li class=\"congcu\"><a href=\"\" class=\"kn bien-phai\">PHỤ KIỆN</a></li>\n");
      out.write("                            ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            \n");
      out.write("                            ");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            \n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"khung-timkiem\">\n");
      out.write("                        <form action=\"search\" method=\"post\">\n");
      out.write("                            <div class=\"tl\" id=\"timkiem\">\n");
      out.write("                                <input value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${valueSearch}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"textSearch\" type=\"text\" class=\"onhap-tk\" placeholder=\"Nhập từ khóa tìm kiếm...\" autocomplete=\"off\">\n");
      out.write("                                <button type=\"submit\" class=\"nut-timkiem\">\n");
      out.write("                                    <i class=\"fa-solid fa-magnifying-glass\"></i>\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"tl\">\n");
      out.write("                            ");
      if (_jspx_meth_c_if_2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                            \n");
      out.write("                            ");
      if (_jspx_meth_c_if_3(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                        </div>  \n");
      out.write("\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"noidung\">\n");
      out.write("                <div class=\"tl-sanpham dong\">\n");
      out.write("                    \n");
      out.write("                    <a href=\"\" class=\"cot l6 m6 c12\">\n");
      out.write("                        <img src=\"./img/lap.jpg\" alt=\"\">\n");
      out.write("                        <div class=\"tl-noidung mau-lap\">\n");
      out.write("                            <div>\n");
      out.write("                                <h1>Máy Tính</h1>\n");
      out.write("                                <p>Spring 2022</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>   \n");
      out.write("                    </a>\n");
      out.write("\n");
      out.write("                    <a href=\"\" class=\"cot l6 m6 c12\">\n");
      out.write("                        <img src=\"./img/mouse.jpg\" alt=\"\">\n");
      out.write("                        <div class=\"tl-noidung mau-chuot\">\n");
      out.write("                            <div>\n");
      out.write("                                <h1>Phụ Kiện</h1>\n");
      out.write("                                <p>Spring 2022</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>    \n");
      out.write("\n");
      out.write("                    </a>\n");
      out.write("\n");
      out.write("<!--                    <a href=\"\" class=\"trend col l4 m4 c12\">\n");
      out.write("                        <img src=\"./img/hot.jfif\" alt=\"\" class=\"img-pro img-trend\">\n");
      out.write("                        <div class=\"tyle-content men-link-content\">\n");
      out.write("                            <div class=\"men-text\">\n");
      out.write("                                <h1>Trend</h1>\n");
      out.write("                                <p>Spring 2022</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>    \n");
      out.write("                    </a>-->\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"khung-nd\">\n");
      out.write("                    <div class=\"dong s-dong\">\n");
      out.write("                        <div class=\"s-cot cot l3 m3 c3\">\n");
      out.write("                            <div class=\"s-chinh\">\n");
      out.write("                                <div class=\"s-bt\">\n");
      out.write("                                    <div class=\"bieutuong-s\">\n");
      out.write("                                        <img width=\"32\" height=\"32\" src=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2.png\" class=\"attachment-medium size-medium\" alt=\"\" srcset=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2-24x24.png 24w\" sizes=\"(max-width: 32px) 100vw, 32px\">\t\t\t\t\t\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-noidung\">\n");
      out.write("                                    <p>Hỗ trợ đổi, trả hàng</p>\n");
      out.write("                                    <h3>Hỗ trợ đổi trả nếu lỗi do nhà phát hành hoặc nhà sản xuất</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"s-cot cot l3 m3 c3\">\n");
      out.write("                            <div class=\"s-chinh\">\n");
      out.write("                                <div class=\"s-bt\">\n");
      out.write("                                    <div class=\"bieutuong-s\">\n");
      out.write("                                        <img width=\"32\" height=\"32\" src=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1.png\" class=\"attachment-medium size-medium\" alt=\"\" srcset=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1-24x24.png 24w\" sizes=\"(max-width: 32px) 100vw, 32px\">\t\t\t\t\t\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-noidung\">\n");
      out.write("                                    <p>Chính sách giao hàng</p>\n");
      out.write("                                    <h3>Hỗ trợ giao hàng toàn quốc, miễn phí ship toàn quốc</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"s-cot cot l3 m3 c3\">\n");
      out.write("                            <div class=\"s-chinh\">\n");
      out.write("                                <div class=\"s-bt\">\n");
      out.write("                                    <div class=\"bieutuong-s\">\n");
      out.write("                                        <img width=\"32\" height=\"32\" src=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4.png\" class=\"attachment-medium size-medium\" alt=\"\" srcset=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4-24x24.png 24w\" sizes=\"(max-width: 32px) 100vw, 32px\">\t\t\t\t\t\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-noidung\">\n");
      out.write("                                    <p>Bảo mật</p>\n");
      out.write("                                    <h3>Chính sách bảo mật thông tin khi sử dụng website của chúng tôi</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"s-cot cot l3 m3 c3\">\n");
      out.write("                            <div class=\"s-chinh\">\n");
      out.write("                                <div class=\"s-bt\">\n");
      out.write("                                    <div class=\"bieutuong-s\">\n");
      out.write("                                        <img width=\"32\" height=\"32\" src=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3.png\" class=\"attachment-medium size-medium\" alt=\"\" srcset=\"http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3-24x24.png 24w\" sizes=\"(max-width: 32px) 100vw, 32px\">\t\t\t\t\t\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"s-noidung\">\n");
      out.write("                                    <p>Địa chỉ mua hàng</p>\n");
      out.write("                                    <h3>Sản phẩm được phân phối tại hệ thống Điện máy xanh, FPT Shop</h3>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                \n");
      out.write("                <div class=\"khung-chu\">\n");
      out.write("                    <h2 class=\"chu\">Sản phẩm mới nhất</h2>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"nd-sanpham dong\">\n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"khung-chu\">\n");
      out.write("                    <h2 class=\"chu\">Tất cả sản phẩm</h2>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"phanloai\">\n");
      out.write("                    <li class=\"phanloai-sp ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag==0? \"active\":\"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        <a class=\"mauchu\" href=\"home\">\n");
      out.write("                            Tất cả sản phẩm\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                   \n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                   \n");
      out.write("                </ul>\n");
      out.write("                <div class=\"nd-sanpham dong\">\n");
      out.write("                    \n");
      out.write("                    ");
      if (_jspx_meth_c_forEach_2(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                \n");
      out.write("                </div>\n");
      out.write("                <div class=\"pagination\">\n");
      out.write("                    ");
      if (_jspx_meth_c_if_4(_jspx_page_context))
        return;
      out.write("   \n");
      out.write("                    ");
      if (_jspx_meth_c_if_5(_jspx_page_context))
        return;
      out.write("   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("                \n");
      out.write("            \n");
      out.write("            <footer class=\"chantrang\">\n");
      out.write("                <div>\n");
      out.write("                    <p>CÁC THÀNH VIÊN</p>\n");
      out.write("                    <ul>\n");
      out.write("                        <li>Nguyễn Quang Hải</li>\n");
      out.write("                        <li>Nguyễn Đức Việt</li>\n");
      out.write("                        <li>Phan Mạnh Tân</li>\n");
      out.write("                        <li>Nguyễn Đan Trường</li>\n");
      out.write("                        <li>Nguyễn Văn Tường</li>\n");
      out.write("                    </ul>  \n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <p>ĐỊA CHỈ</p>\n");
      out.write("                    <h3>Tại Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</h3>   \n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <p>LIÊN LẠC</p>\n");
      out.write("                    <h3>Email: btlweb@gmail.com</h3>\n");
      out.write("                    <h3>Số điện thoại: 09999999999</h3>\n");
      out.write("                </div>\n");
      out.write("            </footer>                 \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js\" integrity=\"sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\" integrity=\"sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"owlcarousel/owl.carousel.min.js\"></script>\n");
      out.write("        <script>$(document).ready(function(){\n");
      out.write("            $(\".owl-carousel\").owlCarousel();\n");
      out.write("          });</script>\n");
      out.write("\n");
      out.write("        <script>autoplay:false;\n");
      out.write("            autoplayTimeout:5000;\n");
      out.write("            autoplayHoverPause:false;</script>\n");
      out.write("        <script>var owl = $('.owl-carousel');\n");
      out.write("            owl.owlCarousel({\n");
      out.write("                items:1,\n");
      out.write("                loop:true,\n");
      out.write("                margin:10,\n");
      out.write("                autoplay:true,\n");
      out.write("                autoplayTimeout:2000,\n");
      out.write("                autoplayHoverPause:true\n");
      out.write("            });\n");
      out.write("            $('.play').on('click',function(){\n");
      out.write("                owl.trigger('play.owl.autoplay',[2000]);\n");
      out.write("            });\n");
      out.write("            $('.stop').on('click',function(){\n");
      out.write("                owl.trigger('stop.owl.autoplay');\n");
      out.write("            });</script>\n");
      out.write("            \n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function(){\n");
      out.write("                $(window).scroll(function(){\n");
      out.write("                    if ($(this).scrollTop()){\n");
      out.write("                        $('.tieude-ttruot').addClass('dinh');\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        $('.tieude-ttruot').removeClass('dinh');\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("             \n");
      out.write("    </body>\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.acc.isAdmin!= 1}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <li class=\"congcu\"><a href=\"\" class=\"kn bien-phai\">TIN TỨC</a></li>\n");
        out.write("                            <li class=\"congcu\"><a href=\"\" class=\"kn\">LIÊN HỆ</a></li>\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.acc.isAdmin == 1}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <li class=\"congcu\"><a href=\"quanlysanpham\" class=\"kn bien-phai\">QL SẢN PHẨM</a></li>\n");
        out.write("                            <li class=\"congcu\"><a href=\"quanlytaikhoan\" class=\"kn\">QL TÀI KHOẢN</a></li>\n");
        out.write("                            <li class=\"congcu\"><a href=\"quanlydonhang\" class=\"kn\">QL ĐƠN HÀNG</a></li>\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }

  private boolean _jspx_meth_c_if_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_2.setPageContext(_jspx_page_context);
    _jspx_th_c_if_2.setParent(null);
    _jspx_th_c_if_2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.acc!=null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_2 = _jspx_th_c_if_2.doStartTag();
    if (_jspx_eval_c_if_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <div class=\"kn-tk\">\n");
        out.write("                                <i class=\"fa-solid fa-circle-user\"></i>\n");
        out.write("                                <h3 class=\"ten-nguoidung\">");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.acc.user}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</h3>\n");
        out.write("\n");
        out.write("                                <div class=\"hienthi-nut\">\n");
        out.write("                                    <a href=\"cart.jsp\"\">Giỏ hàng</a>\n");
        out.write("                                    <a href=\"logOut\">Đăng xuất</a>\n");
        out.write("                                </div>\n");
        out.write("                            </div>\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_2);
    return false;
  }

  private boolean _jspx_meth_c_if_3(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_3.setPageContext(_jspx_page_context);
    _jspx_th_c_if_3.setParent(null);
    _jspx_th_c_if_3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.acc==null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_3 = _jspx_th_c_if_3.doStartTag();
    if (_jspx_eval_c_if_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                            <div class=\"khong-kn-tk\">\n");
        out.write("                                <i class=\"fa-solid fa-circle-user\"></i>\n");
        out.write("\n");
        out.write("                                <div class=\"khong-hienthi-nut\">\n");
        out.write("                                    <a href=\"login.jsp\">Đăng nhập</a>\n");
        out.write("                                </div>\n");
        out.write("                            </div>\n");
        out.write("                            ");
        int evalDoAfterBody = _jspx_th_c_if_3.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_3);
    return false;
  }

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${newProduct}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("n");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                        <div class=\"sanpham cot l3 m4 c12\">\n");
          out.write("                            <img src=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${n.anh}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" alt=\"\">\n");
          out.write("                            <button class=\"nut-chitiet\">\n");
          out.write("                                <a href=\"detail?pid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${n.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"mau-nut\">Chi Tiết</a>\n");
          out.write("                            </button>\n");
          out.write("                            <div class=\"chan-sp\">\n");
          out.write("                                <div class=\"thongtin-sp\">\n");
          out.write("                                    <a href=\"\" class=\"ten-sp\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${n.ten}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("                                    <p class=\"gia\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${n.gia}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write(" VNĐ</p>\n");
          out.write("                                </div>\n");
          out.write("                                <a href=\"\" class=\"them\">Thêm vào giỏ hàng</a>\n");
          out.write("                                <!--<a class=\"them\" href=\"cart?pid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">Thêm vào giỏ hàng</a>-->\n");
          out.write("                            </div>\n");
          out.write("                            \n");
          out.write("                        </div>\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_1 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_1.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_1.setParent(null);
    _jspx_th_c_forEach_1.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.typeOfProduct}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_1.setVar("t");
    int[] _jspx_push_body_count_c_forEach_1 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_1 = _jspx_th_c_forEach_1.doStartTag();
      if (_jspx_eval_c_forEach_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                    <li class=\"phanloai-sp ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag==t.id? \"active\":\"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">\n");
          out.write("                        <a class=\"mauchu\" href=\"category?kind=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${t.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">\n");
          out.write("                            ");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${t.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\n");
          out.write("                        </a>\n");
          out.write("                        \n");
          out.write("                    </li>\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_1[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_1.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_1.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_1);
    }
    return false;
  }

  private boolean _jspx_meth_c_forEach_2(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_2 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_2.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_2.setParent(null);
    _jspx_th_c_forEach_2.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${listProduct}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_2.setVar("p");
    int[] _jspx_push_body_count_c_forEach_2 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_2 = _jspx_th_c_forEach_2.doStartTag();
      if (_jspx_eval_c_forEach_2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                        <div class=\"sanpham cot l3 m4 c12\">\n");
          out.write("                            <img src=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.anh}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" alt=\"\">\n");
          out.write("                            <button class=\"nut-chitiet\">\n");
          out.write("                                <a href=\"detail?pid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"mau-nut\">Chi Tiết</a>\n");
          out.write("                            </button>\n");
          out.write("                            <div class=\"chan-sp\">\n");
          out.write("                                <div class=\"thongtin-sp\">\n");
          out.write("                                    <a href=\"\" class=\"ten-sp\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.ten}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("                                    <p class=\"gia\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.gia}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write(" VNĐ</p>\n");
          out.write("                                </div>\n");
          out.write("                                \n");
          out.write("                                <a class=\"them\" href=\"cart?pid=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${p.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\">Thêm vào giỏ hàng</a>\n");
          out.write("                               \n");
          out.write("                            </div>\n");
          out.write("                        </div>\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_forEach_2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_2[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_2.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_2.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_2);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_4(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_4 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_4.setPageContext(_jspx_page_context);
    _jspx_th_c_if_4.setParent(null);
    _jspx_th_c_if_4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag<1}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_4 = _jspx_th_c_if_4.doStartTag();
    if (_jspx_eval_c_if_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                        ");
        if (_jspx_meth_c_forEach_3((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_4, _jspx_page_context))
          return true;
        out.write(" \n");
        out.write("                    ");
        int evalDoAfterBody = _jspx_th_c_if_4.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_4);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_4);
    return false;
  }

  private boolean _jspx_meth_c_forEach_3(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_4, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_3 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_end_begin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_3.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_4);
    _jspx_th_c_forEach_3.setBegin(1);
    _jspx_th_c_forEach_3.setEnd(((java.lang.Integer) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${endP}", java.lang.Integer.class, (PageContext)_jspx_page_context, null)).intValue());
    _jspx_th_c_forEach_3.setVar("i");
    int[] _jspx_push_body_count_c_forEach_3 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_3 = _jspx_th_c_forEach_3.doStartTag();
      if (_jspx_eval_c_forEach_3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <a href=\"home?index=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("&&kind=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tagpage==i? \"active\":\"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_3.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_3[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_3.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_3.doFinally();
      _jspx_tagPool_c_forEach_var_end_begin.reuse(_jspx_th_c_forEach_3);
    }
    return false;
  }

  private boolean _jspx_meth_c_if_5(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_5 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_5.setPageContext(_jspx_page_context);
    _jspx_th_c_if_5.setParent(null);
    _jspx_th_c_if_5.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag>=1}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_5 = _jspx_th_c_if_5.doStartTag();
    if (_jspx_eval_c_if_5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                        ");
        if (_jspx_meth_c_forEach_4((javax.servlet.jsp.tagext.JspTag) _jspx_th_c_if_5, _jspx_page_context))
          return true;
        out.write(" \n");
        out.write("                    ");
        int evalDoAfterBody = _jspx_th_c_if_5.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_5);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_5);
    return false;
  }

  private boolean _jspx_meth_c_forEach_4(javax.servlet.jsp.tagext.JspTag _jspx_th_c_if_5, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_4 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_end_begin.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_4.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_4.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_if_5);
    _jspx_th_c_forEach_4.setBegin(1);
    _jspx_th_c_forEach_4.setEnd(((java.lang.Integer) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${endP}", java.lang.Integer.class, (PageContext)_jspx_page_context, null)).intValue());
    _jspx_th_c_forEach_4.setVar("i");
    int[] _jspx_push_body_count_c_forEach_4 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_4 = _jspx_th_c_forEach_4.doStartTag();
      if (_jspx_eval_c_forEach_4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                            <a href=\"category?index=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("&&kind=");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tag}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("\" class=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${tagpage==i? \"active\":\"\"}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${i}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</a>\n");
          out.write("                        ");
          int evalDoAfterBody = _jspx_th_c_forEach_4.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_4[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_4.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_4.doFinally();
      _jspx_tagPool_c_forEach_var_end_begin.reuse(_jspx_th_c_forEach_4);
    }
    return false;
  }
}
