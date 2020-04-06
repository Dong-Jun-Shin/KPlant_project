<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/customer/header.css" />

<%-- script --%>
<script type="text/javascript">
	$(function () {
		
		/*검색 후 검색 대상과 검색 단어 출력*/
		var word="<c:out value='${data.keyword}' />";
		var value="";
		if (word!="") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
			
			if ($("#search").val()!='evnt_content') {
				if ($("#search").val()=='evnt_title') value = "#list tr td.goDetail";
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
		
		/*이벤트 단락 클릭시 상세 페이지로 이동하기 위한 처리 이벤트*/
		$(".goDetail").click(function () {
			var evnt_num=$(this).attr("data-num");
			$("#evnt_num").val(evnt_num);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/event/eventDetail"
			});
			$("#detailForm").submit();
			
		});
		
		/*이벤트 생성 버튼 클릭시 입력 폼으로 이동처리*/
		$("#insertFormBtn").click(function () {
			location.href="/admin/event/writeForm";
		});
		
		/*이벤트 전체 보기*/
		$("#eventListBtn").click(function () {
			location.href="/admin/event/eventList";
		});
		
		/* 페이지 번호 클릭 시, 처리 */
        $(".paginate_button a").click(function(e){
           // 기본 속성 해지 함수(ex) a의 href 속성을 해제)
           e.preventDefault();
           $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
           // 페이지 번호에 따른 검색으로 페이징 구현 (실질적인 요청)
           goPage();
        });
	
	});//최상위 $ 함수 끝 
	
	//검색을 위한 실질적인 처리 함수
	function goPage() {
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/admin/event/eventList"
		});
		$("#f_search").submit();
	}
</script>
<%-- script end--%>

<%-- body --%>
<div>
	<h2 class="sub-header">이벤트 관리</h2>
	<div class="event-body">
		<form id="detailForm">
			<input type="hidden" id="evnt_num" name="evnt_num"/>
		</form>
	
		<%--========== 검색 기능 시작 ============ --%>
		<div id="eventSearch" class="text-right">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	            <input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
				<div class="form-group">
					<label>검색 조건</label>
					<select id="search" name="search" class="form-control">
						<option value="all">전체 검색</option>
						<option value="evnt_title">제목</option>
						<option value="evnt_content">내용</option>
					</select>
					<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색할 키워드를 입력해주세요."/>
					<button type="button" class="btn btn-style" id="searchData" name="searchData">검색</button>
				</div>
			</form>
		</div>
		<%--=========== 검색 기능 종료 =========== --%>
		
		<%--========================= 리스트 시작 ============================= --%>
		<div id="eventList">	
			<table class="table table-hover">
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>기간</th>
					<th>등록일</th>
					<th>수정일</th>
				</tr>
				<c:choose>
					<c:when test="${not empty eventList}">
						<c:forEach var="event" items="${eventList}" varStatus="status">
							<tr data-num="${event.evnt_num}" class="goDetail">
								<td>${status.count}</td>
								<td>${event.evnt_title}</td>
								<td>${event.evnt_startDate} ~ ${event.evnt_endDate}</td>
								<td>${event.evnt_rgstDate}</td>
								<td>${event.evnt_modifyDate}</td>
							</tr>	
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th colspan="5" class="tac text-center">등록된 FAQ가 존재하지 않습니다.</th>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	<%--================== 글쓰기 버튼 출력 시작 ============ --%>
	<div class="event-footer">
		<div class="foot-right">
			<input type="button" class="btn btn-style" id="insertFormBtn" name="insertFormBtn" value="이벤트 생성"/>
			<input type="button" class="btn btn-style" id="eventListBtn" name="eventListBtn" value="이벤트 전체 보기"/>
		</div>
	</div>
	<%--================== 글쓰기 버튼 출력 종료 ============ --%>
	
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
</div>
<%-- body end--%>
