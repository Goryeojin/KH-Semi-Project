<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "com.readme.member.model.vo.Question" %>    
<% 
		Question q = (Question)request.getAttribute("q"); // : Object
	
		// n==> 글번호, 글제목, 글내용, 작성자 아이디, 작성일
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<title>나의문의 상세보기</title>
<style>



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
    #gobook{
        text-decoration: none;
        text-align: center;
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
    
        #ask {
      font-size: initial;
	color: white;
	background-color: rgb(120, 150, 50);
	height: 50px;
	width: 100px;
	text-align: center;

	border-radius: 6px;
	display : inline-block;


}
      	.gj{
	color : white;
	padding-top : 5px;
	
	};
	
	#zz > div {
	width :400px;
	float:left;
	display: inline-block;
	
	}
	
	#sjhg{
	margin-top:5px;
	
	
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
                <form action="">
                    <table border="1" align="center">
                  <thead>
                     <tr>
                        <th width="630" colspan="4" style="height: 40px; background-color: rgb(120, 150, 50); color: white;">리뷰</th>
                     </tr>
                  </thead>
                        <tbody>
                          <tr>
                                <th>제목</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= q.getqTitle() %></p></td>
                                <th>작성일</th>
                                <td><p style="margin: 4px 0 0 20px;"><%= q.getqDate() %></p></td>
                            </tr>
                              <tr>
                                <td colspan="4" style="text-align: center;">
                                    <p style="height: 400px; padding: 20px 30px;"><%= q.getqAnswer() %></p>
                                </td>
                            </tr>
                        </tbody>

                    </table>
                    <div id="zz">
                   <div id="ask" class="btn btn-sm" style="padding-top : 11px"><a href="<%= contextPath %>/inquiryList.me?currentPage=1" class="gj">목록으로</a></div>
                   <div id="ask" class="sjhg" style="padding-top: 11px; margin:0;"><a href="<%= contextPath %>/deleteinquiry.me?qno=<%=q.getqNo() %>" class="gj">삭제하기</a></div>
                	</div>
                </form>
            </div>

        </div>
        <div id="content_4"></div>
        <br clear="both">
    </div>
   <%@ include file="../common/footer.jsp" %>
</body>
</html>