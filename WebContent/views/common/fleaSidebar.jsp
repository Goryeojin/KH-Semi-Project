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
        height: 80px;
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
            📚 중고장터
        </div>
        <div id ="category_list">
            <li><a href="<%= request.getContextPath() %>/sellBook.fl?currentPage=1" style="color: black;">판매</a></li>
            <li><a href="<%= request.getContextPath() %>/buyBook.fl?currentPage=1" style="color: black;">구매</a></li>
        </div>
      </div>
</body>
</html>