<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/customer/header.css">
<script type="text/javascript">
	$(function () {
		/*검색 후 검색 대상과 검색 단어 출력*/
		var word="<c:out value='${data.keyword}' />";
		var value="";
		if (word!="") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
			
			if ($("#search").val()!='faq_content') {
				if ($("#search").val()=='faq_title') value = "#list tr .goDetail";
				console.log($(value+":contains('"+word+"')").html());
				
				//:contains()는 특정 텍스트를 포함한 요소 반환
				$(value+":contains('"+word+"')").each(function () {
					var regex = new RegExp(word,'gi');
					$(this).html($(this).html().replace(regex, "<span class='required'>" + word+"</span>"));
				});
			}
		}
		
		//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function() {
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		//조회 검색버튼
		$("#searchData").click(function() {
			if($("search").val()!="all"){
				if(!chkData("#keyword","검색어를")) return;
			}
			goPage();
		});
		
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
		
		/* 페이지 번호 클릭 시, 처리 */
        $(".paginate_button a").click(function(e){
           // 기본 속성 해지 함수(ex) a의 href 속성을 해제)
           e.preventDefault();
           $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
           // 페이지 번호에 따른 검색으로 페이징 구현 (실질적인 요청)
           goPage();
        });
	
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
	
	//검색을 위한 실질적인 처리 함수
	function goPage() {
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/customer/faq/faqList"
		});
		$("#f_search").submit();
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
	
	<%--========== 검색 기능 시작 ============ --%>
	<div id="faqSearch" class="search-header">
		<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	        <input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
			<div class="form-group">
				<select id="search" name="search" class="form-control">
					<option value="all">전체 검색</option>
					<option value="faq_title">질문</option>
					<option value="faq_content">답변</option>
				</select>
				<input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색할 키워드를 입력해주세요."/>
				<button type="button" id="searchData" class="btn btn-style">검색</button>
			</div>
		</form>
	</div>
	<%--=========== 검색 기능 종료 =========== --%>
	
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
	
	<%--======================페이징 출력 시작====================== --%>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage -1}">previous</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage +1 }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<%--======================페이징 출력 끝====================== --%>
	
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