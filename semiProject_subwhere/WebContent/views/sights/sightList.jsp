<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 코스 목록</title>

    <style>
        /* wrap은 가져가지 않을 거임  */
        .wrap{ 
            /* border: 5px solid black;  */
            width: 1200px;
            height: 750px ;
            margin: auto;
            margin-top: 30px;

        }

        .wrap>#menu-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }

        .wrap>#m-body{
            /* border: 1px solid red; */
            width: 100%;
            height: 5%;
            box-sizing: border-box;
           
        }

        .wrap>#content-body{
            /* border: 1px solid blue; */

            width: 100%;
            height: 75%;
            box-sizing: border-box;
        }

        .wrap>#down-body{
            /* border: 1px solid green; */
            width: 100%;
            height: 10%;
            box-sizing: border-box;
        }


        #menu-body>div{
            /* border: 1px dashed black; */
            height: 100%;
            width: 10%;
            float: left;
            box-sizing: border-box;
            
        }

        #m-body>div{
            height: 100%;
            float: left;
            line-height: 35px;
        }
        
        #m-body>#m1{
            width: 30%;
            box-sizing: border-box;
        }

        #m-body>#m2{
            width: 30%;
            box-sizing: border-box;
        }

        #m-body>#m3{
            width: 30%;
            box-sizing: border-box;
            text-align: right;
            margin-left: 70px;
            
        }


        
        



        #menu-body button{
            color: white;
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border-radius: 20px 20px 0 0;
            border: none;
        }

       #menuAll{
        background-color: black;
       }


       #menu1{
        background-color: #0052A4;
       }

       #menu2{
        background-color: #00A84D;
       }

       #menu3{
        background-color: #EF7C1C;
       }

       #menu4{
        background-color: #00A5DE;
       }

       #menu5{
        background-color: #996CAC;
       }

       #menu6{
        background-color: #CD7C2F;
       }

       #menu7{
        background-color: #747F00;
       }

       #menu8{
        background-color: #E6186C;
       }

       #menu9{
        background-color: #BB8336;
       }

       #menu-body button:hover{
        background-color: gray;
        cursor: pointer;
       }





        #m1{
            margin-left: 10px;
        }

        #m3>a{
            text-decoration: none;
            color: black;
        }


        /* content */

        #content-body>table{
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            /* border: 1px solid black; */
        }

       
       
    /* content안에 이미지에 대한거라서 나중에 삭제하기 */
    
    
    
    
    /* content부분 테이블로 만든 스타일 */
    
    table{
        width: 100%;
        /* border: 1px solid red; */
    }
    
    .img{
        width: 70%;
        height: 95px;
        margin-left: 30px;
        box-sizing: border-box;
        border-radius: 20px;
    }
    


    tr>td>div{
        width: 100%;
        /* border: 1px dashed green; */
        box-sizing: border-box;
    }
    
    .h3-class{
        height: 40%;
        box-sizing: border-box;
    }
   
    .p-class{
        height: 60%;
        box-sizing: border-box;
    }

    .h3-class>h3{
        width: 100%;
        height: 45px;
        line-height: 50px;
        padding-left: 10px;
        /* border: 1px solid red; */
        margin: 0;
        color: gray;
        
       
    }

    .p-class>p{
        width: 100%;
        height: 60px;
        margin: 0;
        line-height: 50px;
        padding-left: 10px;
        /* border: 1px solid black; */
        font-size: 13px;
        color: gray;
      
 
    }
    
    tr{
        border-top: 10px solid white;
        border-bottom: 10px solid white;
        margin-bottom: 10px;
        background-color: #f7f7f7;
        
     
    }

    tr:hover{
        background-color: lightgray;
        cursor: pointer;
    }



        /* down-body */

        #down-body{
            text-align: right;
           
           
        }

        #down-body>a{
            margin-right: 20px;
       
        }

        #btn>button{
            margin: 2px;
            border: 0;
            inline-size: 40px;
            block-size: 45px;
        }

        /*paging*/
        #paging {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        #paging button {
            background-color: #f7f7f7; 
            color: #555;
            border: none;
            padding: 8px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s, color 0.3s;
        }

        #paging button:hover {
            background-color: #dcdcdc; 
        }

        #paging button:focus {
            outline: none;
        }

        #paging button.active {
            background-color: gray;
            color: white;
        }

        
       

        /* 버튼에 onclick달아서 배경색 변경하기 호버했을때도 색이 회색으로 변하게 하기 */


    </style>

<!-- 부트 스트랩 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


<!-- 이게 jQuery 컴파일 한 거인듯..? -->
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>




