<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.readme.book.model.vo.Book, com.readme.common.model.vo.PageInfo " %>

   <%
   		ArrayList<Book> searchBook = (ArrayList<Book>)session.getAttribute("searchBook");
   		String search = (String)session.getAttribute("search");
   		
		PageInfo pi = (PageInfo)session.getAttribute("searchPi");
		
   		
		
    	
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
<title>책 검색 </title>





    <style>
        div{
            box-sizing: border-box;
           /* border: 1px solid red;*/
            
        }
        
        .outer{
          text-align: center;
          
          /*전체를 감싸는 div*/
          
          
          
        }
        
        #header{
          width: 100%;
          height: 155px;
          display: inline-block;
          padding:0;
          margin-bottom: -7px;
          
          
        }
        #header>div{
          height: 100%;
          float: left;
          
        }
        #header_1{
          width: 25%;
          margin: 0px;
          padding-top: 45px;
          padding-left: 58px;
          
        }
        #header_2{
          width: 50%;
          padding-top: 45px;
          padding-right: 30px;
          padding-left: 10px;
        }
        #header_3{
          width: 25%;
          padding-top: 20px;
          padding-left: 40px;
        }
        
        
        #header_1 a{
          text-decoration: none;
          color :rgb(255, 255, 255);
          
        }
        #header_1_README{
          font-size: 27px;
          font-weight:900;
        }
        
        #header_1_read{
          font-size: 20px;
          font-weight:700;
        }
        
        
        button{
          width: 90px;
          height: 40px;
          font-size: 14px;
          line-height: 2.4em;
          border-radius: 4px;
          border-width: 1px;
          border-style: solid;
          border-color: rgb(255, 255, 255);
          font-weight: 800;
        }
        #login_btn{
          color: rgb(255, 255, 255);
          background-color: rgb(120, 150, 50);
        }
        #join_btn{
          color:  rgb(255, 255, 255);
          background-color: rgb(120, 150, 50);
        }
        .login-area{
          margin: 0px auto;
        }
        .wrap{
          background-color: rgb(120, 150, 50);
        }
        #navigator{
          width: 100%;
          height : 60px;
          background-color: rgb(120,150,50);
          display: inline-block;
          padding-left: 320px;
          
        }
        #navi{
          list-style: none;
          margin: 0px; /* ul요소는 기본적으로 위 아래로 margin이 있다*/ 
          padding: 0px; /* 심지어 padding도 있다*/
          height:100%;
          
          
        }
        #navi>li{
          float:left;
          width : 12%;
          text-align: center;
          height : 100%;
          margin-top: 0px;
          
          
        }
        #navi a{
          text-decoration: none;
          color: white;
          font-weight: 800;
          width: 100%;
          height: 100%; /* a태그는 인라인요소기 때문에 width, height 속성이 적용X*/
          display : block; /* 인라인 요소를 블럭요소로 바꿔줌 */
          /* vertical-align : middle;*/ /* vertical-align : middle은 블럭요소에서 죽었다께나도 X*/
          line-height : 60px; /* 줄간격 속성 px/ % / em*/
          transform: scale(1); 
          
        }
        #navi li:hover{
          font-size: 19px;
          font-weight: 900;
          color: white;
          background-color: rgb(62,76,28);
          
          border-top-left-radius: 7px;
          border-top-right-radius: 7px;
          
          
        }
        
        
        #navi>li>ul{
          list-style-type : none;
          padding: 0px;
          display: none; /* 평소에는 안보여지다가 마우스가 올라가는 순간 펼쳐지는 효과 1단계*/
          
        }
        #navi>li>a:hover+ul{
          display:block; /* 평소에는 안보여지다가 마우스가 올라가는 순간 펼쳐지는 효과 2단계*/
        }
        #navi>li>ul:hover{
          display:block; /* 평소에는 안보여지다가 마우스가 올라가는 순간 펼쳐지는 효과 3단계*/
        }
        
        #navi>li>ul a{font-size : 13px; background-color: rgb(62, 76, 28);}
        #navi>li>ul a:hover{font-size : 14px; background-color: rgb(62, 76, 28);}
        
        /* 컨텐츠 부분 */
        
        
        /* 키워드 검색부분 시작*/
        
        #content{
          width: 1300px;
          padding: 20px 30px;
          margin: 0 auto;
          height:1700px;
          border: 1px solid rgb(120, 150, 50);
        }
        #search_kw_input{
            height: 50px;
        }
        #search_kw{
            width: 650px;
            margin: 10px 0 0 310px;
            
        }
        #information_text p{
            float: left;
        }
        #information_text {
            height: 50px;
            margin-top: 50px;
            margin-left: 70px;
            
        }
        
        #keyword_text {
            margin-left: 340px;
            font-size: 35px;
            color: rgb(29, 172, 160);
        }
        #keyword_num{
            font-size: 35px;
            color: rgb(29, 172, 160);
        }
        .just_text{
            margin-top: 11px;
            font-size: 25px;
            margin-left: 10px;
            margin-right: 10px;
        }
        /* 키워드 검색부분 끝*/



        #content_bookmenu{
            margin-left: 80px;
            margin-top: 130px;
            width: 1100px;
            height: 50px;
        }
        #content_bookmenu div{
            background-color: rgb(235, 231, 231);
            border: 2px solid rgb(182, 181, 181);
            float: left;
            width: 548px;
            height: 50px;
            text-align: center;
            padding-top: 10px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
        }
        #content_bookmenu div:active{
            background-color: rgb(185, 184, 184);
        }
        #content_while{
            margin-left: 50px;
            width: 1200px;
            height: 1100px;
        }
        .margin_left{
            margin-left: 60px;
        }
        
        .margin_top{
            margin-top: 50px;
        }
        .content_content{
            
            cursor: pointer;
            float: left;
            width:300px;
            height : 440px
            
        }
        .content_content_title{
            margin-top: 25px;
            font-size: 23px;
            font-weight: 600;
            text-align: left;
        }
        .content_content_writer{
            
            text-align: left;
            font-size: 18px;
            font-weight: 600;
            margin-top: -2px;
        }
        .content_content_star{
            text-align: left;
            margin-top: -17px;
            font-size: 18px;
            color: rgb(65, 65, 194)
        }

        #content_2{
            height:130px;
            /* 페이징 처리 바*/
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





        /*컨텐츠 끝*/
        /* 컨텐츠 리모컨 부분*/



    #floating_menu{
        position: fixed;
        right:0%;
        top: 220px;
        box-sizing: border-box;
       border-radius: 20px;
       
        text-align: center;
        width : 90px;
        height: 250px;
        background-color: rgb(120,150,50);
        
    }
    #floating_menu>div{
        width: 100%;
        color: black;
        padding-top: 7px;
    }
    #floating_menu>div>a{
        color: black;
       text-decoration: none;
       
    }
    
    #floating_menu_up{
        height: 18%;
        border-bottom: 2px solid rgb(62, 76, 28);
    }

    
    #floating_menu_down{
        height: 18%;
        border-top: 2px solid rgb(62, 76, 28);
    }
    #floating_menu_content1, #floating_menu_content2{
        height:32%;
    }
    /*  푸터부분  */
    

    #footer{
        width: 100%;
        height: 300px;
    }
    
    #footer_1{
        height: 20%;
        border-style: solid;
        border-width: 2px 0px 1px 0px;
        border-color: rgb(194, 191, 191) gray black black;
        padding-top: 10px;
    }
    #footer_2{
        height: 80%;
        width : 50%;
        padding-top: 30px;
        padding-left: 35px;
        float: left;
    }
    #footer_3{
        height: 80%;
        width : 50%;
        padding-top: 30px;
        padding-right: 50px;
        float: left;
    }
    #footer_1 a{
        font-size: 22px;
        font-weight: 800;
        text-decoration: none;
        
        color: rgb(120,150,50);
    }
    
  
    #footer_2_title{
        font-size: 25px;
        font-weight: 400;
    }
    #footer_2_p{
        font-size: 16px;
    }
    #footer_3 a{
     float: right;
     margin: 10px;
     color: rgb(120,150,50);
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
    
 
    
    </style>



