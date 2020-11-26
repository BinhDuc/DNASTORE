<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
   
<!DOCTYPE html>
<html>
<title>DNA Dashboard</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-right">DNASTORE</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
    	<a class="" onclick="openLink(event, 'thongtin')" Style="cursor: pointer;"><img src="http://localhost:8080/DNAStore/AvatarUser?username=${user.userName}" class=" w3-margin-right" style="width:75px;border-radius: 50%;"></a>
      	
      <p></p>
    </div>
    <div class="w3-col s8 w3-bar">
      <p><strong>${user.fullname}</strong></p>
      
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-button"><i class="fas fa-sign-out-alt"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard - ${user.rolename}</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <button class="w3-bar-item w3-button1 tablink " onclick="openLink(event, 'quanly')"><img src="icon/dashboard.svg" style="width: 16px;height: 16px"> Trang Quản Lý</button>
	    	
					
	<button class="w3-bar-item w3-button tablink " onclick="openLink(event, 'thongtin')"><img src="icon/name.svg" style="width: 16px;height: 16px"> Thông Tin</button>
	
	
	<button class="w3-bar-item w3-button tablink " onclick="openLink(event, 'message')"><img src="icon/envelope.svg" style="width: 16px;height: 16px;"> menu1</button>
	
	
	<button class="w3-bar-item w3-button tablink " onclick="openLink(event, 'datban')"><img src="icon/elearning.svg" style="width: 16px;height: 16px"> menu1</button>


	<button onclick="myFunction('user')" class="w3-button1 w3-block w3-left-align ">Quản Lý Nhân Viên <img src="icon/sort-down.svg" style="width: 13px;height: 13px"></button>
	<div id="user" class="w3-hide w3-animate-zoom w3-margin-left">
	
 		<button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'nhanvien')"><img src="icon/multiple-users-silhouette.svg" style="width: 16px;height: 16px"> Danh Sách Nhân Viên</button>
 		<button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'bangluong')"><img src="icon/name.svg" style="width: 16px;height: 16px"> menu1</button>
	</div>


	<button onclick="myFunction('kho')" class="w3-button1 w3-block w3-left-align">menu1 <img src="icon/sort-down.svg" style="width: 13px;height: 13px"></button>
	<div id="kho" class="w3-hide w3-animate-zoom w3-margin-left">		 	
 		<button class="w3-bar-item w3-button tablink " onclick="openLink(event, 'thucdon')"><img src="icon/restaurant-cutlery-circular-symbol-of-a-spoon-and-a-fork-in-a-circle.svg" style="width: 16px;height: 16px"> menu1</button>
 		<button class="w3-bar-item w3-button tablink " onclick="openLink(event, 'buffet')"><img src="icon/buffet.svg" style="width: 16px;height: 16px"> menu1</button>
	</div>
	<a href="${pageContext.request.contextPath}/createuser" class="w3-bar-item w3-button1" style="text-decoration: none;">Thêm User</a>
	<a href="${pageContext.request.contextPath}/createProduct" class="w3-bar-item w3-button1" style="text-decoration: none;">Thêm Sản phẩm</a>
	<a href="${pageContext.request.contextPath}/logout" class="w3-bar-item w3-button1" data-toggle="tooltip" data-placement="bottom" title="Sign-out"  style="text-decoration: none;"><img src="icon/logout.svg" style="width: 16px;height: 16px"> Đăng Xuất</a>
  </div>
</nav>
<script>
	function myFunction(id) {
  		var x = document.getElementById(id);
 			if (x.className.indexOf("w3-show") == -1) {
   			x.className += " w3-show";
 			} else { 
   			x.className = x.className.replace(" w3-show", "");
 			}
	}
</script>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
  </header>

  <div id='quanly' class="city" style="display:block">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>52</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Messages</h4>
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
	<div id='thongtin' class="w3-container city w3-animate-zoom " style="display:none">
			<div class="w3-padding-16 text-center" style="line-height: 10px;"><h2>Thông tin cá nhân</h2><br><p class="w3-text-grey">Thông tin cơ bản, như tên và chức vụ của bạn, mà bạn sử dụng.</p> </div>
			
			${user.fullname}
			${user.gender}
			${user.birthday}
			${user.number}
			${user.rolename}
		    <img src="http://localhost:8080/DNAStore/AvatarUser?username=${user.userName}" alt="">
		    <div class="w3-container w3-card w3-white w3-margin-bottom">
				<h3 class="w3-padding-16">Hồ Sơ</h3>
			
				<div class="w3-container tablelink">
					<a href="EditUser?username=${user.userName}">
		         		<div class="row btedit w3-hover-light-grey">
		         			<div class="col-sm-4">Họ Và Tên:</div>
		         			<div class="col-sm-7">${user.fullname}</div>
		         			<div class="col-sm-1 w3-text-grey"><i class="fas fa-angle-right"></i></div>
		         		</div>
		         		
	         		</a>
	         		
	         	</div>
	         	<div class="w3-container tablelink">
		         	<a href="EditUser?username=${user.userName}">
		         		<div class="row btedit w3-hover-light-grey">
		         			<div class="col-sm-4">Ngày Sinh:</div>
		         			<div class="col-sm-7">${user.birthday}</div>
		         			<div class="col-sm-1 w3-text-grey"><i class="fas fa-angle-right"></i></div>
		         		</div>
		         		
	         		</a>
	         		
	         	</div>
	         	<div class="w3-container tablelink">
		         	<a href="EditUser?username=${user.userName}">
		         		<div class="row btedit w3-hover-light-grey">
		         			<div class="col-sm-4">Giới Tính:</div>
		         			<div class="col-sm-7">${user.gender}</div>
		         			<div class="col-sm-1 w3-text-grey"><i class="fas fa-angle-right"></i></div>
		         		</div>
		         		
	         		</a>
	         		
	         	</div>
	         	
	         	<div class="w3-container tablelink">
		         	<a href="EditUser?username=${user.userName}">
		         		<div class="row btedit w3-hover-light-grey">
		         			<div class="col-sm-4">Chức Vụ:</div>
		         			<div class="col-sm-7">${user.rolename}</div>
		         			<div class="col-sm-1 w3-text-grey"><i class="fas fa-angle-right"></i></div>
		         		</div>
		         		
	         		</a>
	         		
	         	</div>
			    
			    <div class="w3-container tablelink" >
			    	<a href="EditUser?username=${user.userName}">
		         		<div class="row btedit1 w3-hover-light-grey">
		         			<div class="col-sm-4">User Name:</div>
		         			<div class="col-sm-7">${user.userName}</div>
		         			<div class="col-sm-1 w3-text-grey"><i class="fas fa-angle-right"></i></div>
		         		</div>
		         		
	         		</a>
	         		<br>
	         	</div>
			</div>
		   
		</div>
  

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 w3-light-grey">
    <h4>FOOTER</h4>
    
  </footer>

  <!-- End page content -->
</div>
<!-- --------------------------------------js tab menu------------------------------------------------------------------- -->	
	
	<script>
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
		}
	</script>
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
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>