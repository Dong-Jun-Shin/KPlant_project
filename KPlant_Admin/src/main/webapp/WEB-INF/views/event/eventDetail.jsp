<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventMain.css">
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventDetail.css">
<%-- script 작성 --%>
<script type="text/javascript">
	$(function () {
		$("#goEventList").click(function () {
			location.href="/admin/event/eventList";
		});
		
		
	});//최상위 $종료
</script>
<%-- 화면 구성 --%>
<div>
	
	<h2 class="sub-header">이벤트 관리<small>-이벤트 상세페이지 입니다.</small></h2>
	
	<%-- 이벤트 번호 저장 --%>
	<form name="f_data" id="f_data" method="post">
       <input type="hidden" name="evnt_num" value="${detail.evnt_num}"/>
    </form>
	
	<%--이벤트 제목출력 --%>
	<hr id="top-line">
	<div class="row">
	  <div class="col-md-6 text-left">이벤트 제목입니다.${detail.evnt_title}</div>
	  <div class="col-md-6 text-right">등록일 [${detail.evnt_rgstDate}]</div>
	</div>
	<hr id="botton-line">	
	
	<%--이벤트 상세 정보 보여주기 --%>
	<div> 
		<div class="event_img" data-num="${detail.evnt_num}">
			<img src="/uploadStorage/event/thumbnail/${detail.evnt_thumb}">
			<img src="/uploadStorage/event/fileF/${detail.evnt_fileF}">
			<img src="/uploadStorage/event/fileS/${detail.evnt_fileS}">
			<img src="/uploadStorage/evnet/fileT/${detail.evnt_fileT}">
		</div>
		
		<div class="event_content">
			${detail.evnt_content}
			글내용이 추가 되어야 합니다.
		</div>
		
		<div class="panel panel-success" style="text-align: left;">
			<div class="panel-heading">
			    <h3 class="panel-title">유의사항</h3>
			</div>
			<ul class="mylist">
				<li>당첨되신 분들에게는 킹텐리 상담원을 통해 전화연락을 드립니다. 영업일 기준 4일간 연락을 드리며, 기간 내 배송정보 조사를 위한 통화가 안될시 이벤트 당첨이 취소됩니다. <br/>전화 연결이 어려우신 경우, 콜센터 영업시간(09:00~18:00) 내로 회신해주시면 확인이 가능합니다.<li>
				<li>킹텐리의 회원정보에 입력해둔 휴대전화 번호로 연락을 드립니다. 회원정보에 정확한 정보를 입력해주시길 바랍니다. <br/>부정확한 연락처 기입으로 인해 연락이 불가할 경우 이벤트 당첨이 취소됩니다.</li>
				<li>이하의 사항이 확인될 경우 당첨이 취소됩니다.</li>
				<li>동일인의 중복 ID 사용을 통한 반복 응모, 스팸성 이벤트 응모, 타인의 댓글 도용</li>
				<li>허위, 혹은 국내법과 킹텐리 회원약관에 위배되는 정보를 킹텐리와 킹텐리 스토어 회원정보에 기입했을 경우</li>
				<li>통화 이후 제품 발송 일정과 배송 방법 등 진행 전반은 킹텐리가 직접 운영합니다.</li>
				<li>본 이벤트는 당사의 사정에 따라 사전 예고 없이 변경될 수 있습니다</li>
			</ul>				
		</div>
	</div>
	
	<div class="event-footer">
		<div class="foot-right">
			<input type="button" class="btn btn-style" id="updateFormBtn" name="updateFormBtn" value="수정"/>
			<input type="button" class="btn btn-style" id="DeleteFormBtn" name="DeleteFormBtn" value="삭제"/>
		</div>
		<%-- 목록으로 돌아가기 --%>
		<div style="text-align: center;">
			<button type="button" class="event-mainPage" id="goEventList">목록</button>
		</div>
	</div>
</div>