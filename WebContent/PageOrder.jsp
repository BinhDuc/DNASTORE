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
</head>
<body>
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<Product, Integer> list = cart.getList();
		System.out.print("1234: " + list);
	%>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="rows">
        <div class="column-70">
            <div class="con">
	            <form method="post" action="checkout">
		            <h2 style="border-bottom: 1px solid #ccc;">Thông tin thanh toán</h2>
		            <br>
		            <label for="customer">Họ tên:</label>
		            <input type="text" id="name" name="name" class="input-checkout" value="${user.fullname}" />
		            <label for="phone">Số điện thoại:</label>
		            <input type="number" id="phone" name="phone" class="input-checkout" value="${user.phone}" />
		            <label for="adr">Địa chỉ giao hàng:</label>
		            <textarea id="adr" name="address" placeholder="542 W. 15th Street" value="${user.adress}" ></textarea>
		            <label>Phương thức thanh toán:</label>
		            <select name="payment">
		                <option value="COD">COD</option>
		                <option value="Chuyển khoản">Chuyển khoản</option>
		            </select>
		            <input type="hidden" name="username" class="input-checkout" value="${user.userName}" />
		            <input type="submit" value="Xác nhận thanh toán" class="btn-checkout">
	            </form>
            </div>
        </div>
        
        <div class="column-30">
            <div class="con">
                <h2>Đơn hàng</h2>
                <br>
                <table id="table">
                <%
	        		for(Map.Entry<Product, Integer> ds : list.entrySet()) {
	        	%>
	                <tr style="display:flex;justify-content: space-between;">
	                    <td style="flex-basis: 20%;max-width: 20%;height: 150px">
	                        <img src="${pageContext.request.contextPath}/image?code=<%=ds.getKey().getCode() %>" alt="anhsanpham" style="height:auto;width: auto">
	                    </td>
	                    <td style="flex-basis: 60%;max-width: 60%;">
	                        <a href="product?code=<%=ds.getKey().getCode() %>"><%=ds.getKey().getName() %></a>
	                        <p>Số lượng: <%=ds.getValue() %></p>
	                    </td>
	                    <td style="flex-basis: 20%;max-width: 20%" id="loop">
	                    	<%=ds.getValue() * (ds.getKey().getPrice() - (ds.getKey().getPrice()* ds.getKey().getDiscount()/100)) %>
	                    </td>
	                    
	                </tr>
                <%
	           		}
	          	%>
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