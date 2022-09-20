<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>출석 이벤트</title>
<style>
    /*!!마이페이지 카테고리바 + 사이드 영역!! */
    #pageCategory_bar {
        width: 100%;
        height: 70px;
        padding: 15px 10px 10px 53px;
        font-size: 17px;
        box-sizing: border-box;
        text-align: left;
    }

    #content {
        width: 1300px;
        height: 1225px;
        margin: 0 auto;
    }
    /* 이벤트 페이지 만들기 + 책 리뷰 이벤트 */
    h1 {
        background-color: rgb(120, 150, 50);
        width: 250px;
    }

    #attendance-button {
        display: inline-block;
    }

    #attendance-table td {
        padding: 20px;
        border: 1px solid black;
        width: 130px;
        height: 130px;
    }

    /* 컨텐츠 부분 끝~~*/

    #attendance-complete {
        background-color: #ededed;
        position: absoulute;
        top: 50%;
        left: 50%;
        width: 450px;
        height: 100px;
    }

    #attendance-error {
        background-color: #ededed;
        width: 450px;
        height: 100px;
    }


    #attendance-complete button {
        color: white;
        background-color: rgb(120, 150, 50);
    }

    #attendance-error button {
        color: white;
        background-color: rgb(120, 150, 50);
    }
    button{
        float: right;
        margin-right: 10px;
        background-color: rgb(120, 150, 50);
        color: white;
        font-weight: 650;
        height: 40px;
        width: 150px;
    }
</style>

</head>

<body>
<%@ include file="../common/menubar.jsp" %>
    <div id="content">
        <div id="content_1">
            <div id="pageCategory_bar">
                <a href="">🏠︎ HOME </a> > 이벤트 > 출석이벤트
            </div>
        </div>
        <div id="content_2"></div>
            <!-- 이벤트 시작-->
        <div id="content_3">
            <div id="attendance">
                <div id="attendance-div" style="display: flex; justify-content: space-between;">
                    <div>
                        <h1>이벤트 기간</h1>
                        <h3>2022-01-01 ~ 2022-01-31</h3>
                    </div>
                    <div id="attendance-button" style="margin-right: 260px;">
                        <br>
                        <% if(loginUser != null) { %>
                        <button onclick="attendance();">출석체크 하기</button>
                        <% } %>
                    </div>
                </div>
                <br>
            </div>
            <script>
           		function attendance(){
           			<% if(loginUser != null) { %>
           			location.href= "<%= contextPath %>/goAttent.ev?userNo=" + <%= loginUser.getUserNo() %>;
           			<% } %>
           		}
            </script>
            <div class="attendance-table-div" style="display: flex; justify-content: center;">
                <table id="attendance-table">
                    <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>포인트+100</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                        <td>10</td>
                        <td>11</td>
                        <td>포인트+500</td>
                    </tr>
                    <tr>
                        <td>13</td>
                        <td>14</td>
                        <td>15</td>
                        <td>16</td>
                        <td>17</td>
                        <td>포인트+1000</td>
                    </tr>
                    <tr>
                        <td>19</td>
                        <td>20</td>
                        <td>21</td>
                        <td>22</td>
                        <td>23</td>
                        <td>포인트+1500</td>
                    </tr>
                    <tr>
                        <td>25</td>
                        <td>26</td>
                        <td>27</td>
                        <td>28</td>
                        <td>29</td>
                        <td>포인트+2000</td>
                    </tr>
                </table>
            </div>
        </div>
        <br>
        <div id="content_4"></div>
<%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>