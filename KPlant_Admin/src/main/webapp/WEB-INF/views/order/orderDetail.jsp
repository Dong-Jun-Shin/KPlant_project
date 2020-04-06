<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css"
	href="/admin/resources/include/css/order/orderDetail.css" />

<script type="text/javascript" src="/admin/resources/include/js/common.js"></script>
<script type="text/javascript" src="/admin/resources/include/js/order/order.js"></script>
<script type="text/javascript" src="/admin/resources/include/js/order/orderDetail.js"></script>

<h2 class="sub-header">주문 상세정보</h2>
<div id="order-detail">
	<div class="order-info">
		<div class="body-title">주문자 정보</div>
		<input type="hidden" id="ord_num" name="ord_num" value="${detail.ord_num }"/>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>주문 상태</td>
				<td><label id="ord_status">${detail.ord_status }</label></td>
			</tr>
			<tr>
				<td>주문자</td>
				<td><label>${detail.ord_name }</label></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td class="detail-tel">
					<label>${detail.ord_phone}</label>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><label>${detail.ord_email}</label></td>
			</tr>
		</table>
	</div>
	<div class="shipping-info">
		<div class="body-title">배송지 정보</div>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>운송장 번호</td>
				<td class="detail-request">
					<input type="text" id="ord_trn" name="ord_trn" value="${detail.ord_trn}">
				</td>
			</tr>
			<tr>
				<td>배송지 선택</td>
				<td class="detail-ship">
					<div>
						<strong>받으실 분</strong><br /> 
						<label>${detail.sh_name}</label>
					</div>
					<div class="detail-address">
						<strong>주소</strong><br /> 
						<label>${detail.sh_residence}</label>
					</div>
					<div class="detail-tel">
						<strong>연락처</strong><br /> 
						<label>${detail.sh_phone}</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>배송 요청사항</td>
				<td class="detail-request"><label>${detail.sh_request}</label></td>
			</tr>
		</table>
	</div>
</div>
<div id="order-cart">
	<div class="cart_list">
		<div class="body-title">결제내역</div>
		<table class="body-list">
			<thead>
				<tr>
					<th>번호</th>
					<th colspan="11">상품명/옵션</th>
					<th>수량</th>
					<th colspan="3">상품가</th>
					<th colspan="3">주문금액</th>
					<th colspan="3">배송비</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${prdList }" varStatus="status">
					<tr class="prd-list">
						<td>${status.index + 1 }</td>
						<td colspan="11" class="prd">
							<img alt="${product.prd_num }" src="/KplantUploadStorage/product/${product.i_file }">
							<span class="prd_name">${product.prd_name }</span>
						</td>
						<td>${product.ord_qty }</td>
						<td colspan="3"><span class="prd-price">${product.prd_price }원</span></td>
						<td colspan="3"><span class="ord-price">${product.prd_price * product.ord_qty }원 </span></td>
						<td colspan="3"><span class="shipping">3000원</span></td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
	</div>
	<div id="cart_price">
		<table class="price-list">
			<tbody>
				<tr>
					<td colspan="3">주문금액</td>
					<td class="price" colspan="3" id="ord_total">0원</td>
					<td class="ico" colspan="1"><img alt="마이너스"
						src="/resources/images/order/ico_total_minus.png" /></td>
					<td colspan="3">할인금액</td>
					<td class="price" colspan="3" id="dis_total">0원</td>
					<td class="ico" colspan="1"><img alt="합계"
						src="/resources/images/order/ico_total_sum.png" /></td>
					<td colspan="3">총 결제금액</td>
					<td class="price" colspan="3" id="all_total">${detail.pay_price }원</td>
				</tr>
				<tr>
					<td colspan="14" rowspan="2"></td>
					<td colspan="5">결제 수단</td>
					<td class="price" colspan="2">${detail.pay_method }</td>
				</tr>
				<tr>
					<td colspan="5">결제 승인 금액</td>
					<td class="price" colspan="2">${detail.pay_price }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="detail-footer">
	<button type="button" class="btn btn-style" value="${detail.ord_status }">운송장 수정</button>
	<button type="button" class="btn btn-style" value="교환완료">교환완료</button>
	<button type="button" class="btn btn-style" value="반품완료">반품완료</button>
</div>