<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<link rel="stylesheet" type="text/css" href="/resources/include/css/mypage/mypage.css" />
<script type="text/javascript" src="/resources/include/js/mypage/updateForm.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/updatePassword.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/withdrawal.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/mypage.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm2.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm3.js"></script>

<%-------------------------------------------------------------------------------- --%>
<div id="location">
	<a>홈</a> > 마이페이지 > 회원정보 > <select>
		<option value="회원정보수정">주문/배송내역</option>
	</select>
</div>
<div id="all">

	<div id="nav">
		<div class="profile">
			<div>
				<img id="profileImg" src="/resources/images/mypage/user (2).png" />
			</div>
			<div class="profileTitle">마이페이지</div>
			<div class="profileSub">mypage</div>
		</div>
		<div class="menu">
			<ul>

				<li class="liTitle"><a class="menutitle" href="/mypage/">회원
						정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/passwordConfirm" class="menusub">회원정보 수정</a></li>
						<li><a href="/mypage/passwordConfirm3" class="menusub">비밀번호
								수정</a></li>
						<li><a href="/mypage/passwordConfirm2" class="menusub">회원 탈퇴</a>
							<hr class="hr" /></li>
					</ul></li>
				<li class="liTitle"><a class="menutitle"
					href="/mypage/orderDetails">나의 쇼핑정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/orderDetails" class="menusub">주문/배송내역</a></li>
						<li><a href="/mypage/cancel" class="menusub">취소/반품/환불내역</a>
							<hr class="hr" /></li>
					</ul></li>
				<!-- <li class="liTitle"><a class="menutitle"
					href="/mypage/wishList">위시리스트</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/wishList" class="menusub">찜한 목록</a></li>
					</ul></li> -->
			</ul>
		</div>
	</div>


	<div id="orderDiv">
		<form id="orderForm" class="form-inline">
		<input type="hidden" id="m_num" name="m_num" value = "${updateData.m_num}" />
			<p class="title">주문/배송내역</p>
			<div class="guide">
				<div class="orderImg">
					<img src="/resources/images/mypage/truck (2).png">
				</div>
				<div class="orderText">
					<p>배송추적은 '배송준비중' 상태부터 가능합니다.</p>
					<p>구매확정 후에는 취소/반품이 어렵습니다. 기간내 신청을 완료해 주세요.</p>
				</div>
			</div>
			<div class="orderDate">
				<!-- <div class="dateTitle">
					조회<br /> 기간
				</div>
				<div class="dateSelect">
					<div class="btn-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default">오늘</button>
						<button type="button" class="btn btn-default">1주일</button>
						<button type="button" class="btn btn-default">1개월</button>
						<button type="button" class="btn btn-default">2개월</button>
						<button type="button" class="btn btn-default">3개월</button>
						<button type="button" class="btn btn-default">6개월</button>
						<button type="button" class="btn btn-default">1년</button>
					</div>
					<div class="selectForm">
						<div class="form-group" id="dateCheck">
							<input type="date" name="start_date" id="start_date"
								placeholder="시작일자" class="form-control" />&nbsp;~&nbsp;<input
								type="date" name="end_date" id="end_date" placeholder="종료일자"
								class="form-control" />
						</div>
						<button type="button" class="btn btn-success" id="searchBtn">검색</button>
					</div>
				</div>
			</div> -->
			</div>
			<div></div>
			<p class="title">주문내역</p>
			<div class="orderTable">
				<table class="wishTable table table-striped ">
					<tr class="info">
						<td>주문일자</td>
						<td>주문번호</td>
						<td>주문금액</td>
						<td>주문수량</td>
						<td>진행현황</td>
						<!-- <td>&nbsp;</td> -->
					</tr>
					<%-- <tr>
						<td>${updateData.ord_date}</td>
						<td>${updateData.ord_num}</td>
						<td>${updateData.pay_price}</td>
						<td>${updateData.ord_status}</td>
						<td class = "rightLine">
						<!-- <input type = "button" class = "btn btn-success" value = "배송추적" /> -->
						<input type = "button" class = "btn btn-danger btn-sm" value = "주문취소" />
						<input type = "button" class = "btn btn-primary btn-sm" value = "구매확정" />
						<input type = "button" class = "btn btn-info btn-sm" value = "반품신청" />
						<input type = "button" class = "btn btn-warning btn-sm" value = "교환신청" />
						</td>
					</tr> --%>
					<c:choose>
							<c:when test="${not empty memberOrderList}">
								<c:forEach var="orderList" items="${memberOrderList}" varStatus="status">
									<tr class="text-center" data-num="${orderList.m_num}">
										<td>${orderList.ord_date}</td>
										<td>${orderList.ord_num}</td>
										<td>${orderList.pay_price}</td>
										<td>${orderList.ord_qty}</td>
										<td>${orderList.ord_status}</td>
										
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="tac text-center">주문 내역이 존재하지 않습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
				</table>
			</div>
			<div class="paging">
				<a class="prev" href="#">이전</a><a class="active5" href="#">1</a> <a
					class="next" href="#">다음</a>
			</div>
		</form>
	</div>
</div>


<%--------------------------------------------------------------------- --%>
