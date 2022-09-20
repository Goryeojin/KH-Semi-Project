<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.readme.clientService.model.vo.Notice, com.readme.common.model.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
<title>고객센터 공지사항</title>
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
        height: 450px;
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

    .enroll-btn{
        height: 35px;
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
    table input, table textarea{
        float: left;
        margin: 8px 10px;
    }
    table th{
        background-color: rgb(120, 150, 50);
    }
    table td{
        background-color: white;
    }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 고객센터 > 공지사항
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/clientServiceSidebar.jsp" %>
        </div>
        <div id="content_2">
            <div id="client-inquiry">
                <h2 style="margin: 10px 0 0 20px; font-weight: bolder;">공지사항</h2>
                <hr>
                <div align="center">
                	<% if(!list.isEmpty()) { %>
                    <table border="1" style="width: 90%; margin: 30px 0 0 15px; text-align: center;" align="center">
                        <thead>
                            <tr>
                                <th width="50">번호</th>
                                <th width="300">제목</th>
                                <th width="80">작성자</th>
                                <th width="100">작성일</th>
                                <th width="50">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<% for(Notice n : list) { %>
                            <tr class="notice">
                                <td><%= n.getNoticeNo() %></td>
                                <td><%= n.getNoticeTitle() %></td>
                                <td><%= n.getNoticeWriter() %></td>
                                <td><%= n.getNoticeDate() %></td>
                                <td><%= n.getCount() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% } else { %>
                    <p>조회된 공지사항이 없습니다.</p>
                    <% } %>
                </div>
                <script>
                    $(function(){
                        $('.notice').click(function(){
                            var nno = $(this).children().first().text();
                            location.href = "<%= contextPath %>/notice.cs?nno="+nno;
                        })
                    })
                </script>
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
	        <button onclick="location.href='<%= contextPath%>/noticeList.cs?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/noticeList.cs?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/noticeList.cs?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br><br>
	       </div>
    

           
        </div>
    </div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>