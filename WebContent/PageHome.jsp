<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="vi">
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
		    top:1%;
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
    
    <!-- Main -->
    <main>
        <script>
            jQuery(document).ready(function(e) {
                background();
            });
            function background()
            {
                var img=$('.banner');
                img.css('background-image', function () {
                var bg = ('url(' + $(this).data('background') + ')');
                return bg;
                });
            }
        </script>
        <section class="hero">
            <div class="owl-carousel" id="carousel">
                <div class="item">
                    <div class="banner" data-background="./images/slidess.jpg">
                        <div class="banner-content">
                            <span>Bô Sưu Tập Thu Đông</span>
                            <h1>XU HƯỚNG THỜI TRANG</h1>
                            <h3>“Thời trang có thể phai tàn nhưng phong cách sẽ tồn tại mãi mãi”</h3>
                            <div class="buttons-group">
                                <a href="${pageContext.request.contextPath}/tatca">MUA NGAY</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="banner" data-background="./images/slide.jpg">
                        <div class="banner-content">
                            <span>New Inspiration 2020</span>
                            <h1>TƯNG BỪNG KHAI TRƯƠNG!</h1>
                            <h3>Trending from men and women style collection</h3>
                            <div class="buttons-group">
                                <a href="${pageContext.request.contextPath}/tatca">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="banner" data-background="./images/s1.jpg">
                        <div class="banner-content">
                            <span>Black Friday 2020</span>
                            <h1>NGÂP TRÀN QUÀ TẶNG!</h1>
                            <h3>Trending from men and women style collection</h3>
                            <div class="buttons-group">
                                <a href="${pageContext.request.contextPath}/tatca">MUA NGAY</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            
        </section>
        <section class="section category">

            <div class="category-center container">

                <div class="category-box">
                    <img src="./images/cat1.jpg" alt="">
                    <div class="content">
                        <h2>Sản phẩm nam</h2>
                        <span>${productListm.size()} Sản phẩm</span>
                        <a href="${pageContext.request.contextPath}/nam">mua ngay</a>
                    </div>
                </div>

                <div class="category-box">
                    <img src="./images/cat3.jpg" alt="">
                    <div class="content">
                        <h2>Sản phẩm nữ</h2>
                        <span>${productListf.size()} Sản phẩm</span>
                        <a href="${pageContext.request.contextPath}/nu">mua ngay</a>
                    </div>
                </div>
                <div class="category-box">
                    <img src="./images/cat2.jpg" alt="">
                    <div class="content">
                        <h2>Tất cả sản phẩm</h2>
                        <span>${productLista.size()} Sản phẩm</span>
                        <a href="${pageContext.request.contextPath}/tatca">mua ngay</a>
                    </div>
                </div>
            </div>
            
            
        </section>
        <!--Latest -->
        <section class="section featured one">
            <div class="title">
                <h1>Sản phẩm mới</h1>
            </div>

            <div class="product-center container">
                <c:forEach items="${productList}" var="product" >
	                <div class=" product">
	                    <div class="product-header">
	                        <img src="http://localhost:8080/DNAStore//image?code=${product.code}" alt="anhsanpham">
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
	                        <h4 style="text-decoration: line-through;color:#696969;font-size:12px">
                        		<script>
									var price = ${product.price};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script>
                        	</h4>
		                    <span class="flag-discount">- ${product.discount}%</span>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </section>
        <!-- Product Banner -->
        <section class="section-md banner-discount">
            <div class="product-banner">
                <div class="content">
                    <h2><span class="discount">70% </span> SALE OFF</h2>
                    <h1>
                        <span>Bộ Sưu Tập Thu Đông</span>
                    </h1>
                    <a class="btn" href="#">Mua Ngay</a>
                </div>
            </div>
        </section>
        <section class="advert section one">
            <div class="title">
                <h1>Thương hiệu</h1>
            </div>

            <div class="advert-center container-md">
                <div class="owl-carousel owl-theme" id="brand">
                    <div class="item">
                        <div class="advert-box">
                            <img src="./images/Dolce_&_Gabbana.svg" alt="">
                        </div>
                    </div>
                    <div class="item">
                        <div class="advert-box">
                            <img src="./images/Gucci_Logo.svg" alt="" style="padding: 15px">
                        </div>
                    </div>
                    
                    <div class="item">
                        <div class="advert-box">
                            <img src="./images/Supreme_Logo.svg" alt="">
                        </div>
                    </div>
                    <div class="item">
                        <div class="advert-box">
                            <img src="./images/Dior_Logo.svg" alt="" style="padding: 15px">
                        </div>
                    </div>
                    <div class="item">
                        <div class="advert-box">
                            <img src="./images/Louis_Vuitton_logo_and_wordmark.svg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                
            </script>
        </section>
        <!-- Testimonials -->
        <section class="section">
            <div class="testimonial-center container">
                <div class="testimonial">
                    <div class="img-cover">
                        <img src="./images/vice_item_1.webp" alt="giaohang" />
                    </div>
                    <h4>Giao hàng miễn phí</h4>
                    <p>
                        với đơn hàng từ 200k trở lên
                    </p>
                </div>
                <div class="testimonial">
                    <div class="img-cover">
                        <img src="./images/vice_item_2.webp" alt="hotro" />
                    </div>
                    <h4>Hỗ trợ 24/7</h4>
                    <p>
                        Hỗ trợ online / offline 24/7
                    </p>
                </div>
                <div class="testimonial">
                    <div class="img-cover">
                        <img src="./images/vice_item_3.webp" alt="doitra" />
                    </div>
                    <h4>Miễn phí đổi trả</h4>
                    <p>
                        Trong vòng 7 ngày
                    </p>
                </div>
                <div class="testimonial">
                    <div class="img-cover">
                        <img src="./images/vice_item_4.webp" alt="muahang" />
                    </div>
                    <h4>Đặt hàng trực tuyến</h4>
                    <p>
                        Hotline: 0123.456.789
                    </p>
                </div>
            </div>
        </section>
    </main>
 
    <jsp:include page="_footer.jsp"></jsp:include>
    <script>
        $('#carousel').owlCarousel({
            margin: 0,
            loop: true,
            items: 1,
            autoplay: true,
            autoplayTimeout: 5000,
            smartSpeed: 1000
        });
        $('#brand').owlCarousel({
            loop:true,
            margin:10,                   
            responsive:{
                0:{
                    items:1,
                    autoplay:true,
                    autoplayTimeout:2000,
                },
                320:{
                    items:2,
                    autoplay:true,
                    autoplayTimeout:2000,
                },
                600:{
                    items:3,
                    autoplay:true,
                    autoplayTimeout:2000,
                },
                1000:{
                    items:5,
                    autoplay:false
                }
            }
        });
    </script>
  </body>
</html>