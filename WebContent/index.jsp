<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "com.readme.book.model.vo.*" %>
   
<!DOCTYPE html>
<html lang="en">
<head>
<title>도서 리뷰 사이트 Read me</title>
<style>




  /* 박현빈 메인 컨텐츠 대대적 수정 ㅜㅜ */
  /* 거의 전부 다 수정 ㅜ*/




  /* 컨텐츠 부분 */
    #content{
      width: 1300px;
      padding: 20px 30px;
      margin: 0 auto;
    }
    #content_1{
      height: 650px;
      border-bottom: 2px solid gray;
    }
    
    #content_2{
      border-bottom: 2px solid gray;
      height: 600px;
    }
    #content_3{
      height: 680px;
    }

  /*컨텐츠 1 시작*/
#content_1_title{
  background-color: rgb(228, 222, 222);
  border-radius: 10px;
  width: 1000px;
  margin-left: 130px;
  margin-top: 100px;
}
#content_11{
  margin-left: 130px;
  margin-top: 80px;
}
.greed1{
  cursor: pointer;
}

  #slider1 {
          margin: 0 auto;
          width: 1000px;
          max-width: 100%;
          text-align: center;
          margin-left: 0px;
          margin-top: 0px;
          
        }
        
        #slider1 input[type=radio] {
          display: none;
        }
        
        #slider1 label {
          cursor: pointer;
          text-decoration: none;
        }
        
        #slides1 {
          padding: 10px;
          border: 3px solid #ccc;
          background: #fff;
          position: relative;
          z-index: 1;
        }
        #overflow1 {
          width: 100%;
          overflow: hidden;
        }
        
        #slide11:checked ~ #slides1 .inner1{
          margin-left: 0;
        }
        #slide21:checked ~ #slides1 .inner1{
          margin-left: -100%;
        }
        #slide31:checked ~ #slides1 .inner1{
          margin-left: -200%;
        }
        #slide41:checked ~ #slides1 .inner1{
          margin-left: -300%;
        }
        #slide51:checked ~ #slides1 .inner1{
          margin-left: -400%;
        }
        
        #slides1 .inner1 {
          transition: margin-left 800ms cubic-bezier(0.0770, 0.000, 0.175, 1.000);
          width: 500%; /*-> 아이템 수 * 100*/
          line-height: 0;
          height: 400px;
        } 
        
        #slides1 .slide1 {
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

        .slide-content1 {
            width: 800px;
            margin-left : 0px;
            height:300px;


        }
        
        #controls1 {
          margin: -130px 0 0 0;
          width: 100%;
          height: 50px;
          z-index: 3;
          position: relative;
        }
        #controls1 label {
          transition: opacity 0.2s ease-out;
          display: none;
          width: 50px;
          height: 50px;
          opacity: .4;
        }
        #controls1 label:hover {
          opacity: 1;
        }
        
        #slide11:checked ~ #controls1 label:nth-child(2),
        #slide21:checked ~ #controls1 label:nth-child(3),
        #slide31:checked ~ #controls1 label:nth-child(4),
        #slide41:checked ~ #controls1 label:nth-child(5),
        #slide51:checked ~ #controls1 label:nth-child(1)
        {

      
          background: url(resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
          float: right;
          margin: -100px -55px 0 0;
          display: block;
     

        }
        #slide11:checked ~ #controls1 label:nth-child(5),
        #slide21:checked ~ #controls1 label:nth-child(1),
        #slide31:checked ~ #controls1 label:nth-child(2),
        #slide41:checked ~ #controls1 label:nth-child(3),
        #slide51:checked ~ #controls1 label:nth-child(4)
        
        {
          background: url(resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
          float: left;
          margin: -100px 0 0 -55px;
          display: block;
        }


   


        #slide11:checked ~ #bullets1 label:nth-child(1),
        #slide21:checked ~ #bullets1 label:nth-child(2),
        #slide31:checked ~ #bullets1 label:nth-child(3),
        #slide41:checked ~ #bullets1 label:nth-child(4),
        #slide51:checked ~ #bullets1 label:nth-child(5)
        {
          background: #333;
        }
  /*컨텐츠 1 끝*/

  /* 컨텐츠 2 시작*/
  #content_2_title{
  background-color: rgb(228, 222, 222);
  border-radius: 10px;
  margin-top: 60px;
  width: 1000px;
  margin-left: 130px;
}
#content_12{
  margin-left: 130px;
  margin-top: 80px;
}
.greed2{
  cursor: pointer;
}
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

      
          background: url(resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
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
          background: url(resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
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

  /* 컨텐츠 2 끝*/
    
  /*컨텐츠 3 시작*/
 
  p{
            line-height: 30px;
        }
        #content_3_title{
  background-color: rgb(228, 222, 222);
  border-radius: 10px;
  width: 1000px;
  margin-top: 50px;
  margin-bottom: 80px;
  margin-left: 130px;
}

#content_13{
  margin-left: 130px;
  margin-top: 80px;
}
.greed3{
  cursor: pointer;
}
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

      
          background: url(resources/view_img/rightArrow.png) no-repeat; /* 오른쪽 화살표 이미지 */
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
          background: url(resources/view_img/leftArrow.png) no-repeat; /*요긴 왼쪽*/
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
        
     .slide-content1 p{
     	margin-top : 30px;
     }
      .slide-content1 h5{
     	margin-top : 10px;
     }
      .slide-content1 h1{
     	margin-top : 50px;
     }
     
     #ranking{
        float: right;
        background-color: rgb(120,150,50);
        width: 60px;
        height: 60px;
        border-radius: 50%;
        margin-top:-50px;
        

    }
    #rankingText{
    padding-top:22px;
     
        margin-top : 6px;
        color: white;
        font-size: 20pt;
        font-weight: bold;
        
    }
    
    .timeline_title1 h4{
    	color:rgb(120,150,50);
    	margin-left:90px;
    	margin-top:-50px;
    	font-weight : 600;
    width : 500px;
    	border : 2px solid rgb(120,150,50);
    	border-radius: 20px;
    }

    .slide-content1 h6{
      font-weight: 600;
    	color: deepskyblue;
    	
    }
    
    
    
    
    



