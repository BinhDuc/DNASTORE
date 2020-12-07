<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/1234.png" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<main style="background-color: #c0c0c0;">
        <script>
            jQuery(document).ready(function(e) {
                background();
            });
            function background()
            {
                var img=$('.user-header-wall');
                img.css('background-image', function () {
                var bg = ('url(' + $(this).data('background') + ')');
                return bg;
                });
            }
        </script>
        <section class="user-header" style="background-color: #fff;">
            <div class="user-header-wall" data-background="./images/cloth-1835894_1920.jpg">
            </div>
            
            <div class="user-header-info">
                <div class="avatar-user" style="background: url(DNAStore/WebContent/images/no_avatar.webp)">
                    <img src="${pageContext.request.contextPath}/avatar?username=${user.userName}" alt="avatar">
                </div>
                <p>${user.fullname}</p>
            </div>    
        </section>
        <section class="user-info" style="background-color: #fff;">
            <p>Email: ${user.email}</p>
            <p>Giới tính: ${user.gender}</p>
            <p>Ngày sinh: ${user.birthday}</p>
            <p>Số điện thoại: ${user.phone}</p>
            <p>Địa chỉ: ${user.adress}</p>
        </section>

        <section class="user-option" style="background-color: #fff;">
            <div class="options">
                <i class="fas fa-user"></i>
                <a href="">Thiết lập tài khoản</a>
            </div>
            <div class="options">
                <i class="far fa-clock"></i>
                <a href="">Lịch sử mua hàng</a>
            </div>
            <div class="options" style="margin-bottom:20px">
                <i class="fas fa-sign-out-alt"></i>
                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
            </div>
        </section>
    </main>
    <jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>