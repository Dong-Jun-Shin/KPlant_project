<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/mypage/mypage.css" />

<script type="text/javascript" src="/resources/include/js/mypage/updateForm.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/updatePassword.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/withdrawal.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/mypage.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm2.js"></script>
	<script type="text/javascript" src="/resources/include/js/mypage/passwordConfirm3.js"></script>
<script type = "text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

>>>>>>> origin/develop
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
