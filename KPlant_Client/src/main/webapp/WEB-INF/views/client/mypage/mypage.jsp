<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="location">
	<a>홈</a> > 마이페이지 > 회원정보 > <select>
		<option value="회원정보수정">회원정보수정</option>
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


	<div id="memberDiv">
		<form id="member">
			<p class="title">기본 정보</p>

			<table border="1" class="memberTable">
				<tr>
					<td class="tr1"><label class="text">회원번호</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7945</td>
					<td class="tr1"><label class="text">아이디</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;77tjrgus</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">이름</label></td>
					<td colspan="3" class="tr3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고석현</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">생년월일</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1998-05-18</td>
					<td class="tr1"><label class="text">성별</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;남자</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">전화번호</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;010-1234-5678</td>
					<td class="tr1"><label class="text">이메일</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gjskfn@naver.com</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">주소</label></td>
					<td colspan="3" class="tr3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;31444
						서울특별시 마포구 스토리보드로 17-8</td>
				</tr>
			</table>
		</form>
		<div id="snsLogin">
			<!-- <p class="title">SNS 계정 연결 현황</p>
			<br /> <img src="/resources/images/mypage/naver.PNG" width="270"
				height="52.7" class="img high" /> <img
				src="/resources/images/mypage/kakao.PNG" class="high" width="270"
				height="52.7" /> -->
		</div>
		<input type="button" id="homeupdateBtn" name="updateBtn"
			value="회원 정보변경" class="btn btn-success" />
	</div>

</div>