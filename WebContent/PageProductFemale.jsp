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
    <link rel="stylesheet" href="./css/SearchStyle.css" />
    <link rel="stylesheet" href="./css/pagination.css">
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <script src="./js/jquery.twbsPagination.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var pageSize = 8; // Hiển thị 6 sản phẩm trên 1 trang
            showPage = function (page) {
                $(".product").hide();
                $(".product").each(function (n) {
                    if (n >= pageSize * (page - 1) && n < pageSize * page)
                        $(this).show();
                });
            }
            showPage(1);
            ///** Cần truyền giá trị vào đây **///
            var totalRows = ${productList.size()}; // Tổng số sản phẩm hiển thị
            var btnPage = 3; // Số nút bấm hiển thị di chuyển trang
            var iTotalPages = Math.ceil(totalRows / pageSize);

            var obj = $('#pagination').twbsPagination({
                totalPages: iTotalPages,
                visiblePages: btnPage,
                onPageClick: function (event, page) {
                    console.info(page);
                    showPage(page);
                }
            });
            console.info(obj.data());
        });
    </script>
    <style>
    	.product:hover .product-header::after {
		  background:transparent;
		}
		.product:hover .product-header img {
		  transform: scale(1.05);
		}
		.product{
			cursor: pointer;
		}
    </style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<section class="bg-product">
        <div class="link-title">
            <h1>Thời Trang Nữ</h1>
            <div class="title-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                /
                <a href="">Nữ</a>
            </div>
        </div>
        
    </section>
    <!-- Female Products -->
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
        <div class="container product-list">
            <div class="product-list-left">
                <h3>Nữ</h3>   
                <button class="dropdown-btn"><span>Danh mục sản phẩm</span>
                    <span><i class="fas fa-caret-down"></i></span>
                </button>
                <div class="dropdown-container">
                	<c:forEach items="${categoryList}" var="categoryList" >
                    	<a href="female?categoryid=${categoryList.categoryId}">${categoryList.categoryname}</a>
                    </c:forEach>
                </div>
                
                <script>
                    $('.dropdown-btn').on('click',function(){
                        $('.dropdown-container').slideToggle(280);
                    });
                </script>
            </div>
            <div class="product-center product-list-right">
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
									var price = ${product.price -(product.price * (product.discount / 100))};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script>
	                        </h4>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>  
    </section>
    <c:choose>
		<c:when test="${productList.size() > 6}">
			<section id="pagination"></section>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>