</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>

  <script>
    $(function(){
      
      
	

    })

    


    






  </script>



<div id="content">
  <div id="content_1">
    
    <div id="content_1_title">
      <h2 style="text-align:center;">리뷰가 가장많은 순</h2>
    </div>
    
    <div id="content_11">
                                
                                    
      <div id="slider1">
    
    
        <input type="radio" name="slider1" id="slide11"  value="5" checked>
        <input type="radio" name="slider1" id="slide21" onclick="test1();" value="1">
        <input type="radio" name="slider1" id="slide31" onclick="test1();" value="2">
        <input type="radio" name="slider1" id="slide41" onclick="test1();" value="3">
        <input type="radio" name="slider1" id="slide51" onclick="test1();" value="4">
    
    
        <div id="slides1">
          <div id="overflow1">
            <div class="inner1">
    
              <div class="slide1 slide_11" >
              
              
              
            
              
                  <div class="greed1">
                      <img src="resources/book_upfiles/36.jpg" alt="" width="275px" height="400px" >
                    </div>
                <div class="slide-content1">
                  
                  <div class="text_wrap1">
                      <div class="timeline_title1">
                      <h4>지난 달 리뷰가 가장 많이 달린 책</h4>
                    <h1>인간의 생존 집단의 경쟁</h1><br>
                    <h5>조남수 저 | 바이북스</h5><br>
                    <p></p>
                  </div>
                    
                  <p>

                     황혼에 서 있는 한 시민이 쓴 명상록. 저자 조남수는 지역에서 성실하게 살아온 평범한 사람이기에 지나온 삶의 이야기를 같이 나누고 싶어 황혼에
                      서 있는 한 시민이 쓴 명상록인 《인간의 생존 집단의 경쟁》을 썼다. 이 책은 제20대 대통령후보와 국민에게 전하는 생존의 메시지이다.
                       저자의 생생한 경험에서 우러나온 국민건강과 부동산에 대한 소회와 대안 제시를 담고 있으며 이는 근본해결보다 매번 겉도는 정부정책에 대한 충고의 의미도 있다.
                        저자의 경험과 생각이 살아가야 할 날이 많은 사람들에게 조금은 도움이 되기를 기대한다.
                         
                      
                  </p>
                     
                  </div>
              </div>
              </div>

              


              <div class="slide1 slide_21" id="slide_11">
                 
                
              </div>






    
              <div class="slide1 slide_31"  id = "slide_21">
                  
                
              </div>
    
              <div class="slide1 slide_41" id = "slide_31">
                  
                
              </div>
    
              <div class="slide1 slide_51"  id = "slide_41">
                 
                
              </div>
    
            </div>
          </div>
        </div>

        <div id="controls1">
          <label for="slide11"></label>
          <label for="slide21"></label>
          <label for="slide31"></label>
          <label for="slide41"></label>
          <label for="slide51"></label>
        </div>

   
      </div>
	</div>
    </div>
    
    <script>
		function test1(){
			
			var Num = $('input[name=slider1]:checked').val();
			
			$.ajax({
				url : "mainBestSeller.bo",
				data : { no : Num},
				success : function(result){
					
					// VO객체 하나만 보낸 케이스
					
					var resultStr = "<div class="+'"greed1"'+">"
					+'<img src='+'"resources/book_upfiles/'+ result.bookNo+'.jpg"'+'width="275px" onclick="imgr1('+result.bookNo+');" height="400px">'
                    + '</div>'  
               		+'<div class="slide-content1">'
                	+'<div id='+'"ranking">'
                 + '<div id="rankingText">'+Num+'위'+'</div>'
                 +'</div>'
                  +'<h1>'+result.title+'</h1><br>'
                  +'<h5>'+result.author+'저 | '+result.publisher+'</h5><br>'
                  +'<h6>평균 별점 ★ : '+result.scope+'</h6><br>'
                 + '<p>'+result.intro+'</p>'
                +'</div>';
				
					$('#slide_'+Num+1).html(resultStr);
					
					
					
					
					
				
					
				},
				error : function(){
					alert("AJAX실패");
				}
				
			})
			
		
			

			
		}
		
		
				
		
		</script>
    
    <div id ="content_2">
    <div id="content_2_title">
      <h2 style="text-align:center;">평균 별점이 높은 작품</h2>
    </div>
    <div id="content_12">
      
                                
                                    
      <div id="slider2">
    
        <input type="radio" name="slider2" id="slide12"  value="5" checked>
        <input type="radio" name="slider2" id="slide22" onclick="test2();" value="1">
        <input type="radio" name="slider2" id="slide32" onclick="test2();" value="2">
        <input type="radio" name="slider2" id="slide42" onclick="test2();" value="3">
        <input type="radio" name="slider2" id="slide52" onclick="test2();" value="4">
    
        <div id="slides2">
          <div id="overflow2">
            <div class="inner2">
    
              <div class="slide2 slide_12">
                  <div class="greed2">
                      <img src="resources/book_upfiles/27.jpg" alt="" width="275px" height="400px" >
                    </div>
                <div class="slide-content2">
                  
                  <div class="text_wrap2">
                      <div class="timeline_title2">
                    <h1>곰브리치 세계사</h1><br>
                    <h5>에른스트 H. 곰브리치  저 |  비룡소</h5><br>
                   <br>
                    <p></p>
                  </div>
             
                    
                  <p>
					『곰브리치 세계사』는 복잡한 전문 용어가 아닌 쉬운 말로 세계사를 설명하는 청소년을 위한 책으로 곰브리치가 1935년에 쓴
					 『선사 시대부터 현재까지 세계의 역사』의 개정판 『젊은 독자를 위한 세계사』 를 번역한 것이다. 저자는 이 책을 쓰기 위해서
					방대한 세계사의 여러 사건들을 하나의 기준을 통해서 정리한 뒤, 각 주제와 관련된 기존의 모든 책과 글을 읽은 뒤 그에 대한 내용을 써내려갔다. 이 책은 선사시대부터,
 					작가가 직접 경험한 세계 2차대전까지의 인류 역사의 굵직한 사건들을 다루고 있으면서도 딱딱하고 어려운 역사 용어가 아닌 쉽고 재미있는 설명으로 쓰여졌다.
                  </p>
                     
                     
                  </div>
              </div>
              </div>
              
             
              


              <div class="slide2 slide_22" id="slide_12">
                  
                
              </div>






    
              <div class="slide2 slide_32"id="slide_22">
                 
                
              </div>
    
              <div class="slide2 slide_42" id="slide_32">
                 
                
              </div>
    
              <div class="slide2 slide_52" id="slide_42">
                 
                
              </div>
    
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

   			
   			<script>
		function test2(){
			
			var Num = $('input[name=slider2]:checked').val();
			
			$.ajax({
				url : "mainScope.bo",
				data : { no : Num},
				success : function(result){
					
					// VO객체 하나만 보낸 케이스
					
					var resultStr = "<div class="+'"greed2"'+">"
					+'<img src='+'"resources/book_upfiles/'+ result.bookNo+'.jpg"'+'width="275px" onclick="imgr2('+result.bookNo+');" height="400px">'
                    + '</div>'  
               		+'<div class="slide-content2">'
                	+'<div id='+'"ranking">'
                 + '<div id="rankingText">'+Num+'위'+'</div>'
                 +'</div>'
                  +'<h1>'+result.title+'</h1><br>'
                  +'<h5>'+result.author+'저 | '+result.publisher+'</h5><br>'
                  +'<h6>평균 별점 ★ : '+result.scope+'</h6><br>'
                 + '<p>'+result.intro+'</p>'
                +'</div>';
				
					$('#slide_'+Num+2).html(resultStr);
					
					
					
					
					
				
					
				},
				error : function(){
					alert("실패");
				}
				
			})
			
		
			

			
		}
		
		
				
		
		</script>
    
      </div>
