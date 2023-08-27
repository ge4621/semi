<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행지 추천</title>

    <!-- w3schools 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>


    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">


    <style>
        div * {box-sizing: border-box;}

        .all {
            margin: auto;
            width: 1200px;
            height: 1600px;
        }
        
        /* ---------------content_h----------------- */
        #content_h {
            padding-bottom: 50px;
            color: gray;
            font-weight: bolder;
        }

        /* ---------------content_b----------------- */
        #con1>#con1_head>#contentTitle {
            width: 92%;
            height: 50px;
            float: left;
            font-size: 40px;
            font-weight: bold;
            color: gray;
        }
        
        #con1>#con1_head>#contentIcon {
            width: 8%;
            height: 50px;
            float: left;
        }
        
        #con1>#con1_head>#contentIcon>#like {
            width: 50%;
            float: left;
            cursor: pointer;
        }
        #con1>#con1_head>#contentIcon>#report {
            width: 50%;
            float: left;
            cursor: pointer;
        }

        #con1>#con1_photo {
            width: 100%;
            padding: 70px 0px;
        }
        
        #con1_content>p, #con1_tip>p {
            color: gray;
            font-size: 16px;
            line-height: 30px;
            padding: 5px 10px;
        }

        #con1>#con1_content {
            width: 100%;
            height: 200px;
            background-color: rgb(235, 235, 235);
            border-radius: 10px;
            
        }

        #info1{
            color: #222;
            font-weight: 700;
            font-size: 18px;
            
        }

        #info2{
            color: gray;
            font-weight: 300;
            font-size: 18px;
            
        }

        /* ---------------content_f----------------- */
        #content_f_left {
            width: 50%;
            float: left;
        }
        #content_f_right {
            width: 50%;
            float: left;
        }
        

        /*------슬라이드쇼------*/

        
          .swiper-button-next, .swiper-button-prev {
            position: absolute;
            top: 80%;
            transform: translateY(-50%);
        }
        
       
        .swiper-button-next, .swiper-button-prev {
            width: 30px;
            height: 30px;
            font-size: 20px;
            line-height: 1;
            color: rgba(0, 0, 0, 0.5);
            /*background-color: rgba(0, 0, 0, 0.5);*/
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        
        .swiper-button-prev {
            left: 400px;
        }
        
        .swiper-button-next {
            right: 400px;
        }

        .swiper-slide img { /* 슬라이드 이미지 크기 자유롭게 변경하시면 됩니다 */
            width: 850px; 
            height: 500px; 
        }
    </style>

    </style>
</head>

<body>
<%@ include file="/views/common/header.jsp" %>

    <div class="all">
        <form action="">
            <!------------------------------content_h------------------------------->
            <div id="content_h">
                <p></p>
            </div>

            <!------------------------------content_b------------------------------->
            <div id="content_b">
        
                <div id="con1">
                    <div id="con1_head">
                        <div id="contentTitle" align="center">
                            <p>' 광장시장 '</p>
                        </div>
                        
                        <div id="contentIcon">
                            <img src="resources/images/heart1.png" id="like" onclick="likeToggle()">
                            <script>
                                var h = 1;
                                function likeToggle() {
                                    var like = document.getElementById("like");
                                    if(h % 2 == 1) {
                                        like.src="resources/images/heart2.png";
                                    }else {
                                        like.src="resources/images/heart1.png";
                                    }
                                    h++;
                                }
                            </script>
                            <img src="resources/images/report.png" id="report">
                        </div>
                    </div>
                    <br><br>
                    <!--슬라이드 swiper-->
                    <div id="con1_photo" align="center">
                        
                        <div class="swiper-container">
                            <div class="swiper-wrapper"> <!--슬라이드 이미지 원하는만큼 추가-->
                                <div class="swiper-slide"><img src="resources/images/gwangjang.webp"></div>
                                <div class="swiper-slide"><img src="resources/images/gwangjang2.webp"></div>
                                <div class="swiper-slide"><img src="resources/images/gwangjang3.webp"></div>
                                
                            </div>
                           
                            <div class="swiper-button-next">&#9658;</div>
                            <div class="swiper-button-prev">&#9668;</div>
                        </div>
                    </div>
                    <!--슬라이드 끝-->
                    <div id="con1_content">
                        <p>사장님이 친절하고 음식이 맛있고 인심이 느껴져요 정말이에요</p>
                        
                        
                    </div>
                    <br>
                    
                    <br>
                </div>
                <!--태그-->
                <div id="tag">
                    <button class="btn btn-sm btn-primary">#여행</button>
                    <button class="btn btn-sm btn-primary">#핫플</button>
                </div>
                <br>
                <!--여행지 정보-->
                <div>


                </div>
                    
                <table width="1000">
                    <tr>
                        <th id="info1">이용시간</th>
                        <td id="info2"> 09:00~21:00</td>
                    </tr>
                    <tr>
                        <th id="info1">휴무일</th>
                        <td id="info2">없음</td>
                    </tr>
                    <tr>
                        <th id="info1">운영 요일</th>
                        <td id="info2">매일</td>
                    </tr>
                    <tr>
                        <th id="info1">주소</th>
                        <td id="info2">02800 서울 성북구</td>
                    </tr>
                    <tr>
                        <th id="info1">교통 정보</th>
                        <td id="info2">4호선 한성대입구역 5번출구에서 44m</td>
                    </tr>
                </table>
                        
                       
                        
                <br>
                <br>
        
                <div id="con2">
                </div>
        
            </div>


            <!-------슬라이드 전용 swiper------>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
            <script>
                var swiper = new Swiper('.swiper-container', {
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },
                    slidesPerView: 1,  
                    spaceBetween: 10000, 
                });
            </script>



            <!------------------------------content_f------------------------------->
            
            <div id="content_f_left" align="left">
                <button type="reset" id="writeBtn" class="btn btn-secondary">수정</button>
                <button type="button" id="writeBtn" class="btn btn-secondary">삭제</button>
            </div>
            <div id="content_f_right" align="right">
                <button type="button" id="writeBtn" class="btn btn-secondary">목록</button>
                <button type="submit" id="writeBtn" class="btn btn-secondary">글쓰기</button>
            </div>
            <br><br><br><br>
            <hr>
            <br>

        </form>

        <!------------------------------댓글------------------------------->
        <div class="card-footer">
            <form onsubmit="addComment(event)">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="댓글을 입력하세요" required>
              </div>
              <button type="submit" class="btn btn-primary">작성</button>
            </form>
            <div class="comments mt-3">
            </div>
        </div>
    
        <script>
            function addComment(event) {
                event.preventDefault();
                var commentInput = event.target.querySelector("input");
                var commentText = commentInput.value;
                var date = new Date().toLocaleString();
            
                var commentDiv = document.createElement("div");
                commentDiv.className = "card my-3";
                commentDiv.innerHTML = `
                <div class="card-body">
                    <p class="card-text">${commentText}</p>
                    <p class="card-text"><small class="text-muted">${date}</small></p>
                </div>
                `;
            
                var commentsDiv = event.target.parentNode.querySelector(".comments");
                commentsDiv.insertBefore(commentDiv, commentsDiv.firstChild);
            
                commentInput.value = "";
            }
        </script>


    </div>

    <br><br>
    <%@ include file="/views/common/footer.jsp" %>


</body>
</html>