<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ</title>
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
    table input, table textarea{
        float: left;
        margin: 8px 10px;
    }
    table tr{
        background-color: rgb(212, 212, 212);
    }
    table td{
        background-color: rgb(233, 233, 233);
    }
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 고객센터 > 도서 요청하기 
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/clientServiceSidebar.jsp" %>
        </div>
        <div id="content_2">
            <div id="client-inquiry">
                <h2 style="margin: 10px 0 0 20px; font-weight: bolder;">도서 요청하기</h2>
                <hr>
                <div align="center">
                	<% if(loginUser != null) { %>
                    <form action="<%= contextPath %>/insertRequest.cs" method="post">
                   		<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                        <table border="1" style="width: 90%; margin-top: 30px; text-align: center;" align="center">
                            <tr>
                                <th style="width: 90px;">아이디</th>
                                <td><input type="text" value="<%= loginUser.getUserId() %>" style="width:100px" readonly></td>
                            </tr>
                            <tr>
                                <th>책 제목</th>
                                <td><input type="text" name="title" style="width:300px" required></td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td><textarea name="content" id="" cols="80%" rows="10" required></textarea></td>
                            </tr>
                        </table>
                        <div class="enroll-btn">
                            <button class="btn" type="submit" style="background-color: rgb(120, 150, 50); color: white; float: right; margin: 20px 40px;">등록</button>
                            <br both="clear">
                        </div>
                    </form>
                    <% } else {  %>
                    	<p>로그인 후 이용하실 수 있습니다.</p>
                    <% } %>
                </div>
            </div>
        </div>

        <div id="content_4"></div>
        <br clear="both">

    </div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>