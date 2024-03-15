<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./fcss/pay.css">
        <link rel="stylesheet" href="./fcss/reset.css"> 
        <link rel="stylesheet" href="./fcss/grid.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Đặt hàng</title>
    </head>
    <body>
    <div class="khung-chinh">
        <div class="tieude">
            <div class="trangchu-quanly">
                <a href="home" class="trangchu">Trang chủ</a>
            </div>
            

            </div>
            <div class="khung-sp">
            <div class="luoi rong">
                <form action="checkout" method="post">
                    <div class="noidung dong">
                        <div class="cot l7 m7 c12">
                            <div class="sanpham">
                                <h1>THÔNG TIN THANH TOÁN</h1>

                                <div>
                                    <div class="thongtin-ngdung">
                                        <label for="name">Tên</label>
                                        <input type="text" name="ten" value="${sessionScope.acc.ten}" class="onhap-tt">
                                    </div>
                                    <div class="thongtin-ngdung">
                                        <label for="address">Địa chỉ</label>
                                        <input type="text" name="diachi" value="${sessionScope.acc.diachi}" class="onhap-tt">
                                    </div>
                                    <div class="thongtin-ngdung">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" name="sdt" value="${sessionScope.acc.sdt}" class="onhap-tt">
                                    </div>

                                </div> 
                            </div>
                        </div>
                        <div class="bien-trai cot l5 m5 c12">
                            <div class="tong">
                                <div class="tieude-tt">
                                    <h1>Sản phẩm</h1>
                                    <h1>Tổng</h1>
                                </div>
                                <c:forEach items="${sessionScope.cart.items}" var="item">
                                <div class="sp">
                                    
                                    <div>
                                        <h2>${item.product.ten} x  </h2> 
                                        <h2 class="soluong"> ${item.quantity}</h2>
                                    </div>

                                    <span class="gia">${item.quantity * item.product.gia}</span>
                                    
                                </div>
                                </c:forEach>
                                <div>
                                    <h2>Giao hàng</h2>
                                    <span>Giao hàng miễn phí</span>
                                </div>
                                <div>
                                    <h2>Thanh toán</h2>
                                    <span>Trả tiền khi nhận hàng</span>
                                </div>
                                <div>
                                    <h2>Tổng</h2>
                                    <c:set var="grandTotal" value="0" />

                                    <c:forEach items="${sessionScope.cart.items}" var="item">
                                        <c:set var="subtotal" value="${item.quantity * item.product.gia}" />
                                        <c:set var="grandTotal" value="${grandTotal + subtotal}" />
                                    </c:forEach>  

                                <td data-title="Tạm tính">${grandTotal}</td>
                                   
                                </div>
                            </div>
                            <button type="submit" class="dathang">Đặt Hàng</button>
                            
                        </div>
                    </div>
                </form>
            </div>             
        </div>
    </div>
    </body>
</html>
