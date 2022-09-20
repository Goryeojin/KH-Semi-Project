<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.ArrayList, com.readme.bestSeller.model.vo.BestSeller, com.readme.common.model.vo.PageInfo"%>


<%
  ArrayList<BestSeller> list = (ArrayList<BestSeller>)session.getAttribute("VoteList");
    PageInfo pi = (PageInfo)session.getAttribute("pi");

         // 페이징바 만들 때  필요한 변수 미리 셋팅
int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage(); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <!-- ☆☆☆☆없으면 안돌아감 필수☆☆☆☆☆ -->
    <!-- 부트스트랩 사용 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <title>베스트셀러 투표하기</title>
    <style>
        body { margin: 0;}
        div{
          /* border :  1px solid red; */  
        box-sizing :  border-box;
        }
    .wrap{
        min-width: 1190px;
    }
    .wrap>div{width:100%;}

    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
        
    }

    #content_1{
        width: 17%;
        
       float: left;
    }
    #content_2{
        width: 82%;
        clear: both;
    }
    #content_1, #content_2{
        display: inline-block;
        height: 1000px;
    
    }
    #content_3{
        height: 70px;
        width: 99%;
    
    }



    #ranking{
        background-color: rgb(120,150,50);
        width: 48px;
        height: 48px;
        border-radius: 50%;
        display: inline-block;

    }
    #rankingText{
        margin-left : 12px;
        margin-top : 6px;
        color: white;
        font-size: 18pt;
        font-weight: bold;
        
    }
    #rankingtitle{
        margin-left: 10px;
        display: inline-block;
        font-weight: bold;
        font-size: 30px;
    }

    #yy{
        width: 1300px;

    }


   

    #bookbook0{
        
        margin-top: 0px;
        float: left;
        width: 640px;
        height: 620px;
    }
    #bookbook1{
        
        margin-top: 3px;
        display: inline-block;
        width: 640px;
        height: 620px;
    }
    #bookbook2{
        
        margin-top: 30px;
        float: left;
        width: 640px;
        height: 620px;
    }
    
    #bookbook3{
        
        margin-top: 30px;
        display: inline-block;
        width: 640px;
        height: 620px;
    }



    #book{
        margin-top: 20px;
    }



    #bookimg{
        float: left;
        width: 300;
        height: 450;
    }

    #bookall{

        display: inline-block;
        width: 300px;
        height : 450px;
        
    }

    #booktitle{
        
        margin-left: 20px;
        font-weight: bold;
        font-size: 22px;
 
    }

    #bookauthor{
        
        margin-left: 20px;
        margin-top : 20px;
        font-weight: bold;
        font-size: 18px;
        display: inline-block;
    }

    #bookcontent{
        
        width: 300px;
        margin-left: 20px;
        margin-top : 20px;
        font-size: 18px;
       
    }
    
    #blank{
  
        height: 300px;
    }

    #tt{
   
        font-weight :bold;
        font-size: 38px;
        color: rgb(120,150,50);
    }
    
    #votebutton{
        float: left;
        width: 280px;
        height: 40px;
        background-color: rgb(120,150,50);
        margin-left: 14px;
        border-radius: 3%;
    }
    #votebutton:hover{
   cursor: pointer;
   background-color: gray;
}
    .votetext{
        margin-top: 5px;
        color : white;
        text-align: center;
    }

    #rankingvote{
        
        width: 100px;
        height: 30px;
        background-color: rgb(120,150,50);
        border-radius: 25%;
        display: inline-block;
        float: right;
        margin-top: 5px;
        margin-right: 105px;
        text-align: center;

        
    }
    
    .rankingvote{
          width: 100px;
        height: 30px;
        background-color: rgb(120,150,50);
        border-radius: 25%;
        display: inline-block;
        float: right;
        margin-top: 5px;
        margin-right: 105px;
        text-align: center;
    
    
    }
    

    #rankingvoteText{
        
        margin-top : 3px;
        

    }

   
  

    button{
        margin: 100px;
        height: 38px;
        border-radius: 5px;
        color: white;
        background-color: rgb(120, 150, 50);
        border : white;
    }
    button:hover{
        background-color: rgb(233, 233, 233);
        color: rgb(120, 150, 50);
    }

    .paging-area{
           margin-left: 0px;
           margin-bottom: 50px;
       }

    .buttonnum{
        margin-left: 20px;
    }
    .paging-area{
        margin-left: 0px;
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
          <div id="content_3">
              <div id="pageCategory_bar">
                    <a href="">🏠︎ HOME </a> > 베스트셀러 > 베스트셀러 투표하기
                   </div>
         </div>

            <div id="content_2">


            <br>

            <div id="yy">







         <% for(int i=0; i<list.size(); i++) { %>
            <div id="bookbook<%= i %>">

                <div id="ranking">
                    <div id="rankingText">
                         <%=list.get(i).getBookNo() %>
                     </div>
                    </div>
              
                  <div id="rankingtitle" style="width: 550px;">
                       <%= list.get(i).getTitle() %>
                       </div>
    
                  <div id="book">
                     <div id="bookimg">
                        <img src="<%= contextPath %>/resources/book_upfiles/<%= list.get(i).getBookNo() %>.jpg"" width="300" height="400">
                    </div>
    
    
                    <div id="bookall">
                    <div id="booktitle">
                         <%= list.get(i).getTitle() %>
                    </div>
                    <div id="bookauthor">
                         <%= list.get(i).getAuthor() %> 저 | <%= list.get(i).getPublisher() %>
                    </div>
                    <div id="bookcontent">
                    <%= list.get(i).getIntro() %>
                    </div>
                    </div>
    
                  </div>
                  
                  <br>
                  
                  
                  <div id="votebutton" onclick="hyunbin<%=i %>();">
                    <input type="hidden" name="bookNo<%= i %>" value="<%= list.get(i).getBookNo() %>">
                      <div class="votetext">
 
                                  투표하기
                      </div>
                  </div>




                  <div id="rankingvote<%= i %>" class="rankingvote">
         
                    <div id="rankingvoteText">👍<%= list.get(i).getVotecount() %></div>
             
                  </div>

            </div>
      
            
            <script>
      function hyunbin<%= i %>(){
         
         var bno = $('input[name=bookNo<%= i %>]').val();
      
           $.ajax({
                  
                url : "userVoteUpdate.be",
                  data : { bno : bno },
                  success : function(result){
               
                     var resultInt = "<div id=" + '"rankingvoteText"' + ">" + "👍" + result + '</div>';
                  
                     $('#rankingvote<%= i %>').html(resultInt);
      
                  },
                  error : function(){
                     alert("AJAX실패");
                  }
                  
               })
            
         
      }
      </script>
            
            
            
      <% } %>

   
      
            </div>

              </div>
            </div>
            <div id="blank"></div>
      </div>



            
               
           
           
           


<div class="paging-area" align="center">
        <!-- 페이징 버튼 -->
         <% if(currentPage != 1) { %>
        <button onclick="location.href='<%= contextPath%>/userVote.be?currentPage=<%= currentPage - 1%>'">&lt;</button>
        <%} %>
         <% for(int i =startPage; i <= endPage; i++) {%>
         <%if(i != currentPage) {%>
         
         <!-- /jsp/list.bo?currentPage=8 -->
         <button onclick="location.href='<%= contextPath%>/userVote.be?currentPage=<%= i%>'"><%= i %></button>
        <%}else {%>
        <button disabled><%= i %></button>
        <%} %>
        <%} %>
        
        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%= contextPath%>/userVote.be?currentPage=<%= currentPage + 1%>'">&gt;</button>
        <%} %>
        
        <br><br>
       </div>



      <%@ include file="../common/footer.jsp" %>
         
</body>
</html>