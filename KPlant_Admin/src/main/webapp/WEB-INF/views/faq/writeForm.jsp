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
		/*목록버튼*/
		$("#faqListBtn").click(function () {
			location.href="/admin/faq/faqList";
		});
		
		/*다시쓰기 버튼*/
		$("#faqCancelBtn").click(function () {
			$("#f_writeForm").each(function () {
				this.reset();
			});
		});
		
		/*저장하기 버튼*/
		$("#faqInsertBtn").click(function () {
			console.log("FAQ 저장 버튼 클릭");
			
			// 입력값 체크
			if (!chkData("#faq_title", "질문 사항을")) return;
			else if(!chkData($("#faq_content"), "대답을")) return;
			else{
				$("#f_writeForm").attr({
					"method" : "post",
					"action" : "/admin/faq/faqInsert"
				});
				$("#f_writeForm").submit();
			}
		});
		
	});//최상위 $ 종료
</script>
<%-- script end--%>

<%-- body --%>
<div>
	<h2 class="sub-header">FAQ 입력하기</h2>
	
	<%-- 폼 작성 시작 --%>
	<div class="faq-body">
		<form id="f_writeForm" name="f_writeForm">
			<div id="faq-dataForm">
				<div class="table-header">
					<h4>faq 입력폼</h4>
					<p>*은 필수 항목입니다.</p>
				</div>
				<table class="table-consult form-table">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<th>Q.질문 사항</th>
							<td>
								<input type="text" class="form-control" placeholder="질문을 입력해 주세요" id="faq_title" name="faq_title">
							</td>
						</tr>
						<tr>
							<th>A.대답 사항</th>
							<td>
								<textarea class="form-control" rows="3" id="faq_content" name="faq_content"></textarea>
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
			<button type="button" class="event-mainPage" id="faqInsertBtn" name="faqInsertBtn">저장</button>
		</div>
	</div>
</div>
<%-- body end--%>