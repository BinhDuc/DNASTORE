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
    <title>DNA Dashboard</title>
    <link rel="stylesheet" href="./css/styles.css" />
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
    <style>
        *{
            font-family: AvertaStdCY-Regular;
        }
       	.clock{
       		position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translateX(-50%) translateY(-50%);
		    font-family: AquireBold;
       	}
       	input[type=search]{
       		outline:none;
       	}
       	@media screen and (max-width: 600px) {
	        .clock{
	        	top: -50%;
			    left: 50%;
	        }
        }
    </style>
</head>
<body class="w3-light-grey">
	<!-- Top container -->
    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
        <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
        <span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span>
        <div class="w3-bar-item clock" id="MyClockDisplay" class="clock" onload="showTime()"></div>
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;"><i class="fas fa-expand"></i></button>
    </div>

    <!-- Sidebar/menu -->
    <nav class="w3-sidebar w3-collapse w3-white w3-margin-top w3-animate-opacity" style="z-index:3;width:300px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s4">
                <img src="${pageContext.request.contextPath}/avatar?username=${user.userName}" class=" w3-margin-right" style="width:66px;height:66px; border-radius:50%;">
            </div>
            <div class="w3-col s8 w3-bar ">
                <span><strong>${user.fullname}</strong></span><br>
                <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-button"><i class="fas fa-home"></i></a>
                <a href="#" class="w3-bar-item w3-button"><i class="fas fa-user"></i></a>
                <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt"></i></a>
            </div>
        </div>
        <hr>
        <div class="w3-container">
            <h5 style="font-family: AvertaStdCY-Semibold;">Dashboard</h5>
        </div>
        <div class="w3-bar-block">
            
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'overview')">
            	<i class="fas fa-tachometer-alt"></i>  Overview
            </button>
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'userinfo')">
            	<i class="fas fa-user"></i>  Hồ sơ
            </button>
            <button onclick="dropDown('sub-order')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink">
            	<i class="bx bxs-receipt"></i> Quản lý đơn hàng
            </button>
            <div id="sub-order" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listWaiting')">
                	<i class="fas fa-hourglass-half"></i> Chờ xác nhận
                </button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listDelivery')">
                	<i class="fas fa-shipping-fast"></i> Đang vận chuyển
                </button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listSuccess')">
                	<i class="fas fa-check-circle"></i> Thành công
                </button>
            </div>
        </div>
    </nav>


    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:30px">

    <!-- Header -->
        <header class="w3-container" style="padding-top:22px">
            <h5><b><i class="fas fa-tachometer-alt"></i> Dashboard</b></h5>
        </header>
        <div id="overview" class="city w3-animate-opacity" style="display: block;">
            <div class="w3-row-padding w3-margin-bottom">
                <div class="w3-quarter">
                    <div class="w3-container w3-blue w3-padding-16">
                        <div class="w3-left"><i class="bx bxs-receipt w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>${listod.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Đơn Đặt Hàng</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-pink w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fas fa-hourglass-half w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${waiting.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Chờ xác nhận</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-orange w3-text-white w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fas fa-shipping-fast w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${delivery.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Đang giao</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-green w3-text-white w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fas fa-check-circle w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${success.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Đơn thành công</h4>
                    </div>
                </div>
            </div>
			<script>
		   		$(document).ready(function(){
		   			$('.counter-value').each(function () {
		   				$(this).prop('Counter',0).animate({
		   					Counter: $(this).text()
		   				}, {
		   					duration: 2000,
		   					easing: 'swing',
		   					step: function (now) {
		   						$(this).text(Math.ceil(now));
		   					}
		   				});
		   			});
		
		   		});
		   	</script>
            
			
            <!-- Danh sách Đơn Hàng -->
	        <div>
			    <div class="w3-container">
	                <h2 >Danh sách đơn hàng</h2>
	                <button onclick="exportTableToExcel('order-table', 'Danh_Sách_Đơn_Hàng')" 
	                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
	            </div>
			    
			    
			    <p style="color: red;">${errorString}</p>
			    
			    
			    <div class="w3-container admin-search">	
			    	<i class="fas fa-search"></i>
			 		<input type="search" placeholder="Search..." class="search-input" data-table="order-list">
			 	</div>
			 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable order-list" id="order-table">
			    	<thead>
				       <tr class="w3-green">
				          <th>Mã đơn hàng</th>
				          <th>Mã khách hàng</th>
				          <th>Khách hàng</th>
				          <th>Địa chỉ giao hàng</th>
				          <th>SĐT</th>
				          <th>Thời điểm đặt hàng</th>
				          <th>Hình thức thanh toán</th>
				          <th>Trạng thái</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${listod}" var="listod" > 
							<tr class='clickable-row' data-href='comfirmOrder?orders_id=${listod.id}' style="cursor: pointer;">
			     				<td><c:out value="${listod.id}"/></td>
			     				<td><c:out value="${listod.username.userName}"/></td>
			     				<td><c:out value="${listod.customer}"/></td>
			     				<td><c:out value="${listod.address}"/></td>
			     				<td><c:out value="${listod.phone}"/></td>
			     				<td><c:out value="${listod.orderdate}"/></td>
			     				<td><c:out value="${listod.payment}"/></td>
			     				<c:choose>
			                    	<c:when test="${listod.status == '0'}">
										<td><i class="fas fa-hourglass-half" style="color:#696969;font-size:20px"></i></td>
								    </c:when>
								    <c:when test="${listod.status == '1'}">
										<td><i class="fas fa-shipping-fast" style="color:#ec8209;font-size:20px"></i></td>
								    </c:when>
								    <c:otherwise>
								    	<td><i class="fas fa-check-circle" style="color:#00ff73;font-size:20px"></i></td>
								    </c:otherwise>
		                   		</c:choose>          
			           		</tr>	       
			      	</c:forEach>
			    </table>
			    </div>
		    </div>
        </div>
		<div id='listWaiting' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh sách đơn chờ</h2>
                <button onclick="exportTableToExcel('waiting-table', 'Danh_Sách_Đơn_Hàng')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="order-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all w3-hoverable order-list" id="waiting-table">
		    	<thead>
			       <tr class="w3-green">
			          <th>Mã đơn hàng</th>
			          <th>Mã khách hàng</th>
			          <th>Khách hàng</th>
			          <th>Địa chỉ giao hàng</th>
			          <th>SĐT</th>
			          <th>Thời điểm đặt hàng</th>
			          <th>Hình thức thanh toán</th>
			          <th>Trạng thái</th>
			       </tr>
		       </thead>
	      		<c:forEach items="${waiting}" var="waiting" > 
						<tr class='clickable-row' data-href='comfirmOrder?orders_id=${waiting.id}' style="cursor: pointer;">
		     				<td><c:out value="${waiting.id}"/></td>
		     				<td><c:out value="${waiting.username.userName}"/></td>
		     				<td><c:out value="${waiting.customer}"/></td>
		     				<td><c:out value="${waiting.address}"/></td>
		     				<td><c:out value="${waiting.phone}"/></td>
		     				<td><c:out value="${waiting.orderdate}"/></td>
		     				<td><c:out value="${waiting.payment}"/></td>
		     				<c:choose>
		                    	<c:when test="${waiting.status == '0'}">
									<td><i class="fas fa-hourglass-half" style="color:#696969;font-size:20px"></i></td>
							    </c:when>
							    <c:when test="${waiting.status == '1'}">
									<td><i class="fas fa-shipping-fast" style="color:#ec8209;font-size:20px"></i></td>
							    </c:when>
							    <c:otherwise>
							    	<td><i class="fas fa-check-circle" style="color:#00ff73;font-size:20px"></i></td>
							    </c:otherwise>
	                   		</c:choose>          
		           		</tr>	       
		      	</c:forEach>
		    </table>
		    </div>
	    </div>
	    <div id='listDelivery' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh sách đơn đang giao</h2>
                <button onclick="exportTableToExcel('delivery-table', 'Danh_Sách_Đơn_Vân_Chuyển')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="order-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all w3-hoverable order-list" id="delivery-table">
		    	<thead>
			       <tr class="w3-green">
			          <th>Mã đơn hàng</th>
			          <th>Mã khách hàng</th>
			          <th>Khách hàng</th>
			          <th>Địa chỉ giao hàng</th>
			          <th>SĐT</th>
			          <th>Thời điểm đặt hàng</th>
			          <th>Hình thức thanh toán</th>
			          <th>Trạng thái</th>
			       </tr>
		       </thead>
	      		<c:forEach items="${delivery}" var="delivery" > 
						<tr class='clickable-row' data-href='comfirmOrder?orders_id=${delivery.id}' style="cursor: pointer;">
		     				<td><c:out value="${delivery.id}"/></td>
		     				<td><c:out value="${delivery.username.userName}"/></td>
		     				<td><c:out value="${delivery.customer}"/></td>
		     				<td><c:out value="${delivery.address}"/></td>
		     				<td><c:out value="${delivery.phone}"/></td>
		     				<td><c:out value="${delivery.orderdate}"/></td>
		     				<td><c:out value="${delivery.payment}"/></td>
		     				<c:choose>
		                    	<c:when test="${delivery.status == '0'}">
									<td><i class="fas fa-hourglass-half" style="color:#696969;font-size:20px"></i></td>
							    </c:when>
							    <c:when test="${delivery.status == '1'}">
									<td><i class="fas fa-shipping-fast" style="color:#ec8209;font-size:20px"></i></td>
							    </c:when>
							    <c:otherwise>
							    	<td><i class="fas fa-check-circle" style="color:#00ff73;font-size:20px"></i></td>
							    </c:otherwise>
	                   		</c:choose>          
		           		</tr>	       
		      	</c:forEach>
		    </table>
		    </div>
	    </div>
	    <div id='listSuccess' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh sách đơn hàng thành công</h2>
                <button onclick="exportTableToExcel('success-table', 'Danh_Sách_Đơn_Thành_Công')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="order-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all w3-hoverable order-list" id="success-table">
		    	<thead>
			       <tr class="w3-green">
			          <th>Mã đơn hàng</th>
			          <th>Mã khách hàng</th>
			          <th>Khách hàng</th>
			          <th>Địa chỉ giao hàng</th>
			          <th>SĐT</th>
			          <th>Thời điểm đặt hàng</th>
			          <th>Hình thức thanh toán</th>
			          <th>Trạng thái</th>
			       </tr>
		       </thead>
	      		<c:forEach items="${success}" var="success" > 
						<tr class='clickable-row' data-href='comfirmOrder?orders_id=${success.id}' style="cursor: pointer;">
		     				<td><c:out value="${success.id}"/></td>
		     				<td><c:out value="${success.username.userName}"/></td>
		     				<td><c:out value="${success.customer}"/></td>
		     				<td><c:out value="${success.address}"/></td>
		     				<td><c:out value="${success.phone}"/></td>
		     				<td><c:out value="${success.orderdate}"/></td>
		     				<td><c:out value="${success.payment}"/></td>
		     				<c:choose>
		                    	<c:when test="${success.status == '0'}">
									<td><i class="fas fa-hourglass-half" style="color:#696969;font-size:20px"></i></td>
							    </c:when>
							    <c:when test="${success.status == '1'}">
									<td><i class="fas fa-shipping-fast" style="color:#ec8209;font-size:20px"></i></td>
							    </c:when>
							    <c:otherwise>
							    	<td><i class="fas fa-check-circle" style="color:#00ff73;font-size:20px"></i></td>
							    </c:otherwise>
	                   		</c:choose>          
		           		</tr>	       
		      	</c:forEach>
		    </table>
		    </div>
	    </div>      
		<script>
	      	jQuery(document).ready(function($) {
	      	    $(".clickable-row").click(function() {
	      	        window.location = $(this).data("href");
	      	    });
	      	});
	      	function showTime(){
	      	    var date = new Date();
	      	    var h = date.getHours(); // 0 - 23
	      	    var m = date.getMinutes(); // 0 - 59
	      	    var s = date.getSeconds(); // 0 - 59
	      	    var session = "AM";
	      	    
	      	    if(h == 0){
	      	        h = 12;
	      	    }
	      	    
	      	    if(h > 12){
	      	        h = h - 12;
	      	        session = "PM";
	      	    }
	      	    
	      	    h = (h < 10) ? "0" + h : h;
	      	    m = (m < 10) ? "0" + m : m;
	      	    s = (s < 10) ? "0" + s : s;
	      	    
	      	    var time = h + ":" + m + ":" + s + " " + session;
	      	    document.getElementById("MyClockDisplay").innerText = time;
	      	    document.getElementById("MyClockDisplay").textContent = time;
	      	    
	      	    setTimeout(showTime, 1000);
	      	    
	      	}

	      	showTime();
      	</script>
		<script>
	        (function(document) {
	            'use strict';
	            var TableFilter = (function(myArray) {
	                var search_input;
	
	                function _onInputSearch(e) {
	                    search_input = e.target;
	                    var tables = document.getElementsByClassName(search_input.getAttribute('data-table'));
	                    myArray.forEach.call(tables, function(table) {
	                        myArray.forEach.call(table.tBodies, function(tbody) {
	                            myArray.forEach.call(tbody.rows, function(row) {
	                                var text_content = row.textContent.toLowerCase();
	                                var search_val = search_input.value.toLowerCase();
	                                row.style.display = text_content.indexOf(search_val) > -1 ? '' : 'none';
	                            });
	                        });
	                    });
	                }
	                return {
	                    init: function() {
	                        var inputs = document.getElementsByClassName('search-input');
	                        myArray.forEach.call(inputs, function(input) {
	                            input.oninput = _onInputSearch;
	                        });
	                    }
	                };
	            })(Array.prototype);
	
	            document.addEventListener('readystatechange', function() {
	                if (document.readyState === 'complete') {
	                    TableFilter.init();
	                }
	            });
	
	        })(document);
	    </script>
        <div id='userinfo' class="w3-container city w3-animate-zoom" style="display:none">
            <div class="w3-padding-16" style="line-height: 1.5;text-align: center">
                <h2  style="font-family: AvertaStdCY-Semibold;">Thông tin cá nhân</h2>
                <p class="w3-text-grey" style="line-height: 1.5;">Thông tin cơ bản, như tên và chức vụ của bạn, mà bạn sử dụng.</p> 
            </div>
			
			<div class="w3-container w3-card w3-white w3-margin-bottom card-user">
                <h3 class="w3-padding-16 ttl">Hồ Sơ</h3>
                <div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey">
                            <div class="user-infos-left">    
                                <h3 class="w3-col m3 s12">Ảnh</h3>
                                <p class="w3-col m9 s12">Một bức ảnh giúp cá nhân hóa tài khoản của bạn</p>
                            </div>
                            <div class="user-infos-right">
                                <div class="personal-image">
                                <label class="label">
                                    <input type="file" />
                                    <figure class="personal-figure">
	                                    <img src="http://localhost:8080/DNAStore/avatar?username=${user.userName}" class="personal-avatar" alt="avatar">
	                                    <figcaption class="personal-figcaption">
	                                        <img src="./images/camera-white.png">
	                                    </figcaption>
                                    </figure>
                                </label>
                                </div>
                            </div>
                        </div>	
                    </a>
                </div>
	         	<div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Tên</h3>
                                <p class="ttl-r">${user.fullname}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
                <div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Ngày sinh</h3>
                                <p class="ttl-r">${user.birthday}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
                <div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Giới tính</h3>
                                <p class="ttl-r">${user.gender}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
                <div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey" style="border: none;">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Mật khẩu</h3>
                                <p class="ttl-r">${user.password}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
	         	
	         	
			</div>
			<div class="w3-container w3-card w3-white w3-margin-bottom w3-margin-top card-user">
				<h3 class="w3-padding-16 ttl">Thông tin liên hệ</h3>
				<div class="w3-container">
                    <a href="editUser?username=${user.userName}">
                        <div class="user-infos w3-hover-light-grey">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Email</h3>
                                <p class="ttl-r">${user.email}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
	         	
	         	<div class="w3-container">
                    <a href="EditUser?userName=${user.userName}">
                        <div class="user-infos w3-hover-light-grey" style="border: none;">
                            <div class="user-infos-left">    
                                <h3 class="ttl-l">Điện thoại</h3>
                                <p class="ttl-r">${user.phone}</p>
                            </div>
                            <div class="user-infos-right"><i class="fas fa-angle-right"></i></div>
                        </div>	
                    </a>
                </div>
	         	 
	         	 
			</div>   
		</div>


    <!-- End page content -->
    </div>

    <script>
    // Get the Sidebar
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

        function openLink(evt, animName) {
       	  var i, x, tablinks;
       	  x = document.getElementsByClassName("city");
       	  for (i = 0; i < x.length; i++) {
       	    x[i].style.display = "none";
       	  }
       	  tablinks = document.getElementsByClassName("tablink");
       	  for (i = 0; i < x.length; i++) {
       	    tablinks[i].className = tablinks[i].className.replace(" w3-white", "");
       	  }
       	  document.getElementById(animName).style.display = "block";
       	  evt.currentTarget.className += " w3-white";
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
        function exportTableToExcel(tableID, filename = ''){
		    var downloadLink;
		    var dataType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(tableID);
		    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'excel_data.xls';
		    
		    // Create download link element
		    downloadLink = document.createElement("a");
		    
		    document.body.appendChild(downloadLink);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', tableHTML], {
		            type: dataType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
		    
		        // Setting the file name
		        downloadLink.download = filename;
		        
		        //triggering the function
		        downloadLink.click();
		    }
		};
    </script>
</body>
</html>