<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/orderSheet.css" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="/resources/include/js/order/orderSheet.js"></script>
<div>
	<div class="order-header">
		<div class="left">
			<img alt="주문결제" src="/resources/images/order/ico_order_write.png" />
			주문작성/결제
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
						<th colspan="13">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
					</tr>
				</thead>
				<tbody>
	 				<c:forEach var="i" begin="0" end="${fn:length(prdList)-1 }">
						<tr class="prd-list">
							<td colspan="13" class="prd">
								<img alt="${prdList[i].img_prd }" src="">
								<span class="prd_name">${prdList[i].prd_name }</span>
							</td>
							<td>${ordDetailList[i].ord_qty }</td>
							<td colspan="2"><span class="prd-price">${prdList[i].prd_price }원</span></td>
							<td colspan="2"><span class="ord-price">${prdList[i].prd_price * ordDetailList[i].ord_qty }원 </span></td>
							<td colspan="2"><span class="shipping">3000원</span></td>
						</tr>
 					</c:forEach> 
				</tbody>
			</table>
		</div>
		<form id="ordDetail_info" class="info-form">
			<c:forEach var="i" begin="0" end="${fn:length(prdList)-1 }" varStatus="status">
				<input name="prd_num" type="hidden" value="${prdList[i].prd_num }"/>
				<input name="ord_qty" type="hidden" value="${ordDetailList[i].ord_qty }"/>
			</c:forEach> 
		</form>
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
		<div id="order-write">
			<form id="ord_info" class="info-form">
				<input type="hidden" id="ord_num" name="ord_num" />
				<input type="hidden" name="m_num" value="${member.m_num }" />
				<div class="body-title">주문 / 배송정보</div>
				<div class="order-info">
					<table>
						<colgroup>
							<col width="13%">
							<col width="87%">
						</colgroup>
						<tr>
							<td>주문자<span class="write-point">*</span></td>
							<td><input type="text" id="ord_name" name="ord_name" class="form-control write-control" placeholder="이름 (영문일 경우, 이니셜로 입력)"  maxlength="5"/></td>
						</tr>
						<tr>
							<td>연락처<span class="write-point">*</span></td>
							<td class="write-tel">
								<input type="hidden" id="ord_phone" name="ord_phone"/>
								<select id="ord_phone1" class="form-control write-control">
								</select>
								<span>-</span>
								<input type="tel" id="ord_phone2" class="form-control write-control" maxlength="4"/>
								<span>-</span>
								<input type="tel" id="ord_phone3" class="form-control write-control" maxlength="4"/>
							</td>
						</tr>
						<tr>
							<td>이메일<span class="write-point">*</span></td>
							<td><input type="text" id="ord_email" name="ord_email" class="form-control write-control" placeholder="입력하신 이메일로 결제 내역이 전송됩니다." max="50"/></td>
						</tr>
					</table>
				</div>
			</form>
			<form id="sh_info" class="info-form">
				<div class="shipping-info">
					<table>
						<colgroup>
							<col width="13%">
							<col width="87%">
						</colgroup>
						<tr>
							<td>배송지 선택</td>
							<td class="write-ship">
								<div>
									<span>받으실 분</span><span class="write-point">*</span><br />
									<input type="text" id="sh_name" name="sh_name" class="form-control write-control" placeholder="최대 10자까지 입력 가능합니다."  maxlength="10"/>
								</div>
								<div class="write-address">
									<input type="hidden" id="sh_residence" name="sh_residence"/>
									<span>주소</span><span class="write-point">*</span><br />
									<input type="text" id="sh_residence1" class="form-control write-control" readonly="readonly" />
									<button type="button" id="address_btn">주소 검색</button><br />
									<input type="text" id="sh_residence2" class="form-control write-control" readonly="readonly"  placeholder="(주소 검색을 해주세요.)" />
									<input type="text" id="sh_residence3" class="form-control write-control" placeholder="나머지 상세주소를 입력해주세요."  maxlength="45"/>
								</div>
								<div class="write-tel">
									<input type="hidden" id="sh_phone" name="sh_phone"/>
									<span>연락처</span><span class="write-point">*</span><br />
									<select id="sh_phone1" class="form-control write-control">
									</select>
									<span>-</span>
									<input type="tel" id="sh_phone2" class="form-control write-control"  maxlength="4"/>
									<span>-</span>
									<input type="tel" id="sh_phone3" class="form-control write-control"  maxlength="4"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>배송 요청사항<span class="write-point">*</span></td>
							<td class="write-request">
								<select id="sh_request_sel" class="form-control write-control">
								</select>
								<input type="text" id="sh_request" name="sh_request" class="form-control write-control" placeholder="배송 요청사항을 입력해주세요. (최대 45자까지 입력 가능)" maxlength="45"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
	<div class="order-footer">
		<div class="sel_refund">
			<div class="body-title">품절 시 환불 방법</div>
			<div><span><input type="radio" id="refund" checked="checked"/><label for="refund"><span></span></label>결제수단으로 환불 받기</span></div>
		</div>
			<form id="pay_info" class="info-form">
				<input type="hidden" id="pay_num" name="pay_num" />
				<input type="hidden" id="pay_method" name="pay_method" />
				<input type="hidden" id="pay_price" name="pay_price" />
				<input type="hidden" id="pay_date" name="pay_date" />
				<input type="hidden" id="pay_status" name="pay_status" />
			</form>
			<div class="pay-method">
				<span>결제방식</span>
				<div class="pay-method-btn"><img alt="card" src="/resources/images/order/ico_card.png"><br />신용카드</div>
				<div class="pay-method-btn"><img alt="trans" src="/resources/images/order/ico_trans.png"><br />계좌이체</div>
				<div class="pay-method-btn"><img alt="samsung" src="/resources/images/order/ico_samsung.png"><br />삼성페이</div>
			</div>
		<div class="pay-btn">
			<button type="button" id="cancle_btn" class="btn btn-lg">주문취소</button>
			<button type="button" id="order_btn" class="btn btn-lg">결제하기</button>
		</div>		
	</div>
</div>