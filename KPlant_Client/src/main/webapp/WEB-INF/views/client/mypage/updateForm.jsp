<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-------------------------------------------------------------------------------- --%>
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
						<li><a href="/mypage/cancel"  class="menusub">취소/반품/환불내역</a>
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
		<form id="member" class="form-inline">
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
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="email" class="form-control" id="exampleInputEmail2"
						placeholder="010 1234 5678"></td>
					<td class="tr1"><label class="text">이메일</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="email" class="form-control bottom" id="rows1"
						id="exampleInputEmail2" placeholder="kingtenri">@ <input
						type="email" class="form-control bottom" id="rows2"
						placeholder="naver.com"><br /> <select
						class="form-control" id="emailSelect">
							<option>직접입력</option>
							<option>naver.com</option>
							<option>nate.com</option>
							<option>gmail.com</option>
							<option>hanmail.net</option>
					</select></td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">주소</label></td>
					<td colspan="3" class="tr3">
						<div class="form-group">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="text" class="form-control bottom" id="exampleInputName2"
								placeholder="21445">
							<button type="submit" class="btn btn-default bottom">우편번호
								검색</button>
						</div> <br />
						<div class="form-group">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="email" class="form-control" id="exampleInputEmail2"
								placeholder="왕십리로 12길 23-8"> <input type="email"
								class="form-control" id="exampleInputEmail2"
								placeholder="퇴근빌딩 3">

						</div>

					</td>
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
		<div id="btnAll">
			<div id="delete">
				<input type="button" id="withd" name="withd" value="회원 탈퇴"
					class="btn btn-primary" />
			</div>
			<div id="btn">
				<input type="button" id="reset" name="reset" value="취소"
					class="btn btn-default" /> <input type="button" id="updateBtn2"
					name="updateBtn" value="회원 정보변경" class="btn btn-success" />
			</div>
		</div>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
