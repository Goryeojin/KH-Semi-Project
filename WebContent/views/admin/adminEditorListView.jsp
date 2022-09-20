<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.readme.admin.model.vo.EditorAd, com.readme.admin.model.vo.PageInfo" %>
<%
	ArrayList<EditorAd> list = (ArrayList<EditorAd>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int count = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	int EditorCount = (int)request.getAttribute("EditorCount");
	

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <!-- ☆☆☆☆없으면 안돌아감 필수☆☆☆☆☆ -->
    <!-- 부트스트랩 사용 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   

    <title>관리자 - 금주의 에디터픽 게시판</title>
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
    .select-css {
	    
	    font-size: 16px;
	    font-family: sans-serif;
	    
	    color: rgb(110, 110, 110);
	    line-height: 1.3;
	    padding: .6em 1.4em .5em .8em;
	    width: 100px;
	    max-width: 100%;
	    box-sizing: border-box;
	    margin: 5px;
	    border: 1px solid #aaa;
        
	    border-radius: .5em;
	    -moz-appearance: none;
	    -webkit-appearance: none;
	    appearance: none;
	    background-color: #fff;
        
	    background-repeat: no-repeat, repeat;
	    background-position: right .7em top 50%, 0 0;
	    background-size: .65em auto, 100%;
    }
    .select-css::-ms-expand {
    	display: none;
    }
    .select-css:hover {
    	border-color: #888;
    }
    .select-css:focus {
    	border-color: #aaa;
    	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
    	box-shadow: 0 0 0 3px -moz-mac-focusring;
    	color: #222;
    	outline: none;
    }
    .select-css option {
    	font-weight:normal;
    }

    #contentAll{
        margin-left: 20px;
    }
    #editorCount{
        margin: 5px;
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
        border-radius: 10px;
       
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
        margin-left: 520px ;
        margin-top: 20px;
    }
    #editorCount{
        color: rgb(130, 150, 50);
        font-size: 14px;
    }
    .btn1{
        margin-left: 875px;
    }
    a{
        text-decoration: none;
        color: white;
    }
    #searchBtn{
        color: white;
        background-color: rgb(130, 150, 50);
        border: white;
        padding: 5px;
        font-size: 18px;
        border-radius: 5px;
    }
    .target{
    	display : inline-block;
    	text-overflow : ellipsis;
    	overflow : hidden;	
    	white-space: nowrap;
    
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
                    <h4>금주의 에디터픽</h4>
                     </div>
                <hr><br>
                <div id="contentAll">
                 

                    <div id="editorCount">
                       	 등록된 에디터픽 개수 : <%=EditorCount %>
                    </div>
                    <div class="buttons btn1">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#EditorY" id="inputE">에디터픽 등록</button>
                        <button type="button" data-bs-toggle="modal" data-bs-target="#EditorN">에디터픽 해제</button>
                        
                       
                    </div>

                    <div id="mainTable">
                        <table border="1">
                            <tr>
                                <th width="50">번호</th>                        
                                <th width="100">카테고리</th>
                                <th width="100">저자</th>
                                <th width="150">출판사</th>
                                <th width="250">책이름</th>
                                <th width="400">내용</th>
                                <th width="40">상태</th>
                                
                            </tr>
						<% if(list.isEmpty()){ %>
                            <tr>
                                <td colspan="7">없음</td>
                            </tr>
                        <%}else{ %>
                        	<%for(EditorAd r : list){ %> 	
                            <tr>
                                <td><%=r.getBookNo() %></td>
                                <td><%=r.getCategoryName() %></td>
                                <td><%=r.getBookAuthor() %></td>
                                <td><%=r.getBookPublisher() %></td>
                                <td><%=r.getBookTitle() %></td>
                                <td class="target" width="400"><%=r.getBookIntro() %></td>
                                <td><%=r.getEditorChoice() %></td>
                            </tr>
                           <%} %>
                          <%} %>
                        </table>

                    </div>
         </div>
          <div class="paging-area">
            	<!--  페이징 버튼 -->
            	
    		<% if(currentPage != 1){ %>
        	
      			 <button onclick="location.href='<%= contextPath %>/editorList.ad?currentPage=<%= currentPage-1 %>'">&lt;</button>
       			<%} %>
        		
	        		<% for(int i = startPage; i <= endPage; i++){ %>
	        			<% if(i != currentPage){ %>
	        		
	            		<button onclick="location.href='<%=contextPath%>/editorList.ad?currentPage=<%=i%>'"><%=i %></button>
	            		
		        		<%}else{ %>
		  			           <button disabled><%=i %></button>			           
		        		<%} %>
        			<%} %>	
                 <!-- 페이징바에서 >를 담당 : 다음페이지로 이동 -->
            <% if(currentPage != maxPage){ %>
            
       			<button onclick="location.href='<%= contextPath %>/editorList.ad?currentPage=<%=currentPage+1 %>'">&gt;</button>
     		<%} %>
     	  
            </div>
    </div>

    <script>
        $(function(){

           //체크박스
            $("#all").on('change', function(){

                var $all = $('#all').prop('checked');

                if($all){
                    $('.chk').prop('checked',true);
                }else{
                    $('.chk').prop('checked',false);
                }
            })

            $('.chk').on('change', function(){

                var $chk = $(this).prop('checked');

                if($chk == false){
                    $('#all').prop('checked', false);
                }else{
                   
                }
            })
 
            
            if(<%=EditorCount %> ==5){
            	        	
            	$('#inputE').attr("disabled",true);
         	
            }
            
        })
	
   

    </script>
    
    <!-- N-> Y로 바꿔줄 모달 띄우기 -->
     <!-- The Modal -->
                    <div class="modal" id="EditorY">
                        <div class="modal-dialog modal-fullscreen-sm-down">
                          <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">에디터픽 등록</h4>
                            </div>
                        
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            		
                              <form action="<%= contextPath %>/EditorY.ad" method="get">
                              <p>처리하고자 하는 글 번호 기입</p>
                                  <input type="text" name="bookNo"><br><br>
                                  <button type="submit">요청 처리</button>
                              </form>
                            </div>
                        
                          </div>
                        </div>
                    </div>
               
      <!-- Y-> N로 바꿔줄 모달 띄우기 -->
     <!-- The Modal -->
                    <div class="modal" id="EditorN">
                        <div class="modal-dialog modal-fullscreen-sm-down">
                          <div class="modal-content">
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                              <h4 class="modal-title">에디터픽 해제</h4>

                            </div>
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                            		
                              <form action="<%= contextPath %>/EditorN.ad" method="get">
                              <p>처리하고자 하는 글 번호 기입</p>
                                  <input type="text" name="bookNo"><br><br>
                                  <button type="submit">요청 처리</button>
                              </form>
                            </div>
                        
                          </div>
                        </div>
                    </div>
    
    




</body>
</html>