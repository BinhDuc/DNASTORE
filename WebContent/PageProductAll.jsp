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
	<section class="bg-allproduct">
        <div class="link-title">
            <h1>Tất Cả Sản Phẩm</h1>
            <div class="title-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                /
                <a href="">Tất Cả</a>
            </div>
        </div>
    </section>
    <section class="pro-cate">
        <a href="${pageContext.request.contextPath}/nu">Nữ</a>
        <a href="${pageContext.request.contextPath}/nam">Nam</a>
    </section>
    
    <!-- All Products -->
    <section class="sections all-products" id="products">
        <div class="top container">
            <h3>${productList.size()} sản phẩm</h3>
            <form>
                <select>
                    <option value="1">Defualt Sorting</option>
                    <option value="2">Sort By Price</option>
                    <option value="3">Sort By Popularity</option>
                    <option value="4">Sort By Sale</option>
                    <option value="5">Sort By Rating</option>
                </select>
                <span><i class='bx bx-chevron-down'></i></span>
            </form>
        </div>
        <div class="container">
            <div class="product-center">
            	<c:forEach items="${productList}" var="product" >
	                <div class="product">
	                    <div class="product-header">
	                        <img src="http://localhost:8080/DNAStore/image?code=${product.code}" alt="anhsanpham">
	                    </div>
	                    <div class="product-footer">
	                        <a href="product?code=${product.code}">
	                            <h3>${product.name}</h3>
	                        </a>
	                        <h4 class="price">${product.price} ₫</h4>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
        
    </section>
    <jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>