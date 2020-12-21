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
    <link rel="shortcut icon" href="./images/1234.png" type="image/x-icon">
    <title>DNA Dashboard</title>
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="./css/w3.css">
    <link rel="stylesheet" href="./css/Chart.min.css">
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
        <a href="${pageContext.request.contextPath}/quanly" class="w3-bar-item header"><i class="fas fa-arrow-left"></i></a>
	 	<a href="${pageContext.request.contextPath}/quanly"><span class="w3-bar-item logo" style="color: #fff;">DNASTORE</span></a>
	 	<div class="w3-bar-item clock" id="MyClockDisplay" class="clock" onload="showTime()"></div>
        <span class="w3-bar-item w3-right">${user.rolename}</span>
        <button id="btnFullscreen" class="w3-bar-item w3-right" type="button" style="border: none;
        background: none;color: #fff;cursor: pointer;"><i class="fas fa-expand"></i></button>
    </div>
<!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-main" style="margin-top:30px">
    	<header class="w3-container" style="padding-top:22px">
            <h5><b><i class="fas fa-images"></i> Carousel</b></h5>
        </header>
 <!--------------------------------- Danh sách Đơn Hàng ----------------------------------------------------------------------------->
        <div id='slideshow' class="w3-container city w3-animate-zoom" style="display:block">
		    <p style="color: red;">${errorString}</p>
		 	<div class="w3-responsive w3-container">
		 		<a href="CreateSlide" class="w3-button w3-large w3-blue w3-margin-bottom w3-hover-pink"><i class="fas fa-pen"></i> Thêm Slide</a>
			    <table class="w3-table-all w3-hoverable customers-list" id="ordertable">
			    	<thead>
				       <tr class="w3-pink">
				          <th>Background</th>
				          <th>Title</th>
				          <th>Content 1</th>
				          <th>Content 2</th>
				       </tr>
			       </thead>
		      		<c:forEach items="${slideList}" var="slideList" > 
						<tr class='clickable-row' data-href='editSlide?id=${slideList.id}' style="cursor: pointer;">
		     				<td style="height: 300px"><img alt="carousel" src="${pageContext.request.contextPath}/bgSlide?id=${slideList.id}" style="height:auto;width: auto"></td>
		     				<td><c:out value="${slideList.title}"/></td>
		     				<td><c:out value="${slideList.slideName}"/></td>
		     				<td><c:out value="${slideList.content}"/></td>          
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
 <!--------------------------------- ketthuc ----------------------------------------------------------------------------->
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
</body>
</html>