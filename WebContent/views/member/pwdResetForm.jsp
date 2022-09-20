<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
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
            width: 470px;
            height: 360px;
            margin: auto;
            border: 1px solid grey;
        }
        #pwdSearch_form{
            width: 300px;
            height: 300px;
            margin: auto;
        }
        
        #input-area{
            width: 100%;
            height : 120px;
        }
      
        #ok{
            width: 100%;
            height: 60px;
        }

        #input-area>input{
            box-sizing: border-box;
            width: 100%;
            height: 50%;
        }
        #ok>button{
            box-sizing: border-box;
            width: 100%;
            height: 100%;           
            margin-top: 3px;
        }   
        #ok button{
            background-color: rgb(130, 150, 50);
            color: white;
            border-radius: 10px;
        }
        #solution{
            font-size: 11px;
            color: grey;
            padding: 10px;
           
        }
        #solution a{
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
        #outer1>h1{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #outer2>h3{
            margin-top: 20px;
            margin-bottom: 20px;
        }



    </style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1" align="center">      
            <h1 style="color: rgb(130, 150, 50);">README</h1>    
        
        <div id="outer2" align="center">
            <h3 style="color: rgb(130, 150, 50);">비밀번호 재설정</h3>
            <div id="pwdSearch_form">
                <form action="pwdResetEmail.me" method="post">

                    <div id="input-area">
                        <input type="text" name="userId" required placeholder="아이디"><br>
                        <input type="email" name="email" required placeholder="이메일 주소">
                    </div>
                   
                    <div id="ok">
                        <button type="submit">재설정</button><br>                      
                    </div> 
                   
                    <div id=solution>
                        아이디가 기억나지 않으세요? <a href="<%=contextPath%>/idSearchForm.me">아이디 찾으러 가기 ></a><br>
                        이메일이 기억나지 않으세요? <a href="<%=contextPath%>/faq.cs">해결방법 보러가기 ></a>
                    </div> 
            
            
                </form>
            </div>


        </div>






    </div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>