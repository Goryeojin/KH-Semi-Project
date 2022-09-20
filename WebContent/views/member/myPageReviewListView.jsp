<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap, java.util.List, com.readme.common.model.vo.PageInfo"%>
<%
	List list = (List) request.getAttribute("reviews");
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

<title>나의 리뷰</title>
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
	height: 100%;
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

#reviewbox {
	margin-left: 30px;
}

#delete-review {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 30px;
}

#delete-review-button {
	background-color: rgb(120, 150, 50);
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

#content_5 {
	height: 100px;
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
			<div id="reviewbox">
				<script>
					function deleteSelected() {
						var forDeleteData = $('#reviewForm').serialize();
						console.log(forDeleteData);
						$.ajax({
							url : "reviewDelete.me", // 요기에
							type : 'POST',
							data : {
								deletelist : forDeleteData,
							},
							success : function(data) {
								alert(data)
								//var jsonObj = JSON.parse(data);
								if (forDeleteData !== undefined
										&& forDeleteData !== "") {
									var forDelete = forDeleteData.split('&');
									for (var i = 0; i < forDelete.length; i++) {
										console.log(forDelete[i]);
										var id = forDelete[i].split('=')[0]
												.split('_')[1];
										$('#trReview_' + id).remove();
									}
								}

							},
							error : function(xhr, status) {
								alert(xhr + " : " + status);
								console.log(xhr);
							}
						});
					}
				</script>
				<form id="reviewForm" action="reviewDelete.me" method="post">
					<div>
						<h1 align="left">작성한 리뷰</h1>
						<hr>
						<div id="delete-review">
							<button type="submit" id="delete-review-button">
							리뷰 삭제</button>
						</div>
					</div>


					<div>
						<!-- 리뷰 리스트 시작 -->
						<table class="type04" width="985px;">

							<%
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr id="trReview_<%=((HashMap) list.get(i)).get("review_no")%>">

								<td>
									<input type="checkbox" name="fleaMarketList"
									value="<%=((HashMap) list.get(i)).get("review_no")%>">
								</td>
								<td class="reviewGo">
									<input type="hidden"
									value="<%=((HashMap) list.get(i)).get("review_no")%>">
									<img src="resources/book_upfiles/<%=((HashMap) list.get(i)).get("book_no")%>.jpg"
									style="height: 173px; width: 100px">
								</td>
								<td width="500px" class="reviewGo">
									<input type="hidden"
									value="<%=((HashMap) list.get(i)).get("review_no")%>">
									<%=((HashMap) list.get(i)).get("review_content")%>
								</td>
								<td class="reviewGo">
									<input type="hidden"
									value="<%=((HashMap) list.get(i)).get("review_no")%>">
									<%
										int scope = (int) ((HashMap) list.get(i)).get("review_scope");
									for (int j = 0; j < scope; j++) {
										out.print("★");
									}
									%>
								</td>
							</tr>

							<%
								}
							%>

						</table>
						<script>
							$('.reviewGo').click(function(){
								location.href = "<%= contextPath %>/detail.re?rno="+$(this).children().val();
								console.log("<%= contextPath %>/detail.re?rno="+$(this).children().val());
							})
						</script>


					</div>
				</form>

			</div>
		</div>

		<div id="content_5" style="width: 100%;">
		<div class="paging-area" align="center">
	        <!-- 페이징 버튼 -->
	         <% if(currentPage != 1) { %>
	        <button onclick="location.href='<%= contextPath%>/reviewList.me?currentPage=<%= currentPage - 1%>'">&lt;</button>
	        <%} %>
	         <% for(int i =startPage; i <= endPage; i++) {%>
	         <%if(i != currentPage) {%>
	         
	         <!-- /jsp/list.bo?currentPage=8 -->
	         <button onclick="location.href='<%= contextPath%>/reviewList.me?currentPage=<%= i%>'"><%= i %></button>
	        <%}else {%>
	        <button disabled><%= i %></button>
	        <%} %>
	        <%} %>
	        
	        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
	        <%if(currentPage != maxPage) {%>
	        <button onclick="location.href='<%= contextPath%>/reviewList.me?currentPage=<%= currentPage + 1%>'">&gt;</button>
	        <%} %>
	        
	        <br><br>
       </div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>