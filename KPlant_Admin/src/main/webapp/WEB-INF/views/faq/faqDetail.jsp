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
		$("#goFaqList").click(function () {
			location.href="/admin/faq/faqList";
		});
		
		$("#updateFormBtn").click(function () {
			$("#f_data").attr({
				"method" : "post",
				"action" : "/admin/faq/updateForm"
			});
			$("#f_data").submit();
		});
		
		$("#DeleteFormBtn").click(function () {
			$("#f_data").attr({
				"method" : "post",
				"action" : "/admin/faq/faqDelete"
			});
			$("#f_data").submit();
		})
	});//최상위 $ 종료
	
</script>
<%-- script end--%>

<%-- body --%>
<div>
	<h2 class="sub-header">FAQ 관리</h2>
	
	<%-- faq 번호 저장 --%>
	<form name="f_data" id="f_data" method='post'>
		<input type="hidden" name="faq_num" value="${detail.faq_num}"/>
	</form>
	
	<%-- faq 제목 출력 --%>
	<div class="row">
		<div class="col-md-6 text-left">${detail.faq_title}</div>
		<div class="col-md-6 text-right">등록일 : ${detail.faq_rgstDate}</div>
	</div>
	<hr id="botton-line">
	
	<div class="table-header">
	<%-- faq 상세 정보 보여주기 --%>
	<table class="table-consult form-table">
		<colgroup>
			<col width="15%">
			<col width="85%">
		</colgroup>
		<tr>
			<th>Q.</th>
			<td>${detail.faq_title}</td>
		</tr>
		<tr>
			<th>A.</th>
			<td>${detail.faq_content}</td>
		</tr>
	</table>
	
	<div class="event-footer">
		<div class="foot-right">
			<input type="button" class="btn btn-style" id="updateFormBtn" name="updateFormBtn" value="수정"/>
			<input type="button" class="btn btn-style" id="DeleteFormBtn" name="DeleteFormBtn" value="삭제"/>
		</div>
		<%-- 목록으로 돌아가기 --%>
		<div style="text-align: center;">
			<button type="button" class="event-mainPage" id="goFaqList">목록</button>
		</div>
	</div>
	
</div>
</div>
<%-- body end--%>