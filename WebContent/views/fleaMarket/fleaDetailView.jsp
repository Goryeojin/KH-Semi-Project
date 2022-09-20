<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.readme.fleaMarket.model.vo.FleaMarket, com.readme.fleaMarket.model.vo.Attachment" %>
<%
	FleaMarket flea = (FleaMarket)request.getAttribute("flea");
	Attachment at = (Attachment)request.getAttribute("at");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고장터 상세보기</title>
<style>
    button{
        float: right;
        margin-right: 10px;
        background-color: rgb(120, 150, 50);
        color: white;
        font-weight: 650;
        height: 35px;
        width: 100px;
    }
    input, b{
        margin-left: 20px;
    }
    #content{
        width: 1300px;  
        padding: 20px 30px;
        margin: 0 auto;
    }
    #content_1{
        width: 17.5%;
        float: left;
        clear: both;
    }
    #content_4{
        width: 17.5%;
        float: left;
    }
    #content_2{
        width: 65%;
        float: left;
        /* clear: both; */
    }
    #content_1, #content_2, #content_4{
        display: inline-block;
        height: auto;
        /* display: flex; */
    }
    #content_3{
        height: 70px;
        width: 100%;
    }
    #pageCategory_bar{
        width: 100%;
        height: 70px;  
        padding: 15px 10px 10px 10px;
        font-size: 17px; 
        box-sizing: border-box;
    }



    table{
        text-align: center;
    }
    table td{
        /* margin-left: 20px; */
        text-align: left;
    }
    table tr{
        height: 50px;
    }
    #reply-table td{
        padding: 5px 8px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 중고장터 
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/fleaSidebar.jsp" %>
        </div>
        <div id="content_2" align="center">
            <div id="리뷰수정할거임" align="center" style="height: 960px; width: 780px;">
                <table border="1" align="center">
						<thead>
							<tr>
								<th colspan="4" style="height: 40px; background-color: rgb(120, 150, 50); color: white;">중고장터</th>
							</tr>
						</thead>
                        <tbody>
                            <tr>
                                <th width="170">제목</th>
                                <td colspan="3" width="630" style="text-align: left;"><p style="margin: 4px 0 0 20px;"><%= flea.getFleaTitle() %></p></td>
                            </tr>
                            <tr>
                                <th>가격</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= flea.getPrice() %> 원</p></td>
                                <th>작성자</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= flea.getFleaWriter() %></p></td>
                            </tr>
                            <tr>
                                <th>파일</th>
                                <td colspan="3">&nbsp;&nbsp;
                       	      		<!-- 첨부파일이 없을 경우 -->
			                    	<% if(at == null) {%>
			 					                   첨부파일 업성
			                		<% } else { %>
				                    	<!-- 첨부파일 있을 경우 -->
					                    <a download="<%= at.getOriginName() %>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName() %>">
					                    	<%= at.getOriginName() %>
					                    </a>
			                    	<% } %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: center;">
                                    <div style="height: auto; margin: 20px 30px; border: 1px solid gray;" align="center">
                                        <img src="<%= contextPath %><%= at.getFilePath() + at.getChangeName() %>" alt="" width="650px" height="250px" style="margin-top: 30px;">
                                        <p>
                                        	<%= flea.getFleaContent() %>
                                        </p>
                                    </div>

                                    <div id="reply-area">
                                        <table style="height: auto; margin: 20px 30px; border: 1px solid gray; width: 710px;" align="center" id="reply-table">
                                            <thead style="background-color: rgb(120, 150, 50)">
                                            
                                                <tr style="height: 30px; color: white;">
                                                    <th style="width: 20%;">작성자</th>
                                                    <th style="width: 60%;">댓글내용</th>
                                                    <th style="width: 20%;">작성일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>user01</td>
                                                    <td>쓰레기를 쥰낸 비싸게 파네..ㅋㅋ</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div align="left" style="margin: 20px 30px;">
                                        <% if(loginUser != null) { %>
                                            <p style="margin: 0 0 8px 5px;"> 댓글달기</p>
                                                <p> 
                                                	<textarea id="replyContent" cols="94" rows="3" style="resize:none" placeholder="댓글을 입력하세요"></textarea>
												</p>
                                                <button style="width: 55px; margin: 0 3px 20px 5px;" onclick="insertReply()">등록</button>
                                       </div>
                                       <% } else { %>
                                                <p> 
                                                	<textarea id="replyContent" cols="94" rows="3" style="resize:none" placeholder="로그인 후 이용하세요." readonly></textarea>
												</p>
										<% } %>
																			
										<script>	
											
								  		 	function selectReplyList(){
									   		   $.ajax({
								 			        url : "rlist.fl",
							  				       	data : {fno : <%= flea.getFleaNo() %>},
										         	success : function(list) {
									     	       
									            	// 댓글갯수만큼 반복 => 누적(문자열)
									            		var result = "";
									            		for(var i in list){
									               			result += "<tr style=\"height: 30px;\">"
									                     	+ "<td style=\"width: 20%;\">" + list[i].replyWriter + "</td>"
									                     	+ "<td style=\"width: 60%;\">" + list[i].replyContent + "</td>"
									                     	+ "<td style=\"width: 20%;\">" + list[i].replyDate + "</td>"
									                     	+ "</tr>";
									            		}
									            		$("#reply-area tbody").html(result);
									            
									         		},
									         		error : function() {
									            	console.log("댓글목록 읽어오기 실패띠");
									         		}
									      		})
									      
								   			}
									   		$(function(){
									      
									      selectReplyList();
									      
									      setInterval(selectReplyList, 1000);
									      
									   })
									   
									   function insertReply(){
									      
									      $.ajax({
									      
									         url : "rinsert.fl",
									         data : {
									            content : $("#replyContent").val(), // text()가 아닌 val()로 가져와야함
									            fno : <%= flea.getFleaNo() %>
									         },
									         type : "post",
									         success : function(result){
									            // result 값에 따라서 성공했으면 성공메시지 띄워주기 alert()
									            if(result > 0){
									               
									               alert("댓글 작성에 성공했습니다.");
									               selectReplyList();
									               $("#replyContent").val("") // 작성란 초기화
									               
									            }
									            
									         },
									         error : function(){
									            console.log("댓삽ajax실패");
									         }
									         
									         
									         
									      })
									      
									      
									      
									      
									   }
									
									</script>
										
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button style="margin: 5px 60px 0 0;" onclick="list();">목록으로</button>
                    <% if(loginUser != null &&loginUser.getUserNo() == flea.getUserNo()) { %>
                    	<button style="margin: 5px 10px 0 0;" onclick="fleaUpdate();">수정하기</button>
                    <% } %>
            </div>
            
            <script>
                function list(){
                	<% if(flea.getFleaType() == 1) { %>
                    location.href = "<%= contextPath %>/sellBook.fl?currentPage=1";
                    <% } else { %>
                    location.href= "<%= contextPath %>/buyBook.fl?currentPage=1";
                    <% } %>
                }
                function fleaUpdate(){
                            location.href = "<%= contextPath %>/updateForm.fl?fno=<%= flea.getFleaNo() %>";
                        }
            </script>
        </div>
        <div id="content_4"></div>
        <br clear="both">
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>