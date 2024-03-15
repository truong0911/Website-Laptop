<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fcss/reset.css"> 
        <link rel="stylesheet" href="./fcss/detail.css">  
        <link rel="stylesheet" href="./fcss/grid.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Chi tiết sản phẩm</title>
    </head>
    <body>
            <div class="tieude-ttruot">
            
                <div class="bieutuong">
                    <a href="home" class="bieutuong-kn">Nhóm 4</a>
                </div>
                <div>
                    <ul class="thanhcongcu">
                        <li class="congcu"><a href="home" class="kn bien-phai">GIỚI THIỆU</a></li>
                        <li class="congcu"><a href="laptop" class="kn bien-phai">LAPTOP</a></li>
                        <li class="congcu"><a href="phukien" class="kn bien-phai">PHỤ KIỆN</a></li>
                        <li class="congcu"><a href="home" class="kn bien-phai">TIN TỨC</a></li>
                        <li class="congcu"><a href="home" class="kn">LIÊN HỆ</a></li>
                    </ul>
                </div>
<!--                <div>
                    <ul class="thanhcongcu">
                        
                        <li class="congcu"><a href="#" class="kn bien-phai">GIỚI THIỆU</a></li>
                        <li class="congcu"><a href="#" class="kn bien-phai">LAPTOP</a></li>
                        <li class="congcu"><a href="" class="kn bien-phai">PHỤ KIỆN</a></li>
                        <c:if test="${sessionScope.acc.isAdmin!= 1}">
                        <li class="congcu"><a href="" class="kn bien-phai">TIN TỨC</a></li>
                        <li class="congcu"><a href="" class="kn">LIÊN HỆ</a></li>
                        </c:if>

                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <li class="congcu"><a href="quanlysanpham" class="kn bien-phai">QL SẢN PHẨM</a></li>
                        <li class="congcu"><a href="quanlytaikhoan" class="kn">QL TÀI KHOẢN</a></li>
                        </c:if>
                            
                    </ul>
                </div>-->



                <div class="khung-timkiem">
                    <div class="tl" id="cart">
                        <a href="cart.jsp" class="link-cart">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                    </div>

                    <div class="tl">
                        <c:if test="${sessionScope.acc!=null}">
                        <div class="kn-tk">
                            <i class="fa-solid fa-circle-user"></i>
                            <h3 class="ten-nguoidung">${sessionScope.acc.user}</h3>

                            <div class="hienthi-nut">
                                <a href="cart.jsp">Giỏ hàng</a>
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
            
            <div class="khung-sp">
            <div class="anh-sp">
                <h2 class="ten-sp">${sessionScope.p.ten}</h2>
                <h2 class="gia">${sessionScope.p.gia} VNĐ</h2>
                <img src="${p.anh}" alt="">
            </div>
            <div class="chitiet">
                <h2>Mô tả:</h2>
                <p class="mota sodong-hthi">${sessionScope.p.mota}</p>
                <button  class="hthi-them">Xem Thêm</button>
                <button  class="anbot an">Ẩn Bớt</button>

                <div>
                    <p>Thông số kỹ thuật:</p>
                    <table>
                        <tr>
                          <td>Màn hình</td>
                          <td>${sessionScope.detail.manhinh}</td>
                        </tr>
                        <tr>
                          <td>CPU</td>
                          <td>${sessionScope.detail.cpu}</td>
                        </tr>
                        <tr>
                          <td>RAM</td>
                          <td>${sessionScope.detail.ram}</td>
                        </tr>
                        <tr>
                          <td>Ổ cứng</td>
                          <td>${sessionScope.detail.ocung}</td>
                        </tr>
                        <tr>
                          <td>Đồ họa</td>
                          <td>${sessionScope.detail.dohoa}</td>
                        </tr>
                        <tr>
                          <td>Trọng lượng</td>
                          <td>${sessionScope.detail.trongluong}</td>
                        </tr>
                        <tr>
                          <td>Kích thước</td>
                          <td>${sessionScope.detail.kichthuoc}</td>
                        </tr>
                      </table>
                </div>
                <div class="giohang">
                    <button>
                        <a class="them" href="cart?pid=${p.id}">Thêm vào giỏ hàng</a>
                    </button>
                    <button>Mua ngay</button>
                </div>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function(){
                $(".hthi-them").click(function(){
                    $('.mota').removeClass('.sodong-hthi');
                    $('.hthi-them').addClass('an');
                    $('.anbot').removeClass('an');
                });
            });
        </script>

        <script>
            $(document).ready(function(){
                $(".anbot").click(function(){
                    $('.mota').addClass('.sodong-hthi');
                    $('.anbot').addClass('an');
                    $('.hthi-them').removeClass('an');
                });
            });
        </script>
    </body>
</html>
