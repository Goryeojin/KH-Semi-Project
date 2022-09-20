<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList, com.readme.bestSeller.model.vo.BestSeller"%>

<%
  ArrayList<BestSeller> list = (ArrayList<BestSeller>)session.getAttribute("list2");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>금주의 에디터 픽 베스트셀러</title>
    <style>
        body { margin: 0;}
        div{
         /*   border :  1px solid red;  */
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
        width: 100%;
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
        margin-left : 4px;
        margin-top : 0px;
        color: white;
        font-size: 22pt;
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


    #bookbook1{
        margin-left : 400px;
        width: 640px;
        height: 500px;
    }

   

    #bookbook2{
        
        margin-top: 0px;
        float: left;
        width: 640px;
        height: 500px;
    }
    #bookbook3{
        
        margin-top: 3px;
        display: inline-block;
        width: 640px;
        height: 500px;
    }
    #bookbook4{
        
        margin-top: 30px;
        float: left;
        width: 640px;
        height: 500px;
    }
    
    #bookbook5{
        
        margin-top: 30px;
        display: inline-block;
        width: 640px;
        height: 500px;
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
    
  
    </style>
</head>
<body>
		
		<%@ include file="../common/menubar.jsp" %>
	
        <div id="content">
            <div id="content_3">
				  <div id="pageCategory_bar">
      				  <a href="">🏠︎ HOME </a> > 베스트셀러 > 금주의 에디터 픽 베스트셀러
   					 </div>
			</div>
            
            <div id="content_2">


            <div id="tt" align="center">
               금주의 에디터📖가 뽑은 베스트셀러
            </div>
                
            <br>

            <div id="yy">

        
          <% for(int i=0; i<list.size(); i++) { %>
            <div id="bookbook<%= i+1 %>">
              <div id="ranking">
                <div id="rankingText">⭐</div>
                </div>
              <div id="rankingtitle">
                   <%= list.get(i).getTitle() %>
              </div>


              <div id="book">
                 <div id="bookimg">
                    <img src="<%= contextPath %>/resources/book_upfiles/<%= list.get(i).getBookNo() %>.jpg" alt="" width="300" height="400">
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

            </div>


<% } %>
 

<!-- 


            <div id="bookbook2">

                <div id="ranking">
                    <div id="rankingText">
                          2위
                     </div>
                    </div>
              
                  <div id="rankingtitle">
                       성공하는 사람들의 7가지 습관
                  </div>
    
                  <div id="book">
                     <div id="bookimg">
                        <img src="../../resources/view_img/자기계발01_성공하는 사람들의 7가지 습관.jpg" alt="" width="300" height="400">
                    </div>
    
    
                    <div id="bookall">
                    <div id="booktitle">
                         뼈해장국은 빨간색이다2
                    </div>
                    <div id="bookauthor">
                         우윤희 저 | 뼈해장국집
                    </div>
                    <div id="bookcontent">
                        돼지의 등뼈와 목뼈 부위를 이용하여 만드는 탕. 칼칼하면서도 매콤하고 약간 걸쭉한 국물이 포인트.
    
                        감자탕에서 감자를 빼고 조그만한 1인용 뚝배기에 담은 게 뼈해장국이다. 같은 요리지만 다인분으로 내놓으면 감자탕이다.
    
                        목뼈는 등뼈보다 가격은 더 나가지만, 등뼈보다 훨씬 부드럽고 맛있다
                    </div>
                    </div>
    
                  </div>
    


            </div>





            <div id="bookbook3">

                <div id="ranking">
                    <div id="rankingText">
                          3위
                     </div>
                    </div>
              
                  <div id="rankingtitle">
                       뼈해장국은 빨간색이다.
                  </div>
    
                  <div id="book">
                     <div id="bookimg">
                        <img src="../../resources/view_img/자기계발01_성공하는 사람들의 7가지 습관.jpg" alt="" width="300" height="400">
                    </div>
    
    
                    <div id="bookall">
                    <div id="booktitle">
                         뼈해장국은 빨간색이다2
                    </div>
                    <div id="bookauthor">
                         우윤희 저 | 뼈해장국집
                    </div>
                    <div id="bookcontent">
                        돼지의 등뼈와 목뼈 부위를 이용하여 만드는 탕. 칼칼하면서도 매콤하고 약간 걸쭉한 국물이 포인트.
    
                        감자탕에서 감자를 빼고 조그만한 1인용 뚝배기에 담은 게 뼈해장국이다. 같은 요리지만 다인분으로 내놓으면 감자탕이다.
    
                        목뼈는 등뼈보다 가격은 더 나가지만, 등뼈보다 훨씬 부드럽고 맛있다
                    </div>
                    </div>
    
                  </div>
    



            </div>





            <div id="bookbook4">

                <div id="ranking">
                    <div id="rankingText">
                          4위
                     </div>
                    </div>
              
                  <div id="rankingtitle">
                       뼈해장국은 빨간색이다.
                  </div>
    
                  <div id="book">
                     <div id="bookimg">
                        <img src="../../resources/view_img/자기계발01_성공하는 사람들의 7가지 습관.jpg" alt="" width="300" height="400">
                    </div>
    
    
                    <div id="bookall">
                    <div id="booktitle">
                         뼈해장국은 빨간색이다2
                    </div>
                    <div id="bookauthor">
                         우윤희 저 | 뼈해장국집
                    </div>
                    <div id="bookcontent">
                        돼지의 등뼈와 목뼈 부위를 이용하여 만드는 탕. 칼칼하면서도 매콤하고 약간 걸쭉한 국물이 포인트.
    
                        감자탕에서 감자를 빼고 조그만한 1인용 뚝배기에 담은 게 뼈해장국이다. 같은 요리지만 다인분으로 내놓으면 감자탕이다.
    
                        목뼈는 등뼈보다 가격은 더 나가지만, 등뼈보다 훨씬 부드럽고 맛있다
                    </div>
                    </div>
    
                  </div>
    


            </div>





            <div id="bookbook5">

                <div id="ranking">
                    <div id="rankingText">
                          5위
                     </div>
                    </div>
              
                  <div id="rankingtitle">
                       뼈해장국은 빨간색이다.
                  </div>
    
                  <div id="book">
                     <div id="bookimg">
                        <img src="../../resources/view_img/자기계발01_성공하는 사람들의 7가지 습관.jpg" alt="" width="300" height="400">
                    </div>
    
    
                    <div id="bookall">
                    <div id="booktitle">
                         뼈해장국은 빨간색이다2
                    </div>
                    <div id="bookauthor">
                         우윤희 저 | 뼈해장국집
                    </div>
                    <div id="bookcontent">
                        돼지의 등뼈와 목뼈 부위를 이용하여 만드는 탕. 칼칼하면서도 매콤하고 약간 걸쭉한 국물이 포인트.
    
                        감자탕에서 감자를 빼고 조그만한 1인용 뚝배기에 담은 게 뼈해장국이다. 같은 요리지만 다인분으로 내놓으면 감자탕이다.
    
                        목뼈는 등뼈보다 가격은 더 나가지만, 등뼈보다 훨씬 부드럽고 맛있다
                    </div>
                    </div>
    
                  </div>
    




            </div>

 -->
              </div>
            </div>
            <div id="blank"></div>
      </div>
   	<%@ include file="../common/footer.jsp" %>
		   
</body>
</html>