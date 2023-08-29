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

       
	
        
        
        .list_title{
            /* border: 1px solid blue; */
            box-sizing: border-box;
            height: 8%;
            margin-top: 2%;
        }
        .list_title>h1{
            margin-left:7%;
            /* margin-top: 1%; */
            color: lightgray;
        }

        .list_box{
            /* border: 1px solid red; */
            box-sizing: border-box;
            height: 85%;
        }

        .btn_box{
            /* border: 1px solid green; */
            box-sizing: border-box;
            height: 10%;
            margin-top: 6px;
           
        }

        .writer_list{
            /* border: 1px solid gold; */
            box-sizing: border-box;
            height: 85%;
        }

        .review_box>table{
            /* border: 1px solid skyblue; */
            box-sizing: border-box;
            /* height: 80%; */
            /* border-collapse:collapse; */
            border-collapse:separate;
            border-spacing: 0px 10px;
            border-style: none;
            
        }


        .review_box{
            /* border: 1px solid black; */
            box-sizing: border-box;
            height: 86%;
            
        }
       

        .page_btn{
            /* border: 1px solid blueviolet; */
            /* margin-top: 7%; */
            margin-left: 28%;
        }

        .btn_box>button{
            margin-top: 2%;
            width: 30%;
            height: 60%;
            border: 1px solid rgb(224, 224, 224);
            color: gray;
        }

        .btn_box>button:hover{
            background-color: #007fff;
            color: white;
        }

        .review_box tr{
            background-color: rgb(226, 226, 226);
        }

        .review_box tr:hover{
            cursor: pointer;
            background-color: lightgray;
        }

        .review_box td {
            border-radius: 15px;
        }
        
        .review_box tr td>p,h3{
            margin-left: 5%;
        }

        .review_box h3{
            margin-top: 1px;
            color: gray;
            font-size: medium;
        }

        p{
            margin-top: 0;
            margin-bottom: 1%;
            color: gray;
            font-size: large;
        }

        #date{
            margin-left: 11%;
        }
        
        #d_btn{
            float: right;
            margin-right: 15%;
            /* margin-top: 5%; */
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: gray;
            color: white;
            
        }
        #d_btn:hover{
            background-color: rgb(114, 114, 114);
            color: white;
            cursor: pointer;
            
        }

        .btnjy{
            /* border: 1px solid black; */
            box-sizing: border-box;
            height: 4%;
        }

        .page_btn>button:hover{
            background-color: #007fff;
            color: white;
           
        }

        .page_btn>button{
            border: none;
            width: 30px;
            height: 30px;
            margin-left: 2%;
        }
        
        #jy_h1{
            font-size: xx-large;
            padding-top: 1%;
        }

        #check_box{
            margin-top: 1%;
        }




</style>


</head>
<body>
	<%@ include file="../../views/common/header.jsp" %>

	
		
		<div class="warp">

         <%@ include file="mypageleft.jsp" %>
		

 		<div id="rightpro" class="profiler">
            <div class="list_title">
                <h1 id="jy_h1"><%=loginMember.getMemberId() %>님이 작성하신 댓글</h1>
            </div>
     
            <div class="list_box">
     
                <div class="btn_box" align="center">
                    <button>여행지</button>
                    <button>여행 코스</button>
                    <button>후기글</button>
                </div>
     
                <div class="writer_list">
     
                    <div class="review_box">
                        <table align="center">
                                <!-- cass2. 게시글이 없을 경우 
                            <thody>
                               
                                <tr>
                                    <td>작성하신 댓글이 없습니다.</td>
                                </tr>
                            
                            </tbody>-->
							
							<!-- case2. 게시글이 있을 경우 -->
                            <tbead>
                                <tr>
                                        <td width="600" height="110"> 
                                            <h3><input type="checkbox" name="" id="check_box">&nbsp;남산</h3>
                                            <p id="date">2023-03-11 <br>
                                                        좋아보여요!!!</p>
                                        </td>
                                </tr>
            
                                <tr>
                                        <td width="450" height="110"> 
                                            <h3><input type="checkbox" name="" id="check_box">&nbsp;한강</h3>
                                            <p id="date">2023-03-11 <br>
                                                좋아보여요!!!</p>
                                        </td>
                                </tr>
            
                                <tr>
                                        <td width="450" height="110"> 
                                            <h3><input type="checkbox" name="" id="check_box">&nbsp;동대문</h3>
                                            <p id="date">2023-03-11 <br>
                                                좋아보여요!!!</p>
                                        </td>
                                </tr>
            
                                <tr>
                                        <td width="450" height="110"> 
                                            <h3><input type="checkbox" name="" id="check_box">&nbsp;광화문</h3>
                                            <p id="date">2023-03-11 <br>
                                                좋아보여요!!!</p>
                                        </td>
                                </tr>
                           </tbead>

                          
                            
     
                        </table>
         
                    </div>
     		 </div>

                <div class="btnall">
     
                    <div class="btnjy">
                        <button id="d_btn">삭제하기</button>
                    </div>
    
                    <div class="page_btn" id="page">
                        <button onclick="location.href= ">&lt;</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5</button>
                        <button>&gt;</button>
    
                    </div>
    
            
                </div>
     
     
            </div>




        </div>

</div>
    


<br>
<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>