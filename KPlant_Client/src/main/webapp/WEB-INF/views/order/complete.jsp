<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/complete.css" />
<script type="text/javascript" src="/resources/include/js/order/complete.js"></script>
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
			<div>감사합니다. 결제내역에 대한 메일이 결제 시, 입력해주신 이메일로 전송되었습니다.</div>
		</div>
		<div class="cart_list">
			<div class="body-title">결제내역</div>
			<table class="body-list">
				<thead>
					<tr>
						<th colspan="13">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="${fn:length(orderPrdList)-1 }">
						<tr class="prd-list">
							<td colspan="13" class="prd">
								<img alt="${orderPrdList[i].prd_num }" src="/KplantUploadStorage/product/${orderPrdList[0].images[i].i_file }">
								<span class="prd_name">${orderPrdList[i].prd_name }</span>
							</td>
							<td>${orderDetList[i].ord_qty }</td>
							<td colspan="2"><span class="prd-price">${orderPrdList[i].prd_price }원</span></td>
							<td colspan="2"><span class="ord-price">${orderPrdList[i].prd_price * orderDetList[i].ord_qty }원 </span></td>
							<td colspan="2"><span class="shipping">3000원</span></td>
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
						<td id="all_price" class="price" colspan="3">0원</td>
						<td class="ico" colspan="1"><img alt="마이너스" src="/resources/images/order/ico_total_minus.png"/></td>
						<td colspan="3">할인금액</td>
						<!-- TODO 특가 상품의 할인율 가져와서 적용 -->
						<td id="all_discount" class="price" colspan="3">0원</td>
						<td class="ico" colspan="1"><img alt="합계" src="/resources/images/order/ico_total_sum.png"/></td>
						<td colspan="3">총 주문금액</td>
						<td id="result_price" class="price" colspan="3">0원</td>
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
