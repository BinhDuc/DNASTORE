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
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <link href = "${pageContext.request.contextPath}/css/jquery-ui.min.css" rel = "stylesheet">
    <script src = "${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <style>
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
	 <section class="bg-lienhe">
        <div class="link-title">
            <h1>Liên hệ</h1>
        
            <div class="title-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                /
                <a href="">Liên hệ</a>
            </div>
        </div>
        
    </section>

    <section class="contact">
        <div class="section">
            <div class="row container">
                <div class="col-left">
                   <img src="./images/show_image_footers.webp" alt="anh vd">
                </div>
                <div class="col-right">
                    <h1>Thông tin liên hệ</h1>
                    <hr width="100px" align="left" style="margin-bottom: 50px">
                    <div  class="info">
                        <p class="info-title">Địa chỉ chúng tôi</p>
                        <p>
                            123 Hollywood Street,
                            HaDong,HaNoi,VietNam
                        </p>
                    </div>
                    <div class="info">
                        <p class="info-title">Email chúng tôi</p>
                        <p>company@gmail.com</p>
                    </div>
                    <div class="info">
                        <p class="info-title">Hotline</p>
                        <p>012345678</p>
                    </div>
                    <div class="info">
                        <p class="info-title">Thời gian làm việc</p>
                        <p>
                            Thứ 2 – <br>
                            Thứ 4………………………………………. 9:00am – 10:00pm <br>
                            <br>
                            Thứ 5 – <br>
                            Chủ Nhật………………………………...... 10:00am – 11:00pm
                        </p>
                    </div>
                </div>
            </div>
            <div style="padding: 0 20px;">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.181516953254!2d105.79468715056147!3d20.98079964977126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acc508f938fd%3A0x883e474806a2d1f2!2zSOG7jWMgVmnhu4duIEvhu7kgVGh14bqtdCBN4bqtdCBNw6M!5e0!3m2!1svi!2s!4v1606562965048!5m2!1svi!2s" width="100%" height="600" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
             
        </div>
    </section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>