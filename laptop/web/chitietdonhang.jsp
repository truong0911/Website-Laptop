
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="fcss/quanlydonhang.css">
</head>
<body>
    <div class="main">
        <div class="tieude">
            <ul class="danhsachtieude">
                <li class="cacmuc"><a href="home" class="link">Trang Chủ</a></li>
                <li class="cacmuc"><a href="quanlydonhang" class="link">Trở về</a></li>
                
            </ul>
        </div>
        <div class="bangchitiet">
            <div class="hoadon">
                HÓA ĐƠN
            </div>
            <div class="khachhang">
                <p class="thongtin">Tên Khách Hàng:${account.ten} </p>
                <p class="thongtin">Địa Chỉ:${account.diachi} </p>
                <p class="thongtin">SĐT: ${account.sdt} </p>
            </div>
            <table>
                <thead>
                  <tr>
                    <th>Sản Phẩm</th>
                    <th>Tên</th>
                    <th>Số Lượng</th>
                    <th>Giá</th>
                    
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sanpham}" var="s">
                  <tr>
                      <td><img src="${s.anh}" alt="" height="150" width="150"></td>
                    <td>${s.ten}</td>
                    <td>${s.soluong}</td>
                    <td>${s.gia}</td>
                    
                  </tr>
                    </c:forEach>
                </tbody>
              </table>
              <p class="thongtin">Số Sản Phẩm:${soluong} </p>
              <p class="thongtin">Thành Tiền: ${o.totalmoney}</p>
        </div>
    </div>
</body>
</html>