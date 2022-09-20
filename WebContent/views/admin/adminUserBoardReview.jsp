<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.readme.admin.model.vo.PageInfo, com.readme.admin.model.vo.ReviewAd" %>
<%
	ArrayList<ReviewAd> list = (ArrayList<ReviewAd>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	//페이징바 및 총 개수 변수 세팅
	int count = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	

			


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <title>관리자페이지 - 회원 글 관리(리뷰)</title>
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
    table tr{
       height: 35px;
    }
    #contentAll{
        margin-left: 20px;
    }
    #reviewCount{
        margin: 5px;
    }
    #reviewCount{
        color: rgb(130, 150, 50);
        font-size: 14px;
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
    .select-css {
	    
	    font-size: 16px;
	    font-family: sans-serif;
	    
	    color: rgb(110, 110, 110);
	    line-height: 1.3;
	    padding: .6em 1.4em .5em .8em;
	    width: 120px;
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

    .paging-area{
        margin-left: 440px;
        margin-top : 50px;
    }
    .btn1{
        margin-left: 920px;
    }
    .target{
    	display : inline-block;
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
    	<div class=Title>
            <h4> 유저 책 관리(리뷰) </h4>
        </div>
        <hr>
        <div id="aCategory"> 
            <select class="select-css" name="select" onChange="goPage(value)">
            	<option>글 분류</option>
                <option value="<%= contextPath %>/userBoardReview.ad?currentPage=1">리뷰</option>
                <option value="<%= contextPath %>/userBoardFlea.ad?currentPage=1">중고게시판</option>
            </select> 
        </div>

        <div id="reviewCount">
            총 리뷰 수 : <%=count %>
        </div>
	<form action="<%= contextPath %>/deleteReview.ad" method="post">
        <div class="buttons btn1">
            <button id="reviewDelete">글삭제</button>
        </div>

        <div id="mainTable" >
            <table border="1">
            <thead>
                <tr>
                    <th width="30"><input type="checkbox" class="batch" id="all"></th>
                    <th width="60">번호</th>
                    <th width="80">카테고리</th>
                    <th width="200">책이름</th>
                    <th width="70">작성자</th>
                    <th width="300">리뷰명</th>
                    <th width="150">작성일자</th>
                    <th width="80">상태값</th>
                </tr>
			</thead>
			<tbody>
			<% if(list.isEmpty()){ %>
                <tr>
                    <td colspan="8">조회된 게시글이 없습니다.</td>
                    
                </tr>
            <% }else{ %>
            <!--  반복! -->
              <%for(ReviewAd r : list) {%>
                <tr>
                    <td><input type="checkbox" class="batch" name="reviewCheck" value="<%=r.getReviewNo() %>"></td>
                    <td ><%=r.getReviewNo() %></td>
                    <td><%=r.getCategoryName() %></td>
                    <td class="target" ><%=r.getBookTitle() %></td>
                    <td><%=r.getUserId() %></td>
                    <td><%=r.getReviewTitle() %></td>
                    <td><%=r.getReviewDate() %></td>
                    <td ><%=r.getStatus() %></td>  
                </tr>
                <%} %>
               <%} %>
               </tbody>
            </table>
        </div>
        </form>
       <!-- 페이징바 -->  
        <div class="paging-area">
        	<!--  페이징 버튼 -->
        	
        	 <% if(currentPage != 1){ %>
        	
      			 <button onclick="location.href='<%= contextPath %>/userBoardReview.ad?currentPage=<%= currentPage-1 %>'">&lt;</button>
       			<%} %>
        		
	        		<% for(int i = startPage; i <= endPage; i++){ %>
	        			<% if(i != currentPage){ %>
	        			<!-- http://localhost:8000/jsp/requetList.ad?currentPage=XX -->
	            		<button onclick="location.href='<%=contextPath%>/userBoardReview.ad?currentPage=<%=i%>'"><%=i %></button>
	            	
		        		<%}else{ %>
		  			           <button disabled><%=i %></button>
		  			        
		        		<%} %>
        			<%} %>
        	
        	 <!-- 페이징바에서 >를 담당 : 다음페이지로 이동 -->
            <% if(currentPage != maxPage){ %>
       <button onclick="location.href='<%= contextPath %>/userBoardReview.ad?currentPage=<%=currentPage+1 %>'">&gt;</button>
     	<%} %>
     	  
   
        </div>
    </div>   
   

    <script>
        function goPage(value){

                location.href=value;
        }
        
		/* 체크박스 전체선택 */
        $(function(){
            $('#all').on('change', function(){
                var $all = $('#all').prop('checked');
                if($all){
                    $('.batch').prop('checked', true);
                }
                else{
                    $('.batch').prop('checked', false);
                }
            })
        })
        
        
        $(function(){
            $("input:checkbox[name=reviewCheck]").on('click', function(){
                var uno = $(this).val();
                console.log(uno); 
            })        
         })
   
 

    </script>
	
</body>
</html>