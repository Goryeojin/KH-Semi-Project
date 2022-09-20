<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>

<style>
    div{        
        box-sizing: border-box;
        position: relative;
    }
    #outer1{
        width: 1200px;
        height: 800px;
        margin: auto;
    }
    #outer2{
        width: 450px;
        height: 280px;
        margin: auto;
        border: 1px solid grey;
    }
    #id_search_form{
        width: 300px;
        height: 300px;
        margin: auto;         
    }  
    #id_search_email{
        width: 100%;
        height : 60px;
    }
    #id_search_button{
        width: 100%;
        height: 60px;
    }
    #login_login{
        width: 100%;
        height: 120px;
    }
    #outer1>h1{
        margin-top: 20px;
        margin-bottom: 20px;
    }
     /*--------------- 스타일 */
    #id_search_email>input{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    #id_search_button>button{
        box-sizing: border-box;
        width: 100%;
        height: 100%;      
        margin-top: 3px;
    }
    #id_search_button{
        font-size: 13px;
        text-align: center;
        margin-top: 3px;
     }
    #solution{
        color: grey;
        font-size: 11px;
        margin-top: 5px;
    }
    #solution>a{
        color : black;
        text-decoration: none;
        font-weight: bold;
         
    }
    #id_search_button button{
        background-color: rgb(130, 150, 50);
        color: white;
        border-radius: 5px;
    }
    #outer2>h3{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    #fail{
        color : red;
        font-size: 10px;
    }

</style>
<body>

<%@ include file="../common/menubar.jsp" %>
  <div id="outer1" align="center">      
            <h1 style="color: rgb(130, 150, 50);">README</h1>    
        
        <div id="outer2" align="center">
            <h3 style="color: rgb(130, 150, 50);">아이디 찾기</h3>
            <div id="id_search_form">
               <form action="<%= contextPath %>/idSearch.me" method="post"> <!-- 서블릿 만들어줌  -->

                    <div id="id_search_email">
                        <input type="email" name="email" required placeholder="이메일 주소"><br> 
                    </div>
                   
                    <span id="fail">
                   		<!-- 이메일 다를 때 띄워줄 span요소 생성 -->
                     </span>
                    <div id="id_search_button">
                        <button type="submit">찾기</button><br>        
                    </div>  
                    <div id="solution">
                       	 이메일이 잘 기억나지 않으세요?
                        <a href="<%=contextPath%>/faq.cs">해결방법 보러가기 ></a>                     
                    </div>  
              
                </form>
            </div>
        </div>
       

    </div>
    
    <script>
   
    window.onload = function(){
    	if("<%=userId%>" == "NN"){
        	$("#fail").html("※ 이메일주소를 다시 한번 확인해주세요");
        }
    }

    </script>
    

<%@ include file="../common/footer.jsp" %>
</body>
</html>