<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<!-- Navigation -->
<nav class="nav" style="background:white">
    <div class="navigation container">
        <div class="hamburger">
            <i class="bx bx-menu"></i>
        </div>
        <div class="logo">
            <a href="${pageContext.request.contextPath}/">
                <h1>DNA<span style="color: #f60091;">S</span>TORE</h1>
            </a>
        </div>

        <div class="menu">
            <div class="top-nav">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/">
                        <h1>DNA<span style="color: #f60091;">S</span>TORE</h1>
                    </a>
                </div>
                <div class="close">
                    <i class="bx bx-x"></i>
                </div>
            </div>

            <ul class="nav-list">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/" class="nav-link">TRANG CHỦ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/sanphamnu" class="nav-link">THỜI TRANG NỮ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/sanphamnam" class="nav-link">THỜI TRANG NAM</a>
                </li>
                
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/tatcasanpham" class="nav-link">TẤT CẢ SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <a href="./contact.html" class="nav-link">LIÊN HỆ</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/login" class="nav-link">ĐĂNG NHẬP</a>
                </li>
                <li class="nav-item">
                    <a href="./cart.html" class="nav-link icon">
                        <i class="bx bx-shopping-bag"></i>
                    </a>
                </li>
            </ul>
        </div>

        <a href="./cart.html" class="cart-icon">
            <i class="bx bx-shopping-bag"></i>
        </a>
    </div>
    <script type="text/javascript">
        const menu = document.querySelector(".menu");
        const navOpen = document.querySelector(".hamburger");
        const navClose = document.querySelector(".close");

        const navLeft = menu.getBoundingClientRect().left;
        navOpen.addEventListener("click", () => {
          if (navLeft < 0) {
            menu.classList.add("show");
            document.body.classList.add("show");
            navBar.classList.add("show");
          }
        });

        navClose.addEventListener("click", () => {
          if (navLeft < 0) {
            menu.classList.remove("show");
            document.body.classList.remove("show");
            navBar.classList.remove("show");
          }
        });

        // Fixed Nav
        const navBar = document.querySelector(".nav");
        const navHeight = navBar.getBoundingClientRect().height;
        window.addEventListener("scroll", () => {
          const scrollHeight = window.pageYOffset;
          if (scrollHeight > navHeight) {
            navBar.classList.add("fix-nav");
          } else {
            navBar.classList.remove("fix-nav");
          }
        });
    </script>
</nav>
