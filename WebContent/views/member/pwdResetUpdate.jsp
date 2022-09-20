<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
	String email = (String)request.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 완료</title>
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
        height: 390px;
        margin: auto;
        border: 1px solid grey;
    }
    #id_search_form{
        width: 300px;
        height: 300px;
        margin: auto;      
    }
    #email-area{
        width: 100%;
        height : 60px;
    }
    #home{
        width: 100%;
        height: 60px;
    }
    #login_login{
        width: 100%;
        height: 120px;
    }
    /*--------------- 스타일 */
    #email-area>input{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
    }
    #home>button{
        box-sizing: border-box;
        width: 100%;
        height: 100%;      
        margin-top: 7px;
        margin-bottom: 3px;
    }
    #home button{
        background-color: rgb(130, 150, 50);
        color: white;
        border-radius: 5px;
    }
    #email-area{
        color: rgb(130, 150, 50);
        font-size: 15px;
        font-weight: bold;
    }
    #email-area>p{
        margin: 8px;
    }
    #outer1>h1{
        margin-top: 20px;
        margin-bottom: 15px;
    }
    #outer2>h4{
        margin-top: 20px;
        margin-bottom: 12px;
        color: rgb(109, 109, 109);

    }
    #resetPwd-area>input{
        box-sizing: border-box;
        width: 100%;
        line-height: 35px;    
        margin-top: 3px;
        margin-bottom: 3px;
    }



</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1" align="center">      
        <h1 style="color: rgb(130, 150, 50);">README</h1>    
    
    <div id="outer2" align="center">
        <h4>이메일이 전송되었습니다!</h4>
        <div id="id_search_form">             
                <div id="email-area">
                    <p><%=email %></p>
                    로 인증 번호를 발송하였습니다.
                </div>
                <form action="pwdReset.me" method="post">
                    <div id="resetPwd-area">
                    	<input type="hidden" id="userId" name="userId" value="<%=userId%>">
                        <input type="text" id="pwdKey" name="pwdKey" required placeholder="인증번호">
                        <input type="password" name="changePwd1" id="changePwd1" required  placeholder="비밀번호 입력">
                        <input type="password" name="checkPwd" id="checkPwd" required placeholder="비밀번호 재입력">
                    </div>
                    <div id="home">
                        <button type="submit" onclick="return validate();">비밀번호 재설정</button>       
                    </div>       
                </form>                     
        </div>


    </div>


</div>
<script>
 	function validate(){
 		
 		// 2) 비밀번호 검사
        
        //비밀번호 : 영문 대문자/영문소문자/특수문자 총 2가지 이상 조합, 8자 ~ 32 자
        
        //var pw = $("userPwd").val();
        var pw = changePwd1.value;
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if(pw.length < 8 || pw.length > 32){
        alert("비밀번호를 8 ~ 32자로 입력해주세요.");
            return false;
        }else if(pw.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
            return false;
        }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
        alert("비밀번호는 영문, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
            return false;
        }else {
            console.log("통과");	 
        }


        // 3) 비밀번호 일치
        if(changePwd1.value != checkPwd.value){
            alert('동일한 비밀번호를 입력해주세요!');
            return false;
        }

 		
 	}
</script>
<%@ include file="../common/footer.jsp" %>
</body>
</html>