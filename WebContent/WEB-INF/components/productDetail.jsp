<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/240px-DNA_logo_2015.jpg" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <title>${product.name}</title>

    <!-- owcarousel -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	
    <section class="section product-detail">
        <div class="details container-md">
            <div class="left">
                <div class="main">
                    <img src="http://localhost:8080/DNAStore/image?code=${product.code}" alt="">
                </div>
                
            </div>
            <div class="right" style="margin-top:0.5rem">
                <span>Home/T-shirt</span>
                <h1>${product.name}</h1>
                
                <div class="price">${product.price} đ</div>
                

                <form class="form" method="POST" action="CartController">
	                
                    
                    <input type="hidden" name="description" value="${product.name}">
                    <input type="text" name="quantity" placeholder="1">
                    <input type="hidden" name="price" value="${product.price}"/>
                    
                    <input type="submit" name="action" value="Add To Cart" class="addCart" style="border:none;outline:none;width:20rem;padding:10px;font-weight:bold">
                </form>
                <h3>Product Detail</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero minima delectus nulla voluptates nesciunt
                quidem laudantium, quisquam voluptas facilis dicta in explicabo, laboriosam ipsam suscipit!</p>
            </div>
        </div>
    </section>
    <section class="section featured">
        <div class="top container">
            <h1>Related Products</h1>
            <a href="${pageContext.request.contextPath}/danhsachsanpham" class="view-more">View more</a>
        </div>
        <div class="product-center container">
            <c:forEach items="${productList}" var="product" >
                <div class="product">
                    <div class="product-header">
                        <img src="http://localhost:8080/DNAStore/image?code=${product.code}" alt="">

                        <ul class="icons">
                            <span><i class="bx bx-heart"></i></span>
                            <span><i class="bx bx-shopping-bag"></i></span>
                            <span><i class="bx bx-search"></i></span>
                        </ul>
                    </div>
                    <div class="product-footer">
                        <a href="ProductDetail?code=${product.code}">
                            <h3>${product.name}</h3>
                        </a>

                        <h4 class="price">${product.price} Đ</h4>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

	<jsp:include page="_footer.jsp"></jsp:include>
    <!-- GSAP -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
    <!-- Custom Script -->
    <script src="./js/index.js"></script>
</body>
</html>