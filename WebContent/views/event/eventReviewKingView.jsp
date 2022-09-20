<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.readme.event.model.vo.Event, com.readme.common.model.vo.PageInfo" %>
<%
	ArrayList<Event> list = (ArrayList<Event>)session.getAttribute("list");
	PageInfo pi = (PageInfo)session.getAttribute("pi");
	
	// 페이징바 만들 때  필요한 변수 미리 셋팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰왕 이벤트</title>
<style>
    button{
        /* float: right; */
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
        width: 10%;
        float: left;
        clear: both;
    }
    #content_4{
        width: 10%;
        float: left;
    }
    #content_2{
        width: 80%;
        float: left;
        /* clear: both; */
    }
    #content_1, #content_2, #content_4{
        display: inline-block;
        height: 600px;
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
    .flea-sell-list div{
        width: 230px;
        height: 300px;
        display: inline-block;
        /* float: left; */
        margin: 30px 15px;
    }
    .flea-sell-list p{
        margin: 0;
    }


    #content_5{
        height:150px;
    }
    .paging-area{
        margin: 10px 30px;
       }
    .paging-area button{
        margin: 5px;
        height: 30px;
        width:50px;
        border-radius: 5px;
        color: white;
        background-color: rgb(130, 150, 50);
        border : white;
    }
    .paging-area button:hover{
        background-color: rgb(233, 233, 233);
        color: rgb(130, 150, 50);
    }

    .buttonnum{
        margin-left: 20px;
    }

    table tr{
        height: 40px;
    }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 이벤트 > 리뷰왕 이벤트 
            </div>
        </div>
        <div id="content_1">
        </div>
        <div id="content_2">
            <div id="flea-sell-wrap">
                <h1>리뷰왕 순위</h1>
                <hr>
                <div class="flea-sell-list" align="center">
                <% if(list.isEmpty()) { %>
                	<p>리뷰왕 순위가 없어용</p>
                <% } else { %>
                    <table border="1" style="width: 85%; margin-top: 100px; text-align: center;">
                        <thead>
                            <tr style="background-color: lightgray;">
                                <th width="100">순위</th>
                                <th width="100">이름</th>
                                <th>리뷰 수</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for(int i=0; i<list.size(); i++) { %>
                            <tr>
                                <td><%= i+1 %></td>
                                <td><%= list.get(i).getUserId() %></td>
                                <td><%= list.get(i).getReviewCount() %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                <% } %>
                </div>
            </div>
        </div>

        <div id="content_4"></div>
        <br clear="both">
        <div id="content_5"  style="width: 100%;">
            <br clear="both">
            <!-- 페이징 처리 부분 -->
    
		<div class="paging-area" align="center">
	        <!-- 페이징 버튼 -->
	         <% if(currentPage != 1) { %>
	        <button onclick="location.href='<%= contextPath%>/buyBook.fl?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/buyBook.fl?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/buyBook.fl?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br><br>
       </div>
           
        </div>
    </div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>