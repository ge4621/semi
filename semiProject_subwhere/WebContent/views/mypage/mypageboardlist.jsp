<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.warp{ 
            border: 2px solid lightgray;
            width: 1200px;
            height: 780px;
            margin: auto;
            margin-top: 15px;
        }
        
        .profilel,.profiler{
            border: 1px solid lightgray;
            box-sizing: border-box;
            height: 98%;
            float: left;
            margin-top: 0.7%;
            margin-left: 1%;
        }
        
        .profilel{
            width: 30%;
        }
        .profiler{
            width: 67%;
        }

      
	
        .jylist_title{
            /* border: 1px solid blue; */
            box-sizing: border-box;
            height: 8%;
        }
        .jylist_title>h1{
            margin-left:7%;
            margin-top: 3%;
            color: gray;
        }

        .jylist_box{
            /* border: 1px solid red; */
            box-sizing: border-box;
            height: 89%;
        }

        .jybtn_box{
            /* border: 1px solid green; */
            box-sizing: border-box;
            height: 8%;
        }

        .jywriter_list{
            /* border: 1px solid gold; */
            box-sizing: border-box;
            height: 82.3%;
        }

        #jyimg{
            width: 85%;
            padding:1.5%;
            height:123px;
            border-radius: 20px;
            padding-left: 5px;
            margin-left: 11%;
        }

        
        
        .jylist>table{
            /* border: 1px solid skyblue; */
            box-sizing: border-box;
            /* height: 80%; */
            /* border-collapse:collapse; */
            border-collapse:separate;
            border-spacing: 0px 7px;
            border-style: none; 
        }

        /*tr크기 고정해야 할 때 풀기*/
        /* tr {
            min-height: 130px; 
            max-height: 130px; 
        } */

        #jylist_table>.jylist{
            /* border: 1px solid violet; */
            box-sizing: border-box;
            height: 90%;
        }
       

        .jypage_btn{
            /* border: 1px solid blueviolet; */
            box-sizing: border-box;
            height: 10%;
        }

        .jypage_btn>button {
            border: none;
            width: 30px;
            height: 30px;
            margin: 0 5px;

        }

        .jypage_btn>button:hover {
            background-color: #007fff;
            color: white;
        }

        .jybtn_box>button{
            margin-top: 2%;
            width: 45%;
            height: 60%;
            border: 1px solid rgb(224, 224, 224);
            color: gray;
        }

        .jybtn_box>button:hover {
            background-color: #007fff;
            color: white;
        }

        #jylist_table tr{
            background-color: rgb(226, 226, 226);
            
        }
        
        #jylist_table tr:hover{
            cursor: pointer;
            background-color: lightgray;
        }

        

        #jylist_table #jya{
            padding: 0;
            vertical-align:middle;
            border-radius: 10px;
        }

        #jya>p,h2{
            margin-left: 5%;
            color: gray;
        }

        #jyh2{
            margin-bottom: 0;
        }

        #jyp{
            margin-top: 0;
        }

        
        #jycheck_list{
            margin-top: 50px;
            position: absolute;
        }


        #de_board{
            margin-left: 70%;
            border: none;
            height: 30px;
            border-radius: 10%;
            background-color: gray;
            color: white;
        }

        #de_board:hover{
            background-color: rgb(114, 114, 114);
        }


</style>


</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="warp">
		
	
        <%@ include file="mypageleft.jsp" %>
	
	
	    <div id="rightpro" class="profiler">

            <div class="jylist_title">
                <h1>ge4621님이 작성하신 글</h1>
            </div>
     
            <div class="jylist_box">
     
                <div class="jybtn_box" align="center">
                    <button type="button" onclick="test1();" id="mycoslist">여행 코스</button>
                    <button type="button" onclick="test2();" id="myreviewlist">후기글</button>
                    <!-- <button type="button">여행지</button> -->
                </div>
     
                <div class="jywriter_list">   
     
                    <div class="jylist">
                        <table align="center" id="jylist_table">
                            <tr>
                                <!-- <td><input type="checkbox"></td> -->
        
                                    <div class="jypic">
                                        
                                        <td width="120" id="jya"><input type="checkbox" name="" id="jycheck_list"><img src="resource/남산.jpeg" alt="" id="jyimg"></td>
                                    </div>
                                
                                    <td width="600" height="130" id="jya"> 
                                        <h2 id="jyh2">남산</h2>
                                        <p id="jyp">가가가가가각가가가ㄹㄹㄹㄹㄹㄹ가가가가가가가가각</p>
                                    </td>
                                
                            </tr>
        
                            <tr>
                                    <div class="jypic">
                                        <td width="100" id="jya"><img src="resource/롯데타워 가로.jpeg" alt="" id="jyimg"></td>
                                    </div>
        
                                    <td width="450" height="130" id="jya"> 
                                        <h2 id="jyh2">남산</h2>
                                        <p id="jyp">가가가가가각가가가가가가가가가가가가가가가가가가각</p>
                                    </td>
                                
                            </tr>
        
                            <tr>
                                    <div class="pic">
                                        <td width="120" id="jya"><img src="resource/2023081712383580188.PNG" alt="" id="jyimg"></td>
                                    </div>
                                    <td width="450" height="130" id="jya"> 
                                        <h2 id="jyh2">남산</h2>
                                        <p id="jyp">가가가가가각가가가가가가가가가가가가가가가가가가각</p>
                                    </td>
                            </tr>
        
                            <tr>
                                
                                    <div class="pic">
                                        <td width="120" id="jya"><img src="resource/한강.jpeg" alt="" id="jyimg"></td>
                                    </div>
                                    <td width="450" height="130" id="jya"> 
                                        <h2 id="jyh2">남산</h2>
                                        <p id="jyp">가가가가가각가가가가가가가가가가가가가가가가가가각</p>
                                    </td>
                          
                                
                            </tr>
                        </table>
                    </div>

                   </div>
                    
                    <div class="jypage_btn" align="center">

                        <div>
                            <button id="de_board">삭제하기</button>
                        </div>

                        <button>&lt;</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button>&gt;</button>

                    </div>
        
                </div>
     
            </div>


            <script>
                function test1(){
                    $.ajax({
                        url:"mycoslist.me",
                        data:{
                            boardtype:1
                        },
                        success:function(list){
                            console.log("ajax통신 성공");

                        },
                        error:function(){
                            console.log("ajax통신 실패");
                        }

                    })
                }

            </script>

	
	</div>
	
<br>



<%@ include file="../../views/common/footer.jsp" %>


 

</body>
</html>