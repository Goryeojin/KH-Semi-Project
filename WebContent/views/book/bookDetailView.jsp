<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.util.ArrayList, com.readme.book.model.vo.Book, com.readme.review.model.vo.Review, com.readme.book.model.vo.Wish" %>
    
     
<%	
    	
   	Book b = (Book)session.getAttribute("b");
   	ArrayList<Review> reviewS = (ArrayList<Review>)session.getAttribute("reviewS");
    Wish w = (Wish)session.getAttribute("w");
    
  %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= b.getTitle() %></title>
<style>
    /* 컨텐츠 부분 */
    /*컨텐츠 1 시작*/
    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
    }
    #content_2{
        text-align: left;
        padding-top: 20px;
        padding-bottom: 40px;
        padding-left: 150px;
        border-bottom: 2px solid gray;
    }
    #content_2_intro{
        margin-top: 17px;
        font-size: 16px;
        width:950px;
    }
    #content_3{
        text-align: left;
        padding-top: 0px;
        padding-bottom: 60px;
        padding-left: 150px;
        border-bottom: 2px solid gray;
    }
    #content_3_intro{
        margin-top: 40px;
        font-size: 16px;
        width:950px;
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
    /* 스타일 부분 텍스트 구문 높낮이 안맞아서 수정 */
    #content_1_text{
        text-align: left;
        margin-top: 90px;
        margin-left: 50px;
    }
    #content_1_heart{
        margin-top: -90px;
        margin-left: 300px;
    }
    #content_1_heart h5{
        word-spacing:15px;
        
    }
    #content_1_text h5{
        margin-left: 20px;
        margin-top: 60px;
        
        
    }
    /* 스타일 수정 끝 */
    #content_1_text h1{
        margin-bottom: 70px;
        font-size: 50px;
    }
    
    #content_4{
        height:620px;
        
    }
    #content_4 div{
        float: left;
    }
    
    .content_4_while div{
        float: left;
    }
    .content_4_while{
        margin-left: 80px;
        width: 300px;
        
        background-color: rgb(120, 150, 50);
        border-radius: 10px;
    }
    .content_4_third div{
        float: left;
    }
    
    .content_4_third{
        border-top: 2px solid rgb(62, 76, 28);
        width: 300px;
        height:30px;
        padding-top: 10px;
        padding-bottom:50px;
    }
    .content_4_thumb{
        text-align: left;
        margin-top: 7px;
        padding-left: 15px;
        width: 80px;
        height:30px;
    }
    .content_4_thumbp{
    	margin-top: 2px;
        text-align: left;
        width: 50px;
        height:30px;
        font-size: 20px;
    }
    .content_4_first{
        border-top: 2px solid rgb(62, 76, 28);
        border-bottom: 2px solid rgb(62, 76, 28);
        width: 300px;
        height: 40px;
        font-size: 20px;
    }
    .content_4_userId{
        padding-left: 10px;
        width: 140px;
        text-align: left;
        
    }
    .content_4_star{
        width: 150px;
        text-align: right;
    }
    .content_4_text{
        font-size: 16px;
        padding-top: 27px;
        padding-bottom: 27px;
        
        
    }
    #content_4 h4{
        margin-top: -10px;
        margin-left : -1100px; 
        font-weight:900;  
        margin-bottom: 50px;     
    }
    #content_4 a{
        float: right;
    }
    #review_btn{
        margin-left: 830px;
        margin-top: -100px;
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
    /*컨텐츠 3끝*/


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
    /* 수정 사항 */
    #content_1_h52{
        display: none;
    }
    #review_none{
    	margin-left : 300px;
    	margin-top : 200px;
    	color : rgb(120, 150, 50);
    }
    
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="pageCategory_bar">
            <a href="">🏠︎ HOME </a> > 카테고리 > <%=b.getGnereName() %> 
        </div>
        <div id="content_1">
            <div id="content_1_img">
             <img src="<%= contextPath %>/resources/book_upfiles/<%= b.getBookNo() %>.jpg" alt="" width="350px" height="400px">
            </div>
            <div id = "content_1_text">
                <h1 style="font-weight: 600; width: 600px"><%=b.getTitle() %></h1>
                <h5 style="font-weight: 600;"><%=b.getAuthor() %>저 | <%= b.getPublisher() %></h5>
                <h5 style="font-weight: 600;"><%=b.getGnereName() %></h5>
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
            <div>
                <b style="font-size: 17px;">책소개</b>
            </div>
            <div id = "content_2_intro">
                <p><%=b.getIntro() %>
                </p>
            </div>
        </div>
        <div id="content_3"><br>
            <div>
                <b style="font-size: 17px;">줄거리</b>
            </div>
            <div id = "content_3_intro">
                <p>
                    <%= b.getSummary() %>
                </p>
            </div>
        </div>
        <div id="content_4"><br>
        <% if(reviewS.isEmpty()) { %>
        	<div id = review_none>
        	<h2>아직 리뷰가 없습니다. 리뷰를 작성해주세요 ~~ </h2>
        	</div>
        <%} else { %>
            <h4 style="margin: 10px 0 30px 0; text-align: center;">베스트 리뷰</h4><br>
			<% for(int i = 0; i< reviewS.size(); i++) {%>
            <div class="content_4_while">
                <input type="hidden" value="<%= reviewS.get(i).getReviewNo() %>">
                <legend align="center"><%= reviewS.get(i).getReviewTitle() %></legend>
                <div class = "content_4_first">
                    <div class="content_4_userId"><%= reviewS.get(i).getReviewWriter() %></div>
                    <div class="content_4_star">★ <%= reviewS.get(i).getReviewScope() %></div>
                </div>
                <div class="content_4_text"> <%= reviewS.get(i).getReviewContent() %>
                </div>
                <div class = "content_4_third" style="height: 40px;">
                    <div  class="content_4_thumb">
                        	조회수 :
                    </div>
                    <div class="content_4_thumbp">
                        <p><%= reviewS.get(i).getReviewCount() %></p>
                    </div>
                </div>

            </div>

			
            <% } %>
        <% } %>
			
            <script>
                $('.content_4_while').click(function(){
                    location.href = "<%= contextPath %>/detail.re?rno=" + $(this).children().first().val();
                })
            </script>
            
            
            </div>
            <div id = "review_btn">
            <a href="<%= contextPath %>/list.re?bno=<%= b.getBookNo() %>&&currentPage=1" id="while_review" class="review">리뷰 전체 조회</a>
               <% if(loginUser != null) { %>
            <a href="<%= contextPath %>/enrollForm.re?bno=<%= b.getBookNo() %>" id="writer_review" class="review">리뷰 쓰러 가기</a>
               <%} %>
            
            
        </div>
        </div>
    </div>
    <!-- 박현빈 제이쿼리 추가  -->
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
    <%@ include file="../common/footer.jsp" %>
</body>
</html>