$(function(){
	// 구글 차트 라이브러리 로딩
	google.charts.load('visualization','1',{
	    'packages' : ['corechart']
	});
	
	// 로딩이 완료되면 Chart 함수를 호출
    google.charts.setOnLoadCallback(drawMonthSales);
    google.charts.setOnLoadCallback(drawYearSales);
    google.charts.setOnLoadCallback(drawYearOrder);
    
    // 총 데이터 구해서 값 설정
	$.get("/admin/chart/allData", function(data){
		var dataArr = data.split(",");
		
		$("#month_all_sales").html(numberWithCommas(dataArr[0]) + "원");
	    $("#year_all_sales").html(numberWithCommas(dataArr[1]) + "원");
	    $("#year_all_order").html(dataArr[2] + "건");
	    $("#year_all_cancel").html(dataArr[3] + "건");
	}, "text");
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function drawMonthSales() {
	// DB의 결과를 JSON으로 반환 후 텍스르로 변환
    var jsonData = $.ajax({
        url : "/admin/chart/monthSales",
        dataType : "json",
        async : false
    }).responseText;
    jsonData = jsonData.replace("데이터", "주차별 매출");
    
    // 데이터테이블 생성
    var data = new google.visualization.DataTable(jsonData);

    var options = {
		legend: {
			position: 'top', 
			alignment: 'center',
			textStyle: {bold: true, fontSize: 16}
		},
    	fontSize: 12, 
	    hAxis: {
		    viewWindow: {
		        min: 0,
		        max: 4
		    },
		    maxValue: 5
	    },
	    vAxis:{
	    	viewWindow:{
	    		min: 0
	    	}
	    },
	    series: {0: {color: '#337ab7'}},
	    chartArea: {right: 40, left: 60},
	    width: 350,
        height: 300
	};
    
    var chart = new google.visualization.ColumnChart(document.getElementById('month_sales'));
    chart.draw(data, options);
}

function drawYearSales() {
	// DB의 결과를 JSON으로 반환 후 텍스르로 변환
	var jsonData = $.ajax({
		url : "/admin/chart/yearSales",
		dataType : "json",
		async : false
	}).responseText;
	jsonData = jsonData.replace("데이터", "월별 매출");
	
	// 데이터테이블 생성
	var data = new google.visualization.DataTable(jsonData);

	var options = {
			legend: {
				position: 'top', 
				alignment: 'center',
				textStyle: {bold: true, fontSize: 16}
			},
			fontSize: 12, 
			hAxis: {
				viewWindow: {
					min: 0,
					max: 11
				},
				maxValue: 12
			},
			vAxis:{
				viewWindow:{
					min: 0
				}
			},
			seriesType: 'line',
	        series: {0: {color: '#337ab7'}},
	        chartArea: {right: 40, left: 60},
			width: 350,
			height: 300
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('year_sales'));
	chart.draw(data, options);
}

function drawYearOrder() {
	// DB의 결과를 JSON으로 반환 후 텍스르로 변환
	var jsonData = $.ajax({
		url : "/admin/chart/yearOrder",
		dataType : "json",
		async : false
	}).responseText;
	
	// 범례 수정
	jsonData = jsonData.replace("데이터1", "주문 건수");
	jsonData = jsonData.replace("데이터2", "취소 건수");
	
	// 데이터테이블 생성
	var data = new google.visualization.DataTable(jsonData);
	
	var options = {
			legend: {
				position: 'top', 
				alignment: 'center',
				textStyle: {bold: true, fontSize: 16}
			},
			fontSize: 12, 
			hAxis: {
				viewWindow: {
					min: 0,
					max: 11
				},
				maxValue: 12
			},
			vAxis:{
				viewWindow:{
					min: 0
				}
			},
			seriesType: 'bars',
			series: {1: {color: '#ffe900'}},
			chartArea: {right: 0, left: 50},
			width: 350,
			height: 300
	};
	
	var chart = new google.visualization.ComboChart(document.getElementById('year_order'));
	chart.draw(data, options);
}