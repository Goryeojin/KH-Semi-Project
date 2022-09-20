<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
    
    <!-- chart library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <title>Document</title>
    <style>
    .wrap{
        min-width: 1190px;
    }
    .wrap>div{width:100%;}

    #content{
        width: 1300px;
        padding: 20px 30px;
        margin: 0 auto;
        
    }

    #content_1{
        width: 18%;
        
       float: left;
    }
    #content_2{
        width: 82%;
        clear: both;
    }
    #content_1, #content_2{
        display: inline-block;
        height: 1000px;
        /* display: flex; */
    }
    #content_3{
        height: 70px;
        width: 99%;
    
    }
     #pageCategory_bar{
            width: 100%;
            height: 70px;  
            padding: 15px 10px 10px 53px;
            font-size: 17px; 
            box-sizing: border-box;
        }
    /*차트부분 시작*/
        #content2 {
            margin-left: 30px;
        }

    
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

<%
List<Map<String,Object>> list = (List)request.getAttribute("statisticsList");
%>
        <div id="content">
            <div id="content_3">
                <div id="pageCategory_bar">
                 <a href="">🏠︎ HOME </a> > 마이페이지 > 회원정보
             </div>
            </div>
            <div id="content_1">
             	 <%@ include file="../common/myPageSidebar.jsp" %>
             	
            </div>
            <div id="content_2">

			<div id="content2">
                    <h1 style="display:flex">독서 통계</h1>
                    <hr><br><br>
                    <h7 style="float:left">&nbsp;&nbsp;통계가 제일 높은 상위 3개의 장르만 표시됩니다. </h7><br><br><br>
                    <div style="display:inline-flex;">
                        <div class="container" style="display:inline-flex;">
                            <canvas id="myChart" style="display:inline-flex;" width="500" height="400"></canvas>
                        </div>

                        <div class="container" style="display:inline-flex;">
                            <canvas id="myChart1" style="display:inline-flex;" width=" 500" height="400"></canvas>
                        </div>
                    </div>


                    <!-- 부트스트랩 -->
                    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                        crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                        crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                        crossorigin="anonymous"></script>
                    <!-- 차트 -->
                    <script>
                        var ctx = document.getElementById('myChart');

                        var statisticsList = [];
                        <%
                        	for(int i =0; i<list.size();i++){
                   		%>
                   		var statistics = {
                			<%
                           	for( Entry entry:list.get(i).entrySet()){
                       		%>
                       		<%= entry.getKey()%>:'<%= entry.getValue() %>',
                       		<%
                            	}
                            %>
                   		}
                   		statisticsList.push(statistics);
                   		<%
                        	}
                        %>
                        console.log(statisticsList);
                        
                        var labels =statisticsList.map(s=> s.gnere_name);
                        var statisticsData =statisticsList.map(s=>s.book_count);
                        
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: '지난달',
                                    data: statisticsData,
                                    backgroundColor: [
                                        'rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                    ],
                                    borderColor: [
                                        'rgba(255, 99, 132, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                    ],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                                }
                            }
                        });


                    </script>
                </div>
                
            </div>
        </div>
        <div id="footer">
            <div id="footer_1">
            	<%@ include file="../common/footer.jsp" %>
            </div>
            
        </div>

</body>
</html>