<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type = "text/javascript" src ="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<!-- 주소창 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 회원 등록 CSS-->
<link rel="stylesheet" type="text/css" href="/resources/include/css/join/memberInsert.css">	

<script type="text/javascript">
	$(function() {
		
		//확인 버튼
		$("#insertBtn").click(function () {
			if(!chkData("#m_name","이름"))return;
			else if(!chkData("#m_gender","성별"))return;
			else if(!chkData("#m_residenceNum","우편번호"))return;
			else if(!chkData("#m_residenceAddress","거주지역"))return;
			else if(!chkData("#m_residenceDetailAddress","상세주소"))return;
			else if(!chkData("#m_id","아이디"))return;
			else if(!chkData("#m_pwd","비밀번호"))return;
			else if(!chkData("#m_pwd2","비밀번호 확인"))return;
			else if(!chkData("#m_birth","생년월일"))return;
			else if(!chkData("#m_phone1","전화번호"))return;
			else if(!chkData("#m_phone2","전화번호 앞자리"))return;
			else if(!chkData("#m_phone3","전화번호 뒷자리"))return;
			else if(!chkData("#m_eMail1","이메일 앞자리"))return;
			else if(!chkData("#m_eMail2","이메일 뒷자리"))return;
			else{
				var m_phone = $("#m_phone1 option:selected").val()+"-"+$("#m_phone2").val()+"-"+$("#m_phone3").val();
				$("#m_phone").val(m_phone);
				var m_eMail = $("#m_eMail1").val()+"@"+$("#m_eMail2 option:selected").val();
				$("#m_eMail").val(m_eMail);
				var m_residence = $("#m_residenceNum").val()+$("#m_residenceAddress").val()+$("#m_residenceDetailAddress").val();
				$("#m_residence").val(m_residence);
				
				$("#form").attr({
					"method":"post",
					"action":"/join/memberInsert"
				});
				$("#form").submit();
			}
			
		});
		
		
		
		//아이디 중복 확인
		$("#idCheck").click(function() {
			
			if(!chkData("#m_id","아이디"))return;
			else{
				$.ajax({
					url : "/join/memberIdCheck",//전송 url
					type : "post",//전송시 method
					dataType : "json",
					data:{"m_id" : $("#m_id").val()},
					error : function() {//실행시 오류가 발생하였을 경우
						alert("시스템 오류 입니다. 관리자에게 문의 하세요");
					},//정산적으로 실행이 되었을 걍우
					success : function(data) {
						var goUrl = "";//이동할 경로를 저장할 변수
						if (data == 1) {//일치하지 않는 경우
							$("#msg").text("작성한 아이디가 사용불가능합니다.").css("color", "red");
						} else if (data == 0) {//일치할 경우
							$("#msg").text("작성한 아이디는 사용가능합니다.").css("color", "blue");
						}
					}
				});
			}
		});//아이디 중복 확인 끝
		
		//비밀번호 확인
		$("#alert-success").hide(); 
		$("#alert-danger").hide();
		$("input").keyup(function(){ 
			var m_pwd=$("#m_pwd").val(); 
			var m_pwd2=$("#m_pwd2").val(); 
			if(m_pwd != "" || m_pwd2 != ""){ 
				if(m_pwd == m_pwd2){ 
					$("#alert-success").show(); 
					$("#alert-danger").hide(); 
					$("#insertBtn").removeAttr("disabled"); 
					}else{ 
						$("#alert-success").hide(); 
						$("#alert-danger").show(); 
						$("#insertBtn").attr("disabled", "disabled"); 
					} 
				} 
			});//비밀번호 확인 끝
		
	});
</script>

<!-- 주소  -->
<script>
    function m_residenceDaumPostcode() {
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
                    document.getElementById("m_residenceDetailAddress").value = extraAddr;
                
                } else {
                    document.getElementById("m_residenceDetailAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_residenceNum').value = data.zonecode;
                document.getElementById("m_residenceAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("m_residenceDetailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<div class="container">
		<div class="progress ">
			<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
				<span class="sr-only">70% Complete</span>
			</div>
		</div>
		
		<h1>회원 가입</h1>
		<form id="form" name="form" class="form-inline">
			
			<input type="hidden" id="m_residence" name="m_residence">
			<input type="hidden" id="m_phone" name="m_phone">
			<input type="hidden" id="m_eMail" name="m_eMail">
			
			
			<table>
				<tr>
					<td colspan="2">
						<label># 이름</label> 
					</td>
				</tr>
				<tr>
					<td colspan="2">	
						<input type="text" id="m_name" name="m_name" class="form-control" style="width: 514px;">
					</td>
				</tr>
				<tr>	
					<td colspan="2">
						<label># 성별</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">	
						<label class="radio-inline"> 
							<input type="radio" id="m_gender" name="m_gender" checked="checked" value="여자"> 여자 
						</label>
						<label class="radio-inline"> 
							<input type="radio"name="m_gender" value="남자"> 남자
						</label>
					</td>
				</tr>
				<tr>
					<th colspan="2"># 거주지역</th>
				</tr>
				<tr>
					<td>
						<input type="text" id="m_residenceNum" name="m_residenceNum" class="form-control" style="width:25%" placeholder="우편번호" >
						<input type="text" id="m_residenceAddress" name="m_residenceAddress" class="form-control" style="width:286px;"  placeholder="도로명 주소 또는 지번입력">
					</td>
					<td>	
						<input type="button" id="find" name="find" value="주소검색" onclick="m_residenceDaumPostcode()">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="m_residenceDetailAddress" name="m_residenceDetailAddress" style="width:40%" value="" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label># 아이디</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" id="m_id" name="m_id" style="width: 388px;"> 
					</td>
					<td>
						<input type="button"  id="idCheck" name="idCheck" value="중복 확인">
					</td>
				</tr>
				<tr>
					<td><span id="msg"></span></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<label># 비밀번호</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="password" id="m_pwd" name="m_pwd" class="form-control" style="width: 514px;">
						<p class="text-muted ">8자이상/영문 대 소문자/숫자/특수문자/한글, 공백 불가/ 아이디, 회원 번호 불가/생년월일, 휴대전화 번호 불가/ 20자 이내</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label># 비밀번호 확인</label>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" id="m_pwd2" name="m_pwd2" class="form-control" style="width: 514px;">
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
					</td>
				</tr>
				<tr>
					<td colspan="2"><label># 생년월일</label></td>
				</tr>
				<tr>
					<td colspan="2"><input type="date" id="m_birth" name="m_birth" class="form-control" style="width: 514px;"></td>
				</tr>
				<tr>
					<td colspan="2"><label># 전화 번호</label></td>
				</tr>
				<tr>
					<td colspan="2">
						 <select title="전화번호" style="width: 25%;" class="form-control" id="m_phone1" name="m_phone1">
							<option value="">직접입력</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="011">012</option>
						</select>
						<input type="text"  style="width:189px" class="form-control" id="m_phone2" name="m_phone2" maxlength="4">
						<input type="text"  style="width:188px" class="form-control" id="m_phone3" name="m_phone3" maxlength="4">
					</td>
				</tr>
				<tr>
					<td colspan="2"><label># 이메일</label></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" placeholder="이메일 입력" title="이메일 아이디 입력" id="m_eMail1" name="m_eMail1" style="width: 50%" class="form-control"> @ &nbsp; 
						<select title="이메일 선택" style="width: 225px;" class="form-control"  id="m_eMail2" name="m_eMail2">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.com">daum.com</option>
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