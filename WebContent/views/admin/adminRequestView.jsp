<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.readme.admin.model.vo.PageInfo, com.readme.admin.model.vo.Request" %>
<% 
	ArrayList<Request> list = (ArrayList<Request>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int Ncount = (int)request.getAttribute("Ncount");

	
	//페이징바 변수 세팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <!-- ☆☆☆☆없으면 안돌아감 필수☆☆☆☆☆ -->
    <!-- 부트스트랩 사용 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>관리자 - 도서 요청</title>
    <style>
    body { margin: 0;}
    div{
       
        box-sizing : border-box;
    }
    .admin_wrap>div{width:100%;}

    #admin{
        width: 100%;
        padding: 20px 30px;
        margin: 0 auto;      
    }
   #admin_sidebar{
        width: 15%;
        float:left;
    }
    #admin_content{
        display: inline-block;
        height: 1000px;
    }
    #admin_content{
        width: 84%;
        clear: both;

    }
    /* --------------------------------------레이아웃------------------------------------ */
    #admin_content{
        padding: 20px;
    }
   
    }
    #contentAll{
        margin-left: 20px;
    }
    #rCount{
        margin: 5px;
    }
    table tr{
       height: 35px;
    }
    #category-search>select{
        display: inline;
    }
    #category-search>form{
        display: inline;   
    }
    #category-search>form input{
        height: 40px;
        width: 400px;
        border-radius: 5px;
        border-color: rgb(206, 206, 206);
    }

    button{
        color: white;
        background-color: rgb(130, 150, 50);
        border: white;
        padding: 5px;
        font-size: 13px;
        border-radius: 5px;
       
    }
    button:hover{
        background-color: rgb(233, 233, 233);
        color: rgb(130, 150, 50);
    }
    table{
        text-align: center;
        margin: 10px;
    }
    table tr th{
        background-color: rgb(130, 150, 50);
        color: white;
    }
    .paging-area{
        margin-left: 450px ;
        margin-top: 20px;
    }
    #rCount{
        color: rgb(130, 150, 50);
        font-size: 14px;
    }
    .btn1{
        margin-left: 790px;
    }
    a{
        text-decoration: none;
        color: white;
    }
      
        

    
    </style>
</head>
<body>
    <div id="admin_header">
        <%@ include file="../common/adminMenubar.jsp" %>
    </div>
    <div id="admin_sidebar">
        <%@ include file="../common/adminSidebar.jsp" %>
    </div>
    <div id="admin_content">
        <div class="title">
            <h4>요청게시판</h4>
        </div>
        <hr>
        <div id="conentAll">
            

            <div id="rCount">
               	 책 추가 요청 : <%=Ncount %>
            </div>
		
           

            <div id="mainTable">
                <table border="1" class="request-area">
	                <thead>
	                    <tr>
	                    	                          
	                        <th width="80">글번호</th>
	                        <th width="150">작성일자</th>
	                        <th width="100">아이디</th>                          
	                        <th width="300">책이름</th>
	                        <th width="300">요청내역</th>
	                        <th width="80">처리결과</th>
	                    </tr>
					</thead>
					<tbody>
					<!--  게시글 출력 -->
					<% if(list.isEmpty()){ %>
	                    <tr>                          
	                        <td colspan="6">조회된 게시글이 없습니다.</td>
	                    </tr>
	                <%}else{ %>
	                <!-- 반복 : list에 있는 값을 순차적으로 접근해서 뽑아오기 -->
	                	<%for(Request r : list) { %>
	                    <tr>    
	                                          
	                        <td><%=r.getRequestNO() %></td>
	                        <td><%=r.getRequestDate() %></td>
	                        <td><%=r.getUserId() %></td>    
	                        <td><%=r.getReTitle() %></td>                      
	                        <td><%=r.getReContent() %></td>
	                        <td><%=r.getStatus() %></td>
	                    </tr>
	                   <%} %>
	                 <%} %>
	                  
	                 </tbody>
                </table>
            </div>  
        </div>    
      
        
        
       <!-- 페이징바 -->  
        <div class="paging-area">
        	<!--  페이징 버튼 -->
        	 <% if(currentPage != 1){ %>
      			 <button onclick="location.href='<%= contextPath %>/requestList.ad?currentPage=<%= currentPage-1 %>'">&lt;</button>
       			<%} %>
        		
	        		<% for(int i = startPage; i <= endPage; i++){ %>
	        			<% if(i != currentPage){ %>
	        			<!-- http://localhost:8000/jsp/requetList.ad?currentPage=XX -->
	            		<button onclick="location.href='<%=contextPath%>/requestList.ad?currentPage=<%=i%>'"><%=i %></button>
		        		<%}else{ %>
		  			           <button disabled><%=i %></button>
		        		<%} %>
        			<%} %>
        	
        	 <!-- 페이징바에서 >를 담당 : 다음페이지로 이동 -->
        <% if(currentPage != maxPage){ %>
       <button onclick="location.href='<%= contextPath %>/requestList.ad?currentPage=<%=currentPage+1 %>'">&gt;</button>
     	<%} %>
     	  
   
        </div>
    </div>
    
    <script>
    
    	$(function(){
    	
    		$(".request-area>tbody>tr").click(function(){
    			
    			$('#requestY').modal(); 
    			

    		})
    
    	})
    	
    
    </script>
    <!-- N-> Y로 바꿔줄 모달 띄우기 -->
     <!-- The Modal -->
                    <div class="modal" id="requestY">
                        <div class="modal-dialog modal-fullscreen-sm-down">
                          <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">책 요청 처리하기</h4>
                              
                             
                            </div>
                        
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            		
                              <form action="<%= contextPath %>/requestY.ad" method="get">
                              <p>처리하고자 하는 글 번호 기입</p>
                                  <input type="text" name="requestNo"><br><br>
                                  <button type="submit">요청 처리</button>
                              </form>
                            </div>
                        
                          </div>
                        </div>
                    </div>
    
    
    
    
   




</body>
</html>