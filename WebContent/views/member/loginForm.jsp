<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        div{
            /* border: red solid 1px; */
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
            height: 420px;
            margin: auto;
            border: 1px solid grey;
        }
        #login_form{
            width: 300px;
            height: 300px;
            margin: auto;
        }
        
        #login_id_Pwd{
            width: 100%;
            height : 120px;
        }
        #login_sta{
            width: 100%;
            height: 30px;
        }
        #login_login{
            width: 100%;
            height: 120px;
        }

        #login_id_Pwd>input{
            box-sizing: border-box;
            width: 100%;
            height: 50%;
        }
        #login_login>button{
            box-sizing: border-box;
            width: 100%;
            height: 50%;       
            margin-top: 3px;
        }
        #login_sta{
            font-size: 13px;
            text-align: center;
            margin-top: 3px;
        }
        #login_sta>a{
            text-decoration : none;
            color : rgb(130, 150, 50);
        }
        #login_login button{
            background-color: rgb(130, 150, 50);
            color: white;
            border-radius: 10px;
        }
        #outer1>h1{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #outer2>h3{
            padding: 10px;
        }



    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div id="outer1" align="center">      
            <h1 style="color: rgb(130, 150, 50);">README</h1>    
        
        <div id="outer2" align="center">
            <h3 style="color: rgb(130, 150, 50);">?????????</h3>
            <div id="login_form">
                <form action="<%= contextPath %>/login.me" method="post" name="loginform">

                    <div id="login_id_Pwd">
                        <input type="text" name="userId" required placeholder="?????????"><br>
                        <input type="password" name="userPwd" required placeholder="????????????">
                    </div>
                    <div id="login_sta"><!-- ?????? ?????????!!!!!!!!!!!!!!!! -->
                        <!--????????? ?????? ?????? ???????????? ??? ????????? ???????????? -->
                         <a href="<%=contextPath %>/idSearchForm.me">????????? ??????</a> / <a href="<%=contextPath %>/resetPwdForm.me">???????????? ?????????</a>
                    </div>  <!--  ???????????? ?????? -> ???????????? ??????????????? ????????? -->
            
                </form>
                    <div id="login_login">
                        <button style="background-color: rgb(130, 150, 50)" onclick="login()">?????????</button><br>
                        <button style="background-color: rgb(62, 76, 28)" onclick="enrollPage()">????????????</button>
                    </div>     
            </div>


        </div>

        <script>
            function enrollPage(){

                 location.href = "<%= contextPath %>/enrollForm.me";
            }
            
            function login(){
            	
            	   document.loginform.submit();
            }
            
          
        </script>






    </div>
    
</body>
</html>