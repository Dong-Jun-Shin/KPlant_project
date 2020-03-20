<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%-- 그래프 조회 --%>
<jsp:include page="orderGraph.jsp"></jsp:include>

<%-- 리스트 조회 --%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/order/orderList.css" />
<script type="text/javascript">
	$(function(){
		$("ul.nav>li").removeClass("active");
		$("ul.nav>li:nth-child(4)").addClass("active");
	});
</script>
<div>
	<h2 class="sub-header">주문관리</h2>
	<div class="order-header">
		<select class="form-control">
			<option value="all">전체 검색</option>
			<option value="ord_name">주문자명</option>
			<option value="m_id">주문자 ID</option>
			<option value="ord_date">주문 날짜</option>
			<option value="ord_trn">운송장 번호</option>
		</select>
		<input type="text" class="form-control" placeholder="검색할 키워드를 입력해주세요."/>
		<button type="button" class="btn btn-style">검색</button>
	</div>
	<div class="order-body">
		<table>
			<colgroup>
				<col width="20%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문자명</th>
					<th>주문자 ID</th>
					<th>주문자 연락처</th>
					<th>주문 날짜</th>
					<th>주문 상태</th>
					<th>운송장 번호</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty orderList }">
						<c:forEach var="order" items="${orderList }" varStatus="status">
							<tr>
								<td>OR2002110001</td>
								<td>고왕수</td>
								<td>KingWangJJang22</td>
								<td>010-8888-8888</td>
								<td>20/02/11</td>
								<td>결제완료</td>
								<td>-</td>
							</tr>
							<tr>
								<td>OR2002120001</td>
								<td>하킴</td>
								<td>agrabaChief676</td>
								<td>010-7777-7777</td>
								<td>20/02/10</td>
								<td>배송준비중</td>
								<td>615198441948</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">조회된 주문 목록이 없습니다.</td>
						<tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="order-footer">
		<div class="foot-left">
			<button type="button" class="btn btn-style">마스킹(*) 해제</button>
		</div>
		<div class="foot-right">
			<button type="button" class="btn btn-style">주문 취소</button>
			<button type="button" class="btn btn-style">교환 처리</button>
			<button type="button" class="btn btn-style">반품 처리</button>
		</div>
	</div>
</div>

