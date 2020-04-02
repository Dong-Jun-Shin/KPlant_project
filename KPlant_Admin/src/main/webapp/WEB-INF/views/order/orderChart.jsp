<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 그래프 --%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/template/graph.css" />
<script type="text/javascript" src='https://www.gstatic.com/charts/loader.js'></script>
<script type="text/javascript" src="/admin/resources/include/js/order/orderChart.js"></script>
<h2 class="sub-header">월 실적 현황</h2>
<div class="row">
	<div class="graph">
		<div id="month_sales"></div>
		<div class="graph_title">
			<span class="text-muted">(주차별 단위)</span><br />
			<div>
				<span>월 총 매출액 : </span>
				<span id="month_all_sales"></span>
			</div>
			<h4>월 매출액</h4><!-- Column Chart -->
		</div>
	</div>
	<div class="graph">
		<div id="year_sales"></div>
		<div class="graph_title">
			<span class="text-muted">(월별 단위)</span><br />
			<div>
				<span>연 총 매출액 : </span>
				<span id="year_all_sales"></span>
			</div>
			<h4>연 매출액</h4><!-- Combo Chart -->
		</div>
	</div>
	<div class="graph">
		<div id="year_order"></div>
		<div class="graph_title">
			<span class="text-muted">(월별 단위)</span><br />
			<div>
				<span>연 총 주문건 : </span>
				<span id="year_all_order"></span><br />
				<span>연 총 취소건 : </span>
				<span id="year_all_cancel"></span>
			</div>
			<h4>연 주문, 취소 건</h4><!-- Bar 차트(Combo) -->
		</div>
	</div>
</div>       