<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-------------------------------------------------------------------------------- --%>
<div id="location">
	<a>홈</a> > 마이페이지 > 위시리스트 > <select>
		<option value="회원정보수정">찜한목록</option>
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

				<li class="liTitle"><a class="menutitle" href="/mypage/">회원 정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href = "/mypage/updateForm" class="menusub">회원정보 수정</a></li>
						<li><a href = "/mypage/passwordUpdateForm" class="menusub">비밀번호 수정</a></li>
						<li><a href = "/mypage/withdrawal" class="menusub">회원 탈퇴</a>
							<hr class="hr" /></li>
					</ul></li>
				<li class="liTitle"><a  class="menutitle" href="/mypage/orderDetails">나의 쇼핑정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a  href = "/mypage/orderDetails"class="menusub">주문/배송내역</a></li>
						<li><a  href="/mypage/cancel" class="menusub">취소/반품/환불내역</a>
							<hr class="hr" /></li>
					</ul></li>
				<!-- <li class="liTitle"><a class="menutitle" href="/mypage/wishList">위시리스트</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href = "/mypage/wishList" class="menusub">찜한 목록</a></li>
					</ul></li> -->
			</ul>
		</div>
	</div>


	<div id="wishListDiv">
		<form id="wishList">
			<p class="title">찜한 목록</p>

			<table class="wishTable table table-striped ">
				<tr class="success">
					<td>상품명</td>
					<td>상품금액</td>
					<td>구매</td>
				</tr>
				<tr>
					<td>
					<div class = "imgText">
					<div class = "wimg">
							<a href="#"><img src="/resources/images/mypage/truck (2).png" /></a>
						</div>
						<div class = "wtext">아로니아</div></div></td>
					<td ><div class = "wtd">8.000</div></td>
					<td><div class = "wtd2"><input type="button" value="구매" class="btn btn-success" />&nbsp;&nbsp;<input
						type="button" value="삭제" class="btn btn-primary" /></div></td>
				</tr>
				<tr>
				<td>
					<div class = "imgText">
					<div class = "wimg">
							<a href="#"><img src="/resources/images/mypage/truck (2).png" /></a>
						</div>
						<div class = "wtext">아로니아</div></div></td>
					<td><div class = "wtd">8.000</div></td>
					<td><div class = "wtd2"><input type="button" value="구매" class="btn btn-success" />&nbsp;&nbsp;<input
						type="button" value="삭제" class="btn btn-primary" /></div></td>
				</tr>
				<tr>
					<td>
					<div class = "imgText">
					<div class = "wimg">
							<a href="#"><img src="/resources/images/mypage/truck (2).png" /></a>
						</div>
						<div class = "wtext">아로니아</div></div></td>
					<td><div class = "wtd">8.000</div></td>
					<td><div class = "wtd2"><input type="button" value="구매" class="btn btn-success" />&nbsp;&nbsp;<input
						type="button" value="삭제" class="btn btn-primary" /></div></td>
				</tr>
			</table>
			<div class="paging">
				<a class="prev" href="#">이전</a><a class="active5" href="#">1</a><a
					class="next" href="#">다음</a>
			</div>
		</form>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
