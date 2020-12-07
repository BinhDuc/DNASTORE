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
    <style>
    	.flag-discount {
		    color: #fff;
		    display: block;
		    float: left;
		    padding: 3px 3px;
		    background: #ee4d2d;
		    font-size: 12px;
		    font-weight: 400;
		    position: absolute;
		    top:3%;
		    left:0;
		}
		.flag-discount::before,
		.flag-discount::after {
		    content: "";
		    position: absolute;
		    left: 100%;
		    width: 0;
		    height: 0;
		    border-style: solid;
		    display: block;
		    
		}
		.flag-discount::before {
		    top: 0;
		    border-width: 22px 10px 0 0;
		    border-color: #ee4d2d transparent transparent transparent;
		}
		.flag-discount::after {
		    bottom: 0;
		    border-width: 0 10px 22px 0;
		    border-color: transparent transparent #ee4d2d transparent;
		}
    </style>
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
	            <td colspan="4" style="text-align:center">
	            	<p>Tổng sản phẩm: ${cart.lineItemCount} SẢN PHẨM </p>
	            </td>
	        </tr>
	        <jsp:useBean id="cart" scope="session" class="dnastore.beans.CartBean" />
	
	        <c:if test="${cart.lineItemCount == 0}">
	            <tr> 
		            <td colspan="4" style="text-align:center;padding:20px">
		            	<p>- Giỏ hàng của bạn trống - </p>
		            	<br>
		            	<a href="${pageContext.request.contextPath}/" class="checkout btn" style="background:none;color:#ee4d2d;border:1px solid #ee4d2d;margin-bottom:20px">Mua hàng</a>
		            	
		            </td>
	            </tr>
	        </c:if>
			
	        <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
	            <form name="item" method="POST" action="${pageContext.request.contextPath}/giohang">
	                <tr>
	                	<td style="height: 130px">
                            <img src="${pageContext.request.contextPath}/image?code=${cartItem.code}" alt="anhsanpham" style="height:auto;width: auto">
                        </td>

	                    <td>
	                    	<p style="display: block;width:100%;font-weight: bold">${cartItem.name}</p>
	                    	<p style="display: block;">Giá:
	                    		<script>
									var price = ${cartItem.price};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script> 
	                    		
                   			</p>
	                        <input type='hidden' name='stt' value='<c:out value="${counter.count}"/>'>
	                        
	                        <div style="display: block;align-items: center;width: 80%;">
                                <input type='number' name="quantity"  style="border:1px solid #ccc;text-align:center;border-radius:5px" value='<c:out value="${cartItem.quantity}"/>'> 
	                            
                            </div>
	                    </td>

	                    <td>
	                    	<input type="submit" name="action" value="Sửa" style="border:none;;background: none;color:#696969">
	                    	<input type="submit" name="action" value="X" style="border: none;outline: none;background: none;color: rgb(253, 131, 131);">
	                    </td>
	                </tr>
	            </form>
	        </c:forEach>
	        
	    </table>
   		<div class="total-price" style="margin-right:10px">
   			<div class="total">    
                <div>Tổng tiền</div>
                <div>
                	<script>
						var total = ${cart.total};
						total = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
						document.write(total);
					</script>
                </div>

            </div>
            <a href="#" class="checkout btn">Thanh Toán</a>
   		</div>
	</div>
	<section class="section featured">
        <div class="top container">
            <h1>Có thể bạn cũng thích</h1>
            <br>
        </div>
        <div class="product-center container">
            <c:forEach items="${productList}" var="product" >
                <div class="product clickable" data-href='product?code=${product.code}&categoryid=${product.categoryId}'>
                    <div class="product-header">
                        <img src="${pageContext.request.contextPath}/image?code=${product.code}" alt="anhsanpham">
                    </div>
                    <div class="product-footer">
                        <a href="product?code=${product.code}&categoryid=${product.categoryId}">
                            <h3>${product.name}</h3>
                        </a>

                        <h4 class="price">
	                        <script>
								var price = ${product.price -(product.price * (product.discount / 100))};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>	
                        </h4>
                        <h4 style="text-decoration: line-through;color:#696969;font-size:12px">
                       		<script>
								var price = ${product.price};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>
                       	</h4>
                    </div>
                    <span class="flag-discount">-${product.discount}%</span>
                </div>
            </c:forEach>
        </div>
    </section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>