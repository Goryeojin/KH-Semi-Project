<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.readme.member.model.vo.WishList, java.util.List, com.readme.common.model.vo.PageInfo"%>
<%
	List<WishList> list = (List) request.getAttribute("wishlist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들 때  필요한 변수 미리 셋팅
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<title>나의 책 리스트</title>
<style>
.wrap {
	min-width: 1190px;
}

.wrap>div {
	width: 100%;
}

#content {
	width: 1300px;
	padding: 20px 30px;
	margin: 0 auto;
}

#content_1 {
	width: 18%;
	float: left;
}

#content_2 {
	width: 82%;
	clear: both;
}

#content_1, #content_2 {
	display: inline-block;
	height: 1000px;
	/* display: flex; */
}

#content_3 {
	height: 70px;
	width: 99%;
}

#pageCategory_bar {
	width: 100%;
	height: 70px;
	padding: 15px 10px 10px 53px;
	font-size: 17px;
	box-sizing: border-box;
}

#List div {
	float: left;
	text-align: right;
}

#MyList {
	margin-left: 30px;
	height: 1000px;
}

#pageCategory_bar {
	text-align: left;
}

#search_kw_input {
	height: 40px;
}

#search_kw {
	width: 400px;
	height: 40px;
	margin-left: 500px;
}

.mylist_while {
	margin-left: 70px;
	margin-top: 50px;
	float: left;
}

.mylist_while p {
	text-align: center;
	font-size: 17px;
	font-weight: 600;
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
</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp"%>


	<div id="content">

		<div id="content_3">
			<div id="pageCategory_bar">
				<a href="">🏠 HOME </a> > 마이페이지 > 회원정보
			</div>

		</div>
		<div id="content_1">
			<%@ include file="../common/myPageSidebar.jsp"%>
		</div>
		<div id="content_2">

			<div class="MyList" id="MyList">

				<h1>마이 리스트</h1>

				<hr>
				<br>
				<br>
				<div id="mylist_while_container">
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<div class="mylist_while">
						<input type="hidden" name="bno" value="<%=list.get(i).getBook().getBookNo()%>">
						<div class="myList">
							<img
								src="resources/book_upfiles/<%=list.get(i).getBook().getBookNo()%>.jpg"
								width="200px" height="300px">
						</div>

						<p><%=list.get(i).getBook().getTitle()%></p>
					</div>
					<%
						}
					%>
				</div>
				<script>
					$('.mylist_while').click(function(){
						location.href = "<%= contextPath %>/detail.bo?bno=" + $(this).children().first().val();
						console.log("<%= contextPath %>/detail.bo?bno=" + $(this).children().first().val());
					})
				</script>
			</div>

			<div id="content_5">
		<div class="paging-area" align="center">
	        <!-- 페이징 버튼 -->
	         <% if(currentPage != 1) { %>
	        <button onclick="location.href='<%= contextPath%>/myBookList.me?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/myBookList.me?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/myBookList.me?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br><br>
       </div>
			</div>

		</div>

		<%@ include file="../common/footer.jsp"%>
</body>
</html>