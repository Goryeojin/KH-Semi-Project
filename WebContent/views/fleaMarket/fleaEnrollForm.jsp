<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고장터 글작성하기</title>
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
        height: auto;
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
    #reply-table td{
        padding: 5px 8px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 중고장터 > 등록
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/fleaSidebar.jsp" %>
        </div>
        <div id="content_2" align="center">
            <div id="리뷰수정할거임" align="center" style="height: 960px; width: 780px;">
                <form action="<%= contextPath %>/insert.fl" method="post" enctype="multipart/form-data">
                    <table border="1" align="center">
                            <thead>
                                <tr>
                                    <th colspan="4" style="height: 40px; background-color: rgb(120, 150, 50); color: white;">중고장터</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th width="170">제목</th>
                                    <td colspan="3" width="630" style="text-align: left;"><input type="text" name="title" size="67" style="margin: 4px 0 0 20px;" required></td>
				                    <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                                </tr>
                                <tr>
                                    <th>가격</th>
                                    <td width="300"><input type="text" style="margin: 4px 0 0 20px;" name="price" required> 원</td>
                                    <th>카테고리</th>
                                    <td>
                                        <select name="type" id="" style="margin: 4px 0 0 20px;" required>
                                            <option value="1">판매</option>
                                            <option value="2">구매</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td colspan="3"><input type="file" id="file" name="file" style="margin: 4px 0 0 20px;" required></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="text-align: center;">
                                        <div style="height: auto; margin: 20px 30px;" align="center">
                                            <textarea name="content" id="" cols="94" rows="30" style="margin-top: 20px; resize:none">
                                            </textarea>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                    </table>
                    <button style="margin: 5px 60px 0 0;" type="button" onclick="history.back();">목록으로</button>
                    <button style="margin: 5px 10px 0 0;" type="submit">작성하기</button>
                </form>
            </div>

        </div>
        <div id="content_4"></div>
        <br clear="both">
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>