<%-- 
    Document   : suathongtin
    Created on : Nov 23, 2023, 12:59:12 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sưa thong tin</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="fcss/quanlysanphamCss.css">
    <link rel="stylesheet" href="./fcss/themsanpham.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
    <body>
        <h1>Hello World!</h1>
            <div class="mucthemsanpham">
            <form action="suathongtin" method="post" class="khungthemsanpham">

                <div class="tieude-themsanpham">
                    <h1 class="tieudethem">Sửa khách hàng</h1>
                    <i class="fa-solid fa-x" style="cursor: pointer"></i>
                </div>
                <div class="nhapthongtin">
                    <div class="onhap">
                        <label for="id">Ma KH</label>
                        <input type="text" name="id" value="${ac.getId()}" readonly>
                    </div>
                    <div class="onhap">
                        <label for="ten">Tên</label>
                        <input type="text" name="ten" value="${ac.getTen()}" >
                    </div>
                    <div class="onhap">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="${ac.getUser()}" >
                    </div>
                    <div class="onhap">
                        <label for="password">Password</label>
                        <input type="text" id="password" name="password" value="${ac.getPass()}" >
                    </div>
                    <div class="onhap">
                        <label for="repass">Nhập lại password</label>
                        <input type="text" id="repass" name="repass" value="${ac.getPass()}">
                    </div>
                    <div class="onhap">
                        <label for="sdt">SDT</label>
                        <input type="text" id="sdt" name="sdt" value="${ac.getSdt()}">
                    </div>
                    <div class="onhap">
                        <label for="diachi">Địa chỉ</label>
                        <input type="text" id="diachi" name="diachi" value="${ac.getDiachi()}">
                    </div>
                </div>
                
                <div class="xacnhan">
                    <button type="submit" name="k" value="0" height="30">Sửa</button>
                </div>
                
            </form>
        </div>
    </body>
</html>
