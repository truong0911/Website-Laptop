
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Khoản</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="fcss/quanlysanphamCss.css">
    <link rel="stylesheet" href="./fcss/themsanpham.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="main">
        <div class="tieude">
            <ul class="danhsachtieude">
                <li class="cacmuc"><a href="home" class="link">Trang Chủ</a></li>
                
            </ul>
        </div>
        <p class="themsanpham"><i class="fa-solid fa-plus"></i>Thêm khách hàng</p>
        <c:if test="${sessionScope.acc.isAdmin == 2}">
            <p class="themsanpham2"><i class="fa-solid fa-plus"></i>Thêm nhân viên</p>
        </c:if>
        <c:if test="${sessionScope.acc.isAdmin == 2}">
            <a class="mauchu" href="quanlytaikhoan?use=0">Khách hàng</a>
            <a class="mauchu" href="quanlytaikhoan?use=1">Nhân viên</a>
        </c:if>
        
        <div class="banggiohang">
            <table>
                <thead>
                  <tr>
                    <th>Mã</th>
                    <th>Tài Khoản</th>
                    <th>Mật Khẩu</th>
                    <th>SĐT</th>
                    <th>Địa Chỉ</th>
                    <th>Chi Nhánh</th>
                    <th>Sửa</th>
                    <th>Xóa</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listA}" var="a">
                  <tr>
                    <td>${a.id}</td>
                    <td>${a.user}</td>
                    <td>${a.pass}</td>
                    <td>${a.sdt}</td>
                    <td>${a.diachi}</td>
                    <td>${a.cn}</td>
                    <td><a href="suathongtin?id=${a.id}&uid=${uid}&k=1">Sửa</a></td>
                    <td><a href="xoataikhoan?id=${a.id}&uid=${uid}" class="chitiet">Xóa</a></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
        </div>
            <div class="mucthemsanpham dis">
            <form action="themtaikhoan" method="post" class="khungthemsanpham" enctype="multipart/form-data">

                <div class="tieude-themsanpham">
                    <h1 class="tieudethem">Thêm khách hàng</h1>
                    <i class="fa-solid fa-x" style="cursor: pointer"></i>
                </div>
                <div class="nhapthongtin">
                    <div class="onhap">
                        <label for="ten">Tên</label>
                        <input type="text" id="ten" name="ten" >
                    </div>
                    <div class="onhap">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" >
                    </div>
                    <div class="onhap">
                        <label for="password">Password</label>
                        <input type="text" id="password" name="password" >
                    </div>
                    <div class="onhap">
                        <label for="repass">Nhập lại password</label>
                        <input type="text" id="repass" name="repass" >
                    </div>
                    <div class="onhap">
                        <label for="sdt">SDT</label>
                        <input type="text" id="sdt" name="sdt">
                    </div>
                    <div class="onhap">
                        <label for="diachi">Địa chỉ</label>
                        <input type="text" id="diachi" name="diachi">
                    </div>
                </div>
                
                <div class="xacnhan">
                    <button type="submit"   height="30">Thêm mới</button>
                </div>
                
            </form>
        </div>
            
<!--            <div class="mucthemsanpham ${dis==1?"active":"dis"}">
            <form action="suathongtin" method="post" class="khungthemsanpham" enctype="multipart/form-data">

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
                        <input type="text" name="ten" value="aktr" >
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
                    <button type="submit" name="k" value="0" height="30">Thêm mới</button>
                </div>
                
            </form>
        </div>-->
            
        <div class="mucthemsanpham2 dis">
            <form action="themtaikhoan" method="post" class="khungthemsanpham" enctype="multipart/form-data">

                <div class="tieude-themsanpham">
                    <h1 class="tieudethem">Thêm nhân viên</h1>
                    <i class="fa-solid fa-x" style="cursor: pointer"></i>
                </div>
                <div class="nhapthongtin">
                    <div class="onhap">
                        <label for="ten">Tên</label>
                        <input type="text" id="ten" name="ten" >
                    </div>
                    <div class="onhap">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" >
                    </div>
                    <div class="onhap">
                        <label for="password">Password</label>
                        <input type="text" id="password" name="password" >
                    </div>
                    <div class="onhap">
                        <label for="repass">Nhập lại password</label>
                        <input type="text" id="repass" name="repass" >
                    </div>
                    <div class="onhap">
                        <label for="sdt">SDT</label>
                        <input type="text" id="sdt" name="sdt">
                    </div>
                    <div class="onhap">
                        <label for="diachi">Địa chỉ</label>
                        <input type="text" id="diachi" name="diachi">
                    </div>
                    <div class="onhap">
                        <label for="cn">Chi nhánh</label>
                        <select name="cn" id="cn">
                            <c:forEach items="${cn}" var="c">
                            <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                
                <div class="xacnhan">
                    <button type="submit"   height="30">Thêm mới</button>
                </div>
                
            </form>
        </div>
            
    </div>
    
    <script>
        $(document).ready(function(){
            $(".themsanpham").click(function(){
                $(".mucthemsanpham").addClass("active");

            })
        })
    </script>
    <script>
        $(document).ready(function(){
            $(".fa-x").click(function(){
                $(".mucthemsanpham").removeClass("active");

            })
        })
    </script>
    <script>
        $(document).ready(function(){
            $(".themsanpham2").click(function(){
                $(".mucthemsanpham2").addClass("active");

            })
        })
    </script>
    <script>
        $(document).ready(function(){
            $(".fa-x").click(function(){
                $(".mucthemsanpham2").removeClass("active");

            })
        })
    </script>
</body>
</html>
