<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>진행중인 이벤트</title>
    <style>
        #content {
            width: 1300px;
            height: 1225px;
            margin: 0 auto;
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
        /* 이벤트 페이지 만들기*/
        h1 {
            background-color: rgb(120, 150, 50);
            width: 250px;
        }

        #term {
            margin-bottom: 25px;
        }

        /* 컨텐츠 부분 끝~~*/

        /*책 리뷰 이벤트 부분*/
        .image {
            width: 100%;
            height: 320px;
            margin-bottom: 30px;
        }
        .event {
            text-align: left;
            font-size: 25px;
            font-weight: bold;

        }
    </style>

</head>

<body>
    <%@ include file="../common/menubar.jsp" %>

        <!-- 여기까지가 메뉴바 끝! -->
        <!-- 여기서부터 메인페이지나 다른 화면들 추가-->

        <!-- 여기서부터 마이페이지 사이드바 시작-->
        <!-- 페이지 카테고리 -->
        <!-- 전체를 감싸주는 content div (넓이 1300px주고 가운데 정렬역할) -->
        <div id="content">
            <div id="content_3">
                <div id="pageCategory_bar">
                    <a href="">🏠︎ HOME </a> > 이벤트
                </div>
            </div>
            <br>

            <!-- 이벤트 시작-->
            <div id="term">
                <div id="attendance-div" style="display: flex; justify-content: space-between;">
                    <div>
                        <h1>이벤트 기간</h1>
                        <h3>2022-01-01 ~ 2022-01-31</h3>
                    </div>
                    <br>
                </div>
            </div>

            <div class="event" onclick="reviewKing();">
                <div>
                    리뷰왕 이벤트
                </div>

                <div>
                    <img class="image" src="<%= contextPath %>/resources/view_img/review-event.jpg">
                </div>
            </div>
            <div class="event" onclick="attendance();">
                <div>
                    출석왕 이벤트
                </div>

                <div>
                    <img class="image" src="<%= contextPath %>/resources/view_img/att-event.jpg">
                </div>
            </div>

            <script>
                function reviewKing(){
                    location.href = "<%= contextPath %>/review.ev?currentPage=1"
                }
                function attendance(){
                    location.href = "<%= contextPath %>/attend.ev"
                }
            </script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>