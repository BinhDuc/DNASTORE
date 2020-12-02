<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<!-- Favicon -->
    	<link rel="shortcut icon" href="./images/240px-DNA_logo_2015.jpg" type="image/x-icon">
    <!-- Box icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
   
    <!-- Custom StyleSheet -->
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
    integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <!--  owlcarosel -->
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="./assets/owlcarousel/assets/owl.theme.default.min.css">
    <title>DNASTORE</title>

    <!-- owcarousel -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <style>
      /* .container{
         width: 200px;
         margin: 50px auto;
         font-family: sans-serif;
      } */

      /* label{
         display: block;
         max-width: 200px;
         margin: 0 auto 15px;
         text-align: center;
         word-wrap: break-word;
         color: #1a4756;
      } */

      .hidden, #uploadImg:not(.hidden) + label{
         display: none;
      }

      #file{
         display: none;
         /* margin: 0 auto; */

      }

      #upload{
         display: block;
         padding: 10px 25px;
         border: 0;
         /* margin: 0 auto; */
         font-size: 15px;
         letter-spacing: 0.05em;
         cursor: pointer;
         background: #216e69;
         color: #fff;
         outline: none;
         transition: .3s ease-in-out;}
      #upload:hover, #upload:focus{
            background: #1AA39A;
      }
      #upload:active{
            background: #13D4C8;
            transition: .1s ease-in-out;
      }
      
/* 
      img{
         display: block;
         margin: 0 auto 15px;
      } */
    </style>
   </head>
   <body>
    
      <jsp:include page="_header.jsp"></jsp:include>
       
      <h3>Create Product</h3>
       
      <p style="color: red;">${errorString}</p>
      <br/>
       
      <form method="POST" action="${pageContext.request.contextPath}/createuser" enctype="multipart/form-data">
         
         <label>User_name</label>
         <input type="text" name="username" style="width:50%;padding:10px;margin:10px"/>
         <br/>
          <label>Password</label>
         <input type="text" name="password" style="width:50%;padding:10px;margin:20px"/>
         <br/>
         <label>Full Name</label>
         <input type="text" name="fullname" style="width:50%;padding:10px;margin:10px"/>
         <br/>
         <label>gender</label>
         <input type="text" name="gender" style="width:50%;padding:10px;margin:10px"/>
         <br/>
         <label>birthday</label>
         <input type="text" name="birthday" style="width:50%;padding:10px;margin:10px"/>
         <br/>
         <label>phone number</label>
         <input type="text" name="number" style="width:50%;padding:10px;margin:10px"/>
         <br/>
         <label>Image</label>
         
         
         <div>
	    	<input type='file' id="inputFile" name="image" />
		    <div style="width: 200px;height: 200px;overflow: hidden;background: #f3f3f3;display: flex;justify-content: center;align-items: center;">
		    	<img id="image_upload_preview" src="http://placehold.it/100x100" alt="your image" /> 
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
		</script>
         <br/>
         <label>Category</label>
         <select name="roleid">
         	<c:forEach items="${roleList}" var="roleList" >
         		<option value="${roleList.roleid}">${roleList.rolename}</option>
         	</c:forEach>
		</select>
         
         <br/>
         
         <input type="submit" value="Submit" style="width:20%;padding:10px;margin:20px" />
         <input type="reset" value="Clear" style="width:20%;padding:10px;margin:20px"/>
      </form>
      
       
      <jsp:include page="_footer.jsp"></jsp:include>
       
   </body>
</html>