</head>
<body>
    
   <%@ include file="/views/common/header.jsp" %>
   

    
    <div class="wrap">

        <div id="menu-body">
            <!-- 여기는 여행지 담당 연우님과 겹치는 부분이라 일단 임시로 만들어보기 -->
            
            <div>
                <button id="menuAll" >전체</button>
            </div>
            
            <div>
                <button id="menu1" >1호선</button>
            </div>

            <div >
                <button id="menu2">2호선</button>
            </div>

            <div >
                <button id="menu3">3호선</button>
            </div>

            <div >
                <button id="menu4">4호선</button>
            </div>

            <div >
                <button id="menu5">5호선</button>
            </div>

            <div >
                <button id="menu6">6호선</button>
            </div>

            <div >
                <button id="menu7">7호선</button>
            </div>

            <div >
                <button id="menu8" >8호선</button>
            </div>

            <div >
                <button id="menu9">9호선</button>
            </div>

        </div>
    
        <div id="m-body">
            <div id="m1" style="color: gray;">
             '<span><b>##</b></span>' 에 대한 검색 결과 

            </div>
            <div id="m2"></div>

            <div id="m3" >
                <a href="#" style="color: gray;"><b>최신순</b></a> | <a href="#" style="color: gray;"><b>인기순</b></a>
            </div>
        </div>
    
        <!-- 여행코스 목록은 연우님과 상의해서 정하기 -->
        <!-- 5개씩 하기로 함 -->
        <div id="content-body" >
            <!-- 눌루하면 색 변하게 하기 -->
 
            <!-- 
                .wrap>#content-body>div을 click했을때 이런식으로 
                자바에 식을 작성하면 될 듯
            -->
  

        <table>
            <tr>
                <th style="width: 30%; height: 20%;">
                  <img src="resources/images/naksan.webp" class="img">
                </th>
                
                <td>
                    <div class="h3-class">
                        <h3> <b> 낙산공원</b> </h3>
                    </div>
                    
                    <div class="p-class">
                        <p > 종로구에 위치한 낙산공원은 성곽을 따라 걸으며 산책도 하고 서울의 야경도 즐길 수 있는 일석이조의 야경 조망 명소. </p>
                    </div>
                </td>

            </tr>

            <tr>
                <th style="width: 30%; height:20%;">
                    <img src="resources/images/namsan.webp" class="img">
                </th>
                
                <td>
                    <div class="h3-class">
                        <h3> <b> 남산서울타워</b> </h3>
                    </div>
                    
                    <div class="p-class">
                        <p > 서울의 상징이자 영원한 사랑을 꿈꾸는 전세계 연인들의 로맨스 성지인 남산서울타워 </p>
                    </div>

                </td>
            </tr>

            <tr>
                <th style="width: 30%; height: 20%;">
                    <img src="resources/images/gwangjang.webp" class="img">
                </th>

                <td>
                    <div class="h3-class">
                        <h3> <b> 광장시장</b> </h3>
                    </div>
                    
                    <div class="p-class">
                        <p > 100년 동안 서울 중심에 자리한 광장시장은 서울에서 가장 활기있는 전통시장 중 하나입니다 </p>
                    </div>

                </td>
            </tr>

            <tr>
                <th style="width: 30%; height: 20%;">
                    <img src="resources/images/banpo.webp" class="img">
                </th>
                
                <td>
                    <div class="h3-class">
                        <h3> <b> 반포대교</b> </h3>
                    </div>
                    
                    <div class="p-class">
                        <p > 달빛 무지개 분수가 선사하는 낭만적인 야경 </p>
                    </div>
                </td>
            </tr>

            <tr>
                <th style="width: 30%; height: 20%;">
                    <img src="resources/images/빛초록축제.png" class="img">
                </th>

                <td>
                    <div class="h3-class">
                        <h3> <b> 서울빛초롱축제</b> </h3>
                    </div>
                    
                    <div class="p-class">
                        <p>  빛 조형물 전시와 다양한 체험 프로그램 등 화려한 볼거리를 제공합니다  </p>
                    </div>
                </td>
            </tr>


        </table>






        </div>


        
        <div id="down-body" >
            <br><br>
            <a href="#" class="btn btn-sm btn-secondary" style="block-size: 40px; inline-size: 70px; line-height: 30px;">글작성</a>
            <!-- 글 작성은 회원과 관리자일때만 보이게 하기! (자바에서)-->

        </div>

    </div>

    <div align="center" id="paging">
        <button> &lt; </button>
        <button class="active">1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>6</button>
        <button>7</button>
        <button>8</button>
        <button>9</button>
        <button>10</button>
        <button> &gt; </button>
    </div>

  <br><br>
    
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>