</head>
<body>


<%@ include file="../common/menubar.jsp" %>



<div id="content">
    <div id="pageCategory_bar">
        <a href="">🏠︎ HOME </a> > 검색 
    </div>
    <div id="search_kw" >
        <form onsubmit="return false">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">🔍</span>
                </div >
                <input onkeyup="enterkey();" type="text" class="form-control" placeholder="키워드를 입력해주세요!" name="searchBooks" id="search_kw_input" value="<%=search %>">
        </div>
    </form>
    </div>
    
    <script>
    function enterkey() {
        if (window.event.keyCode == 13) {
        	
             var search = $("#search_kw_input").val();
 
             // 엔터키가 눌렸을 때 실행하는 반응
             location.href = "<%= contextPath %>/search.bo?currentPage=1&&mainSearchbook=" + search;
             							
             
        }
}
    
    
    </script>

    <div id = "information_text">
     
        <p id="keyword_text">'<%= search %>' </p>
     
        <p class="just_text">검색어로 총 </p>
        
        <p id="keyword_num"> <%=pi.getListCount() %> </p>
        
        <p class="just_text">개의 책을 찾았습니다.</p>
        <input type="hidden" name="search_books" value= "<%= search %>">
        
    </div>


    <div id="content_bookmenu">
       
        <div id = "content_bookmenu_title" onclick="searchBook();">책 제목</div>
        <div id = "content_bookmenu_author" onclick="searchAuthor();">저자</div>
    </div>
    <div id = "content_while">
    <% for(int i = 0; i < searchBook.size(); i++) { %>
    <div class = "content_content margin_left margin_top" id="<%= i %>">
                <img src="<%= contextPath %>/resources/book_upfiles/<%= searchBook.get(i).getBookNo() %>.jpg" alt="" width="300px" height="330pxpx">
                <p class="content_content_title"><%= searchBook.get(i).getTitle() %></p>
                <p class="content_content_writer"><%= searchBook.get(i).getAuthor() %> 저 | <%= searchBook.get(i).getPublisher() %></p>
                <p class="content_content_star">평균 별점   ★<%= searchBook.get(i).getScope() %></p>
            
           
    </div>
    <script>
    $('#<%= i %>').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=<%=searchBook.get(i).getBookNo()%>";
    })
    
    </script>
