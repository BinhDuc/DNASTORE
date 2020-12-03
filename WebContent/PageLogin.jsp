<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="vi">
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="./images/1234.png" type="image/x-icon">
    <link rel="stylesheet" href="./boxicons-master/css/boxicons.min.css">
    <link rel="stylesheet" href="./css/login.css" />
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <title>DNASTORE</title>
</head>
<body>
	<!-- Container -->
    <div class="container" id="container">
		<c:choose>
			<c:when test="${message.equals('Tạo Tài Khoản Thành Công!')}">
		    	<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
				<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
				<script>
				    $(document).ready(function(){
				        swal('Chào Mừng Bạn!', 'Bạn đã tạo tài khoản thành công!', 'success');
				    });
				</script>
			</c:when>
		    <c:otherwise>
				
		    </c:otherwise>
		</c:choose>
      
      <!-- Row -->
        <div class="row">
            <!-- Sign Up -->
            <div class="col align-center flex-col sign-up">  
                <div class="form-wrapper align-center">
                    <form class="form sign-up" method="POST" action="${pageContext.request.contextPath}/dangky">
                        <div class="input-group">
                            <i class="bx bxs-user"></i>
                            <input type="text" placeholder="Tên đăng nhập" name="username" required />
                        </div>
                		<div class="input-group">
		                	<i class="bx bx-mail-send"></i>
		                	<input type="email" placeholder="Email" name="email" required/>
		              	</div>
                        <div class="input-group">
                            <i class="bx bxs-lock-alt"></i>
                            <input type="password" placeholder="Mật khẩu" name="password" id="password" required />
                        </div>
                        <div class="input-group">
                            <i class="bx bxs-lock-alt"></i>
                            <input type="password" placeholder="Nhập lại mật khẩu" id="confirm_password" required />
                        </div>
                        <input type="hidden" name="roleid" value="3" />
                        <input type="submit" class="btn" value="ĐĂNG KÝ" />
                        <p>
                            <span>Bạn đã có tài khoản?</span>
                            <b id="sign-in">Đăng nhập</b>
                        </p>
                    </form>
                </div>
            </div>
            <!-- End Sign Up -->
            <!-- Sign In -->
            <div class="col align-center flex-col sign-in">
                <div class="form-wrapper align-center">
                    <form class="form sign-in" method="POST" action="${pageContext.request.contextPath}/dangnhap">
                        <div class="input-group">
                            <i class="bx bxs-user"></i>
                            <input type="text" placeholder="Tên đăng nhập" name="userName" />
                        </div>
                        <div class="input-group">
                            <i class="bx bxs-lock-alt"></i>
                            <input type="password" placeholder="Mật khẩu" name="password" />
                        </div>
                        <p style="color: red;">${errorString}</p>
                        <input type="submit" class="btn" value="ĐĂNG NHẬP" />
                        <p>
                            <b>Quên mật khẩu?</b>
                        </p>
                        
                        <p>
                            <span> Bạn mới biết đến <a href="${pageContext.request.contextPath}/" style="text-decoration: none;color: #ee4d2d;font-weight: bold;">DNASTORE</a>? </span>
                            <b id="sign-up">Đăng ký</b>
                        </p>
                    </form>
                </div>

                <div class="form-wrapper">
                    <div class="social-list align-center sign-in">
                        <div class="align-center facebook-bg">
                            <i class="bx bxl-facebook"></i>
                        </div>
                        <div class="align-center google-bg">
                            <i class="bx bxl-google"></i>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Sign In -->
        </div>
        <!-- End Row -->
        <!-- Content Section -->
        <div class="row content-row">
        <!-- Sign In Content -->
            <div class="col align-items flex-col">
                <div class="text sign-in">
                    <h2>Welcome Back</h2>
                </div>
                <div class="img sign-in">
                    <img src="./images/bg1.svg" alt="" />
                </div>
            </div>

        <!-- Sign Up Content -->
            <div class="col align-items flex-col">
                <div class="img sign-up">
                    <img src="./images/bg2.svg" alt="" />
                </div>
                <div class="text sign-up">
                    <h2>Join with us</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End Container -->

    <!-- Script -->

    <script>
        const container = document.getElementById("container");
        const signIn = document.getElementById("sign-in");
        const signUp = document.getElementById("sign-up");

        setTimeout(() => {
        container.classList.add("sign-in");
        }, 200);

        const toggle = () => {
        container.classList.toggle("sign-in");
        container.classList.toggle("sign-up");
        };

        signIn.addEventListener("click", toggle);
        signUp.addEventListener("click", toggle);
        var password = document.getElementById("password")
        var confirm_password = document.getElementById("confirm_password");

        function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Mật khẩu không trùng");
        } else {
            confirm_password.setCustomValidity('');
        }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;

    </script>
</body>
</html>