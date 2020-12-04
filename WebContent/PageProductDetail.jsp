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
    <section class="section product-detail">
        <div class="details container-md">
            <div class="left">
                <div class="main">
                    <img src="http://localhost:8080/DNAStore/image?code=${product.code}" alt="anhsanpham">
                </div>
            </div>
            <div class="right">
                <span>Trang chủ/${product.categoryname}</span>
                <h1>${product.name}</h1>
                <div class="price">
                	<script>
						var price = ${product.price};
						price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
						document.write(price);
					</script>
                </div>
                

                <form class="form" method="POST" action="${pageContext.request.contextPath}/giohang">
                	
                	<input type="hidden" name="description" value="${product.name}">
                	<input type="hidden" name="price" value="${product.price}">
                    <input type="text" min="1" name="quantity" value="1">
                    
                    <input type="submit" class="addCart" name="action" value="Add To Cart" style="border:none;outline:none;width:40%;padding:10px">
                    
                </form>
                <h3>Chi tiết</h3>
                <p style="max-width:100%;overflow: hidden;">${product.note}</p>
            </div>
        </div>
    </section>
    <section class="section featured">
        <div class="top container">
            <h1>Sản phẩm tương tự</h1>
            <a href="${pageContext.request.contextPath}/tatca" class="view-more">Xem thêm</a>
        </div>
        <div class="product-center container">
            <c:forEach items="${productList}" var="product" >
                <div class="product">
                    <div class="product-header">
                        <img src="http://localhost:8080/DNAStore/image?code=${product.code}" alt="anhsanpham">
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