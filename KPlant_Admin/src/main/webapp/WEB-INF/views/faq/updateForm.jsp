<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/event/eventMain.css">
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/event/eventDetail.css">
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/event/writeForm.css">

<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/customer/header.css" />
<%-- script --%>
<script type="text/javascript">
	$(function () {
		//수정 버튼
		$("#faqUpdateBtn").click(function () {
			console.log("FAQ 수정완료 버튼 클릭");
			
			if (!checkForm("#faq_title","질문을")) return;
			else if(!checkForm("#faq_content","대답을")) return;
			else{
				$("#f_updateForm").attr({
					"method" : "post",
					"action" : "/admin/faq/faqUpdate"
				});
				$("#f_updateForm").submit();
			}
		});
		//취소 버튼
		$("#faqCancelBtn").click(function () {
			$("#f_updateForm").each(function () {
				this.reset();
			});
		});
		
		//글목록 버튼
		$("#faqListBtn").click(function () {
			location.href="/admin/faq/faqList";
		});
		
		
	}); //최상위 $ 종료
</script>
<%-- script 종료 --%>
<%-- body --%>
<div>
	<h2 class="sub-header">FAQ 수정하기</h2>
	
	<%-- 폼 작성 시작 --%>
	<div class="faq-body">
		<form id="f_updateForm">
			<input type="hidden" id="faq_num" name="faq_num" value="${updataData.faq_num}"/>
			
			<div id="faq-dataForm">
				<div class="table-header">
					<h4>faq 입력폼</h4>
					<p>*은 필수 항목입니다.</p>
				</div>
				<table class="table form-table">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<th>등록일</th>
							<td>${updataData.faq_rgstDate}</td>
						</tr>
						<tr>
							<th>*질문 사항</th>
							<td>
								<input type="text" class="form-control" placeholder="질문을 입력해 주세요" id="faq_title" name="faq_title" value="${updataData.faq_title}">
							</td>
						</tr>
						<tr>
							<th>*대답 사항</th>
							<td>
								<textarea class="form-control" rows="3" id="faq_content" name="faq_content">${updataData.faq_content}</textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	
	<div class="faq-footer">
		<div class="foot-right">
			<input type="button" value="다시쓰기" id="faqCancelBtn" class="btn btn-style"/>
			<input type="button" value="목록" id="faqListBtn" class="btn btn-style"/>
		</div>
		<%-- 저장 --%>
		<div style="text-align: center;">
			<input type="button" value="수정 완료" id="faqUpdateBtn" name="faqUpdateBtn" class="event-mainPage" />
		</div>
	</div>
</div>
<%-- body end--%>