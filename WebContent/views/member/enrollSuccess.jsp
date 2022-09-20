<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.readme.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
	//m에 담겨있는 정보 : userId, userPwd, userName, email, gender, birth, event, info

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
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
        height: 250px;
        margin: auto;
        border: 1px solid grey;
    }
    #enrollSuccess{
        width: 300px;
        height: 300px;
        margin: auto;      
    }   
    #email-area{
        width: 100%;
        height : 20px;
    }
    #loginPage{
        width: 100%;
        height: 60px;
    }
    #outer1>h1{
        margin-top: 20px;
        margin-bottom: 20px;
    }
   
    /*--------------- 스타일 */
    #email-area>input{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    #loginPage>button{
        box-sizing: border-box;
        width: 100%;
        height: 100%;      
        margin-top: 3px;
    }
    #loginPage button{
        background-color: rgb(130, 150, 50);
        color: white;
        border-radius: 5px;
    }
    #loginPage a{
        text-decoration: none;
        font-size: 15px;
        color: white;
    }
    #email-area{
        color: rgb(130, 150, 50);
        font-size: 20px;
        font-weight: bold;
    }
    #email-area>p{
        margin: 8px;
    }
    #enrollSuccess>p{
        font-size: 12px;
        color: grey;
    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1" align="center">      
        <h1 style="color: rgb(130, 150, 50);">README</h1>    
    
    <div id="outer2" align="center">
        <br>
        <h4>회원가입이 완료되었습니다!</h4>
        <div id="enrollSuccess">             
                <div id="email-area">
                    <p><%= m.getEmail() %></p> <!-- 유저 이메일 띄워줌 -->               
                </div>
                <br>
                <p>반갑습니다  <%= m.getUserName() %>회원님♥<br><!-- 유저 이름 띄워줌 -->
                    README에서 다양한 책 리뷰를 만나보세요!
                </p>
                <div id="loginPage">
                    <button type="button" onclick="loginPage()">로그인</button>       
                </div>                            
        </div>

    </div>


</div>

<script>
    function loginPage(){
        location.href="<%= contextPath %>/loginForm.me";
          
    }

</script>


<%@ include file="../common/footer.jsp" %>
</body>
</html>