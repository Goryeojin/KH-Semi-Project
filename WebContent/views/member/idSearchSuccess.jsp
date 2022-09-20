<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기 완료</title>
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
        height: 320px;
        margin: auto;
        border: 1px solid grey;
    }
    #id_search_form{
        width: 300px;
        height: 300px;
        margin: auto;     
    }
    #outer1>h1{
        margin-top: 20px;
        margin-bottom: 20px;
    }   
    #id_search_email{
        width: 100%;
        height : 35px;
        color: rgb(130, 150, 50);
        font-weight: bold;
    }
    #logIn{
        width: 100%;
        height: 60px;
    }
    /*--------------- 스타일 */
    #id_search_email>input{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    #id_search_form p{
        color: rgba(65, 65, 65, 0.644);
        margin: auto;
        font-size: 12px;
    }
    #logIn>button{
        box-sizing: border-box;
        width: 100%;
        height: 100%;      
        margin-top: 3px;
    }
    #logIn{
        font-size: 13px;
        text-align: center;
        margin-top: 3px;
    }
    #solution>a{
        margin-top: 15px ;
        color: grey;
        font-size: 12px;
    }
    #solution>p{
    	margin-top: 15px ;
        color: grey;
        font-size: 12px;
        text-decoration : none;
    }
    #logIn button{
        background-color: rgb(130, 150, 50);
        color: white;
        border-radius: 5px;
    }

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1" align="center">      
            <h1 style="color: rgb(130, 150, 50);">README</h1>    
        
        <div id="outer2" align="center">
            <br><br>
            <h5>회원님의 아이디는 다음과 같습니다.</h5>
            <div id="id_search_form">   
            	
                    <div id="id_search_email">
                    
                       <%=userId %>
                    </div>
                    <p>
                        	로그인을 계속 하시려면 로그인 버튼을 눌러주세요.
                    </p> 
                    
                    <div id="logIn">
                        <button onclick="login();">로그인</button><br>        
                    </div>  
                   
                    <div id="solution">
                        <p>비밀번호를 잃어버리셨나요? </p>
                        <a href="<%=contextPath%>/resetPwdForm.me">비밀번호 재설정 ></a>
                    </div>   
                                
            </div>


        </div>
        <script>
        function login(){
        	
        	location.href = "<%=contextPath%>/loginForm.me";
        }
        

        </script>


    </div>
 <%@ include file="../common/footer.jsp" %>   
</body>
</html>