<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

				<li class="liTitle"><a class="menutitle" href="/mypage/mypage">회원
						정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/updateForm" class="menusub">회원정보 수정</a></li>
						<li><a href="/mypage/passwordUpdate" class="menusub">비밀번호
								수정</a></li>
						<li><a href="/mypage/withdrawal" class="menusub">회원 탈퇴</a>
							<hr class="hr" /></li>
					</ul></li>
				<li class="liTitle"><a class="menutitle"
					href="/mypage/orderDetails">나의 쇼핑정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href="/mypage/orderDetails" class="menusub">주문/배송내역</a></li>
						<li><a href="#" class="menusub">취소/반품/환불내역</a>
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
		<form id="orderForm">
			<p class="title">기본 정보</p>
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
				<span><a href="?mode=normal&s_date=G" class="btn_white02">오늘</a></span>
				<span><a href="?mode=normal&s_date=A" class="btn_white02">1주일</a></span>
				<span><a href="?mode=normal&s_date=B" class="btn_white02">1개월</a></span>
				<span><a href="?mode=normal&s_date=C" class="btn_white02">2개월</a></span>
				<span><a href="?mode=normal&s_date=D" class="btn_white02">3개월</a></span>
				<span><a href="?mode=normal&s_date=E" class="btn_white02">6개월</a></span>
				<span><a href="?mode=normal&s_date=F" class="btn_white02">1년</a></span>

			</div>
			<div></div>
<<<<<<< Updated upstream
=======
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
				<a class="prev" href="#">이전</a><a class="active" href="#">1</a>
				<a class="next" href="#">다음</a>
			</div>
>>>>>>> Stashed changes
		</form>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
