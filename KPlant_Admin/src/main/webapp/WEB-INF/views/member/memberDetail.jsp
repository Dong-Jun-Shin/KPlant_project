<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 상세 정보</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/member/memberDetail.css">
		
		<script type="text/javascript">
			$(function () {
				$("#btn").click(function() {
					location.href="/admin/member/memberList";
				});
			});
		</script>
	</head>
	<body>
		<div class="container">
		
			<div class="page-header"><h3 class="text-center">회원 상세 리스트</h3></div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="m_num" value="${detail.m_num}"/>
			</form>
			
			<%--===================== 상세 정보 보여주기 시작 ================= --%>
				<div class="contentTB text-cent">
					<table class="table table-bordered">
						<colgroup>
							<col width="5%"/>
							<col width="9%"/>
							<col width="5%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="10%"/>
							<col width="15%"/>
							<col width="10%"/>
							<col width="5%"/>
							<col width="10%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<td class="text-left">${detail.m_num}</td>
								<th>휴면 여부</th>
								<td class="text-left">${detail.m_dormancy}</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td class="text-left">${detail.m_id}</td>
								<th>비밀번호</th>
								<td class="text-left">${detail.m_pwd}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td class="text-left" colspan="3">${detail.m_name}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td class="text-left">${detail.m_birth}</td>
								<th>성별</th>
								<td class="text-left">${detail.m_gender}</td>
							</tr>
							<tr>
								<th>거주지역</th>
								<td class="text-left" colspan="3">${detail.m_residence}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td class="text-left">${detail.m_phone}</td>
								<th>이메일</th>
								<td class="text-left">${detail.m_eMail}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<%--===================== 상세 정보 보여주기 종료 ================= --%>
				
				<%--================== 확인 버튼 시작 ============ --%>
				<div class="text-center">
					<input type="button" value="확인" id="btn">
				</div>
				<%--================== 확인 버튼 종료 ============ --%>
			
		</div>
	</body>
</html>