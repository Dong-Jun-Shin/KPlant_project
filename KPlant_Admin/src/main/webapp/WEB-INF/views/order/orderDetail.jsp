<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css"
	href="/admin/resources/include/css/order/orderDetail.css" />

<script type="text/javascript" src="/admin/resources/include/js/order/order.js"></script>

<h2 class="sub-header">주문 상세정보</h2>
<div id="order-detail">
	<div class="order-info">
		<div class="body-title">주문자 정보</div>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>주문자<span class="write-point">*</span></td>
				<td><label>orderVO항목 - 주문자</label></td>
			</tr>
			<tr>
				<td>연락처<span class="write-point">*</span></td>
				<td class="detail-tel">
					<label>orderVO항목 - 연락처1</label>
					<span>-</span> 
					<label>orderVO항목 - 연락처2</label>
					<span>-</span> 
					<label>orderVO항목 - 연락처3</label>
				</td>
			</tr>
			<tr>
				<td>이메일<span class="write-point">*</span></td>
				<td><label>orderVO항목 - 이메일</label></td>
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
				<td>배송지 선택</td>
				<td class="detail-ship">
					<div>
						<span>받으실 분</span><span class="write-point">*</span><br /> 
						<label>orderVO항목 - 받는 사람</label>
					</div>
					<div class="detail-address">
						<span>주소</span><span class="write-point">*</span><br /> 
						<label>orderVO항목 - 주소1</label>
						<br /> 
						<label>orderVO항목 - 주소2</label> 
						<br /> 
						<label>orderVO항목 - 주소3</label>
					</div>
					<div class="detail-tel">
						<span>연락처</span><span class="write-point">*</span><br /> 
						<label>orderVO항목 - 연락처1</label>
						<span>-</span> 
						<label>orderVO항목 - 연락처2</label>
						<span>-</span> 
						<label>orderVO항목 - 연락처3</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>배송 요청사항<span class="write-point">*</span></td>
				<td class="detail-request"><label>orderVO항목 - 요청사항</label></td>
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
				<tr>
					<td>1</td>
					<td colspan="11" class="prd"><img alt="상품대표사진"
						src="/resources/images/order/temp1.jpg"> <span>몽골바위솔
							5포트 바위솔 10cm포트묘</span></td>
					<td>1개</td>
					<td colspan="3">9,800원</td>
					<td colspan="3">9,800원</td>
					<td colspan="3">3,000원</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="cart_price">
		<table class="price-list">
			<tbody>
				<tr>
					<td colspan="3">주문금액</td>
					<td class="price" colspan="3">12800원</td>
					<td class="ico" colspan="1"><img alt="마이너스"
						src="/resources/images/order/ico_total_minus.png" /></td>
					<td colspan="3">할인금액</td>
					<td class="price" colspan="3">0원</td>
					<td class="ico" colspan="1"><img alt="합계"
						src="/resources/images/order/ico_total_sum.png" /></td>
					<td colspan="3">총 결제금액</td>
					<td class="price" colspan="3">12800원</td>
				</tr>
				<tr>
					<td colspan="14" rowspan="2"></td>
					<td colspan="5">결제 수단</td>
					<td class="price" colspan="2">신용카드</td>
				</tr>
				<tr>
					<td colspan="5">결제 승인 금액</td>
					<td class="price" colspan="2">3000원</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="detail-footer">
	<button type="button" class="btn btn-style">주문 취소</button>
	<button type="button" class="btn btn-style">교환 처리</button>
	<button type="button" class="btn btn-style">반품 처리</button>
</div>
