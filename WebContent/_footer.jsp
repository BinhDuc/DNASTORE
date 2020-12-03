<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<!-- sub navigation -->
	<div class="sub-nav">       
        <a href="tel:012345678" rel="nofollow" aria-label="phone">
            <i class="fas fa-phone-alt"></i>
        </a>
        
        <a href="//m.me/3591658937533633" target="_blank" rel="noreferrer" aria-label="messenger">
            <i class="fab fa-facebook-messenger"></i>
        </a>
        <a href="${pageContext.request.contextPath}/">
            <i class="fas fa-home"></i>
        </a>
        <a href="mailto:company@gmail.com?subject=feedback">
            <i class="fas fa-envelope"></i>
        </a> 
        <a href="${pageContext.request.contextPath}/taikhoan">
            <i class="fas fa-user"></i>
        </a> 
    </div>
    <!-- Return to Top -->
    <button id="scroll" style="display: none;"><i class="fas fa-chevron-up"></i></button>    
    <!-- Footer -->
    <footer id="footer" class="section footer">
        <div class="container">
            <div class="footer-container">
                <div class="footer-center">
                    <h3>Kết Nối</h3>
                    <a href=""><i class="fab fa-facebook-f"></i></a>
                    <a href=""><i class="fab fa-instagram"></i></a>
                    <a href=""><i class="fab fa-twitter"></i></a>
                    <a href=""><i class="fab fa-youtube"></i></a>
                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="footer-center">
                    <h3>Liên Hệ</h3>
                    <div>
                        <span>
                            <i class="fas fa-map-marker-alt"></i>
                        </span>
                        141 Chiến Thắng, Tân Triều, Thanh Trì, Hà Nội
                    </div>
                    <div>
                        <span>
                            <i class="far fa-envelope"></i>
                        </span>
                        company@gmail.com
                    </div>
                    <div>
                        <span>
                            <i class="fas fa-phone"></i>
                        </span>
                        123456789
                    </div>
                    <div>
                        <span>
                            <i class="far fa-paper-plane"></i>
                        </span>
                        Hanoi City, VietNam
                    </div>
                </div>
                <div class="footer-center">
                    <h3>Đăng ký nhận tin</h3>
                    <p style="color: rgb(153,153,153); font-size: 14px;font-family: AvertaStdCY-Light;">Nhập email của bạn để nhận khuyến mại</p>
                    <div class="search">
                        <input type="text" name="email" placeholder="Nhập email của bạn">
                        <button><i class="fas fa-paper-plane"></i></button>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        <div class="allright">
            <span style="color:rgb(245,237,35)">DNASTORE.</span >&copy;<script>document.write(new Date().getFullYear());</script> All Rights Reserved.
        </div>
    </footer>  
    <!-- End Footer -->
    <script>
	    $(document).ready(function(){ 
	        $(window).scroll(function(){ 
	            if ($(this).scrollTop() > 500) { 
	                $('#scroll').fadeIn(); 
	            } else { 
	                $('#scroll').fadeOut(); 
	            } 
	        }); 
	        $('#scroll').click(function(){ 
	            $("html, body").animate({ scrollTop: 0 }, 100); 
	            return false; 
	        }); 
	    });
    </script>
    <script src="./js/cart.js"></script>