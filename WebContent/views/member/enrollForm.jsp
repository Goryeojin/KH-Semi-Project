<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>회원가입</title>
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
        height: 700px;
        margin: auto;
        border: 1px solid grey;
    }
    form>input{
        width: 100%;
        height: 40px;
    }
    #outer2>form{
        width: 300px;
        margin: auto;
        margin-top: 40px;
    }
    #outer2 .area{
        height: 50px;
        width: 300px;
        margin: 15px 0px;       
    }
    #userId-area input, #email-area input, #userName-area input, #enroll-area input{
        height: 100%;
        width: 300px;
        box-sizing: border-box;         
    }
    /*생년월일 + 성별 레이아웃*/
    #birth-gender-area{
        height: 50px;
        width: 300px;
    }
    #birth-area{         
        width: 160px;
        height: 100%;
        float: left;
        box-sizing: border-box;  
        margin-right: 40px;
    }
    #gender-area{          
        width: 100px;  
        height: 100%;             
        box-sizing: border-box;           
    }
    #birth-area input{
        height: 100%;      
        box-sizing: border-box;   
    }
    #outer1>h1{
        margin-top: 20px;
        margin-bottom: 20px;
    }
    /**/
    #userPwd-area input{
        height: 50%;
        width: 300px;
        box-sizing: border-box;
    }
    /*스타일*/
    #clause-area>label {
        color : grey;
        font-size: 13px;
    }
    #clause-area>a{
        color: grey;
        text-decoration: none;
        font-size: 9px;
    }
    #enroll-area>button{
        color: white;
        background-color: rgb(130, 150, 50);
    }
    #clause-area{
        border: 1px solid grey;
        border-radius: 3px;
        padding-left: 5px;
    }   
    .switch-field {
        display: flex;
        width: 100px;     
        overflow: hidden;         
    }
    .switch-field input {
        position: absolute !important;
        clip: rect(0, 0, 0, 0);
        height: 1px;
        width: 1px;
        border: 0;
        overflow: hidden;
    }
    .switch-field label {
        background-color: #ffffff;
        color: rgba(0, 0, 0, 0.6);
        font-size: 14px;
        line-height: 1;
        text-align: center;
        padding: 14px 16px 8px 16px;
        margin-right: -1px;
        border: 1px solid rgba(0, 0, 0, 0.2);
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.3), 0 1px rgba(255, 255, 255, 0.1);
        transition: all 0.1s ease-in-out;
    }
    .switch-field label:hover {
        cursor: pointer;
    }
    .switch-field input:checked + label {
        background-color: rgb(130, 150, 50);
        box-shadow: none;
    }
    .switch-field label:first-of-type {
        border-radius: 4px 0 0 4px;
    }
    .switch-field label:last-of-type {
        border-radius: 0 4px 4px 0;
    }
    .check-area{
        font-size: 10px;
        color: red;
        margin: auto;

    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="outer1">
        <h1 style="color: rgb(130, 150, 50);" align="center">README</h1> 
        <div id="outer2">
            <form action="<%= contextPath %>/insert.me" method="post" id="enrollForm" name="enrollForm">
                <div id="userId-area" class="area">
                    <input type="text" name="userId" id="userId" required placeholder="아이디">
                    <p class="check-area" id="idCheck-area"> </p>
                </div>

                <div id="userPwd-area" class="area2" style="height: 100px;">
                    <input type="password" name="userPwd" id="userPwd" required placeholder="비밀번호"><br>
                    <input type="password" name="checkPwd" id="checkPwd" required placeholder="비밀번호 확인">
                </div>

                <div id="email-area" class="area">
                    <input type="email" name="email" required placeholder="이메일 주소">
                    <p class="check-area" id="emailCheck-area"> </p>
                </div>

                <div id="userName-area" class="area">
                    <input type="text" name="userName" id="userName" required placeholder="이름">
                </div>

                <div id="birth-gender-area">
                    <div id="birth-area" class="area2">
                        <input type="text" name="birth" id="birth" required placeholder="생년월일  yyyy-mm-dd">
                        <br>
                    </div>

                    <div id="gender-area" class="switch-field">
                        <input type="radio" id="M" name="gender" value="M" checked>
                        <label for="M">남</label>
                        <input type="radio" id="F" name="gender" value="F">
                        <label for="F">여</label>
                    </div>
                </div>  
               
                <div id="clause-area" class="area" style="height: 150px;">
                    <input type="checkbox" class="all" id="all">
                        <label for="all">전체</label><br>
                    <input type="checkbox" class="agr" id="useAgreement" required>
                        <label for="useAgreement">이용약관 동의(필수)</label><a href="">  약관보기 ≫</a><br>
                    <input type="checkbox" class="agr" id="dataAgreement" required>
                        <label for="dataAgreement">개인 정보 수집 및 이용 동의(필수)</label><a href="">  약관보기 ≫</a><br>
                    <input type="checkbox" name="clause" class="agr" id="eventAgreement" value="eventAgreement">
                        <label for="eventAgreement">이벤트, 혜택 알림 수신 동의(선택)</label><br>
                    <input type="checkbox" name="clause" class="agr" id="infoAgreement" value="infoAgreement">
                        <label for="infoAgreement">성별, 생년 정보 제공 동의(선택)</label>
                </div>
               
                <div id="enroll-area">
                    <button id="enrollBtn" class="area" onclick = "return validate();">회원 가입 완료</button>
                </div>
              
            </form>
        </div>
    </div>

    <script>
        $(function(){

           //체크박스 전체 선택
            $("#all").on('change', function(){

                var $all = $('#all').prop('checked');

                if($all){
                    $('.agr').prop('checked',true);
                }else{
                    $('.agr').prop('checked',false);
                }
            })
            $('.agr').on('change', function(){

                var $agr = $('.agr').prop('checked');

                if($agr == false){
                    $('#all').prop('checked', false);
                }

            })
            
            //ajax 사용(아이디 중복체크)
            $("#enrollForm input[name=userId]").on("change", function(){
               var $userId = $(this).val();
               //console.log($userId);
               //ajax로 컨트롤러에 요청하기
               $.ajax({
                  url : "idCheck.me",
                  data : { checkId : $userId },
                  success : function(result){
                     console.log(result);
                     //result : NN(아이디 사용 불가능) YY(아이디 사용 가능)
                     if(result == "NN" ){
                        $("#idCheck-area").text("이미 존재하는 아이디입니다.")
                     }else{
                        $("#idCheck-area").text("")
                        //$("#idCheck-area").text("사용 가능한 아이디입니다.")
                     }
                     
                  },
                  error : function(){
                     console.log("아이디 중복체크 실패")
                  }
                  
               })
               
               
            })
            
            //이메일 중복 체크
             $("#enrollForm input[name=email]").on("change", function(){
               var $email = $(this).val();
               //console.log($email);
               //ajax로 컨트롤러에 요청하기
               $.ajax({
                  url : "emailCheck.me",
                  data : { email : $email },
                  success : function(result){
                     //result : NN(이메일 사용 불가능) YY(이메일 사용 가능)
                     console.log(result);
                     if(result == "NNN" ){
                        $("#emailCheck-area").text("사용하고 있는 이메일입니다.")
                     }else{
                        $("#emailCheck-area").text("")
                        //$("#emailCheck-area").text("사용 가능한 이메일입니다.")
                     }
                     
                  },
                  error : function(){
                     console.log("이메일 중복체크 실패");
                  }
                  
               })
                    
            })  
         
        })

        //정규식
        function validate(){
            // 유효성 검사 : 아이디, 비밀번호, 비밀번호 일치, 이름

            // input요소로부터 value속성값 뽑기
            var userId = document.getElementById('userId');
            var userPwd = document.getElementById('userPwd');
            var checkPwd = document.getElementById('checkPwd');
            var userName = document.getElementById('userName');
            var birth = document.getElementById('birth');

            
            // 1) 아이디 검사
            
            //아이디 : 영문소문자 또는 숫자 4~16자
            var regExp  = /[a-z\d]{4,16}/
            if(!regExp.test(userId.value)){
                alert('유효하지 않은 아이디 입니다. 다시 입력해주세요!')
                userId.select();
                return false;
            }

            // 2) 비밀번호 검사
            
            //비밀번호 : 영문 대문자/영문소문자/특수문자 총 2가지 이상 조합, 8자 ~ 32 자
            
            //var pw = $("userPwd").val();
            var pw = userPwd.value;
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
            if(userPwd.value != checkPwd.value){
                alert('동일한 비밀번호를 입력해주세요!');
                return false;
            }

            // 4) 이름검사
            // 이름 : 최소 2글자 최대 6글자
            regExp = /^[가-힣]{2,6}$/;

            if(!regExp.test(userName.value)){
                alert('유효한 이름을 입력하세요!')

                return false;
            }

            //5)태어난 날 검사
            regExp =  /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
            
            if(!regExp.test(birth.value)){
                alert("유효한 형식(yyyy-mm-dd)을 입력하세요");

                return false
            }

       

                return true;



             document.enrollForm.submit();
        
        }




    </script>
    

<%@ include file="../common/footer.jsp" %>
</body>
</html>