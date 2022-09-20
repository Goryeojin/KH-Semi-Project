<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.readme.fleaMarket.model.vo.FleaMarket, com.readme.common.model.vo.PageInfo" %>
<%
	ArrayList<FleaMarket> list = (ArrayList<FleaMarket>)session.getAttribute("list");
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
<title>중고장터 판매리스트 화면</title>
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
        height: 1000px;
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

    .paging-area{
        margin: 10px 30px;
       }

    .buttonnum{
        margin-left: 20px;
    }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 중고장터 > 판매 
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/fleaSidebar.jsp" %>
        </div>
        <div id="content_2">
            <div id="flea-sell-wrap">
                <h1 style="text-align: center;">판매</h1>
                <hr>
                <% if(loginUser != null) { %>
                <div class="enroll-btn">
                    <button class="btn" style="background-color: rgb(120, 150, 50); color: white; float: right;" onclick="enroll();">등록</button>
                    <br both="clear">
                </div>
                <% } %>
                <div class="flea-sell-list" align="center">
                <% if(list.isEmpty()) { %>
                	<div>게시글이 없습니다.</div>
                <% } else { %>
                	<% for(FleaMarket flea : list) { %>
                    <div class="flea-list">
                        <input type="hidden" class="hidden" value="<%= flea.getFleaNo() %>">
                        <img src="<%= contextPath %><%= flea.getTitleImg() %>" alt="" width="220px" height="240px">
                        <p><%= flea.getFleaTitle() %></p><p><%= flea.getPrice() %>원</p><p><%= flea.getFleaWriter() %></p>
                    </div>
                    <% } %>
               	<% } %>
                </div>
            </div>
        </div>
			<script>
				$(function(){
					// 클릭될 때 마다 url 요청 => location.href=
					// jsp/detail.th?bno=XX
					
					// XX를 먼저 구해보장
					$(".flea-list").click(function(){
						
						var fno = $(this).children().eq(0).val();
						location.href = "<%= contextPath %>/detail.fl?fno=" + fno;
					});
					
				})
					function enroll(){
		            	location.href="<%= contextPath %>/enroll.fl";
		            }
	            
	            
        </script>
        <div id="content_4"></div>
        <br clear="both">
        <div id="content_5"  style="width: 100%;">
            <br clear="both">
            <!-- 페이징 처리 부분 -->
    
		<div class="paging-area" align="center">
	        <!-- 페이징 버튼 -->
	         <% if(currentPage != 1) { %>
	        <button onclick="location.href='<%= contextPath%>/sellBook.fl?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/sellBook.fl?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/sellBook.fl?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br>
       </div>
           
    </div>
    </div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>