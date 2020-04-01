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


	<div id="memberDiv">
		<form id="member" class="form-inline member2">
			<input type="hidden" id="m_num" name="m_num" value = "${updateData.m_num}" />
			<input type = "hidden" id = "m_residence" name = "m_residence" value = "${updateData.m_residence}" />
			<input type = "hidden" id ="m_eMail" name = "m_eMail" value = "${updateData.m_eMail}"/>
			<input type = "hidden" id = "m_phone" name = "m_phone" value = "${updateData.m_phone}" />
			<p class="title">기본 정보</p>

			<table border="1" class="memberTable">
				<tr>
					<td class="tr1"><label class="text">회원번호</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_num}</td>
					<td class="tr1"><label class="text">아이디</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_id}</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">이름</label></td>
					<td colspan="3" class="tr3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_name}</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">생년월일</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_birth}</td>
					<td class="tr1"><label class="text">성별</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${updateData.m_gender}</td>
				</tr>
				<tr>
					<td class="tr1"><label class="text">전화번호</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="phoneSelect" class="form-control bottom">
							<option value="010">010</option>
							<option value="011">011</option>
					</select> - <input type=text class="form-control bottom" id="phone1"
						name="phone2" /> - <input type="text" class="form-control bottom"
						id="phone2" name="phone2" />
					</td>
					<td class="tr1"><label class="text">이메일</label></td>
					<td class="tr2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="email" class="form-control bottom" id="rows1"
						id="exampleInputEmail2">@ <select
						class="form-control" id="emailSelect">
							<option>주소 선택</option>
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
								type="text" class="form-control bottom" id="postcode"
								> <input type="button"
								class="btn btn-default bottom"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div> <br />
						<div class="form-group">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="text" class="form-control" id="address"
								> <input type="text"
								class="form-control" id="detailAddress" ><input
								type="hidden" class="form-control" id="extraAddress"
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
				height="52.7" />
				<input type="text" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목"> -->

		</div>
		<div id="btnAll">
			<div id="delete">
				<input type="button" id="withd" name="withd" value="회원 탈퇴"
					class="btn btn-primary" />
			</div>

			<div id="btn">
				<input type="button" id="reset" name="updateBtn" value="취소"
					class="btn btn-default" /> <input type="button" id="updateBtn2"
					name="updateBtn2" value="회원 정보변경" class="btn btn-success" />
			</div>
		</div>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
