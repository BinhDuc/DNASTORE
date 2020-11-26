<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/240px-DNA_logo_2015.jpg" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />

    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/owlcarousel/assets/owl.theme.default.min.css">
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
</head>
<body style="background: url(./images/Rectangle-7172.jpg) no-repeat fixed center;">
 
    <jsp:include page="_header.jsp"></jsp:include>
    
    <section class="hero">
        <div class="owl-carousel">
            <div class="item">
                <div class="banner">
                    <div class="banner-content">
                        <span>New Inspiration 2020</span>
                        <h1>CLOTHING MADE FOR YOU!</h1>
                        <h3>Trending from men and women style collection</h3>
                        <div class="buttons-group">
                            <a href="">MUA NGAY</a>
                            
                        </div>
                    </div>
                    <img src="./images/banner_1.png" style="width: 85rem;" class="special_01" alt="">
                </div>
            </div>
            <div class="item">
                <div class="banner">
                    <div class="banner-content">
                        <span>New Inspiration 2020</span>
                        <h1>CLOTHING MADE FOR YOU!</h1>
                        <h3>Trending from men and women style collection</h3>
                        <div class="buttons-group">
                            <a href="">MUA NGAY</a>
                        </div>
                    </div>
                    <img src="./images/banner_2.png" style="width: 85rem;" class="special_02" alt="">
                </div>
            </div>
            <div class="item">
                <div class="banner">
                    <div class="banner-content">
                        <span>New Inspiration 2020</span>
                        <h1>CLOTHING MADE FOR YOU!</h1>
                        <h3>Trending from men and women style collection</h3>
                        <div class="buttons-group">
                            <a href="">MUA NGAY</a>
                        </div>
                    </div>
                    <img src="./images/banner_3.png" style="width: 85rem;" class="special_03" alt="">
                </div>
            </div>
        </div>


        <script>
            var owl = $('.owl-carousel');
            owl.owlCarousel({
                margin: 0,
                loop: true,
                items: 1,
                autoplay: true,
                autoplayTimeout: 5000,
                // autoWidth: true
            })
        </script>
    </section>
    <section class="section category" style="background: #fff">
        <div class="category-center container">
            <div class="category-box">
                <img src="./images/cat1.jpg" alt="">
                <div class="content">
                    <h2>THỜI TRANG NAM</h2>
                    <span>1 Sản phẩm</span>
                    <a href="${pageContext.request.contextPath}/sanphamnam">MUA NGAY</a>
                </div>
            </div>
            <div class="category-box">
                <img src="./images/cat2.jpg" alt="">
                <div class="content">
                    <h2>THỜI TRANG NỮ</h2>
                    <span>1 Sản phẩm</span>
                    <a href="${pageContext.request.contextPath}/sanphamnam">MUA NGAY</a>
                </div>
            </div>

            <div class="category-box">
                <img src="./images/cat3.jpg" alt="">
                <div class="content">
                    <h2>NAM VÀ NỮ</h2>
                    <span>2 Sản phẩm</span>
                    <a href="${pageContext.request.contextPath}/tatcasanpham">MUA NGAY</a>
                </div>
            </div>

        </div>
    </section>

       
    <!--Latest -->
    <section class="section featured one" style="background: rgba(255,255,255,0.5);">
        <div class="title">
            <h1>Sản Phẩm Mới</h1>
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
    <!-- Product Banner -->
    <section class="section" style="background: rgba(255,255,255,1);">
        <div class="product-banner">
            <div class="left">
                <!-- Testimonials -->
                <section class="section">
                    <div class="testimonial-center container">
                        <div class="testimonial">
                            <span>&ldquo;</span>
                            <p>
                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
                                fugiat labore. Veritatis et omnis consequatur.
                            </p>
                            <div class="rating">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bx-star"></i>
                            </div>
                            <div class="img-cover">
                                <img src="./images/profile1.jpg" alt="" />
                            </div>
                            <h4>Will Smith</h4>
                        </div>
                        <div class="testimonial">
                            <span>&ldquo;</span>
                            <p>
                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
                                fugiat labore. Veritatis et omnis consequatur.
                            </p>
                            <div class="rating">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bx-star"></i>
                            </div>
                            <div class="img-cover">
                                <img src="./images/profile2.jpg" alt="" />
                            </div>
                            <h4>Will Smith</h4>
                        </div>
                        <div class="testimonial">
                            <span>&ldquo;</span>
                            <p>
                                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Debitis,
                                fugiat labore. Veritatis et omnis consequatur.
                            </p>
                            <div class="rating">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bx-star"></i>
                            </div>
                            <div class="img-cover">
                                <img src="./images/profile3.jpg" alt="" />
                            </div>
                            <h4>Will Smith</h4>
                        </div>
                    </div>
                </section>
            </div>
            <div class="right">
                <div class="content">
                    <h2><span class="discount">70% </span> SALE OFF</h2>
                    <h1>
                        <span>Collect Your Kids Collection</span>
                    </h1>
                    <a class="btn" href="#">shop now</a>
                </div>
            </div>
        </div>
    </section>

    <section class="advert section one" style="background: rgba(255,255,255,0.5);">
        <div class="title">
            <h1>Thương Hiệu</h1>
        </div>

        <div class="advert-center container">
            <div class="owl-carousel owl-theme">
                <div class="item">
                    <div class="advert-box" style="background: rgba(255,255,255,1);">
                        <img src="./images/Dolce_&_Gabbana.svg" alt="">
                    </div>
                </div>
                <div class="item">
                    <div class="advert-box" style="background: rgba(255,255,255,1);">
                        <img src="./images/Gucci_Logo.svg" alt="" style="padding: 15px">
                    </div>
                </div>
                
                <div class="item">
                    <div class="advert-box" style="background: rgba(255,255,255,1);">
                        <img src="./images/Supreme_Logo.svg" alt="">
                    </div>
                </div>
                <div class="item">
                    <div class="advert-box" style="background: rgba(255,255,255,1);">
                        <img src="./images/Dior_Logo.svg" alt="" style="padding: 15px">
                    </div>
                </div>
                <div class="item">
                    <div class="advert-box" style="background: rgba(255,255,255,1);">
                        <img src="./images/Louis_Vuitton_logo_and_wordmark.svg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('.owl-carousel').owlCarousel({
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
            })
        </script>
    </section>
 
    <jsp:include page="_footer.jsp"></jsp:include>
    <!-- GSAP -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.5.1/gsap.min.js"></script>
    <!-- Custom Script -->
    <script src="./js/index.js"></script>
 
  </body>
</html>