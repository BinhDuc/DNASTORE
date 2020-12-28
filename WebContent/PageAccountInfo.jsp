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
    <link rel="stylesheet" href="./css/SearchStyle.css" />
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.css"> -->
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <link href = "${pageContext.request.contextPath}/css/jquery-ui.min.css" rel = "stylesheet">
    <script src = "${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <style>
        @charset "UTF-8";
        *{
            font-family: AvertaStdCY-Regular;
        }
        .avatar-wrapper {
            position: relative;
            height: 150px;
            width: 150px;
            margin: 0 auto;
            border-radius: 50%;
            overflow: hidden;
            box-shadow: 1px 1px 15px -5px black;
            transition: all 0.3s ease;
            background-color: #fff;
        }
        .avatar-wrapper:hover {
            /* transform: rotate(180deg); */
            cursor: pointer;
        }
        .avatar-wrapper:hover .profile-pic {
            opacity: 0.5;
        }
        .avatar-wrapper .profile-pic {
            height: 100%;
            width: 100%;
            transition: all 0.3s ease;
        }
        .avatar-wrapper .profile-pic:after {
            font-family: FontAwesome;
            content: "";
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            position: absolute;
            font-size: 100px;
            background: #ecf0f1;
            color: #34495e;
            text-align: center;
        }
        .avatar-wrapper .upload-button {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
        }
        .avatar-wrapper .upload-button .fa-arrow-circle-up {
            position: absolute;
            font-size: 104px;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            text-align: center;
            opacity: 0;
            transition: all 0.3s ease;
            color: #34495e;
        }
        .avatar-wrapper .upload-button:hover .fa-arrow-circle-up {
            opacity: 0.9;
        }
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .col-25 {
            float: left;
            width: 25%;
            margin-top: 6px;
        }

        .col-75 {
            float: left;
            width: 75%;
            margin-top: 6px;
        }
        .col-75 input[type=text],
        .col-75 input[type=email],
        .col-75 input[type=date],
        .col-75 input[type=number],
        .col-75 input[type=password],
        .col-75 select,
        .col-75 textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }
        .col-25 label {
            padding: 12px 12px 12px 0;
            display: inline-block;
            color: #666666;
        }
        .editacc {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        .editacc:hover {
            background-color: #45a049;
        }
        .form-acc {
            padding: 20px 100px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, .15);
            backdrop-filter: blur(5px);

        }
        .btn-return{
        	padding: 20px;
        	background: #f3f3f3;
        }
        .btn-return a{
        	border: none;
        	outline:none;
        	padding:10px;
        	cursor: pointer;
        	background:none;
        	font-size:16px;
        }
        #product-description {
            margin: 0;
            padding: 0;
        }
        ul.ui-menu{
        	position: fixed;
        	background: #fff;
        	z-index:9;
        	padding:10px 0 0 0;
        	width:10%;
        }
        .list{
            padding: 0 20px;
            height:100px;
            display:flex;
            border-bottom:1px dotted #ccc;
        }
        .list a{
            display: flex;
            border: none;
        }
        .list a p{
        	color: #ee4d2d;
   			font-size: 1.5rem;
        	font-family: AvertaStdCY-Semibold;
        }
        .list a h3{
        	color: #696969;
   			font-size: 1.5rem;
        	font-family: AvertaStdCY-Regular;
        }
        .list a img{
        	padding-right:30px
        }
        li.list:hover{
        	background-color: rgba(0,0,0,0.1);
        }
        li.list:hover a{
            background-color: transparent;
            border: none;
            color:#333;
        }
        li.list:hover a img{
        	color:#ee4d2d;
        	transform: none;
        }
        @media screen and (max-width: 600px) {

            .col-25,
            .col-75,
            .editacc {
                width: 100%;
                margin-top: 0px;
            }
            .form-acc {
                padding: 10px 10px;
                border-radius: 5px;
                background-color: rgba(255, 255, 255, .15);
                backdrop-filter: blur(5px);

            }
            .col-25 label {
	            padding: 8px 8px 8px 0;
	        }
	        .row{
	        	padding:0;
	        }
	        .btn-return{
	        	padding: 10px;
	        }
        }
        .ui-autocomplete {
		    max-height: 70vh;
		    overflow-y: auto;
		    /* prevent horizontal scrollbar */
		    overflow-x: hidden;
	  	}
    </style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<section >
		<c:choose>
			<c:when test="${Message.equals('Sửa thành công')}">
		    	<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>
				<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
				<script>
				    $(document).ready(function(){
				        swal('Thành Công!', 'Tài khoản của bạn đã thiết lập thành công!', 'success');
				    });
				</script>
			</c:when>
		    <c:otherwise>
				
		    </c:otherwise>
		</c:choose>
        <div class="btn-return" style="">
            <a href="${pageContext.request.contextPath}/taikhoan"><i class="fas fa-arrow-left"></i></a>
            <span style="text-align: center;">Thiết lập tài khoản</span>
        </div>
        <form method="POST" action="${pageContext.request.contextPath}/accountInfo" enctype="multipart/form-data" class="form-acc">
            <div class="avatar-wrapper">
                <img class="profile-pic" src="${pageContext.request.contextPath}/avatar?username=${account.userName}" alt="your image" />
                <div class="upload-button">
                    <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
                </div>
                <input class="file-upload" type="file" accept="image/*" name="image" required/>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>UserName</label>
                </div>
                <div class="col-75">
                    <input type="text" name="username" value="${account.userName}" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Password</label>
                </div>
                <div class="col-75">
                    <input type="password" name="password" value="${account.password}" >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Email</label>
                </div>
                <div class="col-75">
                    <input type="email" name="email" value="${account.email}">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Họ Tên</label>
                </div>
                <div class="col-75">
                    <input type="text" name="fullname" value="${account.fullname}" >
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Giới tính</label>
                </div>
                <div class="col-75">
                	<c:choose>
							<c:when test="${account.gender.equals('Nam')}">
						    	<select name="gender">
		                    		<option value="Nam" selected>Nam</option>
		                    		<option value="Nữ">Nữ</option>
		                    	</select>
							</c:when>
							<c:when test="${account.gender.equals('Nữ')}">
						    	<select name="gender">
						    		<option value="Nữ" selected>Nữ</option>
		                    		<option value="Nam">Nam</option>
		                    	</select>
							</c:when>
						    <c:otherwise>
								<select name="gender">
		                    		<option value="Nam">Nữ</option>
		                    		<option value="Nữ">Nam</option>
		                    	</select>
						    </c:otherwise>
						</c:choose>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Ngày sinh</label>
                </div>
                <div class="col-75">
                    <input type="date" name="birthday" value="${account.birthday}">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Số điện thoại</label>
                </div>
                <div class="col-75">
                    <input type="number" name="phone" value="${account.phone}">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Địa chỉ</label>
                </div>
                <div class="col-75">
                    <input type="text" name="adress" value="${account.adress}" placeholder="Địa chỉ">
                </div>
            </div>
            
            <input type="hidden" name="roleid" value="${account.roleid}">
            
            <br>
            <div class="row">
                <input type="submit" value="Thiết lập tài khoản" class="editacc">
            </div>
        </form>
        <script>
            $(document).ready(function() {
	
                var readURL = function(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('.profile-pic').attr('src', e.target.result);
                        }
                
                        reader.readAsDataURL(input.files[0]);
                    }
                }
            
                $(".file-upload").on('change', function(){
                    readURL(this);
                });
                
                $(".upload-button").on('click', function() {
                $(".file-upload").click();
                });
            });
        </script>
    </section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>