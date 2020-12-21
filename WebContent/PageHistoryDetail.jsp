<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@page import="dnastore.beans.Cart"%>
 <%@page import="dnastore.beans.Product"%>
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
    <link rel="stylesheet" href="./css/checkout.css">
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <style>
    	/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox */
		input[type=number] {
		  -moz-appearance: textfield;
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
    </style>
</head>
<body>
	
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="btn-return">
         <button onclick="history.back(-1)"><i class="fas fa-arrow-left"></i></button>
         <span style="text-align: center;">Chi Tiết Đơn Hàng : ${orderdetail.orders_id.id}</span>
     </div>
	<div class="rows">
        <div class="column-70">
            <div class="con">
	            
		            <h2 style="border-bottom: 1px solid #ccc;">Thông tin thanh toán</h2>
		            <br>
		            <label for="customer">Họ tên:</label>
		            <input type="text" id="name" class="input-checkout" value="${orderdetail.orders_id.customer}" readonly/>
		            <label for="phone">Số điện thoại:</label>
		            <input type="number" id="phone" class="input-checkout" value="${orderdetail.orders_id.phone}" readonly />
		            <label for="adr">Địa chỉ giao hàng:</label>
		            <input type="text" class="input-checkout" value="${orderdetail.orders_id.address}" readonly />
		            <label>Phương thức thanh toán:</label>
		            <input type="text" class="input-checkout" value="${orderdetail.orders_id.payment}" readonly />
		            <input type="hidden" name="username" class="input-checkout" value="${user.userName}" />
		            <c:choose>
						<c:when test="${orderdetail.orders_id.status == '0'}">
					    	<p>Trạng thái: <span style="color:#696969">Chờ xác nhận</span></p>
						</c:when>
						<c:when test="${orderdetail.orders_id.status == '1'}">
					    	<p>Trạng thái: <span style="color:#ec8209">Đang giao</span></p>
						</c:when>
					    <c:otherwise>
							<p>Trạng thái: <span style="color:#00ff73">Đơn hàng thành công</span></p>
					    </c:otherwise>
					</c:choose>
	            
            </div>
        </div>
        
        <div class="column-70">
            <div class="con">
                <h2>Đơn hàng</h2>
                <br>
                <table id="table">
                	<c:forEach items="${list}" var="list" >
		                <tr style="display:flex;justify-content: space-between;">
		                    <td style="flex-basis: 30%;max-width: 30%;height: 150px">
		                        <img src="${pageContext.request.contextPath}/image?code=${list.product_id.code}" alt="anhsanpham" style="height:auto;width: auto">
		                    </td>
		                    <td style="flex-basis: 60%;max-width: 60%;">
		                        <a href="product?code=${list.product_id.code}">${list.product_id.name}</a>
		                        <p>Số lượng: ${list.quantity}</p>
		                    </td>
		                    <td style="flex-basis: 20%;max-width: 20%;display: none;" id="loop">
		                    	${list.total_price - (list.total_price*list.coupon/100)}
		                    </td>
		                    <td style="flex-basis: 40%;max-width: 40%;overflow:hidden" id="loop">
		                    	<script>
									var price = ${list.total_price - (list.total_price*list.coupon/100)};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script> 
		                    </td>
		                    
		                </tr>
	                </c:forEach>
	          	</table>
                <br>
                <p style="margin-top:10px;">
                	Tổng tiền:
                	<script type="text/javascript">
			   			var table = document.getElementById("table"), sumVal = 0;
			        
			        	for(var i = 0; i < table.rows.length; i++)
				        {
				            sumVal = sumVal + parseInt(table.rows[i].cells[2].innerHTML);
				        }
			        	sumVal = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(sumVal);
						document.write(sumVal);
				        console.log(sumVal);
					</script>
                </p>
        	</div>
        </div>
    </div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>