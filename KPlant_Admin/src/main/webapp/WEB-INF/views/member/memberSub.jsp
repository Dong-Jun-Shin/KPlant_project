<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="/WEB-INF/common/common.jspf" %>
  
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	function chartData(urlParam, dataChartParam, optionsParam, chartKind, area) {
		$.ajax({
			url: urlParam,
			type: 'post',
			success: function(result) {
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				function drawChart() {
					var dataChart = dataChartParam;
					if(result.length != 0) {
						$.each(result, function(i, item){
							dataChart.push([item.item, item.number]);
						});
					}else {
						dataChart.push(['데이터가 존재하지 않습니다', 1]);
					}
	
					var data = google.visualization.arrayToDataTable(dataChart);
					var view = new google.visualization.DataView(data);
					var options = optionsParam;
					
					var chart;
					switch(chartKind){
						case "bar": 
							chart = new google.visualization.BarChart(area); 
							break;
						case "pie": 
							chart = new google.visualization.PieChart(area);
							break;
					}
					chart.draw(view, options);
				}
			}
		});	
	}

	$(function(){
		var optionsGender = {
				title: "회원성별통계",
				width: 600, // 넓이 옵션
				height: 300, // 높이 옵션
				colors: ['#b0120a'], //bar 색상
				hAxis: {title: '인원수', minValue: 0} // X축
				/* ,vAxis: {title: '성별'} //Y축 */		
		};
		chartData('/admin/member/genderChartData', [['회원성별', '인원수']], optionsGender,  "bar", document.getElementById('barChart'));

		var optionsAge = {
				title: "연령대별통계",
				width: 600, // 넓이 옵션
				height: 300, // 높이 옵션
		};
		chartData('/admin/member/AgeChartData', [['연령대별', '비율']], optionsAge,  "pie", document.getElementById('pieChart'));
	});
</script>
<h1 class="page-header">회원 정보 관리</h1>

<!-- <div class="row placeholders">
	<img src="/graph/pieChart.jpg" class="img-thumbnail"/>&nbsp;&nbsp;
	<img src="/graph/barChart.jpg" class="img-thumbnail"/>
</div> -->

<div class="row placeholders">
	<div id="pieChart" class="col-md-6"></div>  
	<div id="barChart" class="col-md-6"></div>  
</div>