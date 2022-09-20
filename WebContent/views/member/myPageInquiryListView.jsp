<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.readme.member.model.vo.Question,  com.readme.common.model.vo.PageInfo" %>
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
	 PageInfo pi = (PageInfo)session.getAttribute("pi");

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

<title>Document</title>
<style>
body {
	margin: 0;
}

div {
	/*   border : 1px solid red; */
	box-sizing: border-box;
}

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
	width: 17%;
	float: left;
}

#content_2 {
	width: 82%;
	clear: both;
}

#content_1, #content_2 {
	display: inline-block;
	height: 1000px;
}

#content_3 {
	height: 70px;
	width: 99%;
}

#dataBtn>.dateBtn {
	display: inline-block;
}

.dateBtn {
	margin-left: 10px;
	border: 1px solid gray;
	border-radius: 2px;
	text-align: center;
	float: left;
}

#dateBox {
	text-align: left;
}

#yymmdd1 {
	margin-left: 30px;
	height: 50px;
}

#yymmdd2 {
	height: 50px;
}

#today, #week, #month, #year {
	width: 60px;
	height: 50px;
	padding-top: 10px;
	background-color: rgb(120, 150, 50);
	border-radius: 6px;
	color: rgb(255, 255, 255);
}

#jh {
	width: 60px;
	height: 50px;
	margin-right: 250px;
	padding-top: 10px;
	text-align: center;
	float: right;
	border: 1px solid gray;
	background-color: rgb(120, 150, 50);
	border-radius: 6px;
	color: rgb(255, 255, 255);
}

#today:hover, #week:hover, #month:hover, #year:hover {
	cursor: pointer;
	background-color: gray;
}

#jh:hover {
	cursor: pointer;
	background-color: gray;
}

#today {
	margin-left: 30px;
}

/*
      데이트 박스 끝
      */
#ask {
	color: white;
	background-color: rgb(120, 150, 50);
	height: 50px;
	width: 100px;
	text-align: center;
	padding-top: 12px;
	border-radius: 6px;
}

.list-area {
	margin-left: 30px;
	border: 1px solid black;
	text-align: center;
	width: 900px;
	height: 300px;
}

.list-area>table>th, td, th {
	border: 1px solid black;
}

.list-area>thead {
	background-color: rgb(120, 150, 50);
	color: white;
}

#pageCategory_bar {
	width: 100%;
	height: 70px;
	padding: 15px 10px 10px 53px;
	font-size: 17px;
	box-sizing: border-box;
}

