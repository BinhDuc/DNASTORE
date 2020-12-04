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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <style>
        *{
            font-family: AvertaStdCY-Regular;
        }
    </style>
</head>
<body class="w3-light-grey">
	<!-- Top container -->
    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
        <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
        <span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span>
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;">
            <i class="fas fa-expand"></i>
        </button>
    </div>

    <!-- Sidebar/menu -->
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-opacity" style="z-index:3;width:300px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s4">
                <img src="http://localhost:8080/DNAStore/avatar?username=${user.userName}" class=" w3-margin-right" style="width:66px;height:66px; border-radius:50%;">
            </div>
            <div class="w3-col s8 w3-bar">
                <span><strong>${user.fullname}</strong></span><br>
                <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
                <a href="#" class="w3-bar-item w3-button"><i class="fas fa-user"></i></a>
                <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt"></i></a>
            </div>
        </div>
        <hr>
        <div class="w3-container">
            <h5 style="font-family: AvertaStdCY-Semibold;">Dashboard</h5>
        </div>
        <div class="w3-bar-block">
            
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'overview')"><i class="fa fa-users fa-fw"></i>  Overview</button>
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'userinfo')"><i class="fas fa-user"></i>  Hồ sơ</button>
            

            <button onclick="dropDown('sub-product')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink"><i class="fas fa-cogs"></i> Sản Phẩm</button>
            <div id="sub-product" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'category')"><i class="fas fa-images"></i> Category</button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'product')"><i class="fas fa-code-branch"></i> Products</button>
            </div>

            <button onclick="dropDown('sub-acc')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink"><i class="fas fa-cogs"></i> Nhân sự</button>
            <div id="sub-acc" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listuser')"><i class="fas fa-images"></i> User</button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listrole')"><i class="fas fa-code-branch"></i> Role</button>
            </div>
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listcustomer')"><i class="fas fa-user"></i>  Tài khoản khách hàng</button>
            <button onclick="dropDown('sub-nav')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink"><i class="fas fa-cogs"></i> Giao diện</button>
            <div id="sub-nav" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'slideshow')"><i class="fas fa-images"></i> Carousel</button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'slide-brand')"><i class="fas fa-code-branch"></i> Brand</button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'banner-discount')"><i class="fas fa-tags"></i> Banner</button>
            </div>
        </div>
    </nav>


    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

    <!-- !PAGE CONTENT! -->
    <div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <!-- Header -->
        <header class="w3-container" style="padding-top:22px">
            <h5><b><i class="fas fa-tachometer-alt"></i> Dashboard</b></h5>
        </header>
        <div id="overview" class="city w3-animate-opacity" style="display: block;">
            <div class="w3-row-padding w3-margin-bottom">
                <div class="w3-quarter">
                    <div class="w3-container w3-red w3-padding-16">
                        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>52</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Tin Nhắn</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-blue w3-padding-16">
                        <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>99</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Views</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-teal w3-padding-16">
                        <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>23</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Shares</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-orange w3-text-white w3-padding-16">
                        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>50</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Users</h4>
                    </div>
                </div>
            </div>

            <hr/>
            <div class="w3-container">
                <h5>Users mới</h5>
                <ul class="w3-ul w3-card-4 w3-white">
                    <li class="w3-padding-16">
                        <img src="./images/vice_item_1.webp" class="w3-left w3-circle w3-margin-right" style="width:35px">
                        <span class="w3-xlarge">Mike</span><br>
                    </li>
                    <li class="w3-padding-16">
                        <img src="./images/vice_item_1.webp" class="w3-left w3-circle w3-margin-right" style="width:35px">
                        <span class="w3-xlarge">Jill</span><br>
                    </li>
                    <li class="w3-padding-16">
                        <img src="./images/vice_item_1.webp" class="w3-left w3-circle w3-margin-right" style="width:35px">
                        <span class="w3-xlarge">Jane</span><br>
                    </li>
                </ul>
            </div>
            <hr>

            <div class="w3-container">
                <h5>Recent Comments</h5>
                <div class="w3-row">
                    <div class="w3-col m2 text-center">
                        <img class="w3-circle" src="./images/vice_item_1.webp" style="width:96px;height:96px">
                    </div>
                    <div class="w3-col m10 w3-container">
                        <h4>John <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
                        <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
                    </div>
                </div>

                <div class="w3-row">
                    <div class="w3-col m2 text-center">
                        <img class="w3-circle" src="./images/vice_item_1.webp" style="width:96px;height:96px">
                    </div>
                    <div class="w3-col m10 w3-container">
                        <h4>Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15 PM</span></h4>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
                    </div>
                </div>
            </div>
            <br>
        </div>

        
       <!-- Thông tin tài khoản -->
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
                                <p class="w3-col m9 s12 anh">Một bức ảnh giúp cá nhân hóa tài khoản của bạn</p>
                            </div>
                            <div class="user-infos-right">
                                <div class="personal-image">
                                <label class="label">
                                    <input type="file" />
                                    <figure class="personal-figure">
	                                    <img src="http://192.168.43.144:8080/DNAStore/avatar?username=${user.userName}" class="personal-avatar" alt="avatar">
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
                    <a href="editUser?username=${user.userName}">
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
		<!-- Danh mục sản phẩm -->
        <div id='category' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh mục sản phẩm</h2>
                <button onclick="exportTableToExcel('myTablePH', 'Danh Sách Phản Hồi')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="text" onkeyup="myFunctionph()" placeholder="Tìm kiếm theo tên danh mục...">
	
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all" >
		    	<thead>
			       <tr class="w3-green">
			          <th>ID</th>
			          <th>Category name</th>
			          <th>SubId</th>
			       </tr>
		       </thead>
	      		<c:forEach items="${CategoryList}" var="CategoryList" > 
						<tr>
		     				<td><c:out value="${CategoryList.categoryId}"/></td>
		                   	<td><c:out value="${CategoryList.categoryname}"/></td>
		                   	<td><c:out value="${CategoryList.subid}"/></td>            
		           		</tr>	       
		      	</c:forEach>
		    </table>
		    </div>
	    </div>
		
		<div id='product' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách sản phẩm</h2>
                <button onclick="exportTableToExcel('id', 'Danh Sách 1')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
                <a href="createProduct?subid=2" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nam</a>
                <a href="createProduct?subid=1" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nữ</a>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="text" onkeyup="myFunctionph()" placeholder="Tìm kiếm theo tên danh mục...">
	
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable" >
			    	<caption>Sản phẩm nữ</caption>
			    	<thead>
				       <tr class="w3-green">
				          <th>ID</th>
				          <th>Tên sản phẩm</th>
				          <th>Giá</th>
				          <th>Discount</th>
				          <th>Danh mục</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${productListf}" var="productList" > 
						
							<tr class='clickable-row' data-href='editProduct?code=${productList.code}&subid=${productList.subid}' style="cursor: pointer;">
			     				<td><c:out value="${productList.code}"/></td>
			                   	<td><c:out value="${productList.name}"/></td>
			                   	<td><c:out value="${productList.price}"/></td>
			                   	<td><c:out value="${productList.discount}"/></td>  
			                   	<td><c:out value="${productList.categoryname}"/></td>
			                   	                            
			           		</tr>
	           			       
			      	</c:forEach>
			      	
			    </table>
			    <table class="w3-table-all w3-hoverable" >
			    	<caption>Sản phẩm nam</caption>
			    	<thead>
				       <tr class="w3-green">
				          <th>ID</th>
				          <th>Tên sản phẩm</th>
				          <th>Giá</th>
				          <th>Discount</th>
				          <th>Danh mục</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${productListm}" var="productList" > 
						
							<tr class='clickable-row' data-href='editProduct?code=${productList.code}&subid=${productList.subid}' style="cursor: pointer;">
			     				<td><c:out value="${productList.code}"/></td>
			                   	<td><c:out value="${productList.name}"/></td>
			                   	<td><c:out value="${productList.price}"/></td>
			                   	<td><c:out value="${productList.discount}"/></td>  
			                   	<td><c:out value="${productList.categoryname}"/></td>
			                   	                            
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
      	</script>
		<!-- Quản lý nhân sự -->
		<div id='listuser' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Nhân Sự</h2>
                <button onclick="exportTableToExcel('id', 'Danh Sách 1')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="text" onkeyup="myFunctionph()" placeholder="Tìm kiếm theo tên danh mục...">
	
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all" >
			    	<thead>
				       <tr class="w3-green">
				          <th>Username</th>
				          <th>Email</th>
				          <th>Tên</th>
				          <th>Giới tính</th>
				          <th>Ngày Sinh</th>
				          <th>Số điện thoại</th>
				          <th>Chức Vụ</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${AccountList}" var="AccountList" > 
						
							<tr>
			     				<td><c:out value="${AccountList.userName}"/></td>
			                   	<td><c:out value="${AccountList.email}"/></td>
			                   	<td><c:out value="${AccountList.fullname}"/></td>
			                   	<td><c:out value="${AccountList.gender}"/></td>  
			                   	<td><c:out value="${AccountList.birthday}"/></td> 
			                   	<td><c:out value="${AccountList.phone}"/></td>  
			                   	<td><c:out value="${AccountList.rolename}"/></td>             
			           		</tr>
	           			       
			      	</c:forEach>
			    </table>
		    </div>    
		</div>
		<div id='listrole' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Chức Vụ</h2>
                <button onclick="exportTableToExcel('id', 'Danh Sách 1')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="text" onkeyup="myFunctionph()" placeholder="Tìm kiếm theo tên danh mục...">
	
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all" >
			    	<thead>
				       <tr class="w3-green">
				          <th>ID</th>
				          <th>Chức Vụ</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${RoleList}" var="RoleList" > 
						
							<tr>
			     				<td><c:out value="${RoleList.roleid}"/></td>
			                   	<td><c:out value="${RoleList.rolename}"/></td>            
			           		</tr>
	           			       
			      	</c:forEach>
			    </table>
		    </div>    
		</div>
		<!-- quản lý khách hàng thành viên -->
		<div id='listcustomer' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Khách Hàng Đăng Ký Tài Khoản</h2>
                <button onclick="exportTableToExcel('id', 'Danh Sách 1')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
            </div>
		    
		    
		    <p style="color: red;">${errorString}</p>
		    
		    
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="text" onkeyup="myFunctionph()" placeholder="Tìm kiếm theo tên danh mục...">
	
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all" >
			    	<thead>
				       <tr class="w3-green">
				          <th>Email</th>
				          <th>Tên</th>
				          <th>Giới tính</th>
				          <th>Ngày sinh</th>
				          <th>Số điện thoại</th>
				          <th>Địa chỉ</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${UserList}" var="UserList" > 
						
							<tr>
			     				<td><c:out value="${UserList.email}"/></td>
			                   	<td><c:out value="${UserList.fullname}"/></td>
			                   	<td><c:out value="${UserList.gender}"/></td>
			                   	<td><c:out value="${UserList.birthday}"/></td> 
			                   	<td><c:out value="${UserList.phone}"/></td> 
			                   	<td><c:out value="${UserList.adress}"/></td>             
			           		</tr>
	           			       
			      	</c:forEach>
			    </table>
		    </div>    
		</div>
         <div id='1' class="w3-container city w3-animate-zoom" style="display:none">
            <div class="w3-container w3-animate-right ">
                <h5>Recent Comments</h5>
                <div class="w3-row">
                    <div class="w3-col m2 text-center">
                        <img class="w3-circle" src="./images/vice_item_1.webp" style="width:96px;height:96px">
                    </div>
                    <div class="w3-col m10 w3-container">
                        <h4>John <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
                        <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
                    </div>
                </div>

                <div class="w3-row">
                    <div class="w3-col m2 text-center">
                        <img class="w3-circle" src="./images/vice_item_1.webp" style="width:96px;height:96px">
                    </div>
                    <div class="w3-col m10 w3-container">
                        <h4>Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15 PM</span></h4>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
                    </div>
                </div>
            </div>
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
       	    tablinks[i].className = tablinks[i].className.replace(" w3-light-gray", "");
       	  }
       	  document.getElementById(animName).style.display = "block";
       	  evt.currentTarget.className += " w3-light-gray";
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
        }
    </script>
</body>
</html>