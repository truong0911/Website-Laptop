<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./fcss/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Đăng nhập</title>
    </head>
    <body>
        <div class="tieude-ttruot">
            
                <div class="bieutuong">
                    <a href="home" class="bieutuong-kn">Nhóm 4</a>
                </div>
        </div>
        <div class="khung">
            <div class="dang-nhap">
                <form action="signin" method="post">
                    <p id="thongbao">${mess}</p>
                    <input class="oviet" type="text" name="taikhoan" placeholder="Nhập tài khoản" autocomplete="off">
                    <input class="oviet" type="password" name="matkhau" placeholder="Nhập mật khẩu" autocomplete="off">
                    <input type="submit" value="Đăng nhập" name="dangnhap" class="nut-bam">
                </form>
<!--                <div class="remember-forgot">
                    <div class="remember">
                        <input id="remember" value="Remember" type="checkbox" name="remember"> <span>Nhớ mật khẩu?</span>
                    </div>
                    <a href="#" id="forgot">Quên mật khẩu?</a>
                </div>-->

                <p id="mauchu1">---Nếu đã/chưa có tài khoản---</p>
            </div>


            <div class="dang-ky">
                <p id="mauchu1">Bạn chưa có tài khoản?</p>
                <p id="thongbao">${mess}</p>
                <form action="signup" method="post">
                    <input class="oviet" type="text" name="ten" placeholder="Tên người dùng">
                    <input class="oviet" type="text" name="taikhoan" placeholder="Tên tài khoản">
                    <input class="oviet" type="password" name="matkhau" placeholder="Mật khẩu">
                    <input class="oviet" type="password" name="nlmatkhau" placeholder="Nhập lại mật khẩu">
                    <input class="oviet" type="text" name="sdt" placeholder="Số điện thoại">
                    <input class="oviet" type="text" name="diachi" placeholder="Địa chỉ">
                    <input type="submit" value="Đăng ký" name ="dangky" class="nut-bam">

                </form>
                <p id="mauchu1">---Nếu đã/chưa có tài khoản---</p>
            </div>

            <button id="nut-chuyen">Đăng nhập/Đăng ký</button>
        </div>

        <script>
            $(document).ready(function(){
                $(".dang-ky").hide();

                $("#nut-chuyen").click(function(){
                    $(".dang-nhap,.dang-ky").toggle();
                    
                })
            })
        </script>
    </body>
</html>
