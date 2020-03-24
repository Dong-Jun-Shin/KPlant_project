<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-------------------------------------------------------------------------------- --%>
<div id="location">
	<a>홈</a> > 마이페이지 > 회원정보 > <select>
		<option value="회원정보수정">회원탈퇴</option>
	</select>
</div>
<div id="all2">

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

				<li class="liTitle"><a class="menutitle" href="/mypage/mypage">회원 정보</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href = "/mypage/updateForm" class="menusub">회원정보 수정</a></li>
						<li><a href = "/mypage/passwordUpdate" class="menusub">비밀번호 수정</a></li>
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
				<li class="liTitle"><a class="menutitle" href="/mypage/wishList">위시리스트</a>
					<hr class="hr" />
					<ul class="point">
						<li><a href = "/mypage/wishList" class="menusub">찜한 목록</a></li>
					</ul></li>
			</ul>
		</div>
	</div>


	<div id="withdrawalDiv">
		<form id="withdrawalForm" class="form-inline">
			<p class="withdrawalTitle">회원탈퇴</p>
			<div id="instruction">
				<p>회원 탈퇴 시 신중하게 선택하신 후 진행해주시기 바랍니다.</p>
			</div>
			<p class="check">※탈퇴 시 유의사항</p>
			<div id="instructionForm">

				<div class="note">
					<p class="strong">회원탈퇴신청에 앞서 아래의 사항을 반드시 확인하시기 바랍니다</p>
					<p class="subfont">&nbsp; - 탈퇴 후 고객님의 정보는 전자상거래 소비자보호법에 의거한
						개인정보보호정책에 따라 관리됩니다.</p>
					<p class="subfont">&nbsp; - 탈퇴 후 일정기간 재가입 여부판단을 목적으로 고객님의
						최소정보(아이디, 성명)를 보존합니다.</p>
					<p class="subfont">&nbsp; - 탈퇴 시 고객님께서 보유하셨던 위시리스트의 저장상품은 모두
						삭제되며, 복구되지않습니다.</p>
					<p class="subfont">&nbsp; - 꼭 확인하시고 신중하게 탈퇴 신청해 주시기 바랍니다.</p>
				</div>
				<div class="note" id="note2">
					<p class="strong">다음의 경우는 회원탈퇴에 주의가 필요합니다.
					<p class="subfont">&nbsp; - 현재 고객님의 반품처리 요청사항이나 고객서비스가 완료되지 않은
						경우에는 서비스 처리완료 후 탈퇴가능합니다.</p>
					<p class="subfont">&nbsp; - 거래가 진행중인 경우 진행중인 거래를 우선 마무리 해주시기
						바랍니다.</p>
					<p class="subfont">&nbsp; - 회원탈퇴를 하시면, 보유하고 있는 적립금과 위시리스트의
						저장상품들은 자동 소멸됩니다.</p>
					<p class="subfont">&nbsp; - 탈퇴 후 3개월 내(90일) 재가입시 신규회원가입혜택이 지급되지
						않습니다.</p>
				</div>
			</div>

			<div id="instructionForm2">
				<p class="check">※이용하시면서 불편하셨던 사항을 체크해 주세요 (중복체크가능)</p>
				<div class="leave_check_list">
					<ul>
						<li class="topno"><input id="ck1" type="checkbox"
							name="reason" value="다른 쇼핑몰에 비해 가격이 비쌈" title="다른 쇼핑몰에 비해 가격이 비쌈">
							<label for="ck1">다른 쇼핑몰에 비해 가격이 비쌈</label></li>
						<li class="topno"><input id="ck2" type="checkbox"
							name="reason" value="교환/환불/반품에 대한 불만" title="교환/환불/반품에 대한 불만">
							<label for="ck2">교환/환불/반품에 대한 불만</label></li>
						<li><input id="ck3" type="checkbox" name="reason"
							value="상품품질이 안좋음" title="상품 품질이 안 좋음"> <label for="ck3">상품
								품질이 안 좋음</label></li>
						<li><input id="ck4" type="checkbox" name="reason"
							value="이벤트/회원서비스가 다양하지 않음" title="이벤트/회원서비스가 다양하지 않음"> <label
							for="ck4">이벤트/회원서비스가 다양하지 않음</label></li>
						<li><input id="ck5" type="checkbox" name="reason"
							value="상품이 별로 없음" title="상품이 별로 없음"> <label for="ck5">상품이
								별로 없음</label></li>
						<li><input id="ck6" type="checkbox" name="reason"
							value="개인정보 유출우려" title="개인정보 유출우려"> <label for="ck6">개인정보
								유출우려</label></li>
						<li><input id="ck7" type="checkbox" name="reason"
							value="상품찾기가 어려움" title="상품찾기가 어려움"> <label for="ck7">상품찾기가
								어려움</label></li>
						<li><input id="ck8" type="checkbox" name="reason"
							value="자주 이용하지 않음" title="자주 이용하지 않음"> <label for="ck8">자주
								이용하지 않음</label></li>
						<li><input id="ck9" type="checkbox" title="배송이 늦음"
							name="reason" value="배송이 늦음"> <label for="ck9">배송이
								늦음</label></li>
						<li><input id="ck10" type="checkbox" title="기타" name="reason"
							value="기타"> <label for="ck10">기타</label></li>
					</ul>
				</div>
			</div>

		</form>

		<div class="lastConfirm">
			<input type="checkbox" name = "agree" title="회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다." /><label
				id="confirmFont">회원 탈퇴 안내를 모두 확인 하였습니다. 탈퇴에 동의 합니다.</label>
		</div>
		<div id="withdrawalBtnAll">
			<div id="withdrawalBtn">
				<input type="button" id="withReset" name="withReset" value="취소"
					class="btn btn-default" /> <input type="button" id="withBtn"
					name="#withBtn" value="회원탈퇴" class="btn btn-success" />
			</div>
		</div>
	</div>

</div>
<%--------------------------------------------------------------------- --%>
