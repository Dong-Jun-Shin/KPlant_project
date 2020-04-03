<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/customer/customer.css" />
<link rel="stylesheet" type="text/css" href="/resources/include/css/customer/writeForm.css" />
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700&display=swap" rel="stylesheet">
<%--script--%>
<script type="text/javascript">
	
	$(function () {
		$("#goToConsult").click(function () {
			location.href="/customer/consult/consultMain"
		})
	});//최상위 $ 종료
</script>

<%--script 종료--%>
<%-- body --%>
<div class="consult-content">
	<div class="page-header">
		<h1 class="customer-title">1:1 상담 내역 글 작성</h1>
		<hr>
		<ul class="writeForm-s">
			<li>KINGTENRI PLANT를 이용하시면서 느끼셨던 소감이나 환불, 문의사항, 개선사항을 남겨주세요. 작성하시고 회신유무에 따라 고객님의 메일 주소로 회신 됩니다.</li>
			<li>작성하신 고객님의 소중한 말씀은 최대한 빠르게 처리 및 답변드리겠습니다.</li>
		</ul>
	</div>
	
	<div>
		<h2 class="customer-subTitle">의견내용 작성</h2>
	</div>
	
	<%-- 폼 작성 시작 --%>
	<div class="form-div">
		<form action="f_writeForm" name="f_writeForm" class="">
			<div id="f_tableForm">
				<div class="table-header">
					<h4>유형 및 분류 선택</h4>
					<p>*은 필수 항목입니다.</p>
				</div>
				<div class="table-responsive">
					<table class="table-consult form-table">
						<colgroup>
							<col width="15%"/>
							<col width="85%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>*유형선택</th>
								<td>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 칭송
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 환불요청
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 문의사항
									</label>
								</td>
							</tr>
							<tr>
								<th>*분류선택</th>
								<td>
									<div class="col-xs-3">
									    <select class="form-control">
											<option value="배송">배송</option>
											<option value="제품">제품</option>
											<option value="서비스">서비스</option>
											<option value="이벤트">이벤트</option>
											<option value="기타">기타</option>
									    </select>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div id="S_tableForm">
				<div class="table-header">
					<h4>내용작성</h4>
					<p>*은 필수 항목입니다.</p>
				</div>
				<div class="table-responsive">
					<table class="table-consult form-table">
						<colgroup>
							<col width="15%"/>
							<col width="85%"/>
						</colgroup>
						<tbody>
							<tr>
								<th>*회신유무</th>
								<td>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 예
									</label>
									<label class="radio-inline">
									  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 아니오
									</label>
									<span>회신을 원하지 않으시면 아니오를 선택해 주세요</span>
								</td>
							</tr>
							<tr>
								<th>*제목</th>
								<td><input type="text" class="form-control" placeholder="Text input"></td>
							</tr>
							<tr>
								<th>*내용</th>
								<td>
									<textarea class="form-control" rows="15"></textarea>
								</td>
							</tr>
							<tr>
								<th>파일</th>
								<td>
									<div class="form-group">
									  	<label for="exampleInputFile">파일 업로드</label>
									  	<input type="file" id="exampleInputFile">
									  	<div class="help-block">
											<ul>
												<li>고객정보의 보호를 위해 첨부파일 기능 이용시, 개인정보 내용이 포함된 자료의 첨부는 지양하여 주십시오.(※ 신분증, 운전면허 등)</li>
												<li>파일명이 한글, 영문, 숫자를 제외한 다른 나라의 언어일 경우, 등록된 파일에 손상이 발생할 수 있습니다.</li>
												<li>JPG, JPEG, PNG, GIF 파일 형태로 첨부하시기 바랍니다.</li>
												<li>파일당 최대 5MB까지 첨부 가능합니다.</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
		
		<div>
			<button class="form-btn" type="button" id="insertConsult" name="insertConsult">등록</button>
			<button class="form-btn" type="button" id="goToConsult" name="goToConsult">취소</button>
		</div>
		
		<div class="panel panel-success writeForm-padding" style="text-align: left;">
			<div class="panel-heading">
			    <h3 class="panel-title">유의사항</h3>
			</div>
			<ul class="mylist">
				<li>홈페이지 및 모바일 사이트 관련 문의시 사용하시는 컴퓨터나 모바일 OS (Windows, Mac, Android, IOS 등) 및 웹 브라우저 타입과 버전을 ‘내용’ 부분에 작성하여 주시기 바랍니다.<li>
				<li>모바일 App 관련 문의시 고객님이 사용하시는 장치 OS (Android, IOS 등)를 ‘내용’ 부분에 작성하여 주시기 바랍니다.</li>
			</ul>				
		</div>
	</div>
	
</div>
<%-- body 종료--%>