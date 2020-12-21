<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="./images/1234.png" type="image/x-icon">
    <title>DNA Dashboard</title>
    <link rel="stylesheet" href="./css/form.css" />
    <link rel="stylesheet" href="./css/w3.css">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- owcarousel -->
    <script src="./js/jquery-3.3.1.min.js"></script>
    <script src="./js/owl.carousel.min.js"></script>
    <script src='./assets/sweetalert2.all.js'></script>
    <style>
        *{
            font-family: AvertaStdCY-Regular;
        }
        .khung{
        padding:20px}
    </style>
</head>
<body>
	 <!-- Top container -->
    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
       	<a href="${pageContext.request.contextPath}/quanly" class="w3-bar-item header"><i class="fas fa-arrow-left"></i></a>
     	<a href="${pageContext.request.contextPath}/quanly"><span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span></a>  
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;">
            <i class="fas fa-expand"></i>
        </button>
    </div>
    
    <div class="w3-main" style="margin-top:43px;">
        <div class="khung">
            <c:choose>
				<c:when test="${Message.equals('Sửa thành công')}">
					<script>
					    $(document).ready(function(){
					        swal('Thành Công!', 'Sản Phẩm đã sửa thành công!', 'success');
					    });
					</script>
				</c:when>
			    <c:otherwise>
					
			    </c:otherwise>
			</c:choose>
			
            <div>
                <h2 style="font-family: AvertaStdCY-Semibold;">Sửa Sản Phẩm</h2>
            </div>
			<script>
			    function ConfirmDelete()
			    {
			      var x = confirm("Bạn Có Muốn Xóa Không?");
			      if (x)
		          	return true;
			      else
		        	return false;
			    }
			</script> 
           	<a href="deleteProduct?code=${product.code}" onclick="return ConfirmDelete();" class="w3-button w3-green w3-margin-bottom" style="text-decoration: none;border-radius:5px">
           		Delete <i class="fas fa-trash-alt"></i>
           	</a>
            <form method="POST" action="${pageContext.request.contextPath}/editProduct" enctype="multipart/form-data">
            	<div class="row">
                    <div class="col-25">
                        <label>Mã sản phẩm</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="code" value="${product.code}" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Tên sản phẩm</label>
                    </div>
                    <div class="col-75">
                        <input type="text" name="name" value="${product.name}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Giá</label>
                    </div>
                    <div class="col-75">
                        <input type="number" name="price" value="${product.price}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Discount</label>
                    </div>
                    <div class="col-75">
                        <input type="number" name="discount" value="${product.discount}">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Ảnh sản phẩm</label>
                    </div>
                    <div class="col-75">
                        
                    <div class="image">
                            <div class="image-boder">
                                <img id="image_upload_preview" src="${pageContext.request.contextPath}/image?code=${product.code}" alt="your image" class="responsive"/> 
                            </div>
                    </div>
                        <input type='file' id="inputFile" name="image" required/>
                    
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Danh mục dản phẩm</label>
                    </div>
                    <div class="col-75">
                        <select name="categoryid">
                            <c:forEach items="${categoryList}" var="categoryList" >
				         		<option value="${categoryList.categoryId}" ${categoryList.categoryId == product.categoryId ? 'selected' : ''}>${categoryList.categoryname}</option>
				         	</c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Chi tiết sản phẩm</label>
                    </div>
                    <div class="col-75">
                        <textarea name="note" style="height:200px">${product.note}</textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Số lượng</label>
                    </div>
                    <div class="col-75">
                        <input type="number" name="quantity" value="${product.quantity}">
                    </div>
                </div>
                <br>
                <div class="row">
                    <input type="submit" value="Sửa sản phẩm">
                </div>
            </form>
        </div>
    </div>
    
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image_upload_preview').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#inputFile").change(function () {
            readURL(this);
        });
        var mySidebar = document.getElementById("mySidebar");

        // Get the DIV with overlay effect
        var overlayBg = document.getElementById("myOverlay");

        // Toggle between showing and hiding the sidebar, and add overlay effect
        function w3_open() {
            if (mySidebar.style.display === 'block') {
                mySidebar.style.display = 'none';
                overlayBg.style.display = "none";
            } else {
                mySidebar.style.display = 'block';
                overlayBg.style.display = "block";
            }
        };

        // Close the sidebar with the close button
        function w3_close() {
            mySidebar.style.display = "none";
            overlayBg.style.display = "none";
        };

        function openDashboard(dashboardName) {
            var i;
            var x = document.getElementsByClassName("dashboard");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";  
            }
            document.getElementById(dashboardName).style.display = "block";  
        };
        function dropDown(id) {
            var x = document.getElementById(id);
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else { 
                x.className = x.className.replace(" w3-show", "");
            }
        };
        function toggleFullscreen(elem) {
            elem = elem || document.documentElement;
            if (!document.fullscreenElement && !document.mozFullScreenElement &&
                !document.webkitFullscreenElement && !document.msFullscreenElement) {
                if (elem.requestFullscreen) {
                elem.requestFullscreen();
                } else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
                } else if (elem.mozRequestFullScreen) {
                elem.mozRequestFullScreen();
                } else if (elem.webkitRequestFullscreen) {
                elem.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
                }
            } else {
                if (document.exitFullscreen) {
                document.exitFullscreen();
                } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
                } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
                } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
                }
            }
            }

            document.getElementById('btnFullscreen').addEventListener('click', function() {
            toggleFullscreen();
        });
        document.querySelector('.btn-full').onclick = function () {
            this.classList.toggle('fullscreen');
        };
    </script>
</body>
</html>