#dyn {
	margin-left: 30px;
}



    button{
        margin: 100px;
        height: 38px;
        border-radius: 5px;
        color: white;
        background-color: rgb(120, 150, 50);
        border : white;
    }
    button:hover{
        background-color: rgb(233, 233, 233);
        color: rgb(120, 150, 50);
    }

    .paging-area{
           margin-left: 0px;
           margin-bottom: 50px;
       }

    .buttonnum{
        margin-left: 20px;
    }
    .paging-area{
        margin-left: 24px;
        margin-top: 15px;
    }
    .paging-area button{
        margin: 6px;
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

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

	<div id="content">
		<div id="content_3">
			<div id="pageCategory_bar">
				<a href="">🏠︎ HOME </a> > 마이페이지 > 룰루
			</div>
		</div>
		<div id="content_1">
			<%@ include file="../common/myPageSidebar.jsp"%>
		</div>
		<div id="content_2">


			<h1 id="dyn">나의 문의 내역</h1>

			<hr>

			<form action="">
				<div id="dateBox">
					<br>
					<div id="dateBtn">
						<div id="today" class="dateBtn">오늘</div>
						<div id="week" class="dateBtn">1주일</div>
						<div id="month" class="dateBtn">1달</div>
						<div id="year" class="dateBtn">1년</div>
					</div>



					<input type="date" id="yymmdd1"> ~ <input type="date"
						id="yymmdd2">
					<div id="jh">조회</div>
					<br> <br>
				</div>

				<hr>

			</form>


			<script>
				$(function() {

					// 날짜 조회생성 스크립트

					// yy-mm-dd 형식으로 만들어야만 input date에 넣을수 있음
					// 앞에 0 추가하고 slice를 통해 앞에 2자리만 받아서 형식을 만들어줌
					// 전역변수로 만들어주면 처음 누르고 2번째 누를때 값이 변경되서
					// 오류가 발생하기 때문에 전역변수로 사용 x

					$('#today').click(
							function() {

								var today = new Date();
								var year = today.getFullYear();
								var month = today.getMonth() + 1;
								day = today.getDate();
								var yymmddToday = year + "-"
										+ (("0" + month.toString()).slice(-2))
										+ "-"
										+ (("0" + day.toString()).slice(-2));

								$('#yymmdd1').val(yymmddToday);
								$('#yymmdd2').val(yymmddToday);

							})

					$('#week')
							.click(
									function() {

										var today = new Date();
										var year = today.getFullYear();
										var month = today.getMonth() + 1;
										var day = today.getDate();
										var yymmddToday = year
												+ "-"
												+ (("0" + month.toString())
														.slice(-2))
												+ "-"
												+ (("0" + day.toString())
														.slice(-2));

										$('#yymmdd2').val(yymmddToday);

										// 오늘 날짜부터 먼저 출력하게 해준 다음에 가공을함 그래야 당일 출력 가능

										yymmddToday = yymmddToday.split("-");
										var changeDate = new Date();
										changeDate.setFullYear(yymmddToday[0],
												yymmddToday[1] - 1,
												yymmddToday[2] - 6);
										var y = changeDate.getFullYear();
										var m = changeDate.getMonth() + 1;
										var d = changeDate.getDate();
										if (m < 10) {
											m = "0" + m;
										}
										if (d < 10) {
											d = "0" + d;
										}
										changeDate = y + "-" + m + "-" + d;

										// 오늘 날짜부터 먼저 출력하게 해준 다음에 가공을함 그래야 당일 출력 가능
										// split으로 나누고 날짜형식으로 빼주고 9이하일경우 0붙여주고 
										// yy-mm-dd 형식으로 다시 만들어준 후에 6일전(~7일) 출력

										$('#yymmdd1').val(changeDate);

									})

					$('#month').click(
							function() {

								var today = new Date();
								var year = today.getFullYear();
								var month = today.getMonth() + 1;
								var day = today.getDate();
								var yymmddToday = year + "-"
										+ (("0" + month.toString()).slice(-2))
										+ "-"
										+ (("0" + day.toString()).slice(-2));

								$('#yymmdd2').val(yymmddToday);

								yymmddToday = yymmddToday.split("-");
								var changeDate = new Date();
								changeDate
										.setFullYear(yymmddToday[0],
												yymmddToday[1] - 1,
												yymmddToday[2] - 29);
								var y = changeDate.getFullYear();
								var m = changeDate.getMonth() + 1;
								var d = changeDate.getDate();
								if (m < 10) {
									m = "0" + m;
								}
								if (d < 10) {
									d = "0" + d;
								}
								changeDate = y + "-" + m + "-" + d;

								$('#yymmdd1').val(changeDate);

							})

					$('#year').click(
							function() {

								var today = new Date();
								var year = today.getFullYear();
								var month = today.getMonth() + 1;
								var day = today.getDate();
								var yymmddToday = year + "-"
										+ (("0" + month.toString()).slice(-2))
										+ "-"
										+ (("0" + day.toString()).slice(-2));

								$('#yymmdd2').val(yymmddToday);

								// 오늘 날짜부터 먼저 출력하게 해준 다음에 가공을함 그래야 당일 출력 가능

								yymmddToday = yymmddToday.split("-");
								var changeDate = new Date();
								changeDate.setFullYear(yymmddToday[0],
										yymmddToday[1] - 1,
										yymmddToday[2] - 364);
								var y = changeDate.getFullYear();
								var m = changeDate.getMonth() + 1;
								var d = changeDate.getDate();
								if (m < 10) {
									m = "0" + m;
								}
								if (d < 10) {
									d = "0" + d;
								}
								changeDate = y + "-" + m + "-" + d;

								$('#yymmdd1').val(changeDate);

							})

					$('.list-area tr:gt(0)').hide();
					
					$('#jh').click(function() {
						
						$('.list-area tr:gt(0)').hide();

						var btn1 = $('#yymmdd1').val();
						var btn2 = $('#yymmdd2').val();

						var min = btn1;
						var max = btn2;



						// var dayday = $('.askdate').eq(1).text();
					
					
							
						
						var arrdayday = new Array(); 
							
						
						
					
						
						
						for (var i = 0; i < 5; i++) {
								
							arrdayday[i] = $('.askdate').eq(i).text();
							
							console.log(arrdayday[i]);
							
							var date = arrdayday[i];
							
							var key = "tr" + i;
							
						
					
							if(min <= date && date <= max) {


								$('.' + key).show();
							
								
								
							}
							

						}

					})
					
					
					
					

				})
			</script>






			<br>



			<div id="askbutton" align="right" style="width: 930px;">
			
				<a href="<%= contextPath %>/inquiryForm.me" class="btn btn-sm" id="ask">문의하기</a>

			</div>
			
			<br>
			
			
			
			<table class="list-area">
				<thead>
					<tr>
						
						<th width="40">글번호</th>
						<th width="100">날짜</th>
						<th width="150">제목</th>
						<th width="50">처리여부</th>
					</tr>
				</thead>
				<tbody>
		
					<% for(int i=0; i<list.size(); i++){ %>
						<tr class="tr<%= i %>">
							
							<td width="40"><%= list.get(i).getqNo() %></td>
							<td width="100" class="askdate"><%= list.get(i).getqDate() %></td>
							<td width="150"><%= list.get(i).getqTitle() %></td>
							<td width="50"><%= list.get(i).getqStatus() %></td>
						</tr>
					<% } %>
					
					<!-- 
					<tr class="tr1">
						<td width="30"><input type="checkbox"></td>
						<td width="40">2</td>
						<td width="100" class="askdate">2022-01-20</td>
						<td width="150">제육vs돈까스</td>
						<td width="50">N</td>
					</tr>

					
					<tr class="tr2">
						<td width="30"><input type="checkbox"></td>
						<td width="40">3</td>
						<td width="100" class="askdate">2022-01-01</td>
						<td width="150">1</td>
						<td width="50">N</td>
					</tr>
					<tr class="tr3">
						<td width="30"><input type="checkbox"></td>
						<td width="40">3</td>
						<td width="100" class="askdate">2021-01-28</td>
						<td width="150">ㅠㅠ</td>
						<td width="50">N</td>
					</tr>
					<tr class="tr4">
						<td width="30"><input type="checkbox"></td>
						<td width="40">3</td>
						<td width="100" class="askdate">2021-01-17</td>
						<td width="150">ㅠㅠ</td>
						<td width="50">N</td>
					</tr>
					  -->
				</tbody> 
			</table>

	<div class="paging-area">
        <!-- 페이징 버튼 -->
         <% if(currentPage != 1) { %>
        <button onclick="location.href='<%= contextPath%>/inquiryList.me?currentPage=<%= currentPage - 1%>'">&lt;</button>
        <%} %>
         <% for(int i =startPage; i <= endPage; i++) {%>
         <%if(i != currentPage) {%>
         
         <!-- /jsp/list.bo?currentPage=8 -->
         <button id="pg<%= i %>" onclick="location.href='<%= contextPath%>/inquiryList.me?currentPage=<%= i%>'"><%= i %></button>
        <%}else {%>
        <button disabled><%= i %></button>
        <%} %>
        <%} %>
        
        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%= contextPath%>/inquiryList.me?currentPage=<%= currentPage + 1%>'">&gt;</button>
        <%} %>
        
      
       </div>


	<script>

		$(function(){

			$(".list-area>tbody>tr").click(function(){

				// 클릭했을때 해당 공지사항의 번호를 넘기자 
				// 해당 tr태그의 자손 중에서도 첫번쨰 td값이 중요함 ( 내용물을 뽑자 )
				qno = $(this).children().eq(0).text(); // 글번호
				
				
				location.href="<%=contextPath%>/detail.me?qno=" + qno;
				
			})
		})
	</script>

		</div>
	</div>
	
	

	

	<%@ include file="../common/footer.jsp"%>

</body>
</html>