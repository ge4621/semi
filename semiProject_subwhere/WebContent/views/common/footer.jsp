<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <style>
        /* div{box-sizing: border-box; border: 1px solid red;} */
        #footer{width: 1400px; height: 150px; margin: auto;} 

        
        /*-------------------------------------*/
        #footer>div{
            width: 100%;
            background-color: rgb(247, 247, 247);
        }
        #footer_1{height: 15%;}
        #footer_2{height: 35%;}
        #footer_3{height: 20%;}
        #footer_4{height: 30%;}
        
        /* footer1 */
        #footer_1>a{
            text-decoration: none;
            color: rgb(50, 50, 50);
            font-weight: 540;
            margin: 15px;
            vertical-align: middle;
        }

        /* footer2 */
        #footer_2 img{
            /* border: 1px solid green; */
            height: 100%;
        }

        /* footer3 */
        #site{
            list-style-type: none;
            padding: 0;
            margin: 0;
            height: 100%;
        }

        #site>li{
            float: right;
            /* border: 3px solid yellow; */
            /* width: 15%; */
            height: 100%;
            text-align: center;
            margin-right: 10px;
        }

        /* footer4 */
        #footer_4>p{
            width: 100%;
            /* border: 1px solid blue; */
            box-sizing: border-box;
            margin: 0;
            font-size: 12px;
            color: rgb(58, 58, 58);
        }
        #address{height: 60%; padding: 5px 15px;}
        #copyright{height: 40%; text-align: center;}

        
    </style>
   
</head>
<body>
    <div id="footer">
        <div id="footer_1">
            <a href="#">이용약관</a>  
            <a href="#">개인정보취급방침</a>  
            
        </div>
        <div id="footer_2">
           <a href="#"><img src="resources/images/logo_blue_subwhere.png" id="official-logo"></a>
        </div>
        <div id="footer_3">
            <ul id="site">
                <li><a href="https://www.mcst.go.kr/kor/main.jsp"><img src="resources/images/site_foot_mg.png"></a></li>
                <li><a href="https://knto.or.kr/index"><img src="resources/images/site_foot_gg.png"></a></li>
                <li><a href="http://www.wa.or.kr/index.asp"><img src="resources/images/site_foot_wa.png"></a></li>
                <li><a href="https://api.visitkorea.or.kr/#/"><img src="resources/images/site_foot_api.png"></a></li>
            </ul>
        </div>
        <div id="footer_4">
            <p id="address">
                강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F <br>
            </p>
            <p id="copyright">
                Copyright © 2023 Team 가2드 of H Class Information Educational Institute All Right Reserved
            </p>
        </div>
    </div>
    
</body>
</html>