<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(function () {
		/*FAQ 페이지로 이동 하기*/
		$("#goFaqBnt").click(function () {
			location.href="/customer/faq/faqList";
		});
		
		/*글쓰기 버튼 클릭시 처리 이벤트*/
		$("#showConsultForm").click(function () {
			location.href="/customer/consult/writeForm"
		});
		/*글 작성 페이지 insert구문*/
		
		/*로그인 됬을때 글 작성 페이지 만들기*/
		/*고객페이지에 등록 및 조회 가능*/
		
	});//최상위 $종료
</script>

<div class="customer-content">
	<div class="page-header">
		<h1 class="customer-title">고객센터</h1>
	</div>
	
	<div>
		<h2 class="customer-subTitle">1:1상담</h2>
	</div>
	
	<div class="customer-table font-select">
	
		<div class="visual_banner customer smell_type">
			
			<div class="banner_cont">
				<strong>
				KINGTENRI는 언제나 고객의 말씀을 경청하겠습니다.
				<br> 
				고객님의 문의, 제언, 칭송, 불편사항을 남겨주세요.
				</strong>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-md-8" style="text-align: left; padding-left: 40px;">문의 사항은 FAQ에서 먼저 확인하여 주시기 바랍니다.</div>
			<div class="col-md-4" style="text-align: right;">
				<button class="faq-btn" type="button" id="goFaqBnt" name="goFaqBnt">FAQ로 바로가기</button>
			</div>
		</div>
		<div>
			<button class="form-btn" type="button" id="showConsultForm" name="showConsultForm">글 작성하기</button>
		</div>
		<div class="panel panel-success" style="text-align: left;">
			<div class="panel-heading">
			    <h3 class="panel-title">유의사항</h3>
			</div>
			<ul class="mylist">
				<li>질문에 대한 답변은 등록시 작성하시는 고객님의 메일 주소로 회신됩니다.<li>
				<li>로그인 후 작성하신 경우 홈페이지에서 작성일 기준 90일 이내에만 조회가 가능합니다.</li>
				<li>이메일 서버 및 개인 메일함의 설정 상황에 따라 이메일 수신이 안될 수 있으므로 로그인후 홈페이지에서 답변을 조회하여 주시기 바랍니다.</li>
				<li>주말 및 공휴일에 문의하신 내용은 정상 근무일에 처리 되기 때문에 답변이 다소 지연될 수 있습니다.</li>
				<li>고객님의 소중한 말씀은 공휴일을 제회한 평일 근무시간에 담당자에게 전달됩니다.</li>
				<li>담당자 배정 후 신속히 처리하도록 하겠사오니 양해해 주시기 바랍니다.</li>
			</ul>				
		</div>
	</div>

</div>