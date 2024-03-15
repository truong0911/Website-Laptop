<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
        <link rel="stylesheet" href="owlcarousel/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="owlcarousel/assets/owl.theme.default.min.css">  
        <link rel="stylesheet" href="./fcss/reset.css">
        <link rel="stylesheet" href="./fcss/homestyle.css">  
        <link rel="stylesheet" href="./fcss/grid.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Trang Chủ</title>
    </head>
    <body>
        <div class="khung">
            <div class="ttruot">
                <div class="owl-carousel owl-theme">
                    <div><img src="./img/b4.jpg" alt=""></div>
                    <div><img src="./img/b2.jpg" alt=""></div>
                    <div><img src="./img/b5.jpg" alt=""></div>
                </div>

                <div class="tieude-ttruot">   
                    <div class="bieutuong">
                        <a href="home" class="bieutuong-kn">Nhóm 4</a>
                    </div>

                    <c:if test="${sessionScope.acc.isAdmin == 2}">
                    <div class="onhap">
                        <select name="cn" id="cn" onchange="myFunction()">
                            <option value="home">-----cn-----</option>
                            <c:forEach items="${cn}" var="c">
                            <option value="phukien?CN=${c.id}" ${c.id==cnht? "selected":""}>${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    </c:if>
                    <div>
                        <ul class="thanhcongcu">
                            <li class="congcu"><a href="home" class="kn bien-phai">GIỚI THIỆU</a></li>
                            <li class="congcu"><a href="laptop?CN=${cnht}" class="kn bien-phai">LAPTOP</a></li>
                            <li class="congcu"><a href="phukien?CN=${cnht}" class="kn bien-phai">PHỤ KIỆN</a></li>
                            <c:if test="${sessionScope.acc.isAdmin!= 1}">
                            <li class="congcu"><a href="home" class="kn bien-phai">TIN TỨC</a></li>
                            <li class="congcu"><a href="home" class="kn">LIÊN HỆ</a></li>
                            </c:if>
                            
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="congcu"><a href="quanlysanpham" class="kn bien-phai">QL SẢN PHẨM</a></li>
                            <li class="congcu"><a href="quanlytaikhoan" class="kn">QL TÀI KHOẢN</a></li>
                            </c:if>
                            
                        </ul>
                    </div>



                    <div class="khung-timkiem">
                        <form action="searchPK?CN=${cnht}" method="post">
                            <div class="tl" id="timkiem">
                                <input value="${valueSearch}" name="textSearch" type="text" class="onhap-tk" placeholder="Nhập từ khóa tìm kiếm..." autocomplete="off">
                                <button type="submit" class="nut-timkiem">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </form>
                         
                        <c:if test="${sessionScope.acc.isAdmin == 0}">
                        <div class="tl" id="cart">
                            <a href="cart.jsp" class="link-cart">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </a>
                        </div>
                        </c:if>
                                
                        <div class="tl">
                            <c:if test="${sessionScope.acc!=null}">
                            <div class="kn-tk">
                                <i class="fa-solid fa-circle-user"></i>
                                <h3 class="ten-nguoidung">${sessionScope.acc.user}</h3>

                                <div class="hienthi-nut">
                                    <c:if test="${sessionScope.acc.isAdmin == 0}">
                                    <a href="cart.jsp"">Giỏ hàng</a>
                                    </c:if>
                                    <a href="logOut">Đăng xuất</a>
                                </div>
                            </div>
                            </c:if>
                            
                            <c:if test="${sessionScope.acc==null}">
                            <div class="khong-kn-tk">
                                <i class="fa-solid fa-circle-user"></i>

                                <div class="khong-hienthi-nut">
                                    <a href="login.jsp">Đăng nhập</a>
                                </div>
                            </div>
                            </c:if>
                        </div>  

                        
                    </div>

                </div>

            </div>

            <div class="noidung">
                <div class="tl-sanpham dong">
                    
                    <a href="laptop" class="cot l6 m6 c12">
                        <img src="./img/lap.jpg" alt="">
                        <div class="tl-noidung mau-lap">
                            <div>
                                <h1>Máy Tính</h1>
                                <p>Spring 2022</p>
                            </div>
                        </div>   
                    </a>

                    <a href="phukien.jsp" class="cot l6 m6 c12">
                        <img src="./img/mouse.jpg" alt="">
                        <div class="tl-noidung mau-chuot">
                            <div>
                                <h1>Phụ Kiện</h1>
                                <p>Spring 2022</p>
                            </div>
                        </div>    

                    </a>

                </div>

                <div class="khung-nd">
                    <div class="dong s-dong">
                        <div class="s-cot cot l3 m3 c3">
                            <div class="s-chinh">
                                <div class="s-bt">
                                    <div class="bieutuong-s">
                                        <img width="32" height="32" src="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2.png" class="attachment-medium size-medium" alt="" srcset="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon2-24x24.png 24w" sizes="(max-width: 32px) 100vw, 32px">					
                                    </div>
                                </div>
                                <div class="s-noidung">
                                    <p>Hỗ trợ đổi, trả hàng</p>
                                    <h3>Hỗ trợ đổi trả nếu lỗi do nhà phát hành hoặc nhà sản xuất</h3>
                                </div>
                            </div>
                        </div>
                        <div class="s-cot cot l3 m3 c3">
                            <div class="s-chinh">
                                <div class="s-bt">
                                    <div class="bieutuong-s">
                                        <img width="32" height="32" src="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1.png" class="attachment-medium size-medium" alt="" srcset="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon1-24x24.png 24w" sizes="(max-width: 32px) 100vw, 32px">					
                                    </div>
                                </div>
                                <div class="s-noidung">
                                    <p>Chính sách giao hàng</p>
                                    <h3>Hỗ trợ giao hàng toàn quốc, miễn phí ship toàn quốc</h3>
                                </div>
                            </div>
                        </div>
                        <div class="s-cot cot l3 m3 c3">
                            <div class="s-chinh">
                                <div class="s-bt">
                                    <div class="bieutuong-s">
                                        <img width="32" height="32" src="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4.png" class="attachment-medium size-medium" alt="" srcset="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon4-24x24.png 24w" sizes="(max-width: 32px) 100vw, 32px">					
                                    </div>
                                </div>
                                <div class="s-noidung">
                                    <p>Bảo mật</p>
                                    <h3>Chính sách bảo mật thông tin khi sử dụng website của chúng tôi</h3>
                                </div>
                            </div>
                        </div>
                        <div class="s-cot cot l3 m3 c3">
                            <div class="s-chinh">
                                <div class="s-bt">
                                    <div class="bieutuong-s">
                                        <img width="32" height="32" src="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3.png" class="attachment-medium size-medium" alt="" srcset="http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3.png 32w, http://mauweb.monamedia.net/hachi/wp-content/uploads/2020/05/policy_icon3-24x24.png 24w" sizes="(max-width: 32px) 100vw, 32px">					
                                    </div>
                                </div>
                                <div class="s-noidung">
                                    <p>Địa chỉ mua hàng</p>
                                    <h3>Sản phẩm được phân phối tại hệ thống Điện máy xanh, FPT Shop</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="khung-chu">
                    <h2 class="chu">Sản phẩm mới nhất</h2>
                </div>

                <div class="nd-sanpham dong">
                    <c:forEach items="${sessionScope.newphukien}" var="n">
                        <div class="sanpham cot l3 m4 c12">
                            <img src="${n.anh}" alt="">
                            <button class="nut-chitiet">
                                <a href="detail?pid=${n.id}" class="mau-nut">Chi Tiết</a>
                            </button>
                            <div class="chan-sp">
                                <div class="thongtin-sp">
                                    <a href="" class="ten-sp">${n.ten}</a>
                                    <p class="gia">${n.gia} VNĐ</p>
                                    <p class="gia">Số lượng: ${n.soluong}</p>
                                    <p class="gia">Chi Nhánh: ${n.branchId}</p>
                                </div>
                                <a href="" class="them">Thêm vào giỏ hàng</a>
                            </div>
                            
                        </div>
                    </c:forEach>
                </div>
                <div class="khung-chu">
                    <h2 class="chu">Tất cả sản phẩm</h2>
                </div>
                <ul class="phanloai">
                    <li class="phanloai-sp ${tag==0? "active":""}">
                        <a class="mauchu" href="phukien.jsp">
                            Tất cả sản phẩm
                        </a>
                    </li>
                   
                    <c:forEach items="${sessionScope.typeOfPhuKien}" var="t">
                    <li class="phanloai-sp ${tag==t.id? "active":""}">
                        <a class="mauchu" href="categoryPK?cID=${t.id}&CN=${cnht}">
                            ${t.name}
                        </a>
                        
                    </li>
                    </c:forEach>
                   
                </ul>
                <div class="nd-sanpham dong">
                    
                    <c:forEach items="${listPK}" var="p">
                        <div class="sanpham cot l3 m4 c12">
                            <img src="${p.anh}" alt="">
                            <button class="nut-chitiet">
                                <a href="detail?pid=${p.id}" class="mau-nut">Chi Tiết</a>
                            </button>
                            <div class="chan-sp">
                                <div class="thongtin-sp">
                                    <a href="" class="ten-sp">${p.ten}</a>
                                    <p class="gia">${p.gia} VNĐ</p>
                                    <p class="gia">Số lượng: ${p.soluong}</p>
                                    <p class="gia">Chi Nhánh: ${p.branchId}</p>
                                </div>
                                
                                <a class="them" href="cart?pid=${p.id}">Thêm vào giỏ hàng</a>
                               
                            </div>
                        </div>
                    </c:forEach>
                
                </div>
            </div>
            
                
            
            <footer class="chantrang">
                <div>
                    <p>CÁC THÀNH VIÊN</p>
                    <ul>
                        <li>Nguyễn Văn Tường</li>
                        <li>Nguyễn Đan Trường</li>
                        <li>Nguyễn Quốc Bảo</li>
                        <li>Phan Trường Vũ</li>
                    </ul>  
                </div>
                <div>
                    <p>ĐỊA CHỈ</p>
                    <h3>Tại Km10, Đường Nguyễn Trãi, Q.Hà Đông, Hà Nội</h3>   
                </div>
                <div>
                    <p>LIÊN LẠC</p>
                    <h3>Email: btlweb@gmail.com</h3>
                    <h3>Số điện thoại: 09999999999</h3>
                </div>
            </footer>                 
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="owlcarousel/owl.carousel.min.js"></script>
        <script>$(document).ready(function(){
            $(".owl-carousel").owlCarousel();
          });</script>

        <script>autoplay:false;
            autoplayTimeout:5000;
            autoplayHoverPause:false;</script>
        <script>var owl = $('.owl-carousel');
            owl.owlCarousel({
                items:1,
                loop:true,
                margin:10,
                autoplay:true,
                autoplayTimeout:2000,
                autoplayHoverPause:true
            });
            $('.play').on('click',function(){
                owl.trigger('play.owl.autoplay',[2000]);
            });
            $('.stop').on('click',function(){
                owl.trigger('stop.owl.autoplay');
            });</script>
            
        <script>
            $(document).ready(function(){
                $(window).scroll(function(){
                    if ($(this).scrollTop()){
                        $('.tieude-ttruot').addClass('dinh');
                    }
                    else{
                        $('.tieude-ttruot').removeClass('dinh');
                    }
                });
            });
        </script>
        
        <script>
            function myFunction() {
                var selectElement = document.getElementById("cn");
                var selectedValue = selectElement.value;
  
                if (selectedValue !== "") {
                    window.location.href = selectedValue;
                }
            }
        </script>
             
    </body>
</html>
