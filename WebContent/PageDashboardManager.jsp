<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/1234.png" type="image/x-icon">
    <title>DNA Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/w3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Chart.min.css">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fontawesome-free-5.15.1-web/css/all.min.css">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/owlcarousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- owcarousel -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="./js/Chart.min.js"></script>
    <style>
        *{
            font-family: AvertaStdCY-Regular;
        }
        input[type=search]{
       		outline:none;
       	}
       	.clock{
       		position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translateX(-50%) translateY(-50%);
		    font-family: AquireBold;
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
<!---------------------------------------------- Top container ----------------------------------------------------------------------->
    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
        <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
        <span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span>
        <div class="w3-bar-item clock" id="MyClockDisplay" class="clock" onload="showTime()"></div>
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;"><i class="fas fa-expand"></i></button>
    </div>
<!----------------------------------------------------------- Sidebar/menu -------------------------------------------------------->
    <nav class="w3-sidebar w3-collapse w3-white w3-margin-top w3-animate-opacity" style="z-index:3;width:300px;" id="mySidebar"><br>
        <div class="w3-container w3-row">
            <div class="w3-col s4">
                <img src="${pageContext.request.contextPath}/avatar?username=${user.userName}" class=" w3-margin-right" style="width:76px;height:76px; border-radius:50%;">
            </div>
            <div class="w3-col s8 w3-bar ">
                <span>${user.fullname}</span><br>
                <a href="${pageContext.request.contextPath}/" class="w3-bar-item w3-button"><i class="fas fa-home"></i></a>
                <a class="w3-bar-item w3-button" onclick="openLink(event, 'userinfo')"><i class="fas fa-user"></i></a>
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
            <button onclick="dropDown('sub-product')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink">
            	<i class='bx bxs-store' ></i> Sản phẩm
            </button>
            <div id="sub-product" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'category')">
                	<i class="fas fa-list"></i> Phân loại sản phẩm
                </button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'product-f')">
                	<i class='bx bx-closet'></i> Nữ
                </button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'product-m')">
                	<i class="fas fa-tshirt"></i> Nam
                </button>
            </div>
            <button onclick="dropDown('sub-acc')" class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink">
            	<i class="fas fa-users"></i> Nhân sự
            </button>
            <div id="sub-acc" class="w3-hide w3-animate-zoom w3-margin-left">
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listuser')">
                	<i class="fas fa-users-cog"></i> Danh sách
                </button>
                <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listrole')">
                	<i class="fas fa-code-branch"></i> Chức Vụ
                </button>
            </div>
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listcustomer')">
            	<i class="fas fa-address-book"></i>  Tài khoản khách hàng
            </button>
            <button class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" onclick="openLink(event, 'listorder')">
            	<i class='bx bxs-receipt' ></i>  Danh sách đơn hàng
            </button>
            <a class="w3-bar-item w3-button w3-padding w3-text-dark-grey tablink" href="carousel">
               	<i class="fas fa-cogs"></i> Carousel
        	</a>
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
                    <div class="w3-container w3-pink w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fas fa-cash-register w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3>
                            	<script>
									var total = ${total};
									total = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(total);
									document.write(total);
								</script>	
                            </h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Doanh Thu</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-blue w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fas fa-shipping-fast w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${listod.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Đơn Đặt Hàng</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-orange w3-text-white w3-padding-16  w3-card">
                        <div class="w3-left"><i class="fab fa-product-hunt w3-xxxlarge "></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${productList.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Sản phẩm</h4>
                    </div>
                </div>
                <div class="w3-quarter">
                    <div class="w3-container w3-green w3-text-white w3-padding-16 w3-card">
                        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                        <div class="w3-right">
                            <h3 class="counter-value">${UserList.size()}</h3>
                        </div>
                        <div class="w3-clear"></div>
                        <h4>Khách hàng</h4>
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
            <hr/>
            
<!-- ----------------------------------Biểu Đồ------------------------------------------------------------------------ -->
			<div class="w3-row">
				<div class="w3-half w3-container">
					<canvas id="myChart"></canvas>
				    <script>
				    	var ctx = document.getElementById("myChart").getContext('2d');
				      var myChart = new Chart(ctx, {
				        type: 'pie',
				        data: {
				          labels: ["Đang chờ", "Đang chuyển", "Thành Công"],
				          datasets: [{
				            backgroundColor: [
				              "#ff0057",
				              "#ff9800",
				              "#00ff11"
				            ],
				            data: [${waiting.size()}, ${delivery.size()}, ${success.size()}]
				          }]
				        },
		   			   	options: {
		   					animation: {
		   						duration: 0
		   					}
		   				}
				      });
				    </script>
				    <div class="w3-container w3-padding-16">
		                <h5>Users mới</h5>
		                <ul class="w3-ul w3-card w3-white">
		                    <c:forEach items="${NewUserList}" var="NewUserList"> 
		                    	<li class="w3-padding-16">
		                        	<img src="${pageContext.request.contextPath}/avatar?username=${NewUserList.userName}" class="w3-left w3-circle w3-margin-right" style="width:45px;height:45px">
		                        	<span class="w3-xlarge">${NewUserList.fullname}</span><br>
		                    	</li>
		                    </c:forEach>
		                </ul>
		            </div>
				</div>
				<div class="w3-half w3-container w3-padding-16 w3-responsive">
					<div class="w3-white w3-container w3-padding-16">
						<canvas id="canvas" width="400" height="400"></canvas>
					</div>
					
					<script>
						var BIEUDO ={
					  		loadData : function(){
					   			var formatteDayListArray =[];
					    		$.ajax({
					      			async: false,
					      			url: "DoanhThuJsonData",
					      			dataType:"json",
					      			success: function(dayJsonData) {
						    			console.log(dayJsonData);
						    			var labels = dayJsonData.map(function(e) {
					    				   return e.ngay;
					    				});
						    			console.log('ngay: ',labels);
						    			var data = dayJsonData.map(function(e) {
				    				   		return e.total;
					    				});
					    				console.log('total: ',data);
					     				formatteDayListArray.push(labels,data);
						     			
					      			}
				    			});
					   			return formatteDayListArray;
			  				},
						  /*Crate the custom Object with the data*/
					  		createChartData : function(jsonData){
					  			console.log(jsonData);
						    
						   
					   			return {
					   				type: 'line',
					   				data: {
				   			      		labels: jsonData[0],
				   			      		datasets: [{
					   			         	label: 'Doanh thu theo ngày',
					   			         	data: jsonData[1],
					   			         	fill: false,
				   			      			borderColor: 'rgb(233, 30, 99)',
				   			      			lineTension: 0.1
				   			      		}]
				   			   		},
					   			   	options: {
					   					animation: {
					   						duration: 2000,
					   						easing: 'easeInOutExpo'
					   					},
					   					scales: {
				   				        	yAxes: [{
				   				          		ticks: {
				   				            		beginAtZero: true,
				   				            		callback: function(value, index, values) {
						   				              	if(parseInt(value) >= 1000){
						   				                	return '₫' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						   				              	} else {
						   				                	return '₫' + value;
						   				              	}
					   				            	}
					   				          	}
		   				        			}]
				   				      	},
					   				   tooltips: {
						   			        callbacks: {
						   			            label: function(tooltipItem, data) {
						   			                return "₫" + Number(tooltipItem.yLabel).toFixed(0).replace(/./g, function(c, i, a) {
						   			                    return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
						   			                });
						   			            }
					   			        	}
					   			    	}
					   				}
				   				};
					  		},
						  /*Renders the Chart on a canvas and returns the reference to chart*/
						  renderChart:function(ChartData){
						  
						   var ctx = document.getElementById("canvas").getContext("2d"),
						    
						   myChart = new Chart(ctx,ChartData)
						             
						         
						    return myChart;
						  },
						  /*Initalization Student render chart*/
						  initChart : function(){
						     
						   var Data = BIEUDO.loadData();
						    
						    chartData = BIEUDO.createChartData(Data);
						     
						    ChartObj = BIEUDO.renderChart(chartData);
						     
						  }
						};
						 
						 
						$(document).ready(function(){
						   
							BIEUDO.initChart();
						});
					</script>
				</div>
			</div>

            
            <hr>	
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
	                                    <img src="${pageContext.request.contextPath}/avatar?username=${user.userName}" class="personal-avatar" alt="avatar">
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
<!------------------------------------------------- Danh mục sản phẩm ------------------------------------------------------>
        <div id='category' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh mục sản phẩm</h2>
                <button onclick="exportTableToExcel('categoryTable', 'Danh mục sản phẩm')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
                <a href="createCategory" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm danh mục</a>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all w3-hoverable customers-list" id="categoryTable">
		    	<thead>
			       <tr class="w3-green">
			          <th>ID</th>
			          <th>Category name</th>
			          <th>SubId</th>
			       </tr>
		       </thead>
	      		<c:forEach items="${CategoryList}" var="CategoryList" > 
						<tr class='clickable-row' data-href='editCategory?categoryId=${CategoryList.categoryId}' style="cursor: pointer;">
		     				<td><c:out value="${CategoryList.categoryId}"/></td>
		                   	<td><c:out value="${CategoryList.categoryname}"/></td>
		                   	<td><c:out value="${CategoryList.subid}"/></td>            
		           		</tr>	       
		      	</c:forEach>
		    </table>
		    </div>
	    </div>
<!------------------------------------------------------- Sản Phẩm nữ ------------------------------------------->		
		<div id='product-f' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Sản phẩm nữ</h2>
                <button onclick="exportTableToExcel('femaleTable', 'Danh sách sản phẩm nữ')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
                <a href="createProduct?subid=2" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nam</a>
                <a href="createProduct?subid=1" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nữ</a>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable customers-list" id="femaleTable">
			    	<caption>Sản phẩm nữ</caption>
			    	<thead>
				       <tr class="w3-green">
				          <th>ID</th>
				          <th>Tên sản phẩm</th>
				          <th>Giá</th>
				          <th>Discount</th>
				          <th>Danh mục</th>
				          <th>Số lượng</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${productListf}" var="productList" > 
						<tr class='clickable-row' data-href='editProduct?code=${productList.code}&subid=${productList.subid}' style="cursor: pointer;">
		     				<td><c:out value="${productList.code}"/></td>
		                   	<td><c:out value="${productList.name}"/></td>
		                   	<td><c:out value="${productList.price}"/></td>
		                   	<td><c:out value="${productList.discount}"/></td>  
		                   	<td><c:out value="${productList.categoryname}"/></td>
		                   	<td><c:out value="${productList.quantity}"/></td>                         
		           		</tr>
			      	</c:forEach>
			    </table>
		    </div>    
		</div>
<!--------------------------------------- Sản phẩm nam ------------------------------------------------------------->
		<div id='product-m' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Sản phẩm nam</h2>
                <button onclick="exportTableToExcel('maleTable', 'Danh sách sản phẩm nam')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
                <a href="createProduct?subid=2" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nam</a>
                <a href="createProduct?subid=1" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm sản phẩm nữ</a>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable customers-list" id="maleTable">
			    	<caption>Sản phẩm nam</caption>
			    	<thead>
				       <tr class="w3-green">
				          <th>ID</th>
				          <th>Tên sản phẩm</th>
				          <th>Giá</th>
				          <th>Discount</th>
				          <th>Danh mục</th>
				          <th>Số lượng</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${productListm}" var="productList">
						<tr class='clickable-row' data-href='editProduct?code=${productList.code}&subid=${productList.subid}' style="cursor: pointer;">
		     				<td><c:out value="${productList.code}"/></td>
		                   	<td><c:out value="${productList.name}"/></td>
		                   	<td><c:out value="${productList.price}"/></td>
		                   	<td><c:out value="${productList.discount}"/></td>  
		                   	<td><c:out value="${productList.categoryname}"/></td>
		                   	<td><c:out value="${productList.quantity}"/></td>                           
		           		</tr>
			      	</c:forEach>
			    </table>
		    </div>    
		</div>
<!----------------------------------------- Quản lý nhân sự ------------------------------------------------------------------->
		<div id='listuser' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Nhân Sự</h2>
                <button onclick="exportTableToExcel('accountTable', 'Danh sách nhân sự')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
                <a href="createuser" class="w3-button w3-large w3-green w3-margin-bottom ">Thêm Nhân Viên</a>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable customers-list" id="accountTable">
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
						<tr class='clickable-row' data-href='editUser?username=${AccountList.userName}' style="cursor: pointer;">
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
<!--------------------------------------------------------- Danh sách Chức Vụ  -------------------------------------------->
		<div id='listrole' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Chức Vụ</h2>
                <button onclick="exportTableToExcel('roleTable', 'Role List')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container ">
			    <table class="w3-table-all w3-hoverable customers-list" id="roleTable">
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
<!------------------------------------------- quản lý khách hàng thành viên ---------------------------------------------------->
		<div id='listcustomer' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh Sách Khách Hàng Đăng Ký Tài Khoản</h2>
                <button onclick="exportTableToExcel('customersTable', 'Danh sách khách hàng')" 
                class="w3-button w3-large w3-green w3-margin-bottom ">Xuất Excel</button>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
			    <table class="w3-table-all w3-hoverable customers-list" id="customersTable">
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
<!--------------------------------- Danh sách Đơn Hàng -------------------------------------------------------------------------------->
        <div id='listorder' class="w3-container city w3-animate-zoom" style="display:none">
		    <div class="w3-container">
                <h2 >Danh sách đơn hàng</h2>
                <button onclick="exportTableToExcel('ordertable', 'Danh sách đơn hàng')" 
                class="w3-button w3-large w3-green w3-margin-bottom " style="text-decoration: none;">Xuất Excel</button>
            </div>
		    <p style="color: red;">${errorString}</p>
		    <div class="w3-container admin-search">	
		    	<i class="fas fa-search"></i>
		 		<input type="search" placeholder="Search..." class="search-input" data-table="customers-list">
		 	</div>
		 	<div class="w3-responsive w3-container">
		    <table class="w3-table-all w3-hoverable customers-list" id="ordertable">
		    	<thead>
			       <tr class="w3-green">
			          <th>Mã đơn hàng</th>
			          <th>Khách Hàng</th>
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
	


<!--------------- js -------------------------------------------------->
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
        
    </script>
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
   	<script type="text/javascript">
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