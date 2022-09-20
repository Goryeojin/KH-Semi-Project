<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList, com.readme.bestSeller.model.vo.BestSeller"%>

<%
  ArrayList<BestSeller> list1 = (ArrayList<BestSeller>)session.getAttribute("list1");
ArrayList<BestSeller> list2 = (ArrayList<BestSeller>)session.getAttribute("list2");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>베스트셀러</title>
<style>
  body { margin: 0;}
  div{
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
    width: 8%;
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

  div{
      box-sizing: border-box;
  }
  #slideContent{
    width: 1300px;
    padding: 20px 40px;
    margin: 0 auto;
  }
  #slider {
    margin: 0 auto;
    width: 1000px;
    max-width: 100%;
    text-align: center;
    margin-left: 0px;
    margin-top: 0px;
  }

  #slider input[type=radio] {
    display: none;
  }

  #slider label {
    cursor: pointer;
    text-decoration: none;
  }

  #slides {
    padding: 10px;
    border: 3px solid #ccc;
    background: #fff;
    position: relative;
    z-index: 1;
  }
  #overflow {
    width: 100%;
    overflow: hidden;
  }

  #slide1:checked ~ #slides .inner{
    margin-left: 0;
  }
  #slide2:checked ~ #slides .inner{
    margin-left: -100%;
  }
  #slide3:checked ~ #slides .inner{
    margin-left: -200%;
  }
  #slide4:checked ~ #slides .inner{
    margin-left: -300%;
  }
  #slide5:checked ~ #slides .inner{
    margin-left: -400%;
  }

  #slides .inner {
    transition: margin-left 800ms cubic-bezier(0.0770, 0.000, 0.175, 1.000);
    width: 500%; /*-> 아이템 수 * 100*/
    line-height: 0;
    height: 400px;
  } 

  #slides .slide {
    width: 20%; /*-> 100 / 아이템 수*/
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
  }

  /*
  #slides .slide_1{
    background: lightcyan;
  }
  #slides .slide_2{
    background: lightskyblue;
  }
  #slides .slide_3{
    background: mediumturquoise;
  }
  #slides .slide_4{
    background: royalblue;
  }
  #slides .slide_5{
    background: midnightblue;
  }
  */

  .slide-content {
      width: 800px;
      margin-left : 0px;
      height:300px;
  }

  #controls {
    margin: -130px 0 0 0;
    width: 100%;
    height: 50px;
    z-index: 3;
    position: relative;
  }
  #controls label {
    transition: opacity 0.2s ease-out;
    display: none;
    width: 50px;
    height: 50px;
    opacity: .4;
  }
  #controls label:hover {
    opacity: 1;
  }

  #slide1:checked ~ #controls label:nth-child(2),
  #slide2:checked ~ #controls label:nth-child(3),
  #slide3:checked ~ #controls label:nth-child(4),
  #slide4:checked ~ #controls label:nth-child(5),
  #slide5:checked ~ #controls label:nth-child(1)
  {
    background: url(<%= request.getContextPath() %>/resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
    float: right;
    margin: -100px -55px 0 0;
    display: block;
  }
  #slide1:checked ~ #controls label:nth-child(5),
  #slide2:checked ~ #controls label:nth-child(1),
  #slide3:checked ~ #controls label:nth-child(2),
  #slide4:checked ~ #controls label:nth-child(3),
  #slide5:checked ~ #controls label:nth-child(4)

  {
    background: url(<%= request.getContextPath() %>/resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
    float: left;
    margin: -100px 0 0 -55px;
    display: block;
  }

  #slide1:checked ~ #bullets label:nth-child(1),
  #slide2:checked ~ #bullets label:nth-child(2),
  #slide3:checked ~ #bullets label:nth-child(3),
  #slide4:checked ~ #bullets label:nth-child(4),
  #slide5:checked ~ #bullets label:nth-child(5)
  {
    background: #333;
  }
  /*복사본*/
  #slider2 {
    margin: 0 auto;
    width: 1000px;
    max-width: 100%;
    text-align: center;
    margin-left: 0px;
    margin-top: 0px;
  }

  #slider2 input[type=radio] {
    display: none;
  }

  #slider2 label {
    cursor: pointer;
    text-decoration: none;
  }

  #slides2 {
    padding: 10px;
    border: 3px solid #ccc;
    background: #fff;
    position: relative;
    z-index: 1;
  }
  #overflow2 {
    width: 100%;
    overflow: hidden;
  }

  #slide12:checked ~ #slides2 .inner2{
    margin-left: 0;
  }
  #slide22:checked ~ #slides2 .inner2{
    margin-left: -100%;
  }
  #slide32:checked ~ #slides2 .inner2{
    margin-left: -200%;
  }
  #slide42:checked ~ #slides2 .inner2{
    margin-left: -300%;
  }
  #slide52:checked ~ #slides2 .inner2{
    margin-left: -400%;
  }

  #slides2 .inner2 {
    transition: margin-left 800ms cubic-bezier(0.0770, 0.000, 0.175, 1.000);
    width: 500%; /*-> 아이템 수 * 100*/
    line-height: 0;
    height: 400px;
  } 

  #slides2 .slide2 {
    width: 20%; /*-> 100 / 아이템 수*/
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    
  }

  /*
  #slides .slide_1{
    background: lightcyan;
  }
  #slides .slide_2{
    background: lightskyblue;
  }
  #slides .slide_3{
    background: mediumturquoise;
  }
  #slides .slide_4{
    background: royalblue;
  }
  #slides .slide_5{
    background: midnightblue;
  }
  */

  .slide-content2 {
    width: 800px;
    margin-left : 0px;
    height:300px;
  }

  #controls2 {
    margin: -130px 0 0 0;
    width: 100%;
    height: 50px;
    z-index: 3;
    position: relative;
  }
  #controls2 label {
    transition: opacity 0.2s ease-out;
    display: none;
    width: 50px;
    height: 50px;
    opacity: .4;
  }
  #controls2 label:hover {
    opacity: 1;
  }
  #slide12:checked ~ #controls2 label:nth-child(2),
  #slide22:checked ~ #controls2 label:nth-child(3),
  #slide32:checked ~ #controls2 label:nth-child(4),
  #slide42:checked ~ #controls2 label:nth-child(5),
  #slide52:checked ~ #controls2 label:nth-child(1)
  {
    background: url(<%= request.getContextPath() %>/resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
    float: right;
    margin: -100px -55px 0 0;
    display: block;
  }
  #slide12:checked ~ #controls2 label:nth-child(5),
  #slide22:checked ~ #controls2 label:nth-child(1),
  #slide32:checked ~ #controls2 label:nth-child(2),
  #slide42:checked ~ #controls2 label:nth-child(3),
  #slide52:checked ~ #controls2 label:nth-child(4)

  {
    background: url(<%= request.getContextPath() %>/resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
    float: left;
    margin: -100px 0 0 -55px;
    display: block;
  }
  #slide12:checked ~ #bullets2 label:nth-child(1),
  #slide22:checked ~ #bullets2 label:nth-child(2),
  #slide32:checked ~ #bullets2 label:nth-child(3),
  #slide42:checked ~ #bullets2 label:nth-child(4),
  #slide52:checked ~ #bullets2 label:nth-child(5)
  {
    background: #333;
  }

    /*복사본*/
  #slider3 {
    margin: 0 auto;
    width: 1000px;
    max-width: 100%;
    text-align: center;
    margin-left: 0px;
    margin-top: 0px;
  }

  #slider3 input[type=radio] {
    display: none;
  }

  #slider3 label {
    cursor: pointer;
    text-decoration: none;
  }

  #slides3 {
    padding: 10px;
    border: 3px solid #ccc;
    background: #fff;
    position: relative;
    z-index: 1;
  }
  #overflow3 {
    width: 100%;
    overflow: hidden;
  }

  #slide13:checked ~ #slides3 .inner3{
    margin-left: 0;
  }
  #slide23:checked ~ #slides3 .inner3{
    margin-left: -100%;
  }
  #slide33:checked ~ #slides3 .inner3{
    margin-left: -200%;
  }
  #slide43:checked ~ #slides3 .inner3{
    margin-left: -300%;
  }
  #slide53:checked ~ #slides3 .inner3{
    margin-left: -400%;
  }

  #slides3 .inner3 {
    transition: margin-left 800ms cubic-bezier(0.0770, 0.000, 0.175, 1.000);
    width: 500%; /*-> 아이템 수 * 100*/
    line-height: 0;
    height: 400px;
  } 

  #slides3 .slide3 {
    width: 20%; /*-> 100 / 아이템 수*/
    float: left;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
  }

  /*
  #slides .slide_1{
    background: lightcyan;
  }
  #slides .slide_2{
    background: lightskyblue;
  }
  #slides .slide_3{
    background: mediumturquoise;
  }
  #slides .slide_4{
    background: royalblue;
  }
  #slides .slide_5{
    background: midnightblue;
  }
  */

  .slide-content3 {
      width: 800px;
      margin-left : 0px;
      height:300px;
  }

  #controls3 {
    margin: -130px 0 0 0;
    width: 100%;
    height: 50px;
    z-index: 3;
    position: relative;
  }
  #controls3 label {
    transition: opacity 0.2s ease-out;
    display: none;
    width: 50px;
    height: 50px;
    opacity: .4;
  }
  #controls3 label:hover {
    opacity: 1;
  }

  #slide13:checked ~ #controls3 label:nth-child(2),
  #slide23:checked ~ #controls3 label:nth-child(3),
  #slide33:checked ~ #controls3 label:nth-child(4),
  #slide43:checked ~ #controls3 label:nth-child(5),
  #slide53:checked ~ #controls3 label:nth-child(1)
  {
    background: url(<%= request.getContextPath() %>/resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
    float: right;
    margin: -100px -55px 0 0;
    display: block;
  }
  #slide13:checked ~ #controls3 label:nth-child(5),
  #slide23:checked ~ #controls3 label:nth-child(1),
  #slide33:checked ~ #controls3 label:nth-child(2),
  #slide43:checked ~ #controls3 label:nth-child(3),
  #slide53:checked ~ #controls3 label:nth-child(4)

  {
    background: url(<%= request.getContextPath() %>/resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
    float: left;
    margin: -100px 0 0 -55px;
    display: block;
  }
  #slide13:checked ~ #bullets3 label:nth-child(1),
  #slide23:checked ~ #bullets3 label:nth-child(2),
  #slide33:checked ~ #bullets3 label:nth-child(3),
  #slide43:checked ~ #bullets3 label:nth-child(4),
  #slide53:checked ~ #bullets3 label:nth-child(5)
  {
    background: #333;
  }

  p{
      line-height: 30px;
  }
</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

  <div id="content">
    <div id="content_3">
      <div id="pageCategory_bar">
        <a href="">🏠︎ HOME </a> > 베스트셀러
      </div>
    </div>
    <div id="content_1">
    </div>

    <div id="content_2">

      <br>
      <br>
      <br>
       <h1 align="center" style="width:980px;">readMe 독자들이 뽑은 베스트셀러</h1>


   
      <div id ="slideContent">
        <div id="slideContent_1">
   
           <div id="slider">
      
              <input type="radio" name="slider" id="slide1" checked>
              <input type="radio" name="slider" id="slide2">
              <input type="radio" name="slider" id="slide3">
              <input type="radio" name="slider" id="slide4">
              <input type="radio" name="slider" id="slide5">
      
              <div id="slides">
                 <div id="overflow">
                    <div class="inner">
                    <% for(int i=0; i<list1.size(); i++) { %>
                       <div class="slide slide_<%= i+1 %>">
                          <div id="greed<%= list1.get(i).getBookNo() %>">
                          <img src="<%= contextPath %>/resources/book_upfiles/<%= list1.get(i).getBookNo() %>.jpg" alt="" width="450" height="400">
                          </div>
                          <div class="slide-content">
                  
                             <div class="text_wrap">
                                <div class="timeline_title">
                                   <h1><%= list1.get(i).getTitle() %></h1><br>
                                   <h5><%= list1.get(i).getAuthor() %> 저 | <%= list1.get(i).getPublisher() %></h5><br>
                                   <h5>킹현빈 평론가의 평가</h5><br>
                                </div>
                     
                                <p class="imagecontent">
                                  
                                  <%= list1.get(i).getIntro() %>
                                    
                                </p>
                     
                             </div>
                          </div>
                       </div>
                       
                          
            			<script>
            			$('#greed<%= list1.get(i).getBookNo() %>').click(function(){
            		        location.href = "<%= contextPath %>/detail.bo?bno=<%= list1.get(i).getBookNo() %>";
            		    })
            			</script>
            
                       
                       <% } %>
            
            
                    </div>
                 </div>
              </div>
      
              <div id="controls">
              <label for="slide1"></label>
              <label for="slide2"></label>
              <label for="slide3"></label>
              <label for="slide4"></label>
              <label for="slide5"></label>
              </div>
   
   
   
           </div>
        </div>



        <br><br><br><br><br><br><br>

        <h1 align="center" style="width:980px;">금주의 에디터픽 베스트셀러</h1>
        <br>

        <div id="content_12">


        <div id="slider2">

        <input type="radio" name="slider2" id="slide12" checked>
        <input type="radio" name="slider2" id="slide22">
        <input type="radio" name="slider2" id="slide32">
        <input type="radio" name="slider2" id="slide42">
        <input type="radio" name="slider2" id="slide52">
            
        <div id="slides2">
        <div id="overflow2">
        <div class="inner2">


		<% for(int i = 0; i<list2.size(); i++) { %>
        <div class="slide2 slide_<%= i+1 %>2">
        <div id="greed2<%= list2.get(i).getBookNo() %>">
        <img src="<%= contextPath %>/resources/book_upfiles/<%= list2.get(i).getBookNo() %>.jpg" alt="" width="450" height="400">
        </div>
        <div class="slide-content2">

        <div class="text_wrap2">
        <div class="timeline_title2">
        <h1><%= list2.get(i).getTitle() %></h1><br>
        <h5><%= list2.get(i).getAuthor() %> 저 | <%= list2.get(i).getPublisher() %></h5><br>
        <h5>킹현빈 평론가의 평가</h5><br>
        <p></p>
        </div>

        <p>

		<%= list2.get(i).getIntro() %>

        </p>

        </div>
        </div>
        </div>


                          
            			<script>
            			$('#greed2<%= list2.get(i).getBookNo() %>').click(function(){
            		        location.href = "<%= contextPath %>/detail.bo?bno=<%= list2.get(i).getBookNo() %>";
            		    })
            			</script>
            
			<% } %>

        </div>
        </div>
        </div>

        <div id="controls2">
        <label for="slide12"></label>
        <label for="slide22"></label>
        <label for="slide32"></label>
        <label for="slide42"></label>
        <label for="slide52"></label>
        </div>



        </div>
        </div>

        <br><br><br><br><br><br><br>
        <h1 align="center" style="width:980px;">교보문고 실시간 인기순위</h1>
        <br>
        <div id="content_13">


        <div id="slider3">

        <input type="radio" name="slider3" id="slide13" checked>
        <input type="radio" name="slider3" id="slide23">
        <input type="radio" name="slider3" id="slide33">
        <input type="radio" name="slider3" id="slide43">
        <input type="radio" name="slider3" id="slide53">

        <div id="slides3">
        <div id="overflow3">
        <div class="inner3">

        <div class="slide3 slide_13">
          <div id="greed">
                   <img src="<%= contextPath %>/resources/book_upfiles/52.jpg" alt="" width="450" height="400">
            </div>
        <div class="slide-content3">
          
          <div class="text_wrap3">
              <div class="timeline_title3">
            <h1>첫 파이썬</h1><br>
            <h5>엘리스 코딩 저 | 이지스블리딩</h5><br>
            <h5>"코딩 기초 문법과 컴퓨팅 사고력부터 ‘점심 메뉴 추첨기’ 만들기까지!
				왕초보 맞춤 파이썬 입문서"</h5><br>
				<h5>김관민 평론가의 평가</h5><br>
           
          </div>
            
          <p>

         "코딩 기초 문법과 컴퓨팅 사고력부터 ‘점심 메뉴 추첨기’ 만들기까지!
왕초보 맞춤 파이썬 입문서

초등 고학년부터 필수인 코딩, 주인공 ‘엘리스 토끼’와 함께 게임하듯 배워보자. 176가지 그림과 45가지 코딩 문제를 풀다 보면 코딩 능력과 컴퓨팅 사고력을 동시에 기를 수 있다.

          </p>
              
          </div>
        </div>
        </div>




        <div class="slide3 slide_23">
          <div id="greed">
               <img src="<%= contextPath %>/resources/book_upfiles/55.jpg" alt="" width="450" height="400">
            </div>
        <div class="slide-content3">

          <h1>개발자로 살아남기</h1><br>
          <h5>박종천 저 | GOLDEN RABBIT</h5><br>
          <h5>고려진 평론가의 평가</h5><br>
          
          
          
          <p>"평생 개발자를 꿈꾼다면 30년 커리어패스를 설계하자

실리콘밸리와 우리나라에서 30년간 TOP 개발자로 활약한 저자의 커리어패스 인사이트를 공개한다. 저자가 제안하는 ‘성장하는 30년 커리어패스’에 도전하세요. 처음 10년은 성장하는 시기, 다음은 리딩하며 일하는 시기, 마지막은 서포트하는 시기다. 시기별로 엔지니어링 역량, 매니지먼트 역량, 비즈니스 역량을 갖추자. 이 책은 주니어/시니어 개발자, 팀장, 리드에 이르기까지 다양한 역할에 필요한 역량을 9가지 기술 중심으로 소개한다."</p>

        </div>

        </div>







        <div class="slide3 slide_33">
          <div id="greed">
              <img src="<%= contextPath %>/resources/book_upfiles/2.jpg" alt="" width="450" height="400">
            </div>
        <div class="slide-content3">

          <h1>달러구트 꿈 백화점</h1><br>
          <h5>이미예 저 | 팩토리나인</h5><br>
          <h5>박현빈 평론가의 평가</h5><br>


          <p>여기는 잠들어야만 입장할 수 있는 ‘달러구트 꿈 백화점’입니다

잠들어야만 입장할 수 있는 독특한 마을. 그곳에 들어온 잠든 손님들에게 가장 인기 있는 곳은, 온갖 꿈을 한데 모아 판매하는 ‘달러구트의 꿈 백화점’이다. 긴 잠을 자는 사람들은 물론이고, 짧은 낮잠을 자는 사람들과 동물들로 매일매일 대성황을 이룬다.</p>

        </div>

        </div>

        <div class="slide3 slide_43">
          <div id="greed">
              <img src="<%= contextPath %>/resources/book_upfiles/5.jpg" alt="" width="450" height="400">
            </div>
        <div class="slide-content3">

          <h1>아몬드</h1><br>
          <h5>손원평 | 창비</h5><br>
          <h5>강사님의 평가</h5><br>
          
          <p>『아몬드』의 주인공 ‘윤재’는 감정을 느끼는 데 어려움을 겪는 독특한 캐릭터다. 다른 사람의 말과 행동의 이면을 읽어 내지 못하고 공포도 분노도 잘 느끼지 못하는 윤재는 ‘평범하게’ 살아가려고 가까스로 버텨 오고 있다. 엄마에게서 남이 웃으면 따라 웃고, 호의를 보이면 고맙다고 말하는 식의 ‘주입식’ 감정 교육을 받기도 한다. 세상을 곧이곧대로만 보는 아이, ‘괴물’이라고 손가락질받던 윤재는 어느 날 비극적인 사건을 맞아 가족을 잃게 되면서 이 세상에 홀로 남는다.</p>

        </div>

        </div>

        <div class="slide3 slide_53">
          <div id="greed">
              <img src="<%= contextPath %>/resources/book_upfiles/24.jpg" alt="" width="450" height="400">
            </div>
        <div class="slide-content3">

          <h1>담론</h1><br>
          <h5>신영복 저 | 돌베게</h5><br>
          <h5>박평식 평론가의 평가</h5><br>
          
          <p>"우리 시대의 지성, 신영복의 삶과 철학!

신영복 교수는 1989년부터 거의 25년간 대학 강의를 하였다. 이제 그는 2014년 겨울 학기를 마지막으로 더 이상 대학 강단에 서지 않고 있다. 비정기적 특강을 제외한다면, 대학 강단에서 그를 보기는 어려울 듯하다. 대신 저자는 강단에 서지 못하는 미안함을 그의 강의를 녹취한 원고와 강의노트를 저본으로 삼은 책 『담론』으로 대신한다고 밝히고 있다.

</p>

        </div>

        </div>

        </div>
        </div>
        </div>

        <div id="controls3">
        <label for="slide13"></label>
        <label for="slide23"></label>
        <label for="slide33"></label>
        <label for="slide43"></label>
        <label for="slide53"></label>
        </div>



        </div>
        </div>






      </div>

    </div>
  </div>


	<br><br><br>


<%@ include file="../common/footer.jsp" %>
         
</body>
</html>