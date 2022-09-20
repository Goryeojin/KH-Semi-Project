<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #category {
    	margin : auto;
        /*margin-top: 30px;
        margin-left: 10px;*/
        width: 220px;
        height: auto;
    }

    #category_title{
        width: 220px;
        height: 50px;
        background-color: rgb(120, 150, 50);
        text-align: left;
        padding-top: 13px;
        padding-left: 5px;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
    }
    #category_list{
        width: 220px;
        height: 125px;
        background-color: rgb(224, 220, 220);
        text-align: left;
        font-size: 16px;
        padding-left: 10px;
        padding-top: 8px;
    }
    #category_list li:hover{
        font-weight: 600;
        cursor: pointer;   
    }

    #category_list li{
        margin-bottom: 4px;
    }

    #content_1_categorytitle{
        margin-top: 30px;
        margin-left: 50px;
        width: 800px;
        font-size: 40px;
        font-weight: 800;
        text-align: left;
    }
</style>
</head>
<body>
      <div id ="category">
        <div id = "category_title">
            📚 고객센터
        </div>
        <div id ="category_list">
            <li><a href="<%= request.getContextPath() %>/faq.cs" style="color: black;">FAQ</a></li>
            <li><a href="<%= request.getContextPath() %>/noticeList.cs?currentPage=1" style="color: black;">공지사항</a></li>
            <li><a href="<%= request.getContextPath() %>/inquiry.cs" style="color: black;">1:1 문의하기</a></li>
            <li><a href="<%= request.getContextPath() %>/request.cs" style="color: black;">도서 요청하기</a></li>
        </div>
      </div>
</body>
</html>