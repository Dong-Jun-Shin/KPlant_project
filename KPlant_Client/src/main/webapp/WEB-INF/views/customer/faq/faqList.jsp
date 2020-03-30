<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(function () {
		/*modal창에 값 전달하기*/
		$(".goADetail").click(function () {
			var faq_num=$(this).parents("tr").attr("data-num");
			$("#faq_num").val(faq_num);
			console.log("선택한 질문 번호: "+ faq_num);
			$(this).popover(options);

			$.getJSON("/customer/faq/getFaq",$("#detailModal").serialize(), function(data){
				$("#faq_title").html(data.faq_title);
				$("#faq_content").html(data.faq_content);
				
				var input_num = $("<input>");
				input_num.attr({"type":"hidden","name":"faq_num"});
				input_num.val(data.faq_num);
				
				$('#faqModal').modal();
				dataReset();
				
			}).fail(function(){
				alert('시스템 오류 입니다. faq 관리자에게 문의해 주세요');
				dataReset();
			});
		});
		
		/*확인 버튼 클릭시 돌아가기*/
		$("#check-btn").click(function () {
			location.href="/customer/faq/faqList";
		})
	});//최상위 $ 함수 종료
	
	/* 팝오버(popover)에 대한 옵션 설정 */
	var options = { 
		html : true,
		placement : 'right',
		container: 'body',
		title: function() {
			return $("#popover-head").html();
		},
		content: function() {
			return $("#popover-content").html();
		}
	}
	//폼 초기화 작업
	function dataReset() {
		$("#faq_num").val("");
	}
	
	
</script>
<%-- 내용 구현하기 --%>
<div class="customer-content">
	<%-- Main title 출력 시작--%>
	<div class="page-header">
		<h1 class="customer-title">고객센터</h1>
	</div>
	<%-- Main title 출력 종료--%>
	<%-- Sub title 출력 시작--%>
	<div>
		<h2 class="customer-subTitle">FAQ</h2>
	</div>
	<%-- Sub title 출력 종료--%>
	
	<%-- =========FAQ 데이터 테이블 출력============ --%>
	<div class="table-reponsive customer-table">
		<form id="detailModal">
			<input type="hidden" id="faq_num" name="faq_num"/>
		</form>
		<table class="faq-table">
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty faqList}">
					<c:forEach var="faq" items="${faqList}">
						<tr data-num="${faq.faq_num}">
							<th class="tac text-center faq-title faq-q" style="width: 15%;">Q</th>
							<th class="tac faq-th goADetail">${faq.faq_title}</th>
							<th class="tac text-center faq-q goADetail">
								<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							</th>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<th colspan="3" class="tac text-center">등록된 FAQ가 존재하지 않습니다.</th>
				</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<%-- =========FAQ 데이터 테이블 출력 종료============ --%>
	
	<%-- ===================FAQ Modal 페이지 제작 ===================--%>
	<div class="modal fade" id="faqModal" tabindex="-1" role="dialog" aria-labelledby="faqModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id=""></button>
					<h4 class="modal-title" id="faqModalLabel">FAQ 상세보기</h4>
				</div>
				<div class="modal-body modal-table">
					<table class="table">
						<tr>
							<th class="question"><strong>Q</strong></th>
							<td id="faq_title" class="faq_title" style="text-align: left;"></td>
						</tr>
						<tr>
							<th class="answer"><strong>A</strong></th>
							<td id="faq_content" class="faq_content" style="text-align: left;"></td>
						</tr>
					</table>
				</div>
				<div class="btnDiv">
					<button type="button" class="check-btn" id="check-btn">확인</button>
				</div>
			</div>
		</div>
	</div>
	<%-- ===================FAQ Modal 페이지 종료 ===================--%>
		
</div>