<script>


		function searchAuthor(){

		var searchthings = $('input[name=searchBooks]').val();

		$.ajax({
		url : "searchBookAuthor.bo",
		data : { 
			searchA : searchthings
		},
		success : function(result){
		
			var resultStr2 = "";
			for(var i =0; i < result.length; i++){
				resultStr2 += 
			  '<div class = '+'"content_content margin_left margin_top"'+ 'id='+'"<%= i %>">'
              +'<img src='+'"<%= contextPath %>/resources/book_upfiles/'+result[i].bookNo+'.jpg"'+'" alt='+'"" width='+'"300px"'+' height='+'"330pxpx">'
              +'<p class='+'"content_content_title">'+ result[i].title +'</p>'
              +'<p class='+'"content_content_writer">'+result[i].author +' 저 |'+result[i].publisher+'</p>'
              +'<p class='+'"content_content_star">'+'평균 별점   ★'+result[i].scope+'</p>'+ '</div>';
			}
			
			$("#content_while").html(resultStr2);
			$(".paging-area").css("display","none");
			
			
			
		
	
		
		
	
		
			},
			error : function(){
				console.log("error ㅜ");
			}
	
		})

		}

		




</script>
<script>


		function searchBook(){

		var searchthings = $('input[name=searchBooks]').val();

		$.ajax({
		url : "searchBookTitle.bo",
		data : { 
			searchA : searchthings
		},
		success : function(result){
		
			var resultStr3 = "";
			
			for(var i =0; i < result.length; i++){
				resultStr3 += 
			  '<div class = '+'"content_content margin_left margin_top"'+ 'id='+'"'+result[i].bookNo+'">'
              +'<img src='+'"<%= contextPath %>/resources/book_upfiles/'+result[i].bookNo+'.jpg"'+'" alt='+'"" width='+'"300px"'+' height='+'"330pxpx">'
              +'<p class='+'"content_content_title">'+ result[i].title +'</p>'
              +'<p class='+'"content_content_writer">'+result[i].author +' 저 |'+result[i].publisher+'</p>'
              +'<p class='+'"content_content_star">'+'평균 별점   ★'+result[i].scope+'</p>'+ '</div>';
			}
			
			$("#content_while").html(resultStr3);
			$(".paging-area").css("display","block");
			
			
			
			
			
		
	
		
		
	
		
			},
			error : function(){
				console.log("error ㅜ");
			}
	
		})

		}
		
		
		





</script>
   

   	<%} %>
</div>

<div id = "content_2">
<!-- 페이징 처리 -->


<div class="paging-area" align="center">
        <!-- 페이징 버튼 -->
         <% if(currentPage != 1) { %>
        <button onclick="location.href='<%= contextPath%>/search.bo?mainSearchbook=<%= search %>&&currentPage=<%= currentPage - 1%>'">&lt;</button>
        <%} %>
        
      	<% for(int i = startPage; i <= endPage; i++) { %>
      	<%if(i != currentPage) {%>
      	
      	
      	<button onclick="location.href='<%= contextPath%>/search.bo?mainSearchbook=<%= search %>&&currentPage=<%= i%>'"><%= i %></button>
        <%}else {%>
        <button disabled><%= i %></button>
        <%} %>
        <%} %>
        
        <!-- 페이징바에서 >를 담당 : 다음페이지 이동 -->
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%= contextPath%>/search.bo?mainSearchbook=<%= search %>&&currentPage=<%= currentPage + 1%>'">&gt;</button>
        <%} %>
        
        <br><br>
    </div>






</div>



   
</div>




<script>

$('#68').click(function(){
    location.href = "<%= contextPath %>/detail.bo?bno=68";
})


</script>






<%@ include file="../common/footer.jsp" %>
</body>
</html>