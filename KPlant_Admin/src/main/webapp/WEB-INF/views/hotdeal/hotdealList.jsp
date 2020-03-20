<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 리스트 --%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/hotdeal/hotdealList.css" />
<script type="text/javascript">
	$(function(){
		$("ul.nav>li").removeClass("active");
		$("ul.nav>li:nth-child(3)").addClass("active");
	});
</script>
<div>
	<h2 class="sub-header">핫딜관리</h2>
	<div class="hotdeal-header">
		<select class="form-control">
			<option value="all">전체 검색</option>
			<option value="ord_name">상품번호</option>
			<option value="m_id">할인율</option>
			<option value="ord_date">유효기간</option>
			<option value="ord_trn">등록날짜</option>
		</select>
		<input type="text" class="form-control" placeholder="검색할 키워드를 입력해주세요."/>
		<button type="button" class="btn btn-style">검색</button>
	</div>
	<div class="hotdeal-body">
		<table>
			<colgroup>
				<col width="17%">
				<col width="16%">
				<col width="17%">
				<col width="17%">
				<col width="16%">
				<col width="17%">
			</colgroup>
			<thead>
				<tr>
					<th>상품번호</th>
					<th>할인율</th>
					<th>적용 전 가격</th>
					<th>적용 후 가격</th>
					<th>등록날짜</th>
					<th>유효기간</th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${not empty hotdealList }"> --%>
<%-- 						<c:forEach var="hotdeal" items="${hotdealList }" varStatus="status"> --%>
							<tr>
								<td>PR0001</td>
								<td>20%</td>
								<td>25,000원</td>
								<td>20,000원</td>
								<td>20/02/11</td>
								<td>~20/02/29</td>
							</tr>
							<tr>
								<td>PR0345</td>
								<td>30%</td>
								<td>12,800원</td>
								<td>8,960원</td>
								<td>20/02/11</td>
								<td>~20/02/29</td>
							</tr>
<%-- 						</c:forEach> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
						<tr>
							<td colspan="7">조회된 핫딜 목록이 없습니다.</td>
						<tr>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
			</tbody>
		</table>
	</div>
	<div class="hotdeal-footer">
		<button type="button" class="btn btn-style">핫딜 생성</button>
		<button type="button" class="btn btn-style">핫딜 수정</button>
		<button type="button" class="btn btn-style">핫딜 삭제</button>
	</div>
</div>

