<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-------------------------------------------------------------------------------- --%>
<div id="location">
	<a>홈</a> > 마이페이지 > 회원정보 > <select>
		<option value="회원정보수정">비밀번호 변경</option>
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
						<li><a href = "/mypage/passwordConfirm" class="menusub">회원정보 수정</a></li>
						<li><a href = "/mypage/passwordConfirm3" class="menusub">비밀번호 수정</a></li>
						<li><a href = "/mypage/passwordConfirm2" class="menusub">회원 탈퇴</a>
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


	<div id="passwordDiv">
		<form id="passwordConf3" class="form-inline">
		<input type="hidden" id="m_num" name="m_num" value = "${updateData.m_num}" />
			<p class="passwordTitle">비밀번호 확인</p>
			<div id="instruction">
				<p>회원님의 개인 정보를 안전하게 보호하기 위해 비밀번호를 다시 입력하여 주십시오.</p>
			</div>
			<p class="pwdForm">비밀번호를 입력해 주세요.</p>
			<table border="1" id="confirm">
				<tr>
					<td class="tr1"><label class="text2">회원 아이디</label></td>
					<td class="tr2" id="pwdName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_id}
					</td>
				<tr>
					<td class="tr1" id="pwdBefo"><label class="text2">기존
							비밀번호</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="password" class="form-control" id = "m_pwd3" name = "m_pwd" placeholder="기존 비밀번호를 입력" />
					</td>
			</table>

		</form>
		<div id="pwdBtnAll">
			<div id="pwdBtn">
				<input type="button" id="pwdConfBtn3" name="updateBtn" value="확인"
					class="btn btn-success" />
			</div>
		</div>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
