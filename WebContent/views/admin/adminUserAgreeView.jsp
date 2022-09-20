<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <!-- ☆☆☆☆없으면 안돌아감 필수☆☆☆☆☆ -->
    <!-- 부트스트랩 사용 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>관리자 - 이용약관</title>
    <style>
    body { margin: 0;}
    div{
       
        box-sizing : border-box;
    }
    .admin_wrap>div{width:100%;}

    #admin{
        width: 100%;
        padding: 20px 30px;
        margin: 0 auto;      
    }
   #admin_sidebar{
        width: 15%;
        float:left;
    }
    #admin_content{
        display: inline-block;
        height: 1000px;
    }
    #admin_content{
        width: 84%;
        clear: both;

    }
    /* --------------------------------------레이아웃------------------------------------ */
    #admin_content{
        padding: 20px;
    }
    #userAgrTable{
        margin-left: 40px;
    }
    table{
        width: 1000px;
        border : 1px white;
        
    }
    table th{
        text-align: center;
        color: white;
        background-color: rgb(130, 150, 50);
    }
    table p{
        overflow: scroll;
        height: 400px;
    }
      
        

    
    </style>
</head>
<body>
    <div id="admin_header">
        <%@ include file="../common/adminMenubar.jsp" %>
    </div>
    <div id="admin_sidebar">
        <%@ include file="../common/adminSidebar.jsp" %>
    </div>
    <div id="admin_content">
        <div class="title">
            <h4>이용약관</h4>
        </div>
        <hr>

        <div id="userAgrTable">
            <table border="1">
                <tr>
                    <th width="100px">이용약관</th>
                    <td><p>제1장 총 칙<br>
                    	  본 약관은 READ ME 주식회사(이하 “회사”라 합니다)가 운영하는 READ ME를 통하여 제공하는 상품 및 디지털콘텐츠 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 이용자의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다. 
                    <br>본 약관에서 사용하는 용어의 정의는 다음과 같습니다. 
                    
                    </p></td>
                </tr>
                <hr>
                <tr>
                    <th>개인정보<br>처리방침</th>
                    <td><p>
                    	 READ ME 주식회사(이하 "회사”라 함)는 고객님들의 개인정보를 소중히 다루고 있습니다. 회사는 '개인정보보호법'과 ‘정보통신망이용촉진 및 정보 보호 등에 관한 법률’ 등 모든 관련 법규를 준수하며 회원님의 개인정보가 보호받을 수 있도록 최선을 다하고 있습니다. <br>
                		개인정보 보호정책을 통해 이용자가 제공한 개인정보가 어떠한 용도와 방식으로 이용되며, 개인정보 보호를 위해 어떠한 방법을 통해 관리되고 있는지에 대해 알려드립니다.
					<br> 1. 수집하는 개인정보 항목 및 수집방법 가. 수집하는 개인정보 항목 <br>
					                첫째, 회사는 회원가입 및 로그인, 원활한 고객상담, 각종 최적화된 서비스를 제공하기 위하여, 다음과 같은 최소한의 개인정보를 이용자의 회원가입 시 수집하고 있습니다.
					                일반/외국인/14세미만 어린이 회원가입 시 필수 입력 사항: 이름, 아이디, 비밀번호, 이메일주소, 법정대리인의 본인인증값 선택 입력 사항: 생년, 성별 <br>
					                둘째, 모바일 서비스 이용시 단말기에 관한 정보(단말기 모델, 하드웨어 ID, 운영체제 버전정보)와 서비스 이용 기본 통계(동기화, 독서노트 기능 제공을 위한 서점 및 애플리케이션 이용 정보, 서점 내 회원 대상 또는 개인화된 맞춤 추천 기능을 위한 서점 및 애플리케이션 이용 정보)이 수집될 수 있으나,<br><br>
					                이는 개인을 식별할 수 없는 형태입니다. 만약 서비스 이용 도중 추가적으로 개인정보 수집이 필요한 경우, 회사는 회원에게 미리 이러한 사실을 고지하고 동의를 받습니다. <br><br>
					                셋째, 회사는 이용자의 페이퍼샵 주문 혹은 AS시 재화의 배송 및 원활한 고객상담을 위하여 다음과 같은 기본 정보를 수집하고 있습니다. 이름, 주소, 유선전화번호, 휴대전화번호, 이메일주소 <br><br>
					                넷째, 회사는 이용자의 선물하기 기능 이용시 선물 전송을 위하여 필요한 선물 수령인의 기본 정보를 수집하고 있습니다.
					                선물 수령인의 이름, 휴대전화번호, 이메일 주소 다섯째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다. IP 주소, 쿠키, 방문 일시, OS종류, 브라우저 종류, 결제기록, 서비스 이용 기록, 불량이용 기록 여섯째, 유료 서비스 이용 과정에서 아래와 같은 정보가 개인정보 수탁자(결제대행사)에 의해 수집될 수 있으나, 
					                회사는 결제 정보를 보관하지 않습니다. 신용카드 결제시 : 카드사명, 카드번호 등 휴대전화 결제시 : 휴대폰번호, 통신사, 결제승인번호 등 계좌이체시 : 은행명, 계좌번호 등 상품권 이용시 : 상품권 번호 일곱째, 회사는 재화 및 콘텐츠의 환불을 위해 필요한 다음 정보를 수집하고 있습니다. 
					            
                    
                    
                    </p></td>
                </tr>
            </table>

        </div>
    </div>
    




</body>
</html>