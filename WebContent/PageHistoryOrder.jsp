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
    	.history{
    		display: flex;
    		justify-content: space-between;
    		align-items: center;
    		padding:10px;
    		margin:20px;
    		border-bottom: 1px solid #696969;
    		cursor: pointer;
    	}
    	.history:hover{
    		background:#f3f3f3;
    		cursor: pointer;
    	}
    	.btn-return{
        	padding: 20px;
        	background: #f3f3f3;
        }
        .btn-return button{
        	border: none;
        	outline:none;
        	padding:10px;
        	cursor: pointer;
        	background:none;
        	font-size:16px;
        }
        @media screen and (max-width: 600px) {
	        .btn-return{
	        	padding: 10px;
	        }
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
	<section>
		<div class="btn-return">
            <button onclick="history.back(-1)"><i class="fas fa-arrow-left"></i></button>
            <span style="text-align: center;">Lịch Sử Mua Hàng</span>
        </div>
		<c:forEach items="${listOrder}" var="listOrder" >
			<div class="history clickable-row" data-href='historyDetail?orders_id=${listOrder.id}'>
			<div>
				<p>Thời gian: ${listOrder.orderdate}</p>
				<p>Mã đơn hàng: ${listOrder.id}</p>
				<c:choose>
					<c:when test="${listOrder.status == '0'}">
				    	<p>Trạng thái: <span style="color:#696969">Chờ xác nhận</span></p>
					</c:when>
					<c:when test="${listOrder.status == '1'}">
				    	<p>Trạng thái: <span style="color:#ec8209">Đang giao</span></p>
					</c:when>
				    <c:otherwise>
						<p>Trạng thái: <span style="color:#00ff73">Đơn hàng thành công</span></p>
				    </c:otherwise>
				</c:choose>
				
			</div>
			<div>
				<i class="fas fa-chevron-right"></i>
			</div>
			</div>
		</c:forEach>
        <script>
	      	jQuery(document).ready(function($) {
	      	    $(".clickable-row").click(function() {
	      	        window.location = $(this).data("href");
	      	    });
	      	});
      	</script>
		
	</section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>