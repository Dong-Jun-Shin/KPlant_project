<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/cart.css" />
<div>
	<div class="order-header">
		<div class="left">
			<img alt="장바구니" src="/resources/images/order/ico_order_cart.png" />
			장바구니
		</div>
		<div class="right">
			<span><span>01</span> 장바구니</span>
			<span><span>02</span> 주문작성/결제</span>
			<span><span>03</span> 주문완료</span>
		</div>
	</div>
	<div class="order-body">
		<div class="cart_list">
			<div class="body-title">내가 담은 상품리스트</div>
			<table class="body-list">
				<thead>
					<tr>
						<th>선택</th>
						<th colspan="7">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
						<th colspan="6">리스트 변경</th>
					</tr>
				</thead>
				<tbody>
					빈 바구니 요소
					<tr>
						<td colspan="21">장바구니에 추가된 상품이 없습니다.</td>
					</tr>
					상품 요소
					<tr>
						<td><input type="checkbox" name="sel_prd" /></td>
						<td colspan="7" class="prd">
							<img alt="상품대표사진" src="/resources/images/order/temp1.jpg">
							<span>몽골바위솔 5포트 바위솔 10cm포트묘</span>
						</td>
						<td>수량</td>
						<td colspan="2">9,800원</td>
						<td colspan="2">9,800원</td>
						<td colspan="2">3,000원</td>
						<td colspan="6">
							<button type="button" class="btn btn-success">수정</button>
							<button type="button" class="btn btn-success">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="cart_btn">
				<button type="button" class="btn btn-lg" disabled="disabled">찜하기</button>
				<button type="button" class="btn btn-lg" disabled="disabled">모두 삭제</button>
			</div>
		</div>
		<div id="cart_price">
			<table class="price-list">
				<tbody>
					<tr>
						<td colspan="5">주문금액</td>
						<td colspan="1">0</td>
						<td class="ico" colspan="1"><img alt="마이너스" src="/resources/images/order/ico_total_minus.png"/></td>
						<td colspan="5">할인금액</td>
						<td colspan="1">0</td>
						<td class="ico" colspan="1"><img alt="합계" src="/resources/images/order/ico_total_sum.png"/></td>
						<td colspan="6">총 주문금액</td>
						<td colspan="1">0</td>
					</tr>
					<tr>
						<td colspan="5">주문금액</td>
						<td colspan="1">0</td>
						<td colspan="8" rowspan="2"></td>
						<td colspan="6">적립예정 금액</td>
						<td colspan="1">0</td>
					</tr>
					<tr>
						<td colspan="5">선결제 배송비</td>
						<td colspan="1">0</td>
						<td colspan="7"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="order-footer">
		<button type="button" id="all_ord_btn" class="btn btn-lg" disabled="disabled">전체 주문</button>
		<button type="button" id="sel_ord_btn" class="btn btn-lg" disabled="disabled">선택상품 주문</button>
	</div>
</div>
