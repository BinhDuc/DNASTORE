<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<!-- Navigation -->
    
    <nav class="navigation">
        <div class="nav-center container">
            <div class="hamburger">
                <i class="fas fa-bars"></i>
            </div>
            <a href="${pageContext.request.contextPath}/" class="logo">
                <h1>DNA<span>S</span>TORE</h1>
            </a>

            <div class="nav-menu">
                <div class="nav-top">
                    <div class="logo">
                        <h1>DNA<span>S</span>TORE</h1>
                    </div>
                    <div class="close">
                        <i class="fas fa-times"></i>
                    </div>
                </div>

                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/" class="nav-link">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/nu" class="nav-link">Nữ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/nam" class="nav-link">Nam</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/tatca" class="nav-link">Tất cả</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/gioithieu" class="nav-link">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/lienhe" class="nav-link">Liên hệ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/dangnhap" class="nav-link">Đăng nhập</a>
                    </li>
                </ul>

                <div class="nav-bottom">
                    <h3>Liên hệ với chúng tôi qua</h3>
                    <p>Hostline: 012345678</p>
                    <p>Email: company@gmail.com</p>
                    <div>
                        <span>DNASTORE </span >&copy;
                            <script>document.write(new Date().getFullYear());</script> All Rights Reserved.
                    </div>
                    
                </div>
            </div>
            
            
            <div class="nav-icons">
                <a href="#"><i class="fas fa-user"></i></a>
                <button class="bnt-search"><i class="fas fa-search"></i></button>
                <a href="${pageContext.request.contextPath}/giohang" class="notification">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="badge total-count"></span>
                </a>
            </div>
            <div class="search-box">
                <input type="text" placeholder="Bạn tìm gì ..." class="search-input"/>
                <input type="button" value="Tìm kiếm"/>
            </div>

            
        </div>
        <script type="text/javascript">
            const nav = document.querySelector(".nav-menu");
            const navigation = document.querySelector(".navigation");
            const openBtn = document.querySelector(".hamburger");
            const closeBtn = document.querySelector(".close");

            const navLeft = nav.getBoundingClientRect().left;
            openBtn.addEventListener("click", () => {
              if (navLeft < 0) {
                navigation.classList.add("show");
                nav.classList.add("show");
                document.body.classList.add("show");
              }
            });

            closeBtn.addEventListener("click", () => {
              if (navLeft < 0) {
                navigation.classList.remove("show");
                nav.classList.remove("show");
                document.body.classList.remove("show");
              }
            });

            // Fixed Nav
            const navBar = document.querySelector(".navigation");
            const navHeight = navBar.getBoundingClientRect().height;
            window.addEventListener("scroll", () => {
              const scrollHeight = window.pageYOffset;
              if (scrollHeight > navHeight) {
                navBar.classList.add("fix-nav");
              } else {
                navBar.classList.remove("fix-nav");
              }
            });
            
            $(document).ready(function() {
     
                $(".bnt-search").click(function() {
                    $(".search-box").toggle();
                    $("search-input").focus();
                });
    
            });
        </script>
    </nav>
