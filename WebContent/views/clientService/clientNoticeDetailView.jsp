<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.readme.clientService.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 공지사항</title>
<style>
    button{
        float: right;
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

    #content_5{
        height:150px;
    }
    .paging-area{
        margin-left: 230px;
        margin-top: 30px;
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
    table{
        text-align: center;
    }
    table td{
        /* margin-left: 20px; */
        text-align: left;
    }
    table tr{
        height: 50px;
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
            <div style="width: 900px;">
                <h2 style="margin: 10px 0 0 20px; font-weight: bolder;">공지사항</h2>
                <hr>
                <table border="1" align="center">
                    <thead>
                        <tr>
                            <th colspan="4" style="height: 30px; background-color: rgb(120, 150, 50); color: white;">공지사항 자세히보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th width="170">제목</th>
                            <td colspan="3" width="630" style="text-align: left;"><p style="margin: 4px 0 0 20px;"><%= n.getNoticeTitle() %></p></td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><p style="margin: 4px 0 0 20px;"><%= n.getNoticeWriter() %></p></td>
                            <th>조회수</th>
                            <td><p style="margin: 4px 0 0 20px;"><%= n.getCount() %></p></td>
                        </tr>
                        <tr>
                            <th>작성일</th>
                            <td colspan="3"><p style="margin: 4px 0 0 20px;"><%= n.getNoticeDate() %></p></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center;">
                                <p style="height: 500px; padding: 20px 30px;"><%= n.getNoticeContent() %></p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button style="margin: 5px 60px 0 0;" onclick="listgo();">목록으로</button>
                </div>
                
                <script>
                	function listgo(){
                		location.href="<%= request.getContextPath() %>/noticeList.cs?currentPage=1";
                	}
                </script>
        </div>

        <div id="content_4"></div>
        <br clear="both">

    </div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>