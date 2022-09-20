<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map, java.util.List, com.readme.common.model.vo.PageInfo"%>
<%
	List<Map> list = (List) request.getAttribute("fleaMarketList");
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

<title>나의 중고장터</title>
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
	height: 1300px;
}

#content_1, #content_2 {
	display: inline-block;
	height: 100%;
	/* display: flex; */
}

#content_3 {
	height: 70px;
	width: 99%;
}

#content_5 {
	height: 100px;
}

#pageCategory_bar {
	width: 100%;
	height: 70px;
	padding: 15px 10px 10px 53px;
	font-size: 17px;
	box-sizing: border-box;
}

#delete-div {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 30px;
}

#fleaMarket {
	margin-left: 30px;
	min-height:350px;
}

#fleaMarket-table {
	width: 100%;
}

#fleaMarket-table tr {
	border-bottom: 1px solid black;
}

#fleaMarket-table td {
	padding: 15px;
}

#delete-button {
	color: white;
	background-color: #789632;
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
			<!-- 중고장터 시작-->
			<div id="fleaMarket">
				<h1 style="text-align: left">중고장터 작성글</h1>
				<hr>
				<br>
				<br>
				<form id="fleaMarketForm" action="fleaListDelete.me" method="post">
					<div id="delete-div">
						<button type="submit" id="delete-button" >선택 삭제</button>
					</div>
					<script>
					</script>
					<table id="fleaMarket-table">
						<th></th>
						<th>카테고리</th>
						<th>제목</th>
						<th>가격</th>
						<th>댓글수</th>
						<%
							for (int i = 0; i < list.size(); i++) {
						%>

						<tr id="trFleaMarketList_<%=(int) list.get(i).get("flea_no")%>">
							<td>
								<input type="checkbox" name="fleaMarketList"
								value="<%=(int) list.get(i).get("flea_no")%>">
							</td>
							<td class="fleaGo">
								<input type="hidden"
								value="<%=(int) list.get(i).get("flea_no")%>">
								<%=(int) list.get(i).get("flea_type") == 1 ? "판매" : "구매"%>
								
							</td>
							<td class="fleaGo">
								<input type="hidden"
								value="<%=(int) list.get(i).get("flea_no")%>">
								<%=list.get(i).get("flea_title")%>
							</td>
							<td class="fleaGo">
								<input type="hidden"
								value="<%=(int) list.get(i).get("flea_no")%>">
								<%=list.get(i).get("flea_price")%>
							</td>
							<td class="fleaGo">
								<input type="hidden"
								value="<%=(int) list.get(i).get("flea_no")%>">
								<%=list.get(i).get("review_count")%>
							</td>
						</tr>
						<%
							}
						%>
						<script>
							$('.fleaGo').click(function(){
								location.href = "<%= contextPath %>/detail.fl?fno="+$(this).children().val();
								console.log("<%= contextPath %>/detail.fl?fno="+$(this).children().val());
							})
						</script>

					</table>
				</form>
			</div>
		</div>

		<div id="content_5" style="width: 100%;">
		<div class="paging-area" align="center">
	        <!-- 페이징 버튼 -->
	         <% if(currentPage != 1) { %>
	        <button onclick="location.href='<%= contextPath%>/fleaList.me?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/fleaList.me?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/fleaList.me?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br><br>
       </div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>