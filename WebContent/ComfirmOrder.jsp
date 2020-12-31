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
    <link rel="stylesheet" href="./css/checkout.css">
    <link rel="stylesheet" href="./css/w3.css">
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
</head>
<body>
	<!-- Top container -->
    <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
    	<c:choose>
	    	<c:when test="${user.roleid == 1}">
				<a href="${pageContext.request.contextPath}/quanly" class="w3-bar-item header"><i class="fas fa-arrow-left"></i></a>
     	 		<a href="${pageContext.request.contextPath}/quanly"><span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span></a>
		  	</c:when>
		  	<c:when test="${user.roleid == 2}">
				<a href="${pageContext.request.contextPath}/nhanvien" class="w3-bar-item header"><i class="fas fa-arrow-left"></i></a>
     	 		<a href="${pageContext.request.contextPath}/nhanvien"><span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span></a>
		  	</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/" class="w3-bar-item header"><i class="fas fa-arrow-left"></i></a>
     	 		<a href="${pageContext.request.contextPath}/"><span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span></a>
			</c:otherwise>
  		</c:choose>  
        
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;">
            <i class="fas fa-expand"></i>
        </button>
    </div>
    <div class="w3-main" style="margin-top:43px;">
    	
    	<c:choose>
			<c:when test="${Message.equals('Sửa thành công')}">
				<script>
				    $(document).ready(function(){
				        swal('Thành Công!', 'Đơn hàng chuẩn bị được vận chuyển!', 'success');
				    });
				</script>
			</c:when>
		    <c:otherwise>
				
		    </c:otherwise>
		</c:choose>
    	<header style="padding:0 60px;">
            <h4 style="font-family: AvertaStdCY-Semibold;">Mã đơn hàng : ${orders_id}</h2>
            <button id="btn-export" class="w3-btn w3-green" onclick="exportHTML();">Xuất hóa đơn</button>
        </header>
		<div class="rows" style="padding:20px 50px">
	        <div class="column-70">
	            <div class="con">
		            <form method="post" action="comfirmOrder">
			            <h2 style="border-bottom: 1px solid #ccc;">Thông tin thanh toán</h2>
			            <br>
			            <label for="customer">Họ tên:</label>
			            <p>
			            	<input type="text" id="name" name="name" class="input-checkout" value="${orderdetail.orders_id.customer}" />
			            </p>
			            <label for="phone">Số điện thoại:</label>
			            <p>
			            	<input type="text" id="phone" name="phone" class="input-checkout" value="${orderdetail.orders_id.phone}" />
			            </p>
			            <label for="adr">Địa chỉ giao hàng:</label>
			            <p>
			           		<textarea id="adr" name="address" placeholder="542 W. 15th Street">${orderdetail.orders_id.address}</textarea>
			            </p>
			            <label>Phương thức thanh toán:</label>
			            <p>
				            <c:choose>
								<c:when test="${orderdetail.orders_id.payment.equals('COD')}">
							    	<select name="payment">
						                <option value="COD" selected>COD</option>
						                <option value="Chuyển khoản">Chuyển khoản</option>
						            </select>
								</c:when>
							    <c:otherwise>
									<select name="payment">
										<option value="Chuyển khoản" selected>Chuyển khoản</option>
						                <option value="COD">COD</option>
						            </select>
							    </c:otherwise>
							</c:choose>
						</p>
			            <label>Trạng thái:</label>
			            <c:choose>
							<c:when test="${orderdetail.orders_id.status == 0}">
						    	<select name="status">
					                <option value="0" selected>Chờ xác nhận</option>
					                <option value="1">Giao Hàng</option>
					            </select>
							</c:when>
							<c:when test="${orderdetail.orders_id.status == 1}">
						    	<select name="status">
					                <option value="0">Chờ xác nhận</option>
					                <option value="1" selected>Giao Hàng</option>
					                <option value="2">Đã nhận</option>
					            </select>
							</c:when>
						    <c:otherwise>
								<p style="color:green">Đơn hàng thành công</p>
						    </c:otherwise>
						</c:choose>
			            <input type="hidden" value="${orderdetail.orders_id.id}" name="id">
			            <input type="hidden" value="${user.roleid}" name="roleid">
			            <c:choose>
							<c:when test="${orderdetail.orders_id.status == 2}">
						    	<input type="hidden" value="Xác nhận giao hàng" class="btn-checkout">
							</c:when>
						    <c:otherwise>
								<input type="submit" value="Xác nhận giao hàng" class="btn-checkout">
						    </c:otherwise>
						</c:choose>
		            </form>
	            </div>
	        </div>
	        
	        <div class="column-30">
	            <div class="con">
	                <h2>Đơn hàng</h2>
	                
	                <br>
	                <table id="table">
	                <c:forEach items="${list}" var="list" >
		                <tr style="display:flex;justify-content: space-between;">
		                    <td style="flex-basis: 20%;max-width: 20%;height: 150px">
		                        <img src="${pageContext.request.contextPath}/image?code=${list.product_id.code}" alt="anhsanpham" style="height:auto;width: auto">
		                    </td>
		                    <td style="flex-basis: 50%;max-width: 50%;">
		                        <a href="product?code=${list.product_id.code}" style="font-size: 16px">${list.product_id.name}</a>
		                        <p>Số lượng: ${list.quantity}</p>
		                    </td>
		                    <td style="flex-basis: 20%;max-width: 20%;display: none;" id="loop">
		                    	${list.total_price - (list.total_price*list.coupon/100)}
		                    </td>
		                    <td style="flex-basis: 30%;max-width: 30%;">
		                    	<script>
									var price = ${list.total_price - (list.total_price*list.coupon/100)};
									price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
									document.write(price);
								</script> 
		                    </td>
		                    
		                </tr>
	                </c:forEach>
		          	</table>
	                <br>
	                <p style="margin-top:10px;">
	                	Tổng tiền:
	                	<script type="text/javascript">
				   			var table = document.getElementById("table"), sumVal = 0;
				        
				        	for(var i = 0; i < table.rows.length; i++)
					        {
					            sumVal = sumVal + parseFloat(table.rows[i].cells[2].innerHTML);
					        }
				        	sumVal = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(sumVal);
							document.write(sumVal);
					        console.log(sumVal);
						</script>
	                </p>
	        	</div>
	        </div>
	    </div>
	</div>
	
	<div id="source-html" class="w3-main" style="margin-top:43px;display:none">
		<div>
			<center><h1>HÓA ĐƠN MUA HÀNG</h1></center>
			<div style="display: flex;justify-content: space-between">
				<div style="text-align: center;flex-basis: 50%">
                     <h2 style="color: #333333;">DNA<span style="color: orangered;">S</span>TORE</h2>
                 </div>
                 <div style="flex-basis: 50%">
                   	<p>Hostline: 012345678 </p>
                    <p>Email: company@gmail.com</p>
                 </div>
			</div>
		</div>
		<br>
		<div>
       		Chào quý khách,<br>
       		DNASTORE gửi đến quý khách hóa đơn cho đơn hàng ${orders_id}
       	</div>
		<div >
	        <div style="width:100%">
	            <div class="con">
		            <form method="post" action="comfirmOrder">
			            <h3 style="border-bottom: 1px solid #ccc;">THÔNG TIN ĐƠN HÀNG #${orders_id} (${orderdetail.orders_id.orderdate})</h3>
			            <br>
			            <p>
			            	Họ tên khách hàng: ${orderdetail.orders_id.customer}
			            </p>
			            <p>
			            	Điện thoại: ${orderdetail.orders_id.phone}
			            </p>
			            <p>
			           		Địa chỉ giao hàng: ${orderdetail.orders_id.address}
			            </p>
			            <p>
				            Phương thức thanh toán: ${orderdetail.orders_id.payment}
						</p>
		            </form>
	            </div>
	        </div>
	        <br>
	        <div style="width:100%">
	            <div class="con">
	                <h3 style="border-bottom: 1px solid #ccc;">CHI TIẾT ĐƠN HÀNG</h3>
	                
	                <br>
	                <table id="tables" style="width:100%;border: none">
	                	<thead style="background-color: rgb(2, 172, 234);border: none">
					       <tr style=" text-align: left;color:#fff;font-weight: bold;text-transform: uppercase;height: 40px;border: none;font-size: 16px">
					          <td style="border: none;border: 1px solid rgb(2, 172, 234)">Sản phẩm</td>
					          <td style="border: none;border: 1px solid rgb(2, 172, 234)">Số lượng</td>
					          <td style="border: none;border: 1px solid rgb(2, 172, 234)">Đơn giá</td>
					          <td style="text-align: left;border: none;border: 1px solid rgb(2, 172, 234)">Thành tiền</td>
					          <td style="text-align: left;border: none;display: none;border: 1px solid rgb(2, 172, 234)">0</td>
					       </tr>
				       	</thead>
		                <c:forEach items="${list}" var="list" >
			                <tr style="border-bottom: 1px solid red;height: 30px;">
			                    <td style="border-bottom: 1px solid #ccc" >
			                    	${list.product_id.name}
			                    </td>
			                    <td style="border-bottom: 1px solid #ccc">
			                    	${list.quantity}
			                    </td>
			                    <td style="border-bottom: 1px solid #ccc">
			                    	<script>
										var price = ${list.total_price/list.quantity};
										price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
										document.write(price);
									</script>
			                    </td>
			                    <td style="text-align: left;border-bottom: 1px solid #ccc">
			                    	<script>
										var price = ${list.total_price - (list.total_price*list.coupon/100)};
										price = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
										document.write(price);
									</script> 
			                    </td>
			                    <td style="display: none">
			                    	${list.total_price - (list.total_price*list.coupon/100)}
			                    </td>
			                </tr>
		                </c:forEach>
		          	</table>
	                <p style="margin-top:10px;font-weight: bold;text-align: right">
	                	Tổng giá trị đơn hàng:
	                	<script type="text/javascript">
				   			var table = document.getElementById("tables"), sumVal = 0;
				        
				        	for(var i = 0; i < table.rows.length; i++)
					        {
					            sumVal = sumVal + parseFloat(table.rows[i].cells[4].innerHTML);
					            console.log(table.rows[i].cells[4].innerHTML);
					        }
				        	sumVal = Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(sumVal);
							document.write(sumVal);
						</script>
	                </p>
	                <table>
	                	<tr>
	                		<td colspan="2" style="margin-right:350px;">
	                			<h3>Người mua hàng</h3>
	                			<p>(Ký,ghi rõ họ tên)</p>
	                		</td>
	                		<td colspan="2"style="float: right;">
	                			<h3>Người bán hàng</h3>
	                			<p>(Ký,ghi rõ họ tên)</p>
	                		</td>
	                	</tr>
	                </table>
	        	</div>
	        </div>
	    </div>
	</div>
	
	<script>
	    function exportHTML(){
	       var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
	            "xmlns:w='urn:schemas-microsoft-com:office:word' "+
	            "xmlns='http://www.w3.org/TR/REC-html40'>"+
	            "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
	       var footer = "</body></html>";
	       var sourceHTML = header+document.getElementById("source-html").innerHTML+footer;
	       
	       var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
	       var fileDownload = document.createElement("a");
	       document.body.appendChild(fileDownload);
	       fileDownload.href = source;
	       fileDownload.download = 'hoadon#${orders_id}.doc';
	       fileDownload.click();
	       document.body.removeChild(fileDownload);
	    }
	</script>
</body>
</html>