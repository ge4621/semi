<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <% 
   String contextPath = request.getContextPath(); // /jsp

   Member loginMember = (Member)session.getAttribute("loginMember");
   // 로그인 시도 전 menubar.jsp 로딩시 : null인 상태
   // 로그인 성공 후 menubar.jsp 로딩시 : 로그인 성공한 회원의 정보가 담겨있는 Member 객체
   
   String alertMsg = (String)session.getAttribute("alertMsg");
   // 서비스 요청 전 menubar.jsp 로딩시 : null인 상태
   // 서비스 성공 후 menubar.jsp 로딩시 : alert로 띄워줄 메시지 문구
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        
         #header{ /* 헤더 전체 영역 관련 */
            /* border: 2px solid blue; */
            /* background-color: aliceblue; */
            width: 1400px;
            height: 168px;
            margin: auto;
            box-sizing: border-box;
        }

        #navigator{ /*네비바 영역 관련*/
            /* border: 2px solid yellowgreen; */
            width: 1400px;
            height: 72px;
            margin: auto;
            box-sizing: border-box;
            background-color: rgb(236, 236, 236);
            font-family: 'KIMM_Bold';
        }

        #header>div{ /*네비바 제외한 헤더 부분 영역 나누기*/
            /* border: 1px solid yellow; */
            height: 100%;
            float: left;
            box-sizing: border-box;
        }
        
        /*--------------header1-------------*/
        #header_1{
            width: 30%;
            position: relative;
        }

        #header_1 img{
            /* border: 2px solid lightgreen; */
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            width: 85%;
        }

        /*--------------header2-------------*/
        #header_2{
            width: 35%;
            position: relative;
        }

        #search_form {
            width: 80%; height: 25%;
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            /* border: 2px solid orangered; */
        }
        
        #search_form div{
           display: inline;
        }

        #search_btn{margin-left: 5px;}

        select{ /*select박스 스타일*/
            border-color: lightgray;
            border-width: 2px;
            font-size: 14px;
            border-radius: 7px;
        }

        /*--------------header3-------------*/
        #header_3{
            width: 15%;
            position: relative;
        }
        #weather{
            /* border: 3px solid purple; */
            width: 160px;
            height: 70px;
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
        }

        #weather>a{text-decoration: none;}

        /*--------------header4-------------*/
        #header_4{
            width: 20%;
            position: relative;
        }
        
        /*-----------로그인 전-----------*/
        #before_login a{
            text-decoration: none;
            font-size: large;
            font-weight: 500;
            border:none;
        }

        #before_login{
            position: absolute;
            top: 65px;
            left: 100px;
        }

        #before_login a:hover{
            color: rgb(74, 182, 254);
            font-size: larger;
        }


        /*-----------로그인 후-----------*/
        
        #user_info{
            /* border: 2px solid lightskyblue; */
            width: 200px;
            height: 80px;
            
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left:15px;

        }
        #user_info img{ /*프사*/
            /* border: 1px solid; */
            width: 65px;
            margin-top: 5px;
        }
        #user_info b{ /*닉네임*/
            /* border: 1px solid; */
            font-size: 17px;
            vertical-align: sub;
        }

        #usermenu{ /*햄버거버튼 속성*/
            background-color: transparent; /* 뒷 배경을 부모와 같게 맞춰줌 */
            border:none;
            float: right;
            margin-top: 55px;

        }

        #usermenu>img{ /*햄버거사진*/
            /* border: 1px solid; */
            width: 45px;
        }

        #usermenu_page{ /*팝업창 틀*/
            width: 400px; 
            height: 500px;
            position: absolute;
            display: none;
            border: 0.1px solid #f1f2f3;
            border-radius: 10px;
            background-color: #f1f2f3;
            z-index: 9999;
            right: 2px;
            top: 120px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.7);
            
        }

        #closeUserMenu{ /*usermenu 닫기 x 버튼*/
            float: right;
            border: none;
            background-color: transparent;
            font-weight: 700;
            font-size: x-large;
            margin: 10px;
            z-index: 99999;
        }
        #closeUserMenu:hover{ /*usermenu 닫기 x 버튼 hover*/
            color: #686868;
        }

        #overlay { /*뒷 배경 어둡게*/
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9998;
        }
        
        /* ==================== usermenu 안 세부 화면들 ==================== */

        /* usermenu_page_content 공통*/
        .usermenu_page{
            position: relative;
            width: 100%;
            height: 100%;
        }
        .usermenu_page table{
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===============*/
            width: 250px;
        }
        .usermenu_page h3{ /* 메뉴 제목 */
            text-align: center;
            margin-top: 22%;
            font-weight: 700;
        }
        .form-control{
            /* input 공통 부트스트랩 */
            font-size: 14px;
        }

        /* 로그인 usermenu_page_login */
        #usermenu_page_login table{
            margin-top: 170px;
            height: 200px;
        }
        #usermenu_page_login a{ /* 로그인 버튼 아래 ID찾기, 비번찾기, 회원가입*/
            text-decoration: none;
            color: rgb(96, 96, 96);
            font-weight: 700;
        }
        #usermenu_page_login a:hover{ /* 로그인 버튼 아래 ID찾기, 비번찾기, 회원가입*/
            text-decoration: none;
            color: #007fff;
            font-weight: 700;
        }

        /* 로그인 성공 후 usermenu_page_login_success */
        #usermenu_page_login_success table{
            margin-top: 250px;
            /* width: 250px; */
            height: 150px;
        }
        #usermenu_page_login_success_userinfo{ /*프사, 이름*/
            /*===정중앙 스타일===*/
            margin: auto;
            position: absolute;
            top: 0;
            bottom:0;
            left: 0;
            right: 0;
            /*===================*/
            
            text-align: center;
            margin-top: 20%;
            font-weight: 700;
        }

        /* 찾기 usermenu_page_find */
        .find_id_or_pwd{ 
            /* border: 3px solid magenta; */
            margin: auto;
            width: 75%;
            height: 300px;
            margin-top: 30px;
        }
        .tab-content{ /* 탭 내용*/
            background-color: white;
            width: 100%;
            height: 250px;
        }
        #find_id_or_pwd_pills{ /*탭버튼 뒷배경*/
            background-color: rgb(174, 174, 174);
            border-radius: 5px;
        }
        #home table{ /* ID 찾기 테이블 */
            height: 120px;
            margin-top: 230px;
        }
        #hometable2{
            text-align: center;
        }
        #hometable2 button{
            width: 115px;
            font-size: 14px;
            margin: 3px;
        }
        #hometable2 button:hover{
            background-color: #007fff;
            border: 1px solid #007fff;
        }

        #menu1 table{ /* 비밀번호 찾기 테이블 */
            height: 190px;
            margin-top: 220px;
        }
        
        /* 비밀번호 변경 usermenu_page_change_pwd */
        #usermenu_page_change_pwd table{
            height: 200px;
            margin-top: 170px;
        }
        #usermenu_page_change_pwd input{
            font-size: 11px;
        }

        /* 비밀번호 변경 성공, ID/비번 찾기 실패*/
        .usermenu_page_plain table{
            width: 270px;
            text-align: center;
            font-weight: 700;
        }
        
        
        
        /*--------------navigator-------------*/

        #navigator li{
            /* border: 1px solid; */
            margin-top: 1px;
        }

        #navigator a{ /*네비바 버튼 요소 관련*/
            text-align: center;
            width: 140px;
            margin: 15px;
            margin-left: 30px;
            margin-right: 30px;
            border-radius: 12px;
        }        

        .btn-light{ /*홈, 공지사항 버튼*/
            background-color: #fffefe;
            border: 1px #ededed;
        }
        
        
        
       
    </style>

