<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@page import="dnastore.beans.Cart"%>
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
				
                

                <form class="form">
                    <input type="number" min="1" name="quantity" value="1" readonly>
                    <a href="giohang?command=insert&code=${product.code}&cartID=<%=System.currentTimeMillis()%>" class="addCart" >Mua ngay</a>
                </form>
                <h3>Chi tiết</h3>
                <p style="max-width:100%;overflow: hidden;">${product.note}</p>
            </div>
        </div>
        
    </section>
    <section class="section container" style="display:flex;justify-content: center;">
   		<div class="fb-comments" data-href="http://192.168.43.144:8080/DNAStore/product?code=${product.code}" data-numposts="5" data-width="100%"></div>
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
                        <a href="product?code=${product.code}">
                            <h3>${product.name}</h3>
                        </a>

                        <h4 class="price">
                        	<script>
								var price = ${product.price};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>
                        </h4>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>