<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./fcss/cartCss.css">
    <link rel="stylesheet" href="./fcss/reset.css"> 
    <link rel="stylesheet" href="./fcss/grid.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Giỏ hàng</title>
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
        <div class="luoi rong">
            <p class="bieuthi an">Giỏ hàng đã được cập nhật!</p>
            <div class="dong">
                
                <div class="cot l7 m7 c12">
     
                    <div>
                        <table class="ds-giohang">
                            <thead>
                                <tr>
                                    <th colspan="3">Sản phẩm</th>
                                    <th>Giá</th>
                                    <th class="soluong-sp">Số lượng</th>
                                    <th>Tổng</th>
                                </tr>
                            </thead>

                            <tbody>


                                <c:forEach items="${sessionScope.cart.items}" var="item">
                                <tr class="giohang-sp">
                                    <td class="xoa-sp">
                                        <form action="process" method="post">
                                            <input type="hidden" name="id" value="${item.product.id}">
                                            <button class="nut-xoa" type="submit">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                            
                                        </form>

                                    </td>
                                    <td>
                                        <a href="" class="hinhnho">
                                            <img src="${item.product.anh}" alt="" class="anh-sp">
                                        </a>
                                    </td>
                                    <td>
                                        <p>${item.product.ten}</p>
                                    </td>
                                    <td>
                                        <span>${item.product.gia}</span>
                                    </td>
                                    <td class="soluong-sp">
                                        <a class="thuchien" href="process?num=-1&id=${item.product.id}">-</a>
                                        <input type="number" value="${item.quantity}" class="soluong">
                                        <a class="thuchien" href="process?num=1&id=${item.product.id}">+</a>
                                    </td>
                                    <td>
                                        <span>${item.quantity * item.product.gia}</span>
                                    </td>
                                </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="capnhat">
                            <div class="quaylai">
                                <a class="kieuchu" href="home">← Tiếp tục xem sản phẩm    </a>
                            </div>

<!--                            <button  class="nut-capnhat" name="update_cart">Cập nhật giỏ hàng</button>-->
                        </div>

                    </div>
                    
                </div>

                <div class="cot l5 m5 c12 bien-trai">
                    <div class="gh-tongcong">
                        <p class="tongcong">CỘNG GIỎ HÀNG</p>
                        <table>
                            <tr>
                                <th>Tạm tính</th>
                                <c:set var="grandTotal" value="0" />

                                <c:forEach items="${sessionScope.cart.items}" var="item">
                                    <c:set var="subtotal" value="${item.quantity * item.product.gia}" />
                                    <c:set var="grandTotal" value="${grandTotal + subtotal}" />
                                </c:forEach>  

                                <td data-title="Tạm tính">${grandTotal}</td>
                            </tr>
                            <tr>
                                <th>Giao hàng</th>
                                <td data-title="Giao hàng">Giao hàng miễn phí</td>
                            </tr>
                            <tr>
                                <th>Tổng</th>
                                <c:set var="grandTotal" value="0" />

                                <c:forEach items="${sessionScope.cart.items}" var="item">
                                    <c:set var="subtotal" value="${item.quantity * item.product.gia}" />
                                    <c:set var="grandTotal" value="${grandTotal + subtotal}" />
                                </c:forEach>  

                                <td data-title="Tạm tính">${grandTotal}</td>
                            </tr>
                        </table>
                        <div class="quaylai">
		
                            <a href="pay.jsp" class="kieuchu">Tiến hành thanh toán</a>
                        </div>
                    </div>
                </div>

                
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $(".nut-capnhat").click(function(){
                $(".bieuthi").removeClass(".an");
            });
        });
    </script>
</body>
</html>
