<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/include/css/member/memberList.css">

<style type="text/css">
#searchData {
	padding: 5px 33px;
	background-color: #1E332C;
	border: 2px solid #1E332C;
	color: white;
	border-radius: 3px;
	margin-top: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		
		
		//검색 대상이 변경될 때마다 처리 이벤트
		$("#search").change(function() {
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
	
      	//검색버튼
		$("#searchData").click(function() {
			if($("#search").val()!="all"){
				if(!chkData("#keyword","검색어")) return;
			}
			goPage();
		});
		
		//검색을 위한 실질적인 처리 함수
		function goPage() {
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/member/memberList"
			});
			$("#f_search").submit();
		}
		
		/*제목 클릭시 상세 페이지 이동을 위한 처리이벤트*/
		$(".goDetail").click(function(){
			var m_num=$(this).parents("tr").attr("data-num");
			$("#m_num").val(m_num);
			console.log("글번호: "+m_num);
			//상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
			$("#detailForm").attr({
				"method":"get",
				"action":"/admin/member/memberDetail"
			});
			$("#detailForm").submit();
		});
		
		
		 /* 페이지 번호 클릭 시, 처리 */
        $(".paginate_button a").click(function(e){
           // 기본 속성 해지 함수(ex) a의 href 속성을 해제)
           e.preventDefault();
           $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
           // 페이지 번호에 따른 검색으로 페이징 구현 (실질적인 요청)
           goPage();
        });
		
	});
</script>

<section>
	<div class="container">
		<jsp:include page="memberSub.jsp"/>
		
		<div><h2 class="sub-header">회원 리스트</h2></div>
		
		<form id="detailForm">
			<input type="hidden" id="m_num" name="m_num"/>
		</form>
	
			<%--========== 검색 기능 시작 ============ --%>
			<div id="memberSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				
					<div class="form-group">
						<label>검색 조건</label> 
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="m_name">이름</option>
							<option value="m_id">아이디</option>
							<option value="m_birth">생년월일</option>
							<option value="m_residence">거주지역</option>
							<option value="m_phone">전화번호</option>
							<option value="m_eMail">이메일</option>
						</select> <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control">
					<button type="button" id="searchData">검색</button>
				</div>
			</form>
		</div>
		<%--=========== 검색 기능 종료 =========== --%>
		
		<%--========================= 리스트 시작 ============================= --%>
			<div id="memberList">
				<table summary="회원 정보 리스트" class="table table-striped">
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
					<thead>
						<tr>
							<th data-value="m_num" class="order text-center">번호</th>
							<th class="text-center">이름</th>
							<th class="text-center">성별</th>
							<th class="text-center">아이디</th>
							<th class="text-center">비밀번호</th>
							<th class="text-center">생년월일</th>
							<th class="text-center">거주지역</th>
							<th class="text-center">전화번호</th>
							<th class="text-center">이메일</th>
							<th class="text-center">휴면</th>
							<th data-value="m_date" class="order">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty memberList}">
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr class="text-center" data-num="${member.m_num}">
										<td>${member.m_num}</td>
										<td class="goDetail text-left">${member.m_name}</td>
										<td>${member.m_gender}</td>
										<td >${member.m_id}</td>
										<td >${member.m_pwd}</td>
										<td >${member.m_birth}</td>
										<td >${member.m_residence}</td>
										<td >${member.m_phone}</td>
										<td >${member.m_eMail}</td>
										<td >${member.m_dormancy}</td>
										<td>${member.m_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 회원이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%--================== 리스트 종료 ================== --%>
			
			<%--================== 페이징 출력 시작 ================== --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">previous</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">	
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage +1}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<%--================== 페이징 출력 종료  ================== --%>
	</div>
</section>
