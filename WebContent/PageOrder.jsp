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
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="rows">
        <div class="column-70">
            <div class="con">
	            <form mathod="post" action="checkout">
		            <h2 style="border-bottom: 1px solid #ccc;">Thông tin thanh toán</h2>
		            <br>
		            <label for="customer">Họ tên:</label>
		            <input type="text" id="name" name="name" class="input-checkout"/>
		            <label for="phone">Số điện thoại:</label>
		            <input type="number" id="phone" name="phone" class="input-checkout"/>
		            <label for="adr">Địa chỉ giao hàng:</label>
		            <textarea id="adr" name="address" placeholder="542 W. 15th Street"></textarea>
		            <label>Phương thức thanh toán:</label>
		            <select name="payment">
		                <option value="COD">COD</option>
		                <option value="Chuyển khoản">Chuyển khoản</option>
		            </select>
		            <input type="hidden" name="username" class="input-checkout"/>
		            <input type="submit" value="Xác nhận thanh toán" class="btn-checkout">
	            </form>
            </div>
        </div>
        <jsp:useBean id="cart" scope="session" class="dnastore.beans.CartBean" />
        <div class="column-30">
            <div class="con">
                <h2>Đơn hàng</h2>
                <br>
                <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
                <div style="display:flex;justify-content: space-between;border-bottom: 1px solid #ccc;">
                    <div style="flex-basis: 20%;max-width: 20%;">
                        <img src="${pageContext.request.contextPath}/image?code=${cartItem.code}" alt="anhsanpham">
                    </div>
                    <div style="flex-basis: 60%;max-width: 60%;">
                        <a href="product?code=${cartItem.code}">${cartItem.name}</a>
                        <p>Số lượng: ${cartItem.quantity}</p>
                    </div>
                    <div style="flex-basis: 10%;max-width: 10%;">
                        <p class="price">
                        	<script>
								var price = ${cartItem.totalCost};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>
						</p>
                    </div>
                </div>
                </c:forEach>
                <br>
                <p style="margin-top:10px;">
                	Tổng tiền:
                	<script>
						var price = ${cart.total};
						price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
						document.write(price);
					</script>
                </p>
            </div>
        </div>
    </div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>