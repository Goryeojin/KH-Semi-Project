<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.readme.admin.model.vo.PageInfo, com.readme.admin.model.vo.BookMG" %>
<%@ page import = "com.readme.admin.model.vo.CategoryAd" %>
<%
	ArrayList<BookMG> list = (ArrayList<BookMG>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<CategoryAd> category = (ArrayList<CategoryAd>)request.getAttribute("category");
	
	//페이징바 및 총 개수 변수 세팅
	int count = pi.getListCount();
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

    <title>관리자 - 책관리</title>
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
    #reviewCount{
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
        margin-left: 350px ;
        margin-top: 20px;
    }
    #reviewCount{
        color: rgb(130, 150, 50);
        font-size: 14px;
    }
    .btn1{
        margin-left: 740px;
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
            <h4> 책 관리 </h4>
        </div>
        <hr>
        <div id="contentAll">

            <div id="aCategory"> 
             <form action="<%=contextPath %>/categoryBookList.ad?currentPage=1" method="post">
                <select name="bookCategory" id="bookCategory" class="select-css" onchange="formChange(this.form)">
                   <%for(CategoryAd c : category){ %>
                    <option value="<%=c.getCategoryNo()%>"><%=c.getCategoryName() %></option> 
                   <%} %>
                </select> 
             </form>
            </div>

            <div id="reviewCount">
                등록된 모든 책의 개수 : <%=count %>
            </div>

          

            <div id="mainTable">
                <table border="1">
                    <tr>
                        <th width="100">책 번호</th>  
                        <th width="100">장르</th>                   
                        <th width="300">책이름</th>                   
                        <th width="150">저자</th>
                        <th width="150">출판사</th>
                        <th width="80">리뷰수</th>
                    </tr>
				<%if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="7"></td>                                                                     
                    </tr>
                 <%}else{ %>
                 	<%for(BookMG b : list){ %>
                    <tr>                                                                     
                        <td><%=b.getBookNo() %></td>
                        <td><%=b.getCategoryName() %></td>
                        <td><%=b.getBookTitle() %></td>
                        <td><%=b.getBookAuthor() %></td>
                        <td><%=b.getBookPublisher() %></td>
                        <td><%=b.getReviewCount() %></td>
                    </tr>
                  <%} %>
                <%} %>
                 
                </table>

            </div>
            <div class="paging-area">
            	<!--  페이징 버튼 -->
    <% if(currentPage != 1){ %>
        	
      			 <button onclick="location.href='<%= contextPath %>/bookList.ad?currentPage=<%= currentPage-1 %>'">&lt;</button>
       			<%} %>
        		
	        		<% for(int i = startPage; i <= endPage; i++){ %>
	        			<% if(i != currentPage){ %>
	        			<!-- http://localhost:8000/jsp/requetList.ad?currentPage=XX -->
	            		<button onclick="location.href='<%=contextPath%>/bookList.ad?currentPage=<%=i%>'"><%=i %></button>
	            		
		        		<%}else{ %>
		  			           <button disabled><%=i %></button>
		  			          
		        		<%} %>
        			<%} %>
        			
                 <!-- 페이징바에서 >를 담당 : 다음페이지로 이동 -->
            <% if(currentPage != maxPage){ %>
       <button onclick="location.href='<%= contextPath %>/bookList.ad?currentPage=<%=currentPage+1 %>'">&gt;</button>
     	<%} %>
     	  
            </div>

        </div>
    </div>

    <script>
      
		function formChange(obj){
		
			obj.submit(); 

	}
 
        

    </script>



</body>
</html>