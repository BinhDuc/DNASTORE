<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="dnastore.beans.Cart"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta property="fb:app_id" content="822891454926787" />
    <meta property="fb:admins" content="100023036730559"/>
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
    <script src='./assets/sweetalert2.all.js'></script>
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
		.product:hover .product-header::after {
		  background:transparent;
		}
		.product:hover .product-header img {
		  transform: scale(1.05);
		}
		.product{
			cursor: pointer;
		}
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
		.quantity{
			margin-right: 2rem;
		}
		.quantity-button{
			cursor: pointer;
			padding:10px;
			text-align:center;
			font-weight:bold;
		}
		
		
    </style>
</head>
<body>
	<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v9.0&appId=822891454926787&autoLogAppEvents=1" nonce="VrznsMrn"></script>
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	<jsp:include page="_header.jsp"></jsp:include>
    <section class="section product-detail">
        <div class="details container-md">
            <div class="left">
                <div class="main">
                    <img src="${pageContext.request.contextPath}/image?code=${product.code}" alt="anhsanpham">
                </div>
            </div>
            <div class="right">
                <span>Trang chủ/${product.categoryname}</span>
                <h1>${product.name}</h1>
                <div class="price">
                	<script>
						var price = ${product.price -(product.price * (product.discount / 100))};
						price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
						document.write(price);
					</script>
					<c:choose>
                    	<c:when test="${product.discount > '0'}">
							<div style="text-decoration: line-through;color:#696969;font-size:12px">
								<script>
									var price = ${product.price};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script>
			           		</div>
					    </c:when>
					    <c:otherwise>
					    	
					    </c:otherwise>
                    </c:choose>
							
                </div>
                <form class="form" method="get" action="giohang">
                    <input type="hidden" name="code" value="${product.code}" >
                    <input type="hidden" name="cartID" value="<%=System.currentTimeMillis()%>" >
                    <div class="quantity">
						<div class="quantity-button quantity-down">-</div>
						<input type="number" min="1" max="${product.quantity}" name="quantity" value="1" id="quantity" style="margin-right: 0;">
						<div class="quantity-button quantity-up">+</div>
					</div>
                    
                    <input type="submit" name="command" 
                    	value="Mua ngay" onclick="myFunction()" 
                    	class="addCart" style="width:160px;border:none;outline:none;padding:10px 0;cursor: pointer;">
                </form>
                <h3>Chi tiết</h3>
                <p style="max-width:100%;overflow: hidden;">${product.note}</p>
            </div>
        </div>
    </section>
    <script>
		function myFunction() {
		  var x, text;
		
		  // Get the value of the input field with id="numb"
		  x = document.getElementById("quantity").value;
		  y = ${product.quantity};
		
		  // If x is Not a Number or less than one or greater than 10
		  if (isNaN(x) || x < 1 || x > y) {
			  $(document).ready(function(){
				swal('Nhập lại số lượng!', '${product.name} còn ${product.quantity} sản phẩm', 'warning');
			});
		  } else {
		  }
		  document.getElementById("alert").innerHTML = text;
		}
	</script>
    <section class="section container" style="display:flex;justify-content: center;">
   		<div class="fb-comments" data-href="http://localhost:8080/DNAStore/product?code=${product.code}" data-lazy="true" data-numposts="5" data-width="100%"></div>
   	</section>
    <section class="section featured">
        <div class="top container">
            <h1>Sản phẩm tương tự</h1>
            <a href="${pageContext.request.contextPath}/tatca" class="view-more">Xem thêm</a>
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
	<script>
	    jQuery('.quantity').each(function() {
	      var spinner = jQuery(this),
	        input = spinner.find('input[type="number"]'),
	        btnUp = spinner.find('.quantity-up'),
	        btnDown = spinner.find('.quantity-down'),
	        min = input.attr('min'),
	        max = input.attr('max');
	
	      btnUp.click(function() {
	        var oldValue = parseFloat(input.val());
	        if (oldValue >= max) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue + 1;
	        }
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	
	      btnDown.click(function() {
	        var oldValue = parseFloat(input.val());
	        if (oldValue <= min) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue - 1;
	        }
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	
	    });
	</script>
</body>
</html>