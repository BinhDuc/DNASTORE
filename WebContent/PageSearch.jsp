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
    <link href = "${pageContext.request.contextPath}/css/jquery-ui.min.css" rel = "stylesheet">
    <script src = "${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var pageSize = 8; // Hiển thị 8 sản phẩm trên 1 trang
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
		.bg-search{
			background-image: url(./images/pexels-freestocksorg-749353.jpg);
  			background-size: cover;
		}
		.product{
			cursor: pointer;
		}
		.product:hover .product-header::after {
		  background:transparent;
		}
		.product:hover .product-header img {
		  transform: scale(1.05);
		}
		#product-description {
            margin: 0;
            padding: 0;
        }
        ul.ui-menu{
        	position: fixed;
        	background: #fff;
        	z-index:9;
        	padding:10px 0 0 0;
        	width:10%;
        }
        .list{
            padding: 0 20px;
            height:100px;
            display:flex;
            border-bottom:1px dotted #ccc;
        }
        .list a{
            display: flex;
            border: none;
        }
        .list a p{
        	color: #ee4d2d;
   			font-size: 1.5rem;
        	font-family: AvertaStdCY-Semibold;
        }
        .list a h3{
        	color: #696969;
   			font-size: 1.5rem;
        	font-family: AvertaStdCY-Regular;
        }
        .list a img{
        	padding-right:30px
        }
        li.list:hover{
        	background-color: rgba(0,0,0,0.1);
        }
        li.list:hover a{
            background-color: transparent;
            border: none;
            color:#333;
        }
        li.list:hover a img{
        	color:#ee4d2d;
        	transform: none;
        }
        .ui-autocomplete {
		    max-height: 70vh;
		    overflow-y: auto;
		    /* prevent horizontal scrollbar */
		    overflow-x: hidden;
	  	}
    </style>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<section class="bg-search">
        <div class="link-title">
            <h1>DNASTORE</h1>
            <div class="title-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                /
                <a href="">Các kết quả tìm kiếm cho: ' ${search} '</a>
            </div>
        </div>
    </section>
    
    <!-- All Products -->
    <section class="sections all-products" id="products">
        <div class="top container">
            <h3>Tìm thấy <b>${productList.size()}</b> sản phẩm</h3>
            
        </div>
        <p>${errorString }</p>
        <div class="container">
            <div class="product-center product-center-s">
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
	                        
                        	<c:choose>
		                    	<c:when test="${product.discount > '0'}">
									<h4 style="text-decoration: line-through;color:#696969;font-size:12px">
		                        		<script>
											var price = ${product.price};
											price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
											document.write(price);
										</script>
		                        	</h4>
							    </c:when>
							    <c:otherwise>
							    	<h4 style="text-decoration: line-through;color:#fff;font-size:12px;">
		                        		<script>
											var price = ${product.price};
											price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
											document.write(price);
										</script>
		                        	</h4>
							    </c:otherwise>
		                    </c:choose>
	                        
	                    </div>
	                    <c:choose>
	                    	<c:when test="${product.discount > '0'}">
								<span class="flag-discount">-${product.discount}%</span>
						    </c:when>
						    <c:otherwise>
						    	
						    </c:otherwise>
	                    </c:choose>
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