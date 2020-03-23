<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 등록</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
<script type = "text/javascript" src = "/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

<!-- 회원 등록 CSS-->
<link rel="stylesheet" type="text/css" href="/resources/include/css/join/memberInsert.css">	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/join/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, m_residence, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.m_residence.value = m_residence;
	}
</script>

<script type="text/javascript">
	$(function() {
		
		//아이디 중복 확인
		$("#idCheck").click(function() {
			var m_id = /^[a-zA-Z0-9]{4,12}$/
			var query={m_id:$("#m_id").val()};
			if(!chkData("#m_id","아이디"))return;
			else{
				$.ajax({
					url : "/join/memberIdCheck",//전송 url
					type : "post",//전송시 method
					data : query,
					dataType : "text",
					error : function() {//실행시 오류가 발생하였을 경우
						alert("시스템 오류 입니다. 관리자에게 문의 하세요");
					},//정산적으로 실행이 되었을 걍우
					success : function(data) {
						var goUrl = "";//이동할 경로를 저장할 변수
						if (data == 1) {//일치하지 않는 경우
							$("#msg").text("작성한 아이디가 사용불가능합니다.").css("color", "red");
						} else if (data == 1) {//일치할 경우
							$("#msg").text("작성한 아이디는 사용가능합니다.").css("color", "blue");
						}
					}
				});
			}
		});
		
		$("#insertBtn").click(function () {
			location.href="/join/complete";
		})
		
	});
</script>
</head>
<body>
	<div class="container">
		<div class="progress ">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
				style="width: 70%;">
				<span class="sr-only">70% Complete</span>
			</div>
		</div>
		
		<h1>기존 회원 여부 확인</h1>
		<form id="form" name="form" method="post">
			<table>
				<tr>
					<td colspan="2">
						<label for="exampleInputEmail2"># 이름</label> 
					</td>
				</tr>
				<tr>
					<td colspan="2">	
						<input type="text" id="m_name" name="m_name" class="form-control">
					</td>
				</tr>
				<tr>	
					<td colspan="2">
						<label for="exampleInputEmail2"># 성별</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">	
						<label class="radio-inline"> 
							<input type="radio" name="m_gender" id="m_gender" checked="checked"> 여자 
						</label>
						<label class="radio-inline"> 
							<input type="radio" id="m_gender" name="m_gender"> 남자
						</label>
					</td>
				</tr>
				<colgroup>
					<col style="width:20%"><col>
				</colgroup>
				<tr>
					<th colspan="2"># 우편번호</th>
				</tr>
				<tr>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="m_residence" name="m_residence"  placeholder="도로명 주소 건물명 또는 지번입력" class="form-control">
					</td>
					<td>	
						<input type="button" id="find" name="find" value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th colspan="2">도로명주소</th>
				</tr>
				<tr>
					<td colspan="2"><input type="text" id="roadAddrPart1"class="form-control"></td>
				</tr>
				<tr>
					<th colspan="2">상세주소</th>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" id="addrDetail" value="" class="form-control">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="exampleInputEmail2"># 아이디</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" id="m_id" name="m_id" style="width: 388px;"> 
						<span id="msg"></span>
					</td>
					<td>
						<input type="button"  id="idCheck" name="idCheck" value="중복 확인">
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<label for="exampleInputEmail2"># 비밀번호</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="password" id="m_pwd" name="m_pwd" class="form-control">
						<p class="text-muted ">8자이상/영문 대 소문자/숫자/특수문자/한글, 공백 불가/ 아이디, 회원 번호 불가/생년월일, 휴대전화 번호 불가/ 20자 이내</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label for="exampleInputEmail2"># 비밀번호 확인</label>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" id="m_passwd" name="m_passwd" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><label for="exampleInputEmail2"># 생년월일</label></td>
				</tr>
				<tr>
					<td colspan="2"><input type="date" id="m_blrth" name="m_blrth" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><label for="exampleInputEmail2"># 전화 번호</label></td>
				</tr>
				<tr>
					<td colspan="2">
						 <select title="전화번호" style="width: 25%;" class="form-control">
							<option>직접입력</option>
							<option value="010">010</option>
							<option value="011">011</option>
						</select>
						<input type="text"  style="width:20%" class="form-control">
						<p style="width:10%">ㅡ</p>
						<input type="text"  style="width:20%" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2"><label for="exampleInputEmail2"># 이메일</label></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" placeholder="이메일 입력" title="이메일 아이디 입력" style="width: 50%" class="form-control"> @ &nbsp; 
						<select title="이메일 도메인 선택" style="width: 180px;" class="form-control" style="width: 50%">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>	
			</table>
		</form>
		<div>
			<input type="button" id="insertBtn" value="등록">
		</div>
		
	</div>
</body>
</html>