</div>
</div>
    
<div id ="content_3">
  <div id="content_3_title">
    <h2 style="text-align:center;">전문가가 선정한 책</h2>
  </div>
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
                <div class="greed3" id="greed3_1">
                    <img src="resources/book_upfiles/6.jpg" alt="" width="275px" height="400px" >
                  </div>
              <div class="slide-content3">
                
                <div class="text_wrap3">
                    <div class="timeline_title3">
                  <h1>꽃을 보듯 너를 본다</h1><br>
                  <h5>나태주 저 | 지혜</h5><br>
                  <h5>고려진 평론가의 평가</h5><br>
                  <p></p>
                </div>
                  
                <p>

                    나태주 시집 『꽃을 보듯 너를 본다』. 이 시집은 시인 나태주의 시 가운데 인터넷의 블로그나 트위터에서 자주 오르내리는 시들만 모아 엮은 책이다.
                    
                </p>
                   
                </div>
            </div>
            </div>

            


            <div class="slide3 slide_23">
                <div class="greed3" id="greed3_2">
                    <img src="resources/book_upfiles/28.jpg" alt="" width="275px" height="400px">
                  </div>
              <div class="slide-content3">
           
                <h1>총, 균, 쇠</h1><br>
                <h5>재레드 다이아몬드 저 | 문학사상</h5><br>
                <h5> 유은비 평론가의 평가</h5><br>
                
                
                
                <p>"인류문명의 불균형은 총, 균, 쇠 때문이다!

					퓰리처상을 수상한 세계적 석학 재레드 다이아몬드 박사의 『총, 균, 쇠』. ‘왜 어떤 민족들은 다른 민족들의 정복과 지배의 대상으로 전락하고 말았는가?’"
					</p>
              </div>
              
            </div>






  
            <div class="slide3 slide_33">
                <div class="greed3" id="greed3_3">
                    <img src="resources/book_upfiles/32.jpg" alt="" width="275px" height="400px">
                  </div>
              <div class="slide-content3">
           
                <h1>칼뱅 작품선 5</h1><br>
                <h5>장 칼뱅 저 | 아낙이</h5><br>
                <h5>킹현빈 평론가의 평가</h5><br>
                
                
                <p>"「피기우스의 자유의지 논박」은 루터의 「노예의지론」과 동일 선상에 있으면서, 구체적인 사안에 대한 논박하는 가운데
 				프로테스탄트 종교개혁의 근본 원인을 알려 준다."</p>

              </div>
              
            </div>
  
            <div class="slide3 slide_43">
                <div class="greed3" id="greed3_4">
                    <img src="resources/book_upfiles/48.jpg" alt="" width="275px" height="400px">
                  </div>
              <div class="slide-content3">
           
                <h1>전기차 첨단기술 교과서</h1><br>
                <h5>톰 덴튼  저 | 보누스</h5><br>
                <h5>우윤희 평론가의 평가</h5><br>
                
                
                <p>전기 자동차에 관한 모든 것을 담은 기술 교양서다. 전기 자동차의 역사와 종류는 물론이고, 구조와 작동원리를 해설한다.
                 전기 자동차는 분명히 자동차 산업의 미래이지만, 전기 자동차를 둘러싼 오해와 소문은 여전히 만연하다. 전기 자동차와 관련한 기술적 이해도가 낮기 때문이다.
                 </p>

              </div>
              
            </div>
  
            <div class="slide3 slide_53">
                <div class="greed3" id="greed3_5">
                    <img src="resources/book_upfiles/54.jpg" alt="" width="275px" height="400px">
                  </div>
              <div class="slide-content3">
           
                <h1>컴퓨터 개론</h1><br>
                <h5>강환수 저 | INFINITY BOOKS</h5><br>
                <h5>김미라 평론가의 평가</h5><br>
                
                <p>‘4차 산업혁명’을 가장 잘 설명한 안내서</p>

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

        <script>
             // 박현빈 제이쿼리문 추가
             
     
             
   	function imgr1(a){
   		location.href = "<%= contextPath %>/detail.bo?bno="+a; 
             }
   	function imgr2(a){
   		location.href = "<%= contextPath %>/detail.bo?bno="+a; 
             }
   
   	$('.greed1').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=36";
    })
   
   	$('.greed2').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=27";
    })


    $('#greed3_1').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=6";
    })

    $('#greed3_2').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=28";
    })

    $('#greed3_3').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=32";
    })
    
    $('#greed3_4').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=48";
    })
    
    $('#greed3_5').click(function(){
        location.href = "<%= contextPath %>/detail.bo?bno=54";
    })

   



        </script>
    </div>
  </div>
<%@ include file="../views/common/footer.jsp" %>
</body>
</html>