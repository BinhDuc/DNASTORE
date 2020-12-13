<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./images/1234.png" type="image/x-icon">
    <title>404-PageNotFound</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg,#ee4d2d,#ee4d2d 50%,#333 50%,#333);
        }
        a{
            text-decoration: none;
            color: #f3f3f3;
            padding: 20px;
            

        }
        .box{
            position: relative;
            
        }
        .box h2{
            color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 15em;
            text-shadow: -25px 25px 40px rgba(0, 0, 0, 0.5),
            -10px 10px 0 rgba(255, 255, 255, 0.5),
            -20px 20px 0 rgba(255, 255, 255, 0.2),
            -30px 30px 0 rgba(255, 255, 255, 0.05);

        }
        .box h2 .zero{
            position: relative;
            display: inline-block;
            width: 200px;
            height: 200px;
            background: linear-gradient(to bottom, #fff,#777);
            border-radius: 50%;
            margin: 0 15px;
            box-shadow: -25px 25px 40px rgba(0, 0, 0, 0.5);
        }
        .box h2 .zero::before{
            content: '';
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
            width: 180px;
            height: 180px;
            background: linear-gradient(to top, #fff,#777);
            border-radius: 50%;
        }
        .box h2 .zero::after{
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 100px;
            height: 100px;
            background: linear-gradient(315deg,#ee4d2d,#ee4d2d 50%,#333 50%,#333);
            border-radius: 50%;
            box-shadow: inset 0 0 30px rgba(0, 0, 0, 1);
            animation: animate 5s steps(4000) infinite;
        }
        
        @keyframes animate{
            0%{
                transform: translate(-50%,-50%) rotate(0deg);
            }
            100%{
                transform: translate(-50%,-50%) rotate(360deg);
            }
        }
        @media only screen and (max-width: 424px) {
            body{
                min-height: 100vh;
                
            }
            .box h2{
                font-size: 9.6em;
            }
            .box h2 .zero{
                width: 130px;
                height: 130px;
            }
            .box h2 .zero::before{
                width: 115px;
                height: 115px;
            }
            .box h2 .zero::after{
                width: 70px;
                height: 70px;
            }
        }
    </style>
</head>
<body>
    <div class="box">
        
        <h2>4<span class="zero"></span>4</h2> 
        <div style="display: flex;justify-content: center;align-items:center;flex-wrap: wrap; position: relative;">
            <h3 style="color: #f3f3f3;width: 100%;text-align: center;">Ooops!! Có gì đó sai sai</h3>
            <a href="${pageContext.request.contextPath}/">Quay lại Trang Chủ ></a>
        </div>
    </div>
    
</body>
</html>