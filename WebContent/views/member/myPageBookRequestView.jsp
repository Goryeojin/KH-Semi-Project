<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.readme.member.model.vo.Request,  com.readme.common.model.vo.PageInfo" %>
<%
		ArrayList<Request> list = (ArrayList<Request>)request.getAttribute("list"); // : Object
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>Document</title>
    <style>
        body { margin: 0;}
        div{
        /* border : 1px solid red; */
        box-sizing : border-box;
    }
    .wrap{
        min-width: 1190px;
    }
    .wrap>div{width:100%;}

    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
        
    }

    #content_1{
        width: 17%;
        
       float: left;
    }
    #content_2{
        width: 82%;
        clear: both;
    }
    #content_1, #content_2{
        display: inline-block;
        height: 1000px;
    
    }
    #content_3{
        height: 70px;
        width: 99%;
    
    }


    #dataBtn > .dateBtn{
            display: inline-block;
        }


        .dateBtn{
            border: 1px solid gray;
            border-radius: 2px;
            text-align: center;
            float: left;
        }

      #dateBox{
        text-align: left;

      }

      #yymmdd1{
        margin-left: 30px;
        height: 50px;
      }
      #yymmdd2{
        height: 50px;
      }

      #today, #week, #month, #year{
        
        width: 60px;
        height: 50px;
        padding-top: 10px;
      }
  
      #jh{
        width: 60px;
        height: 50px;
        margin-right : 300px;
        padding-top: 10px;
        text-align: center;
        float: right;
        border: 1px solid gray;
      }


      /*
      데이트 박스 끝
      */

      #ask{
          color : white;
          background-color:rgb(120, 150, 50);
          height : 50px;
          width : 100px;
          text-align: center;
          padding-top : 12px;
          border-radius: 6px;

      }
      .list-area{
          margin-left : 0;
          border : 1px solid black;
          text-align: center;
          width : 900px;
          height : 150px;
      }

      .list-area > table > th, td, th{

        border : 1px solid black;
      }

      .list-area > thead{
        background-color:rgb(120, 150, 50);
        color : white;
      }
    
	
	       #pageCategory_bar{
            width: 100%;
            height: 70px;  
            padding: 15px 10px 10px 53px;
            font-size: 17px; 
            box-sizing: border-box;
        }
    
    
    /* 여기서부터 요청내역 */
          .list-area{
          margin-left : 30px;
          border : 1px solid black;
          text-align: center;
          width : 900px;
          height :220px;
      }

      #dyn{
          margin-left : 30px;
      }

      .list-area > table > th, td, th{

        border : 1px solid black;
      }

      .list-area > thead{
        background-color:rgb(120, 150, 50);
        color : white;
      }
      


      #ask{

          margin-top: 20px;
          color : white;
          background-color:rgb(120, 150, 50);
          height : 50px;
          width : 100px;
          text-align: center;
          padding-top : 8px;
          border-radius: 6px;

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
           margin-left: 340px;
           margin-top: 10px;
       }

    .buttonnum{
        margin-left: 0px;
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
        margin-left: 0px;
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
		
		<%@ include file="../common/menubar.jsp" %>

        <div id="content">
          <div id="content_3">
				  <div id="pageCategory_bar">
      				  <a href="">🏠︎ HOME </a> > 마이페이지 > 도서 요청 내역
   					 </div>
			</div>
          <div id="content_1">
			<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
            <div id="content_2">

                
    <h1 id="dyn">도서 요청 내역</h1>
    <hr>
    <table class="list-area">
        <thead>
            <tr>
                <th width="30">번호</th>
                <th width="80">작성일자</th>
                <th width="100">책 이름</th>
                <th width="300">요청내역</th>
                <th width="50">요청현황</th>
            </tr>
        </thead>
        	<tbody>
			<!-- 공지사항 하나도 존재하지 않을 경우 -->
			<!-- 리스트가 비어있을 경우 -->
			<%if(list.isEmpty()) { %>
			<tr>
				<td colspan="5">도서 요청 내역이 없습니다.</td>
			</tr>
			<% } else { %> <!--  리스트가 차있을경우 -->
			<!-- 공지사항 존재할 경우-->
				<!--  향상된 포문  -->
				<% for(Request r : list) { %>
				<tr>
					<td><%= r.getRequestNo() %></td>
					<td><%= r.getRequestDate() %></td>
					<td><%= r.getRequestTitle() %></td>
					<td><%= r.getRequestContent() %></td>
					<td><%= r.getStatus() %></td>
				</tr>
				
				<% } %>
			<% } %>
		</tbody>
		
		<!--         
        <tbody>
            <tr>
                <td width="30">1</td>
                <td width="80">2022.01.01</td>
                <td width="100">김관민, 잘생김의 비결</td>
                <td width="300">제발 넣어주세요ㅕ</td>
                <td width="50">미완료</td>
            </tr>
            <tr>
                <td width="30">2</td>
                <td width="80">2022.01.16</td>
                <td width="100">김관민, 잘생김의 비결</td>
                <td width="300">읽어도 안되는건 안다구요</td>
                <td width="50">미완료</td>
            </tr>
            <tr>
                <td width="30">3</td>
                <td width="80">2022.01.17</td>
                <td width="100">김관민, 잘생김의 비결</td>
                <td width="300">제발요</td>
                <td width="50">미완료</td>
            </tr>
            <tr>
                <td width="30">4</td>
                <td width="80">2022.01.18</td>
                <td width="100">김관민, 잘생김의 비결</td>
                <td width="300">ㅠㅠ</td>
                <td width="50">미완료</td>
            </tr>
            <tr>
                <td width="30">5</td>
                <td width="80">2022.01.19</td>
                <td width="100">김관민, 잘생김의 비결</td>
                <td width="300">ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</td>
                <td width="50">미완료</td>
            </tr>
        </tbody>
         -->
         
    </table>
      


  	<div class="paging-area">
        <!-- 페이징 버튼 -->
         <% if(currentPage != 1) { %>
        <button onclick="location.href='<%= contextPath%>/requestList.me?currentPage=<%= currentPage - 1%>'">&lt;</button>
        <%} %>
         <% for(int i =startPage; i <= endPage; i++) {%>
         <%if(i != currentPage) {%>
         
         <!-- /jsp/list.bo?currentPage=8 -->
         <button id="pg<%= i %>" onclick="location.href='<%= contextPath%>/requestList.me?currentPage=<%= i%>'"><%= i %></button>
        <%}else {%>
        <button disabled><%= i %></button>
        <%} %>
        <%} %>
        
        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%= contextPath%>/requestList.me?currentPage=<%= currentPage + 1%>'">&gt;</button>
        <%} %>
        
      
       </div>

        </div>
        </div>
   
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>