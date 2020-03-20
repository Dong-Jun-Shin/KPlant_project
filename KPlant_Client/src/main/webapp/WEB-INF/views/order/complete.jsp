<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/complete.css" />
<div>
	<div class="order-header">
		<div class="left">
			<img alt="주문완료" src="/resources/images/order/ico_order_complete.png" />
			주문완료
		</div>
		<div class="right">
			<span><span>01</span> 장바구니</span>
			<span><span>02</span> 주문작성/결제</span>
			<span><span>03</span> 주문완료</span>
		</div>
	</div>
	<div class="order-body">
		<div class="order-alert">
			<div>"결제가 완료 되었습니다"</div>
			<div>감사합니다. 결제내역에 대한 메일이 입력해주신 이메일로 전송되었습니다.</div>
		</div>
		<div class="cart_list">
			<div class="body-title">결제내역</div>
			<table class="body-list">
				<thead>
					<tr>
						<th colspan="14">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="14" class="prd">
							<img alt="상품대표사진" src="/resources/images/order/temp1.jpg">
							<span>몽골바위솔 5포트 바위솔 10cm포트묘</span>
						</td>
						<td>1개</td>
						<td colspan="2">9,800원</td>
						<td colspan="2">9,800원</td>
						<td colspan="2">3,000원</td>
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
						<td class="ico" colspan="1"><img alt="마이너스" src="/resources/images/order/ico_total_minus.png"/></td>
						<td colspan="3">할인금액</td>
						<td class="price" colspan="3">0원</td>
						<td class="ico" colspan="1"><img alt="합계" src="/resources/images/order/ico_total_sum.png"/></td>
						<td colspan="3">총 주문금액</td>
						<td class="price" colspan="3">12800원</td>
					</tr>
					<tr>
						<td colspan="4">주문금액</td>
						<td class="price" colspan="2">9800원</td>
						<td colspan="15" rowspan="2"></td>
					</tr>
					<tr>
						<td colspan="4">선결제 배송비</td>
						<td class="price" colspan="2">3000원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="order-footer">
		<div class="pay-btn">
			<button type="button" id="mypage_btn" class="btn btn-lg">마이페이지</button>
			<button type="button" id="home_btn" class="btn btn-lg">홈으로</button>
		</div>		
	</div>
</div>
