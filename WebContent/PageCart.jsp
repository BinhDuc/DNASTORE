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
	<div class=" cart">
		<div class="cart-header">
            <button onclick="history.back(-1)"><i class="fas fa-arrow-left"></i></button>
            <span>Giỏ hàng của tôi</span>
        </div>
	    <table>
	        <tr bgcolor="#CCCCCC">
	            <td>Sản phẩm</td>
	            <td>Số lượng</td>
	            <td>Giá </td>
	            <td>Thành tiền</td>
	        </tr>
	        <jsp:useBean id="cart" scope="session" class="dnastore.beans.CartBean" />
	
	        <c:if test="${cart.lineItemCount == 0}">
	            <tr> <td colspan="4">- Cart is currently empty -</td></tr>
	            <tr> <td colspan="4"><a href="#" class="checkout btn">Mua hàng</a> </td></tr>
	        </c:if>
	
	        <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
	            <form name="item" method="POST" action="${pageContext.request.contextPath}/giohang">
	                <tr>
	                    <td><c:out value="${cartItem.description}"/></td>
	                    <td>
	                        <input type='hidden' name='stt' value='<c:out value="${counter.count}"/>'>
	                        <input type='number' name="quantity" value='<c:out value="${cartItem.quantity}"/>'> 
	                        <input type="submit" name="action" value="Update">
	                        <input type="submit" name="action" value="Delete">
	                    </td>
	                    <td><c:out value="${cartItem.price}"/>₫</td>
	                    <td><c:out value="${cartItem.totalCost}"/>₫</td>
	                </tr>
	            </form>
	        </c:forEach>
	        
	    </table>
   		<div class="total-price" style="margin-right:10px">
   			<div class="total">    
                <div>Tổng tiền</div>
                <div><c:out value="${cart.total}"/> ₫</div>

            </div>
            <a href="#" class="checkout btn">Thanh Toán</a>
   		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>