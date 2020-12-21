<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <%@page import="dnastore.beans.Cart"%>
 <%@page import="dnastore.beans.Product"%>
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
    <script src='./assets/sweetalert2.all.js'></script>
    <style>
    	.flag-discount {
		    color: #fff;
		    display: block;
		    float: left;
		    padding: 3px 3px;
		    background: #ee4d2d;
		    font-size: 12px;
		    font-weight: 400;
		    position: absolute;
		    top:3%;
		    left:0;
		}
		.flag-discount::before,
		.flag-discount::after {
		    content: "";
		    position: absolute;
		    left: 100%;
		    width: 0;
		    height: 0;
		    border-style: solid;
		    display: block;
		    
		}
		.flag-discount::before {
		    top: 0;
		    border-width: 22px 10px 0 0;
		    border-color: #ee4d2d transparent transparent transparent;
		}
		.flag-discount::after {
		    bottom: 0;
		    border-width: 0 10px 22px 0;
		    border-color: transparent transparent #ee4d2d transparent;
		}
		a.delete-btn{
			border: none;
           	outline: none;
           	color: #ee4d2d;
           	padding:10px;
           	border-radius:50%;
           	text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 16px;
		}
		.product:hover .product-header::after {
		  background:transparent;
		}
		.product:hover .product-header img {
		  transform: scale(1.05);
		}
		.product{
			cursor: pointer;
		}
		/* Chrome, Safari, Edge, Opera */
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
		  -webkit-appearance: none;
		  margin: 0;
		}
		
		/* Firefox */
		input[type=number] {
		  -moz-appearance: textfield;
		}
		@media only screen and (max-width: 567px) {
			.total-1price{
				display:none
			}
		}
		.checkout:hover{
			background:#f25433
		}
    </style>
</head>
<body>
	<%
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<Product, Integer> list = cart.getList();
	%>
	<jsp:include page="_header.jsp"></jsp:include>
	
	<div class=" cart">
		<div class="cart-header">
            <button onclick="history.back(-1)"><i class="fas fa-arrow-left"></i></button>
            <span>Giỏ hàng của tôi</span>
        </div>
        <form action="checkout">
        	<table id="table">
		    	
		        <tr bgcolor="#CCCCCC">
		            <td colspan="4" style="text-align:center">
		            	<p>Tổng sản phẩm:<%=list.size() %> SẢN PHẨM </p>
		            </td>
		        </tr>
		        <%	
		        	
		        	for(Map.Entry<Product, Integer> ds : list.entrySet()) {
		        %>
	               <tr>
	               		<td style="height: 130px">
	                          <img src="${pageContext.request.contextPath}/image?code=<%=ds.getKey().getCode() %>" alt="anhsanpham" style="height:auto;width: auto">
	                      </td>
	
	                   <td>
	                   	<a href="product?code=<%=ds.getKey().getCode() %>&categoryid=<%=ds.getKey().getCategoryId()%>" 
	                   	style="display: block;width:100%;font-weight: bold;color:#333;font-size:18px"><%=ds.getKey().getName() %></a>
	                   	<p style="display: block;">Giá:
	                   		<script>
								var price = <%=ds.getKey().getPrice() - ( ds.getKey().getPrice()* ds.getKey().getDiscount()/100 ) %>;
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script> 
	                   		
	                 	</p>
	                       
	                       <div style="display: block;align-items: center">
	                       		<a href="giohang?command=sub&code=<%=ds.getKey().getCode() %>&cartID=<%=System.currentTimeMillis()%>&quantity=1" class="update-btn">
	          						<i class="fas fa-minus"></i>
	          					</a>
	                            <input type='number' name="quantity" id="quantity"
	                            	oninput="javascript: if (this.value > this.max) {
	                            							$(document).ready(function(){
									      						swal('Nhập lại số lượng!', 'còn  sản phẩm', 'warning');
								  							});
								  						}"
								  	oninvalid="$(document).ready(function(){
						      						swal('Nhập lại số lượng!', '<%=ds.getKey().getName() %> còn <%=ds.getKey().getQuantity() %> sản phẩm', 'warning');
					  							});"
	                            	style="border:1px solid #ccc;text-align:center;border-radius:5px" 
	                            	value="<%=ds.getValue() %>" max="<%=ds.getKey().getQuantity() %>" class="readonly" required />
	                            <a href="giohang?command=plus&code=<%=ds.getKey().getCode() %>&cartID=<%=System.currentTimeMillis()%>&quantity=1" class="update-btn">
	                       			<i class="fas fa-plus"></i>
	                       		</a>
	                		</div>
	                		<script>
							    $(".readonly").keydown(function(e){
							        e.preventDefault();
							    });
							</script>
	                   </td>
					   <td id="loop" style="display: none;">
	                        <%=ds.getValue() * (ds.getKey().getPrice() - (ds.getKey().getPrice()* ds.getKey().getDiscount()/100)) %>	
					   </td>
					   <td class="total-1price">
					   		Thành tiền:
					   		<script>
								var price = <%=ds.getValue() * (ds.getKey().getPrice() - (ds.getKey().getPrice()* ds.getKey().getDiscount()/100)) %>;
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script> 
	                        	
							
					   </td>
	                   <td>
	                   	<a href="giohang?command=remove&code=<%=ds.getKey().getCode() %>&cartID=<%=System.currentTimeMillis()%>&quantity=<%=ds.getValue() %>" class="delete-btn">
	                   		<i class="fas fa-times-circle"></i>
	                   	</a>
	                   </td>
	               </tr>
	               
	           <%
	           	}
	           %>
		        
		        
		    </table>
		    
	   		<div class="total-price" style="margin-right:10px">
	   			<div class="total">    
	                <div>Tổng tiền</div>
	                <div id="val">
						<script type="text/javascript">
				   			var table = document.getElementById("table"), sumVal = 0;
				        
				        	for(var i = 1; i < table.rows.length; i++)
					        {
					            sumVal = sumVal + parseInt(table.rows[i].cells[2].innerHTML);
					        }
				        	sumVal = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(sumVal);
							document.write(sumVal);
					        console.log(sumVal);
						</script>
	                </div>
	
	            </div>
	            
	            <input type="submit" class="checkout btn" value="Thanh toán" 
	            style="outline:none;border:none;cursor: pointer;padding:15px 20px;font-size:18px">
	   		</div>
        </form>
		   
   		
	</div>
	<section class="section featured">
        <div class="top container">
            <h1>Có thể bạn cũng thích</h1>
            <br>
        </div>
        <div class="product-center container">
            <c:forEach items="${productList}" var="product" >
                <div class="product clickable" data-href='product?code=${product.code}&categoryid=${product.categoryId}'>
                    <div class="product-header">
                        <img src="${pageContext.request.contextPath}/image?code=${product.code}" alt="anhsanpham">
                    </div>
                    <div class="product-footer">
                        <a href="product?code=${product.code}&categoryid=${product.categoryId}">
                            <h3>${product.name}</h3>
                        </a>

                        <h4 class="price">
	                        <script>
								var price = ${product.price -(product.price * (product.discount / 100))};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>	
                        </h4>
                        <h4 style="text-decoration: line-through;color:#696969;font-size:12px">
                       		<script>
								var price = ${product.price};
								price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
								document.write(price);
							</script>
                       	</h4>
                    </div>
                    <span class="flag-discount">-${product.discount}%</span>
                </div>
            </c:forEach>
        </div>
    </section>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>