</head>
<body>


	<% if(alertMsg != null){ %>
		<script>
			alert("<%= alertMsg%>");
		</script>
		<% session.removeAttribute("alertMsg"); %>
	<% } %>

    <div id="header">
        
        <div id="header_1">
            <!-- 로고 -->
            <a href="#"><img src="resources/images/logo_blue_subwhere.png" alt="logo"></a>
        </div>

        <div id="header_2">
            <!-- 역 검색창 -->

            
            <form id="search_form">
                <div id="search_station">
                    
                    <select onchange="categoryChange(this)" style="height: 36px; width: 170px;">
                        <option>호선 번호 선택</option>
                        <option value="line1">1호선</option>
                        <option value="line2">2호선</option>
                        <option value="line3">3호선</option>
                        <option value="line4">4호선</option>
                        <option value="line5">5호선</option>
                        <option value="line6">6호선</option>
                        <option value="line7">7호선</option>
                        <option value="line8">8호선</option>
                        <option value="line9">9호선</option>
    
                    </select>
                    
                    <select id="station" style="height: 36px; width: 150px;">
                    <option>역 명 선택</option>
                    </select>

                    <script>
                    function categoryChange(e) {
                        var station1 = ["서울역", "용산", "시청", "종로 3가", "동대문", "동묘앞", "청량리", "회기", "영등포", "구로", "인천", "부천"];
                        var station2 = ["홍대입구", "합정", "신림", "서울대입구", "사당", "강남", "성수", "왕십리", "잠실"];
                        var station3 = ["안국", "경복궁", "홍제", "종로3가", "을지로3가", "압구정", "신사", "수서"];
                        var station4 = ["삼각지", "명동", "동대문역사공원", "총신대입구(이수)", "혜화", "미아"];
                        var station5 = ["광화문", "여의도", "공덕", "청구", "군자", "천호", "굽은다리"];
                        var station6 = ["응암", "불광", "망원", "이태원", "안암"];
                        var station7 = ["노원", "건대입구", "청담", "논현", "고속터미널", "대림"];
                        var station8 = ["잠실", "천호", "암사", "가락시장"];
                        var station9 = ["등촌", ,"선유도", "흑석", "종합운동장", "석촌", "올림픽공원"];
                        var target = document.getElementById("station");
                    
                        if(e.value == "line1") var d = station1;
                        else if(e.value == "line2") var d = station2;
                        else if(e.value == "line3") var d = station3;
                        else if(e.value == "line4") var d = station4;
                        else if(e.value == "line5") var d = station5;
                        else if(e.value == "line6") var d = station6;
                        else if(e.value == "line7") var d = station7;
                        else if(e.value == "line8") var d = station8;
                        else if(e.value == "line9") var d = station9;
                    
                        target.options.length = 0;
                    
                        for (x in d) {
                            var opt = document.createElement("option");
                            opt.value = d[x];
                            opt.innerHTML = d[x];
                            target.appendChild(opt);
                        }
                    }
                    </script>

                    <!-- 검색버튼 -->
                    <div id="search_btn">
                        <input type="submit" value="검색" class="btn btn-primary" style="border: 1px;">
                    </div>
                   
            
                </div>
            
            </form>
            
            
        </div>
        <div id="header_3">
            <div id="weather">
                <!-- Weather widget by https://meteodays.com -->
                <a id="ms-informer-link-1c0f2690c0b614035a8e37b7b9f11ada" class="ms-informer-link" href="https://meteodays.com/ko/weather/overview/seoul">서울날씨</a>
                <script class="ms-informer-script" src="https://meteodays.com/ko/informer/script/1c0f2690c0b614035a8e37b7b9f11ada"></script>
                <!-- End -->
            </div>
        </div>

        <div id="header_4">
        
           <% if(loginMember == null){ %>
        
               <!-- case1. 로그인 전 : 로그인 -->
               <div id="before_login">
                   <a href="#" onclick="openUserMenu()">Login</a>
               </div>
   
               <div id="overlay"></div>
               
         <%}else { %>

            <!-- case2. 로그인 후 : 프사+닉네임 -->
               <div id="after_login">
   
                   <div id="user_info">
                       <img src="resources/images/profile_img_nocamera.png" alt="profile">
                       <b><%= loginMember.getNickname()%></b>
                   </div>
                   
                   <button id="usermenu" onclick="openUserMenu()">
                       <img src="resources/images/hamburger_btn.png">
                   </button>
               
               </div>
         <%} %>

            <div id="overlay"></div>
            
            <div id="usermenu_page" class="usermenu_page">

                <!-- 팝업창 닫힘 버튼 -->
                <button id="closeUserMenu">×</button>


            <% if(loginMember == null){ %>
                <!-- 로그인 -->
                <div id="usermenu_page_login">

                    <form action="<%= contextPath %>/login.me" method="post">

                        <h3>로그인</h3>

                        <table>
                        
                            <tr>
                                <td><input type="text" name="memberId" class="form-control" placeholder="아이디"></td>
                            </tr>
                            <tr>
                                <td><input type="password" name="memberPwd" class="form-control" placeholder="비밀번호"></td>
                            </tr>
                            <tr>
                                <td><button class="btn btn-primary btn-block" type="submit">로그인</button></td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="#">ID 찾기 </a> |
                                    <a href="#">비밀번호 찾기 </a> |
                                    <a href="#">회원가입</a>
                                </td>
                            </tr>
                            
                        </table>               
    
                    </form>
                </div>
            <%}else { %>
            
                <!-- 로그인 성공-->
                <div id="usermenu_page_login_success" class="usermenu_page_content">
                    
                    <div id="usermenu_page_login_success_userinfo" style="width: 100px; height: 100px;">
                        <img src="resources/images/profile_img_nocamera.png" alt="profile" style="width: 100px; height: 100px;">
                        <p><b align="center">'<%=loginMember.getNickname() %>'님</b></p>
                    </div>
                    
                    <table>
                    
                        <tr>
                            <td><input type="button" class="btn btn-primary btn-block" value="마이페이지" onclick = "location.href='<%=contextPath%>/mypageform.me'"></td>
                        </tr>
                        <tr>
                            <td><input type="button" class="btn btn-secondary btn-block" value="회원정보 변경" onclick ="location.href='<%=contextPath%>/mypageform.me'"></td>
                        </tr>
                        <tr>
                            <td><input type="button" class="btn btn-secondary btn-block" value="로그아웃" onclick = "location.href = '<%=contextPath%>/mylogout.me' "></td>
                        </tr>
                        
                    </table>

                </div>
                <%} %> 

                <!-- ID / 비밀번호 찾기 -->
                <!-- <div id="usermenu_page_find">

                    <form action="#">

                        <h3>ID / 비밀번호 찾기</h3>

                        <div class="find_id_or_pwd">

                            <ul class="nav nav-pills nav-justified" role="tablist" id="find_id_or_pwd_pills">

                                <li class="nav-item">
                                    <a class="nav-link active btn btn-secondary" data-toggle="pill" href="#home">ID 찾기</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-secondary" data-toggle="pill" href="#menu1">비밀번호 찾기</a>
                                </li>
                                
                            </ul>

                            <div class="tab-content">

                                <div id="home" class="container tab-pane active"><br>

                                    

                                    <table id="hometable1">
                                        
                                        <form action="">
                                            <tr>
                                                <td>
                                                    <b>가입한 이메일로 찾기</b>
                                                    <input type="text" class="form-control">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><button class="btn btn-primary btn-block">ID 찾기</button></td>
                                            </tr>
                                        </form>
                                        

                                    </table>


                                    

                                    <table id="hometable2" style="margin-top: 270px;">

                                        <tr>
                                            <p style="font-size: 12px; text-align: center; margin-top: 20px;">입력하신 정보와 일치하는 계정을 발견했습니다.</p>
                                            <th>
                                                <input type="radio"> wow59*** 
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>
                                                <button class="btn btn-secondary">비밀번호 찾기</button>
                                                <button class="btn btn-secondary">로그인</button>
                                            </th>
                                            
                                        </tr>

                                    </table>
                                        
                                        
                                </div>


                                
                                
                                <div id="menu1" class="container tab-pane fade"><br>

                                    <form action="">
                                        <table>
                                            <tr>
                                                <td><input type="text" class="form-control" placeholder="이름"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control" placeholder="이메일"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control" placeholder="휴대폰 번호"></td>
                                            </tr>
                                            <tr>
                                                <td style="font-size: x-small;">이름, 이메일, 휴대폰 모두 일치하셔야 합니다.</td>
                                            </tr>
                                            <tr>
                                                <td><button class="btn btn-primary btn-block">비밀번호 찾기</button></td>
                                            </tr>
    
                                        </table>
                                    </form>

                                </div>
                                
                            </div>

                        </div>
    
                    </form>

                </div> -->
                
                <!-- 비밀번호 변경 -->
                <!-- <div id="usermenu_page_change_pwd">

                    <h3>비밀번호 변경</h3>
                    
                        <form action="#">

                            <table>
                                <tr>
                                    <td>
                                        <b>새로운 비밀번호</b>
                                        <input type="text" class="form-control" placeholder="영문 대소문자, 숫자, 특수문자 조합 8~15자">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>새로운 비밀번호 확인</b>
                                        <input type="text" class="form-control" placeholder="한번 더 입력해주세요">
                                    </td>
                                </tr>
                                <tr>
                                    <td><button class="btn btn-primary btn-block">변경하기</button></td>
                                </tr>
    
                            </table>
                        </form>
                        
                    
                </div> -->

                <!-- 비밀번호 변경 성공 -->
                <!-- <div id="usermenu_page_change_pwd_success" >

                    <div class="usermenu_page_plain">

                        <table border="1">
                            <tr>
                                <td>
                                    <p>
                                        비밀번호 변경이 성공적으로 이루어졌습니다. <br>
                                        다시 로그인 해주세요!
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" class="btn btn-primary" value="확인" href="로그인페이지로 이동">
                                </td>
                            </tr>
                        </table>
                        
                        
                    </div>
                    
                </div> -->

                <!-- ID / 비밀번호 찾기 실패 -->
                <!-- <div id="usermenu_page_find_id_or_pwd_fail">
                    
                    <div class="usermenu_page_plain">

                        <table border="1">
                            <tr>
                                <td>
                                    <p>
                                        입력하신 정보와 일치하는 계정이 없습니다. <br>
                                        다시 시도해주세요.
                                    </p>
                                    <p>
                                        회원가입을 원하시나요?
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" class="btn btn-primary" value="확인" href="회원가입페이지로 이동">
                                </td>
                            </tr>
                        </table>

                        
                        
                    </div>
                    
                </div> -->


                
            </div>
                

            <!-- 팝업창 함수 -->
            <script>

                function openUserMenu() {
                    var overlay = document.getElementById('overlay');
                    var userMenuPage = document.getElementById('usermenu_page');
                    var closeButton = document.getElementById('closeUserMenu');

                    // 창 띄우기
                    if (userMenuPage.style.display === 'block') {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    } else {
                        userMenuPage.style.display = 'block';
                        overlay.style.display = 'block';
                    }

                    // X누르면 창 닫힘
                    closeButton.addEventListener('click', function() {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    });

                    // 배경 누르면 창 닫힘
                    overlay.addEventListener('click', function() {
                        userMenuPage.style.display = 'none';
                        overlay.style.display = 'none';
                    });
                    
                }

                
                
            </script>

        </div>


    </div>
    <div id="navigator">
        <!-- navi -->
        <ul class="nav nav-pills justify-content-center ">
            <li class="nav-item">
                <a class="btn btn-light" href="#">홈</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary" href="#">여행지 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary" href="#">여행 코스 추천</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-primary" href="#">여행 후기</a>
            </li>
            <li class="nav-item">
                  <a class="btn btn-light" href="#">공지사항</a>
            </li>
        </ul>
    </div>
    
    
    
    
</body>

</html>