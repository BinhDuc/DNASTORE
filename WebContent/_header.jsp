<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="java.util.TreeMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@page import="dnastore.beans.Cart"%>
 <%@page import="dnastore.beans.Product"%>
<%
	Cart cart = (Cart) session.getAttribute("cart");
	if(cart == null){
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	TreeMap<Product, Integer> list = cart.getList();
%> 
<!-- Navigation -->
    
    <nav class="navigation">
        <div class="nav-center container">
            <div class="hamburger">
                <i class="fas fa-bars"></i>
            </div>
            <a href="${pageContext.request.contextPath}/" class="logo"  style="outline:none">
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
                        <a href="${pageContext.request.contextPath}/" class="nav-link"  style="outline:none">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/nu" class="nav-link"  style="outline:none">Nữ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/nam" class="nav-link"  style="outline:none">Nam</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/sale" class="nav-link"  style="outline:none">Sale</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/gioithieu" class="nav-link"  style="outline:none">Giới Thiệu</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/lienhe" class="nav-link"  style="outline:none">Liên hệ</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/dangnhap" class="nav-link"  style="outline:none">Đăng nhập</a>
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
            	<a href="${pageContext.request.contextPath}/taikhoan" style="outline:none"><i class="fas fa-user"></i></a>
                <button class="bnt-search" style="border:none;outline:none"><i class="fas fa-search"></i></button>
                <a href="${pageContext.request.contextPath}/giohang" class="notification" style="border:none;outline:none">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="badge total-count"><%=list.size() %></span>
                </a>
            </div>
            <form class="search-box-s" method="get" action="search">
                <input id ="product"  type="search" placeholder="Bạn tìm gì ..." maxlength="100" class="search-input" name="q"/>
                <input type ="hidden" id = "product-id">
                <input type="submit" value="Tìm kiếm" 
                style="width: 80px;padding: 5px 0;background: orangered;color: #fff; margin-left: -6px;border: 1px solid orangered;outline: none;cursor: pointer;">
            </form>

            
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
                    $(".search-box-s").toggle();
                    $(".search-input").focus();
                });
    
            });
        </script>
        <script>
        	var productData ={
       			loadData : function(){
   	            	var products = [];
   	            	$.ajax({
   		      			async: false,
   		      			url: "JsonProduct",
   		      			dataType:"json",
   		      			success: function(JsonData) {
   		      				products = JsonData;
   		    				console.log(products);
   		      			}
   	    			});
   	            	return products;
   	            }
        	}
	        $(function() {
	   			var data = productData.loadData();
	   			console.log("data",data);
	            $( "#product" ).autocomplete({
	            	minLength:2,
	                source: data,
	                focus: function( event, ui ) {
	                    $( "#product" ).val( ui.item.label );
	                    return false;
	                },
	                select: function( event, ui ) {
	                    $( "#product" ).val( ui.item.label );
	                    $( "#product-id" ).val( ui.item.value );
	                    $( "#product-description" ).html( ui.item.desc );
	                    return false;
	                }
	            })
	            .data( "ui-autocomplete" )._renderItem = function( ul, item ) {
	                return $( "<li class='list'>" )
	                .append( "<a href='product?code="+item.value+"'>"
	                		+'<img src="${pageContext.request.contextPath}/image?code='+item.value+'" alt="anhsanpham">' 
	                		+"<div>"+"<h3>"+ item.label +"</h3>"+ "<p>" + item.desc +" ₫"+"</p>" +"</div>"+ "</a>" )
	                .appendTo( ul );
	            };
	         });
	    </script>
    </nav>
