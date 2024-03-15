
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
                <li class="cacmuc "><a href="quanlydonhang?check=0" class="link ${check==0? "active":""}">Đơn Hàng Chờ</a></li>
                <li class="cacmuc "><a href="quanlydonhang?check=1" class="link ${check==1? "active":""}">Đơn Hàng Đã Duyệt</a></li>
            </ul>
        </div>
        <div class="banggiohang ${check==0? "hien":""}">
            <table>
                <thead>
                  <tr>
                    <th>Mã</th>
                    <th>Ngày Đặt</th>
                    <th>Tổng Giá</th>
                    <th>Chi Tiết</th>
                    <th>Xác Nhận</th>
                    <th>Hủy Đơn</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${donchuaduyet}" var="o">
                  <tr>
                    <td>${o.id}</td>
                    <td>${o.date}</td>
                    <td>${o.totalmoney}</td>
                    <td><a href="chitietdonhang?id=${o.id}" class="chitiet">Chi Tiết</a></td>
                    <td><a href="checkquanlydonhang?id=${o.id}&&check=0" class="xacnhan">Xác Nhận</a></td>
                    <td><a href="checkquanlydonhang?id=${o.id}&&check=1" class="huy">Hủy Đơn</a></td>
                  </tr>
                  </c:forEach>
                  
                  
                </tbody>
              </table>
        </div>
        
        
        <div class="banggiohang ${check==1? "hien":""}">
            <table>
                <thead>
                  <tr>
                    <th>Mã</th>
                    <th>Ngày Đặt</th>
                    <th>Tổng Giá</th>
                    <th>Chi Tiết</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${dondaduyet}" var="ok">
                  <tr>
                    <td>${ok.id}</td>
                    <td>${ok.date}</td>
                    <td>${ok.totalmoney}</td>
                    
                    <td><a href="chitietdonhang?id=${ok.id}" class="chitiet">Chi Tiết</a></td>
                    
                  </tr>
                  </c:forEach>
                  
                  
                </tbody>
              </table>
        </div>
    </div>
</body>
</html>
