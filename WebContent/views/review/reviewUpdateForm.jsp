<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.readme.review.model.vo.Review" %>
<%
	Review re = (Review)request.getAttribute("re");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<meta charset="UTF-8">
<title>리뷰수정화면</title>
<style>
    /* ㄹ고려진 */
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
    button{
        float: right;
        /* margin-right: 10px; */
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3"></div>
        <div id="content_1"></div>
        <div id="content_2">
            <div id="리뷰수정할거임" align="center" style="height: 960px;">
                <form action="<%= contextPath %>/update.re" method="post">
                    <input type="hidden" name="userNo" value="<%= re.getUserNo() %>">
                    <input type="hidden" name="bno" value="<%= re.getBookNo() %>">
                    <input type="hidden" name="rno" value="<%= re.getReviewNo() %>">
                    <table border="1" align="center" style="margin: 0px;">
						<thead>
							<tr>
								<th colspan="4" style="height: 40px; background-color: rgb(120, 150, 50); color: white;">리뷰 수정</th>
							</tr>
						</thead>
                        <tbody>
                            <tr>
                                <th width="170">제목</th>
								<td colspan="3" width="630" style="text-align: left;"><input type="text" name="reviewTitle" size="67" style="margin: 4px 0 0 20px;" value="<%= re.getReviewTitle() %>" required></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= re.getReviewWriter() %></p></td>
                                <th>작성일</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= re.getReviewDate() %></p></td>
                            </tr>
                            <tr>
                                <th>별점</th>
                                <td>
                                    <input type="hidden" id="scope" name="scope">
                                    <div class="make_star">
                                        <div class="rating">&nbsp;&nbsp;&nbsp;
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>	
                                        </div>
                                    </div>
                                </td>
                                <script>
                                    $(function(){
                                        $('#scope').val(<%= re.getReviewScope() %>);
                                        $('.make_star svg').css({color : '#000'});
                                        $('.make_star svg:nth-child(-n'+<%= re.getReviewScope() %>+')').css({color : 'rgb(130, 150, 50'});
                                        
                                        $('.make_star svg').click(function(){
                                            var targetNum = $(this).index() + 1;
                                            $('.make_star svg').css({color : '#000'});
                                            $('.make_star svg:nth-child(-n'+targetNum+')').css({color : 'rgb(130, 150, 50'});
                                            $('#scope').val(targetNum);
                                    });
                                    })
                                </script>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: center;">
                                    <textarea name="reviewContent" id="" cols="90" rows="30" style="margin-top: 20px; resize: none" required>
                                        <%= re.getReviewContent() %>
                                    </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button style="margin: 5px 60px 0 0;" type="button" onclick="history.back();">취소</button>
                    <button style="margin: 5px 10px 0 0;" type="submit">수정하기</button>
                </form>
            </div>
        </div>
        <div id="content_4"></div>
        <br clear="both">
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>