<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-------------------------------------------------------------------------------- --%>
<div id="location">
	<a>홈</a> > 마이페이지 > 회원정보 > <select>
		<option value="회원정보수정">취소/반품/환불내역</option>
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
						<li><a href="/mypage/updateForm" class="menusub">회원정보 수정</a></li>
						<li><a href="/mypage/passwordUpdateForm" class="menusub">비밀번호
								수정</a></li>
						<li><a href="/mypage/withdrawal" class="menusub">회원 탈퇴</a>
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
				<li class="liTitle"><a class="menutitle"
					href="/mypage/wishList">위시리스트</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/wishList" class="menusub">찜한 목록</a></li>
					</ul></li>
			</ul>
		</div>
	</div>


	<div id="orderDiv">
		<form id="orderForm" class="form-inline">
			<p class="title">취소/반품/환불내역</p>
			<div class="guide">
				<div class="orderImg">
					<img src="/resources/images/mypage/truck (2).png">
				</div>
				<div class="orderText">
					<p>배송추적은 '배송준비중' 상태부터 가능합니다.</p>
					<p>구매확정 후에는 반품/교환이 어렵습니다. 기간내 신청을 완료해 주세요.</p>
				</div>
			</div>
			<div class="orderDate">
				<div class="dateTitle">
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
			</div>
			<div></div>
			<p class = "title">주문내역</p>
			<div class = "orderTable">
				<table class="wishTable table table-striped ">
				<tr class="info">
					<td>주문일자/번호</td>
					<td>상품명/옵션</td>
					<td>주문금액</td>
					<td>진행현황</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan = "5">해당 내역이 없습니다.</td>
				</tr>	
			</table>
			</div>
			<div class="paging">
				<a class="prev" href="#">이전</a><a class="active" href="#">1</a><a
					class="next" href="#">다음</a>
			</div>
		</form>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
