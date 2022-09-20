<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 FAQ</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
    button{
        /* float: right; */
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
    #content_2{
        width: 65%;
     
        /* clear: both; */
    }
    #content_1, #content_2{
        display: inline-block;
        height: 1000px;
        /* display: flex; */
    }
    #content_3{
        height: 70px;
        width: 100%;
    }
    #pageCategory_bar{
        width: 100%;
        height: 70px;  
        padding: 15px 10px 10px 10px;
        font-size: 17px; 
        box-sizing: border-box;
    }

    /*----*/
    
        #content_FAQ{
            margin-top: 40px;
        }
        .container {
          padding: 5px;
        }
        .container input[type='radio'] {
          display: none;
        }
        .container label {
          display: inline-block;
          padding: 0px 10px;
          height: 40px;
          line-height: 40px;
          font-size: 15px;
          cursor: pointer;
          text-align: center;
          border: 1px solid #eee;
        }
        .container input:checked + label {
          color: #fff;
          background: rgb(130, 150, 50);
        }
        .container .tab-content {
            display: none;
            width: 600px;
            border: 1px solid #eee;
            font-size: 15px;
            padding: 10px;
            }

        #tab1:checked ~ #tab-content1 {
            display: block;         
        }
        #tab2:checked ~ #tab-content2 {
            display: block;          
        }
        #tab3:checked ~ #tab-content3 {
            display: block;       
        }
        .FAQ-area{      
            width: 300px;
            line-height: 30px;
            border-radius: 10px;        
            padding: 5px;
            color: rgb(130, 150, 50);
            font-size: 15px;
        }

        .container p{
            padding-left: 15px;
            padding-top: 15px;
            width : 330px;
            height: 200px;        
            border-radius: 3px;
            color: rgb(88, 88, 88);
            display: none;

        }
</style>

</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_3">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 고객센터 > FAQ 
            </div>
        </div>
        <div id="content_1">
            <%@ include file="../common/clientServiceSidebar.jsp" %>
        </div>
        <div id="content_2">
            <div id="wrap">
                <div>
                    <h2 style="margin: 10px 0 0 20px; font-weight: bolder;">FAQ</h2>
                </div>
                <hr>
                <div id="content_FAQ" align="center">
                    <div class="container">
                        <input  id="tab1" name="tab-menu" type="radio" checked>
                        <label for="tab1">가입/탈퇴/로그인</label>
                        <input  id="tab2" name="tab-menu" type="radio">
                        <label for="tab2">사이트이용</label>
                        <input  id="tab3" name="tab-menu" type="radio">
                        <label for="tab3">기타</label>
                  
                        <div id="tab-content1" class="tab-content">
                          <div class="FAQ-area">Q. 로그인이 안될 경우</div>
                          <p>A.  알아서 하세요</p>
                      
                          <div class="FAQ-area">Q. 회원가입이 안 될 경우</div>
                          <p>A.  기도하세요</p>
                      
                          <div class="FAQ-area">Q. 탈퇴 방법</div>
                          <p>A.  탈퇴는 없다</p>
                      
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                      
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                      
                        </div>
                        <div id="tab-content2" class="tab-content">
                          <div class="FAQ-area">Q. 버튼이 잘 눌리지 않습니다</div>
                          <p>A.  껐다 키세요</p>
                  
                          <div class="FAQ-area">Q. 사이트가 예뻐요</div>
                          <p>A.  감사합니다</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                        </div>
                  
                        <div id="tab-content3" class="tab-content">
                          <div class="FAQ-area">Q. 적립금은 어디에 쓰나요?</div>
                          <p>A.  상품으로 바꿔드립니다.</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                  
                          <div class="FAQ-area">Q. 반품은 언제되나요?</div>
                          <p>A.  반품은 3-4달</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            $(function(){
                $('.FAQ-area').click(function(){
                   
                    var $p = $(this).next();
                 
                    if($p.css('display') == 'none'){
             
                     
                        $p.siblings('p').slideUp(1000);
                        
                       
                        $p.slideDown(1000);
                        
                    }else{
                        $p.slideUp(1000);
                    }
                })
            })
        
        </script>
       
           
           
    </div>
    </div>

   <%@ include file="../common/footer.jsp" %>
</body>
</html>