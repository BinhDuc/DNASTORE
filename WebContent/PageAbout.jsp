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
	<section class="bg-gioithieu">
        <div class="link-title">
            <h1>Giới thiệu</h1>
        
            <div class="title-links">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                /
                <a href="">Giới thiệu</a>
            </div>
        </div>
        
    </section>
	<section class="contact">
        <h1 style="text-align: center;padding: 20px;font-weight: bold;">"Thời trang có thể phai tàn nhưng 
            phong cách sẽ tồn tại mãi mãi."</h1>
        
        <div class="section">
            <div class="row container">
                <div class="col-left">
                   <img src="./images/Canifa-Casual-20208014-_1_.jpg" alt="anh vd">
                </div>
                <div class="col-right">
                    <h1>Tầm nhìn và sứ mệnh</h1>
                    <hr width="100px" align="left" style="margin-bottom: 50px">
                    <div style="color: #696969;">
                        <p style="font-size: 16px;font-style: italic;">Mang đến niềm vui cho hàng triệu gia đình Việt</p>
                        <p style="line-height: 1.5;">
                            DNA hướng đến mục tiêu mang lại niềm vui mặc mới mỗi ngày cho hàng triệu người tiêu dùng Việt. 
                            Chúng tôi tin rằng người dân Việt Nam cũng đang hướng đến một cuộc sống năng động, tích cực hơn.
                        </p>
                    </div>
                    
                </div>
            </div>
            <div class="row container">
                <div class="col-right">
                    <h1 >Giá trị cốt lõi của DNA</h1>
                    <hr width="100px" align="left" style="margin-bottom: 50px">
                    <div style="color: #696969;">
                        <p style="font-size: 16px;font-style: italic;">Kinh doanh dựa trên giá trị thật:</p>
                        <p style="line-height: 1.5;">
                            DNA thiết lập hệ thống tiêu chuẩn chất lượng quốc tế áp dụng trên tất cả quy trình quản lý
                             và kiểm soát chất lượng từ khâu chọn lọc nguyên phụ liệu cho đến khâu thiết kế và sản xuất 
                             (Oeko-tex, Cotton USA, Woolmark,...).
                        </p>
                    </div>
                    
                </div>
                <div class="col-left">
                   <img src="./images/len-long-cuu-uc-wool-mark.jpg" alt="anh vd">
                </div>
                
            </div>
             
        </div>
    </section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>