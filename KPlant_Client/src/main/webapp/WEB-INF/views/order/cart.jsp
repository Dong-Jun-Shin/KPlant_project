<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/cart.css" />
<script type="text/javascript" src="/resources/include/js/order/cart.js"></script>
<script type="text/javascript">
	$(function(){
		// 로그인 여부 체크
		var loginBool = "${empty m_num}";
		if(loginBool=="true"){
			alert("로그인 후, 구매가 가능합니다.");
			location.href="/login/login";
		}
		
		var emptyBool = "${empty prdList}";
		setBtn((emptyBool=="true"));
	});
</script>
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
						<th class="all-check">선택</th>
						<th colspan="7">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
						<th colspan="6">리스트 변경</th>
					</tr>
				</thead>
				<tbody>
					<%-- 데이터 출력 --%>
 					<c:choose>
						<%-- 상품 요소 --%>
 						<c:when test="${not empty prdList}">
 							<c:forEach var="i" begin="0" end="${fn:length(prdList)-1 }" >
								<tr class="prd-list">
									<td>
										<input type="checkbox" name="sel_prd"/>
										<input type="hidden" class="index" value="${i }">
									</td>
									<td colspan="7" class="prd">
										<img alt="${prdList[i].prd_num }" src="/KplantUploadStorage/product/${prdList[0].images[i].i_file }">
										<span>${prdList[i].prd_name }</span>
									</td>
									<td><input class="spinner" type="text" value="${ordDetailList[i].ord_qty }"/></td>
									<td colspan="2"><span class="prd-price">${prdList[i].prd_price }원</span></td>
									<td colspan="2"><span class="ord-price">${prdList[i].prd_price * ordDetailList[i].ord_qty }원 </span></td>
									<td colspan="2"><span class="shipping">3000원</span></td>
									<td colspan="6">
										<button type="button" class="btn btn-success updateBtn">수정</button>
										<button type="button" class="btn btn-success deleteBtn">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						
						<%-- 빈 바구니 요소 --%>
						<c:otherwise>
							<tr>
								<td colspan="21">장바구니에 추가된 상품이 없습니다.</td>
							</tr>
 						</c:otherwise>
 					</c:choose>
				</tbody>
			</table>
			<div class="cart_btn">
<!-- 				<button type="button" id="wishListBtn" class="btn btn-lg btn-style" disabled="disabled">찜하기</button> -->
				<button type="button" id="allDeleteBtn" class="btn btn-lg btn-style" disabled="disabled">모두 삭제</button>
			</div>
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
					<tr>
						<td colspan="4">주문금액</td>
						<td id="ord_price" class="price" colspan="2">0원</td>
						<td colspan="15" rowspan="2"></td>
					</tr>
					<tr>
						<td colspan="4">선결제 배송비</td>
						<td id="sh_price" class="price" colspan="2">0원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="order-footer">
		<button type="button" class="btn btn-lg btn-style ord_btn" value="all">전체 주문</button>
		<button type="button" class="btn btn-lg btn-style ord_btn" value="sel">선택상품 주문</button>
	</div>
</div>
