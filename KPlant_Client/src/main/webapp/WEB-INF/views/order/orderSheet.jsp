<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/order/orderSheet.css" />
<script type="text/javascript">
	//연락처
// 	var tel_ary=array('02','031','032','033','041','043','042','044','051','052','053','054','055','061','062','063','064','070');
	
	// 핸드폰번호
// 	var phone_ary=array('010','011','016','017','019');
	
	$(function(){
		$(".pay-method-btn").click(function(){
			$(".pay-method-btn").removeClass("method");
			$(".pay-method-btn").children("img[alt='card']").attr({"src":"/resources/images/order/ico_card.png"});
			$(".pay-method-btn").children("img[alt='acc']").attr({"src":"/resources/images/order/ico_acc.png"});
			$(".pay-method-btn").children("img[alt='spay']").attr({"src":"/resources/images/order/ico_spay.png"});
			
			$(this).addClass("method");
			$(this).children("img").attr({"src":"/resources/images/order/ico_" + $(this).children("img").attr("alt") + "_sel.png"});
		});
	})
</script>

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
						<th>선택</th>
						<th colspan="13">상품명/옵션</th>
						<th>수량</th>
						<th colspan="2">상품가</th>
						<th colspan="2">주문금액</th>
						<th colspan="2">배송비</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" name="sel_prd" /></td>
						<td colspan="13" class="prd">
							<img alt="상품대표사진" src="/resources/images/order/temp1.jpg">
							<span>몽골바위솔 5포트 바위솔 10cm포트묘</span>
						</td>
						<td>1</td>
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
		<div id="order-write">
			<div class="body-title">주문 / 배송정보</div>
			<div class="order-info">
				<table>
					<colgroup>
						<col width="13%">
						<col width="87%">
					</colgroup>
					<tr>
						<td>주문자<span class="write-point">*</span></td>
						<td><input type="text" class="form-control write-control" placeholder="이름 (영문일 경우, 이니셜로 입력)"  maxlength="5"/></td>
					</tr>
					<tr>
						<td>연락처<span class="write-point">*</span></td>
						<td class="write-tel">
							<select class="form-control write-control">
								<option value="010">010</option>
								<option value="011">011</option>
							</select>
							<span>-</span>
							<input type="tel" class="form-control write-control" maxlength="4"/>
							<span>-</span>
							<input type="tel" class="form-control write-control" maxlength="4"/>
						</td>
					</tr>
					<tr>
						<td>이메일<span class="write-point">*</span></td>
						<td><input type="text" class="form-control write-control" placeholder="입력하신 이메일로 결제 내역이 전송됩니다." max="50"/></td>
					</tr>
				</table>
			</div>
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
								<input type="text" class="form-control write-control" placeholder="최대 10자까지 입력 가능합니다."  maxlength="10"/>
							</div>
							<div class="write-address">
								<span>주소</span><span class="write-point">*</span><br />
								<input type="text" class="form-control write-control" readonly="readonly"/>
								<button class="btn">주소 검색</button><br />
								<input type="text" class="form-control write-control" readonly="readonly"/>
								<input type="text" class="form-control write-control" placeholder="나머지 상세주소를 입력해주세요."  maxlength="45"/>
							</div>
							<div class="write-tel">
								<span>연락처</span><span class="write-point">*</span><br />
								<select class="form-control write-control">
									<option value="010">010</option>
									<option value="011">011</option>
								</select>
								<span>-</span>
								<input type="tel" class="form-control write-control"  maxlength="4"/>
								<span>-</span>
								<input type="tel" class="form-control write-control"  maxlength="4"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>배송 요청사항<span class="write-point">*</span></td>
						<td class="write-request">
							<select class="form-control write-control">
								<option value="직접입력">메시지 직접 입력</option>
								<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
								<option value="배송 전, 연락주세요.">배송 전, 연락주세요.</option>
								<option value="부재 시, 휴대폰으로 연락주세요.">부재 시, 휴대폰으로 연락주세요.</option>
								<option value="부재 시, 경비실에 맡겨주세요.">부재 시, 경비실에 맡겨주세요.</option>
								<option value="선택안함">선택 안함</option>
							</select>
							<input type="text" class="form-control write-control" placeholder="배송 요청사항을 입력해주세요. (최대 45자까지 입력 가능)" maxlength="45"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="order-footer">
		<div class="sel_refund">
			<div class="body-title">품절 시 환불 방법</div>
			<div><span><input type="radio" id="refund" checked="checked"/><label for="refund"><span></span></label>결제수단으로 환불 받기</span></div>
		</div>
		<div class="pay-method">
			<span>결제방식</span>
			<div class="pay-method-btn"><img alt="card" src="/resources/images/order/ico_card.png"><br />신용카드</div>
			<div class="pay-method-btn"><img alt="acc" src="/resources/images/order/ico_acc.png"><br />계좌이체</div>
			<div class="pay-method-btn"><img alt="spay" src="/resources/images/order/ico_spay.png"><br />삼성페이</div>
		</div>
		<div class="pay-btn">
			<button type="button" id="cancle_ord_btn" class="btn btn-lg">주문취소</button>
			<button type="button" id="order_btn" class="btn btn-lg">결제하기</button>
		</div>		
	</div>
</div>
