<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./fontawesome-free-5.15.1-web/css/all.min.css">
    <script type="text/javascript">
    var time = 5; //How long (in seconds) to countdown
    var page = "${pageContext.request.contextPath}/"; //The page to redirect to
    function countDown(){
        time--;
        gett("time").innerHTML = time;
        if(time == 0){
            window.location = page;
        }
    }
    function gett(id){
        if(document.getElementById) return document.getElementById(id);
        if(document.all) return document.all.id;
        if(document.layers) return document.layers.id;
        if(window.opera) return window.opera.id;
    }
    function init(){
        if(gett('time')){
            setInterval(countDown, 1000);
            gett("time").innerHTML = time;
        }
        else{
            setTimeout(init, 50);
        }
    }
    document.onload = init();
    </script>
    <title>Document</title>
    <style>
        *{
            font-family: sans-serif;
        }
        .checkmark {
            width: 200px;
            margin: 0 auto;
            padding-top: 40px;
        }

        .path {
            stroke-dasharray: 1000;
            stroke-dashoffset: 0;
            animation: dash 2s ease-in-out;
            -webkit-animation: dash 2s ease-in-out;
        }

        .spin {
            animation: spin 2s;
            -webkit-animation: spin 2s;
            transform-origin: 50% 50%;
            -webkit-transform-origin: 50% 50%;
        }

        p {
            font-family: sans-serif;
            /* color: #00ff04; */
            font-size: 30px;
            font-weight: bold;
            margin: 20px auto;
            text-align: center;
            animation: text .5s linear .4s;
            -webkit-animation: text .4s linear .3s;
        }

        @-webkit-keyframes dash {
            0% {
                stroke-dashoffset: 1000;
            }
            100% {
                stroke-dashoffset: 0;
            }
        }

        @keyframes dash {
            0% {
                stroke-dashoffset: 1000;
            }
            100% {
                stroke-dashoffset: 0;
            }
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @-webkit-keyframes text {
            0% {
                opacity: 0; }
            100% {
                opacity: 1;
            }
        }
        .container{
            border: 1px solid #ccc;
            padding: 20px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, .5);
            border-radius: 15px;

        }
        body{
            padding:200px;
        }
        @media (max-width: 1439px) {
            body{
                padding:100px;
            }
            .container{
                border: none;
                padding: 20px;
            }
            p{
                font-size: 20px;
            }
            h1{
                font-size: 25px;
            }
        }
        @media (max-width: 1023px) {
            body{
                padding:0px;
            }
            .container{
                border: none;
                padding: 20px;
            }
            p{
                font-size: 20px;
            }
            h1{
                font-size: 25px;
            }
        }
        @media (max-width: 424px){
            .container{
                border: none;
                padding: 20px;
                box-shadow: none;
            }
        }
    </style>
</head>
<body>
	<div class="container">
        <div class="checkmark">
            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 161.2 161.2" enable-background="new 0 0 161.2 161.2" xml:space="preserve">
            <path class="path" fill="none" stroke="#00ff04" stroke-miterlimit="10" d="M425.9,52.1L425.9,52.1c-2.2-2.6-6-2.6-8.3-0.1l-42.7,46.2l-14.3-16.4
                c-2.3-2.7-6.2-2.7-8.6-0.1c-1.9,2.1-2,5.6-0.1,7.7l17.6,20.3c0.2,0.3,0.4,0.6,0.6,0.9c1.8,2,4.4,2.5,6.6,1.4c0.7-0.3,1.4-0.8,2-1.5
                c0.3-0.3,0.5-0.6,0.7-0.9l46.3-50.1C427.7,57.5,427.7,54.2,425.9,52.1z"/>
            <circle class="path" fill="none" stroke="#00ff04" stroke-width="4" stroke-miterlimit="10" cx="80.6" cy="80.6" r="62.1"/>
            <polyline class="path" fill="none" stroke="#00ff04" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="113,52.8 
                74.1,108.4 48.2,86.4 "/>

            <circle class="spin" fill="none" stroke="#00ff04" stroke-width="4" stroke-miterlimit="10" stroke-dasharray="12.2175,12.2175" cx="80.6" cy="80.6" r="73.9"/>

            </svg>   
        </div>
        <p>Đặt hàng thành công</p>
        <div style="display: flex;justify-content: center;flex-wrap: wrap;">
            <h1 style="flex: 100%;text-align: center;">Trở lại trang chủ sau <span id="time"></span> giây(s)!</h1>
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none;color: #696969;">Quay lại trang chủ <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
</body>
</html>