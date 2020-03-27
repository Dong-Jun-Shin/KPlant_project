<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 그래프 --%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/template/graph.css" />
<h2 class="sub-header">월 실적 현황</h2>
<div class="row placeholders">
	<div class="col-xs-6 col-sm-3 placeholder">
		<img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
		<h4>월 매출액</h4><!-- 바 차트 -->
		<span class="text-muted">Something else</span>
	</div>
	<div class="col-xs-6 col-sm-3 placeholder">
		<img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
		<h4>연 매출액</h4><!-- 꺾은 선 차트 -->
		<span class="text-muted">Something else</span>
	</div>
	<div class="col-xs-6 col-sm-3 placeholder">
		<img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
		<h4>연 주문량</h4><!-- 파이 차트 -->
		<span class="text-muted">Something else</span>
	</div>
		<div class="col-xs-6 col-sm-3 placeholder">
		<img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
		<h4>오늘 주문량</h4><!-- 숫자로 표시 -->
		<span class="text-muted">Something else</span>
	</div>
</div>       