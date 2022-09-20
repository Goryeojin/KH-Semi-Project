<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
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

    <title>Document</title>
    <style>
        body { margin: 0;}
        div{
          /*  border : 1px solid red; */
        box-sizing : border-box;
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

    #request{
            margin-top : 10px;
            margin-left: 50px;
            width:720px;
            height:420px;
            background-color: rgb(212, 212, 212);
            border-radius: 6px;
        }

        #oneone{
          margin-left:275px;
          background-color: rgb(212, 212, 212);
          width:240px;
          height:50px;
          text-align: center;

          border-radius: 6px;
        }

        #ct {
            margin-left:120px;
            height: 40px;

        }
        #ctTitle {
            
            margin-left:120px;
          width:454px;
            height: 40px;
            

        }
        #ctContent {
            
            margin-left:120px;
            width:454px;
            height: 200px;


        }   
           #ask, #cancel{
               float: left;
               margin-top: 40px;
               margin-left: 230px;
               color : white;
               background-color:rgb(120, 150, 50);
               height : 45px;
               width : 90px;
               text-align: center;
             
               border-radius: 6px;
               

               

      }
      
      #ask:hover, #cancel:hover {
	cursor: pointer;
	background-color: gray;
}

      #cancel{
          display: inline-block;
          margin-left : 20px;
      }
  
      #ask {
      font-size: initial;
	color: white;
	background-color: rgb(120, 150, 50);
	height: 50px;
	width: 100px;
	text-align: center;

	border-radius: 6px;

	
}
      	.gj{
	color : white;
	
	};
	




    </style>
</head>
<body>
		
		<%@ include file="../common/menubar.jsp" %>

        <div id="content">
          <div id="content_3">
				  <div id="pageCategory_bar">
      				  <a href="">🏠︎ HOME </a> > 마이페이지 > 룰루
   					 </div>
			</div>
          <div id="content_1">
			<%@ include file="../common/myPageSidebar.jsp" %>
			</div>
            <div id="content_2">

                <div id="oneone">
                    <h1>1:1 문의하기</h1>
                 </div>
             
             
             	<form id="enroll-form" action="<%= contextPath %>/inquiry.me" method="post">
             	
             	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>" >
             	
                 <div id="request">
             
                     <br>
                     <br>
             
             
               
                     <input type="text" name="qTitle" id="ctTitle" placeholder="문의제목" required>
                     <br>
                    <!--   <input type="textarea" id="ctContent" placeholder="문의내용"> -->
             			<textarea id="ctContent" name="qContent" placeholder="문의내용"></textarea>
             
             
                     <div id="">
                     <button id="ask" type="submit" class="btn btn-sm" >문의하기</button>
                     <div id="ask" class="ggg" style="margin-left:18px; padding-top: 13px;"><a href="<%= contextPath %>/inquiryList.me?currentPage=1" class="gj">목록으로</a></div>
                     <!-- 이전페이지로 돌아가는 함수 -->
                     </div>
                     </form>
                     
                     
                 </div>
            </div>
       </div>
   

   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>