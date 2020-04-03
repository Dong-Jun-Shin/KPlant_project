<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventMain.css">
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventDetail.css">
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/writeForm.css">
<%-- script --%>
<script type="text/javascript">
	$(function () {
		//수정완료 버튼
		$("#eventUpdateBtn").click(function () {
			console.log("EVENT 수정완료 버튼 클릭");
			
			//입력값 체크
			if (!checkForm("#evnt_title","이벤트 제목을 ")) return;
			else if (!checkForm("#evnt_startDate","이벤트 시작일을")) return;	
			else if (!checkForm("#evnt_endDate","이벤트 종료일을")) return;	
// 			else if (!checkForm("#fileF","썸내일용 파일을")) return;	
// 			else if (!chkFile($("#fileF"))) return;	
			else{
				if ($('#fileF').val()!="") {
					if (!chkFile($('#fileF'))) return;
				}
				$("#f_updateForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action" : "/admin/event/eventUpdate"
				});
				$("#f_updateForm").submit();
			}
s		});
		
		//다시쓰기 버튼
		$("#eventCancelBtn").click(function () {
			$("#f_updateForm").each(function () {
				this.reset();
			});
		});
		
		//리스트로 이동하기
		$("#eventListBtn").click(function () {
			location.href="/admin/event/eventList";
		});
	});//최상위 $ 함수
</script>
<%-- script end--%>
<%-- body--%>
<div class="updateForm_body">
	<h2 class="sub-header">이벤트 수정하기</h2>
	
	<%-- 폼 작성 시작 --%>
	<div class="event-body">
		<form id="f_updateForm" name="f_updateForm">
			<input type="hidden" id="evnt_num" name="evnt_num" value="${updateData.evnt_num}"/>
			<input type="hidden" id="evnt_thumb" name="evnt_thumb" value="${updateData.evnt_thumb}"/>
			<input type="hidden" id="evnt_fileF" name="evnt_fileF" value="${updateData.evnt_fileF}"/>
			<input type="hidden" id="evnt_fileS" name="evnt_fileS" value="${updateData.evnt_fileS}"/>
			<input type="hidden" id="evnt_fileT" name="evnt_fileT" value="${updateData.evnt_fileT}"/>
			
			<div id="event-dateForm">
				<div class="table-header">
					<h4>이벤트 기간 설정</h4>
					<p>*은 필수 항목입니다.</p>
				</div>
				<table class="table-consult form-table">
					<colgroup>
						<col width="15%"/>
						<col width="85%"/>
					</colgroup>
					<tbody>
						<tr>
							<th>*이벤트 기간</th>
							<td class="form-inline">
								<div class="form-group">
								    <label class="sr-only" for="exampleInputEmail3">이벤트 시작일</label>
								    <input type="date" class="form-control" id="evnt_startDate" name="evnt_startDate" value="${updateData.evnt_startDate}">
								</div>
								<span> 부터 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<div class="form-group">
								    <label class="sr-only" for="exampleInputPassword3">이벤트 종료일</label>
								    <input type="date" class="form-control" id="evnt_endDate" name="evnt_endDate" value="${updateData.evnt_endDate}">
								</div>
								<span> 까지</span>
							</td>
						</tr>
						<tr>
							<th>*제목</th>
							<td>
								<input type="text" class="form-control" placeholder="제목을 입력해 주세요" id="evnt_title" name="evnt_title" value="${updateData.evnt_title}">
							</td>
						</tr>
						<tr>
							<th>*파일 업로드</th>
							<td>
								<div class="form-group">
									<div class="form-group">
								    	<label for="exampleInputFile">*썸네일</label>
									   <!--  <input type="file" id="evnt_thumb" name="evnt_thumb" > -->
								    	<c:if test="${updateData.evnt_thumb != ''}">
											<img src="/KplantUploadStorage/event/thumbnail/${updateData.evnt_thumb}">
										</c:if>
									</div>
									
									<div class="form-group">
								    	<label for="exampleInputFile">*파일1 업로드(썸네일)</label>
									    <input type="file" id="fileF" name="fileF">
									    <c:if test="${updateData.evnt_fileF != ''}">
											<img src="/KplantUploadStorage/event/${updateData.evnt_fileF}">
										</c:if>
									</div>
									
									<div class="form-group">
								    	<label for="exampleInputFile">파일2 업로드</label>
									    <input type="file" id="fileS" name="fileS">
										<c:if test="${updateData.evnt_fileS != ''}">
											<img src="/KplantUploadStorage/event/${updateData.evnt_fileS}">
										</c:if>
									</div>
									
									<div class="form-group">
								    	<label for="exampleInputFile">파일3 업로드</label>
									    <input type="file" id="fileT" name="fileT">
										<c:if test="${updateData.evnt_fileT != ''}">
											<img src="/KplantUploadStorage/event/${updateData.evnt_fileT}">
										</c:if>
									</div>
								    <div class="help-block">
										<ul>
											<li>파일1은 썸네일로 활용되는 파일이기 때문에 필수로 첨부하시기 바랍니다.</li>
											<li>파일 1, 파일2, 파일3은 이미지 순서대로 업로드되기 때문에 순서에 따라 파일을 업로드 해주시길 바랍니다.</li>
											<li>파일명이 한글, 영문, 숫자를 제외한 다른 나라의 언어일 경우, 등록된 파일에 손상이 발생할 수 있습니다.</li>
											<li>JPG, JPEG, PNG, GIF 파일 형태로 첨부하시기 바랍니다.</li>
											<li>파일당 최대 5MB까지 첨부 가능합니다.</li>
										</ul>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>부가 설명</th>
							<td>
								<textarea class="form-control" rows="3" name="evnt_content" id="evnt_content"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	
	<div class="event-footer">
		<div class="foot-right">
			<input type="button" value="다시쓰기" id="eventCancelBtn" class="btn btn-style"/>
			<input type="button" value="목록" id="eventListBtn" class="btn btn-style"/>
		</div>
		<%-- 저장 --%>
		<div style="text-align: center;">
			<button type="button" class="event-mainPage" id="eventUpdateBtn" name="eventUpdateBtn">수정완료</button>
		</div>
	</div>
</div>
