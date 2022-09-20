<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList, com.readme.book.model.vo.Book, com.readme.common.model.vo.PageInfo, com.readme.book.model.vo.Wish " %>
    <%@ page import = "com.readme.review.model.vo.Review" %>
     
    <%
    	
    	Book b = (Book)session.getAttribute("b");
    	ArrayList<Review> reviewB = (ArrayList<Review>)session.getAttribute("reviewB");
        Wish w = (Wish)session.getAttribute("w");
		PageInfo pi = (PageInfo)session.getAttribute("pi");
    	
    	// 페이징바 만들 때  필요한 변수 미리 셋팅
    	int currentPage = pi.getCurrentPage();
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage();
    	int maxPage = pi.getMaxPage();
    	
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= b.getTitle() %>-리뷰전체보기</title>
<style>
    /* 컨텐츠 부분 */
    /*컨텐츠 1 시작*/
    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
    }
    #content_2{
        padding-bottom: 40px;
        padding-left: 150px;
        border-bottom: 2px solid gray;
    }
    #content_1{
        height:520px;
        border-bottom: 2px solid gray;
    }
    #content_1 div{
        float: left;
    }
    
    #content_1_img{
        margin-left: 150px;
        margin-top: 30px;
    }
    #content_1_text{
        text-align: left;
        margin-top: 70px;
        margin-left: 50px;
    }

    .content_1_h5{
        margin-top: 50px;
    } 
    #content_1_heart{
        margin-top: -33px;
        margin-left: 300px;
    }
    #content_1_heart h5{
        word-spacing:20px
    }
    #content_1_text h2,h3,h4,h5{
        margin-left: 20px;
        margin-top: 30px;
    }
    #content_1_text h1{
        margin-bottom: 120px;
        font-size: 50px;
    }
    
    #content_3{
        height:1500px;
        
    }
    #content_3 div{
        float: left;
    }
    
    .content_3_while div{
        float: left;
    }
    .content_3_while{

        margin-top: 70px;
        margin-left: 80px;
        width: 300px;
        height: 360px;
        background-color: rgb(120, 150, 50);
        border-radius: 10px;
        
    }
    .content_3_third div{
        float: left;
    }
    
    .content_3_third{
        border-top: 2px solid rgb(62, 76, 28);
        width: 300px;
        height:40px;
        padding-top: 10px;
        padding-bottom:50px;
    }
    .content_3_thumb{
        text-align: left;
        padding-left: 15px;
        width: 80px;
        height:40px;
    }
    .content_3_thumbp{
        text-align: left;
        width: 50px;
        height:40px;
        font-size: 20px;
    }
    .content_3_first{
        border-bottom: 2px solid rgb(62, 76, 28);
        border-top: 2px solid rgb(62, 76, 28);
        width: 300px;
        height: 40px;
        font-size: 20px;
    }
    .content_3_userId{
        padding-left: 10px;
        width: 140px;
        text-align: left;
        
    }
    .content_3_star{
        width: 150px;
        text-align: right;
    }
    .content_3_text{
        font-size: 16px;
        padding-top: 27px;
        padding-bottom: 50px;
    }
    #content_3 a{
        float: right;
    }
    
    #review{
        margin-top: 100px;
        margin-right: 100px;
        background-color: rgb(120, 150, 50);
        width: 220px;
        height: 65px;
        font-size: 20px;
        padding-top: 16px;
        color: rgb(255, 255, 255);
        font-weight: 600;
        border-radius: 7px;
    }

    /*컨텐츠 3끝*/

    #content_4{
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


    .paging-area{
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
      /* 수정 사항 */
      #content_1_h52{
        display: none;
    }
    
    #content_3_review{
    	margin-left : 500px;
    	margin-top : 100px;
    	color : rgb(120,150,50);
    	
    }
    
    
     #review_btn{
      margin-left:990px;
        margin-top: 80px;
        margin-bottom: 50px;
    }

    #review_btn a:hover{
        text-decoration: none;
        color: rgb(62, 76, 28);
    }
    
    .review{
        
        
        background-color: rgb(120, 150, 50);
        
        padding: 15px 15px 15px 15px;
        font-size: 18px;
        color: rgb(255, 255, 255);
        font-weight: 600;
        border-radius: 10px;
    }
    
    

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id= "content">
        <div id="content_1">
            <div id="pageCategory_bar">
                <a href="<%= contextPath %>">🏠︎ HOME </a> > 카테고리 > <%=b.getGnereName() %>
            </div>
            <div id="content_1_img">
                <img src="<%= contextPath %>/resources/book_upfiles/<%= b.getBookNo() %>.jpg" alt="" width="350px" height="400px">
            </div>
            <div id = "content_1_text">
                <h1 style="font-weight: 600;"><%=b.getTitle() %></h1>
                <h5 class="content_1_h5" style="font-weight: 600;"><%=b.getAuthor() %>저 | <%= b.getPublisher() %></h5>
                <h5 class="content_1_h5" style="font-weight: 600;"><%=b.getGnereName() %></h5>
                <h5 style="font-weight: 600;">평균 별점 ★ : <%= b.getScope() %> </h5>	
                <div id = "content_1_heart" >
                <% if(loginUser != null) { %>
                    <h5 id = "content_1_h5">
                        찜하기 <svg xmlns="http://www.w3.org/2000/svg" style="cursor:pointer" width="30" height="30" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                        </svg>
                    </h5><!--박현빈 수정-->
                    <h5 id = "content_1_h52">
                        찜하기 <svg xmlns="http://www.w3.org/2000/svg" style="cursor:pointer" width="30" height="30" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                          </svg>
                    </h5>
                <% } %>
                </div>
            </div>
        </div>
        <div id="content_2">
            
        </div>
    
        <div id="content_3"><br>
            <h4>총 리뷰 수  : <%= pi.getListCount() %></h4>
            <% if(reviewB.isEmpty()) { %>
            <div id = "content_3_review">
            	<h2>조회된 리뷰가 없습니다~</h2>
            	</div>
            <% } else { %>
            
	   			 <% for(Review r : reviewB) { %>
            <div class="content_3_while <%= r.getReviewTitle() %>">
                <input type="hidden" value="<%= r.getReviewNo() %>">
                <legend align="center"><%= r.getReviewTitle() %></legend>
                <div class = "content_3_first">
                    <div class="content_3_userId"><%= r.getReviewWriter() %></div>
                    <div class="content_3_star">★ <%= r.getReviewScope() %></div>
                </div>
                <div class="content_3_text"> <%= r.getReviewContent() %></div>
                
                <div class = "content_3_third">
                    <div  class="content_3_thumb">
                        	조회수 :
                    </div>
                    <div class="content_3_thumbp">
                        
                            <p><%= r.getReviewCount() %></p>
                    </div>
                </div>
            </div>
	            <%} %>
            <%} %>
                <script>
                $('.content_3_while').click(function(){
                    location.href = "<%= contextPath %>/detail.re?rno="+$(this).children().first().val();
                    console.log($(this).children().first().val());
                })
                
                </script>
              <div id = "review_btn">
            
            
               <% if(loginUser != null) { %>
               <div>
            <a href="<%= contextPath %>/enrollForm.re?bno=<%= b.getBookNo() %>" id="writer_review" class="review">리뷰 쓰러 가기</a>
            </div>
               <%} %>
    
            
        </div>
            <script>
		$(function(){
			<% if(loginUser != null) { %>
				<% if(w == null) { %>
			             
			        $("#content_1_h5").click(function(){
			        	
			        	location.href="<%= contextPath %>/insertWish.bo?bno=<%= b.getBookNo() %>&&userNo=<%= loginUser.getUserNo() %>";
			        });
			        	
			    <% } else if(w.getStatus().equals("N")) { %>
			    
			        $("#content_1_h5").click(function(){
			        	
			        	location.href="<%= contextPath %>/updateWishY.bo?bno=<%= b.getBookNo() %>&&userNo=<%= loginUser.getUserNo() %>";
			        });
			        
		    	<% } else if(w.getStatus().equals("Y")) { %>
		    	
		            $("#content_1_h5").hide();
		            $("#content_1_h52").show();
			        $("#content_1_h52").click(function(){
			        	
			        	location.href="<%= contextPath %>/updateWishN.bo?bno=<%= b.getBookNo() %>&&userNo=<%= loginUser.getUserNo() %>";
			        });
		    	
		    	<% } %>
	    	<% } %>
			
		})
		/*	
        $("#content_1_h5").click(function(){
            $("#content_1_h5").hide();
            $("#content_1_h52").show();

        });
        $("#content_1_h52").click(function(){
           
            $("#content_1_h5").show();
            $("#content_1_h52").hide();
            
        });
        
        */
        
    </script>
         
        </div>
        <div id="content_4"><br>
            <!-- 페이징 처리 부분 -->
            <div class="paging-area" align="center">
        <!-- 페이징 버튼 -->
         <% if(currentPage != 1) { %>
        <button onclick="location.href='<%= contextPath%>/list.re?bno=<%= b.getBookNo() %>&&currentPage=<%= currentPage - 1%>'">&lt;</button>
        <%} %>
      	<% for(int i =startPage; i <= endPage; i++) {%>
      	<%if(i != currentPage) {%>
      	
      	<!-- /jsp/list.bo?currentPage=8 -->
      	<button onclick="location.href='<%= contextPath%>/list.re?bno=<%= b.getBookNo() %>&&currentPage=<%= i%>'"><%= i %></button>
        <%}else {%>
        <button disabled><%= i %></button>
        <%} %>
        <%} %>
        
        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%= contextPath%>/list.re?bno=<%= b.getBookNo() %>&&currentPage=<%= currentPage + 1%>'">&gt;</button>
        <%} %>
        
        <br><br>
    </div>
            
            
    </div>
    
    
    
</div>

<script>
   
        $("#content_1_h5").click(function(){
             
            $("#content_1_h5").hide();
            $("#content_1_h52").show();

        });
        $("#content_1_h52").click(function(){
           
            $("#content_1_h5").show();
            $("#content_1_h52").hide();
            
        });
</script>
<%@ include file="../common/footer.jsp" %>


</body>
</html>