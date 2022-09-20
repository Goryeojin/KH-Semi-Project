<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.util.ArrayList, com.readme.book.model.vo.Book " %>
   <%
   		ArrayList<Book> categoryList = (ArrayList<Book>)session.getAttribute("categoryList");
   	
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title class="category">카테고리</title>
 <style>
    /* 컨텐츠 부분 */
    /*컨텐츠 기본 틀 시작*/
    
    div{
    	/*border : 1px solid red;*/
    }
    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
    }
    #content_2{
        height: 1000px;
    }
    #content_1{
        height:600px;
        border-bottom: 2px solid gray;
    }

    #content_1 div{
        float: left;
    }

    #content_1_img{
        margin-left: 200px;
        margin-top: 30px;
    }
    #content_1_text{
        text-align: left;
        margin-top: 30px;
        margin-left: 60px;
        width: 300px;
        height: 330px;
    }
    #content_1_text h6{
        font-size: 18px;
    }
    #content_1_text h4,h6{
        margin-bottom: 20px;
    }
    #content_3 div{
        float: left;
    }

    /*컨텐츠 기본 틀 끝*/
    /*컨텐츠 1 시작*/

    #category {
        margin-top: 30px;
        margin-left: 10px;
        width: 220px;
        height: 480px;
    }
    
    #content_2_star{
    	margin-left:18px;
    }
    #content_2_star h5{
    	color : deepskyblue;
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
        height: 430px;
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
    
    #category_list>li>a{
        text-decoration: none;
        color: black;
    }

    #content_1_categorytitle{
        margin-top: 30px;
        margin-left: 50px;
        width: 800px;
        font-size: 40px;
        font-weight: 800;
        text-align: left;
    }
    #readme{
        text-align: left;
        font-size: 25px;
        font-weight: 600;
        margin-left: 50px;
        width: 800px;
        height: 50px;
        margin-top: px;
    }

    /* 컨텐츠 1 끝*/
    /* 컨텐츠 2 시작*/


    #content_2 div{
        float: left;
    }

    .content_2_while{
        width: 555px;
        height: 500px;
        margin-top: 60px;
        margin-left: 60px;
    }
    .content_2_title{
        width: 555px;
        height: 50px;
        font-size: 35px;
        font-weight: 600;
        text-align: left;
    }

    .content_2_img{
        margin-top: 50px;
    }
    .content_2_text{
        text-align: left;
        margin-left: 17px;
        width: 270px;
        height: 300px;
    }

    .content_2_text h6{
        font-size: 18px;
    }

    .content_2_text h4,h6{
        margin-bottom: 20px;
    }

    /* 컨텐츠 2 끝*/
    #content_3{
        height:150px;
    }
    #pageCategory_bar{
        width: 100%;
        height: 70px;  
        font-size: 17px;
        font-weight: 600; 
        box-sizing: border-box;
        text-align: left;
    }

    #pageCategory_bar a{
        font-size: 20px;
    }

    #content_3 div{
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

</style>
</head>
<body>


<%@ include file="../common/menubar.jsp" %>









<div id="content">
    <div id="pageCategory_bar">
        <a href="">🏠︎ HOME </a> > 카테고리 > <b class="category">역사</b> 
    </div>
  <div id="content_1">
      <div id ="category">
        <div id = "category_title">
            📚 카테고리
        </div>
        <div id ="category_list">
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=1">소설</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=2">시/에세이</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=3">경제/경영</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=4">자기개발</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=5">인문</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=6">역사/문화</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=7">종교</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=8">정치/사회</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=9">과학</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=10">기술/공학</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=11">컴퓨터/IT</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=12">예술</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=13">건강</a></li>
            <li><a href ="<%= contextPath %>/listCategory.bo?gno=14">어린이</a></li>
        </div>
      </div>
      <div id="content_1_categorytitle">
          <p><%= categoryList.get(0).getGnereName() %></p>
      </div>
      
      <div id="content_1_img" class="book_go" style="cursor: pointer;">
          <img src="<%= contextPath %>/resources/book_upfiles/<%= categoryList.get(0).getBookNo() %>.jpg" alt="" width="300px" height="370px" >
          </div>
         <div id = "content_1_text" class="book_go" style="cursor: pointer;">
          <h4 style="font-weight: 600;"><%= categoryList.get(0).getTitle() %></h4>
          <h6 style="font-weight: 600;"><%= categoryList.get(0).getAuthor() %> 저 | <%= categoryList.get(0).getPublisher() %></h6>
          <p>
      		<%= categoryList.get(0).getIntro() %>
          
          </p>
          
          <h6 style="font-weight: 600;">평균 별점 ★ : <%= categoryList.get(0).getScope() %></h6>
            
         </div>

         <script>
             $('.book_go').click(function(){
                 location.href = "<%= contextPath %>/detail.bo?bno=<%= categoryList.get(0).getBookNo() %>";
             })
         </script>
    </div>
    
    <div id="content_2">
    <% for(int i =1; i < categoryList.size(); i++) { %>
        <div class = "content_2_while">
        <div class="content_2_img<%=i %>" style="cursor: pointer;">
            <img src="<%= contextPath %>/resources/book_upfiles/<%= categoryList.get(i).getBookNo() %>.jpg" alt="" width="260px" height="370px">
            </div>
           <div class = "content_2_text" style="cursor: pointer;">
            <h4 style="font-weight: 600;"><%= categoryList.get(i).getTitle() %></h4>
            <h6 style="font-weight: 600;"><%= categoryList.get(i).getAuthor() %> 저 | <%= categoryList.get(i).getPublisher() %></h6>
            <p>
             <%= categoryList.get(i).getIntro() %>
              
            </p>
           
           </div>
           <div id = "content_2_star">
            <h6 style="font-weight: 600;">평균 별점 ★ : <%= categoryList.get(i).getScope() %></h6>
            </div>
        </div>
        <script>
            $(function(){
                var category = "<%= categoryList.get(i).getGnereName() %>";
                console.log(category);
                $('.category').text(category);
            })
        </script>
         <script>
                $('.content_2_img<%=i %>').click(function(){
                	   location.href = "<%= contextPath %>/detail.bo?bno=<%= categoryList.get(i).getBookNo() %>";
                })
                
       </script>
        
<%} %>
        
        
       
    </div>
 
    
    <div id="content_3"><br>
	</div>

</div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>