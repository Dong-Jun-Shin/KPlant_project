<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventMain.css">
<%-- ===========================스크립트 구성 ==============================--%>
<script>
	$(function () {
		/*이벤트 단락 클릭시 상세 페이지로 이동하기 위한 처리 이벤트*/
		$(".goDetail").click(function () {
			var evnt_num=$(this).parents("div").attr("data-num");
			$("#evnt_num").val(evnt_num);
			console.log("글번호: " + evnt_num);
			//상세페이지로 이동하기 위해 form 추가(id : detailForm)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/event/eventDetail"
			});
			$("#detailForm").submit();
		})
	})//상위 $ 함수 끝
	
	/*
	/*동적으로 eventList 값 전달
	function listData() {
		console.log("EVENT 리스트 출력");
		var count = 0;
		
		$.getJSON("/event/eventData", function (data) {
			console.log("length : " + data.length);
			$(data).each(function (index) {
				var evnt_num = this.evnt_num;
				var evnt_title = this.evnt_title;
				var evnt_content = this.evnt_content;
				var evnt_views = this.evnt_views;
				var evnt_rgstDate = this.evnt_rgstDate;
				var evnt_startDate = this.evnt_startDate;
				var evnt_endDate = this.evnt_endDate;
				var evnt_modifyDate = this.evnt_modifyDate;
				var evnt_thumb = this.evnt_thumb;
				var evnt_fileF = this.evnt_fileF;
				var evnt_fileS = this.evnt_fileS;
				var evnt_fileT = this.evnt_fileT;
				thumbnailList(evnt_num, evnt_title, evnt_content, evnt_views, evnt_rgstDate, evnt_startDate, evnt_endDate, evnt_modifyDate, evnt_thumb, evnt_fileF, evnt_fileS, evnt_fileT, index);
				
			});
		}).fail(function () {
			alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")
		});
	}
	
	function thumbnailList(evnt_num, evnt_title, evnt_content, evnt_views, evnt_rgstDate, evnt_startDate, evnt_endDate, evnt_modifyDate, evnt_thumb, evnt_fileF, evnt_fileS, evnt_fileT, index){
		var column = $("<div>");
		column.attr("data-num", evnt_num);
		column.addClass("col-sm-6 col-md-4");
		
		var thumbnail = $("<div>");
		thumbnail.addClass("thumbnail");
		
		var lightbox_a = $("<a>");
		lightbox_a.attr({"href":"/uploadStorage/event/"+evnt_fileF, "data-lightbox":"roadtrip", "title":evnt_title});
		
		var img = $("<img>");
		img.attr("src", "/uploadStorage/gallery/thumbnail/"+evnt_thumb);

		var caption = $("<div>");
		caption.addClass("caption");
		
		var h3 = $("<h3>");
		h3.html(g_subject.substring(0, 12)+"...");
		
		var pInfo = $("<p>");
		pInfo.html("작성자: "+ g_name +" / 등록일: " + g_date);
		
		var pContent = $("<p>");
		pContent.html(g_content.substring(0, 24)+"...");
		
		var pBtnArea = $("<p>");
		
		var upBtn = $("<a>");
		upBtn.attr({"data-btn":"upBtn", "role":"button"});
		upBtn.addClass("btn btn-primary gap");
		upBtn.html("수정");
		
		var delBtn = $("<a>");
		delBtn.attr({"data-btn":"delBtn", "role":"button"});
		delBtn.addClass("btn btn-default");
		delBtn.html("삭제");
		
		caption.append(h3).append(pInfo).append(pContent));
		column.append(thumbnail.append(lightbox_a.append(img)).append(caption));
		
		$("#rowArea").append(column);
	}*/
</script>
<%-- ===========================스크립트 종료 ==============================--%>

<%-- 화면구성 --%>
<div>
	<div class="page-header event-title">
		<h1 class="event-title">EVENT</h1>
		<p >진행중인 이벤트 페이지 입니다.</p>
	</div>
	
	<div class="event-banner">
		<div class="banner-style">
			<p>Welcom To KINGTENRI</p>
			<h1>Event</h1>
			<p><span class="text-color">킹텐리</span>와 함께 이벤트를 즐겨보세요!</p>
		</div>
	</div>
	
	<%-- 상세페이지로 이동하기 위한 hidden form --%>
	<form id="detailForm">
		<input type="hidden" id="evnt_num" name="evnt_num"/>
	</form>
	<%--====================이벤트 thumbnail 출력하기=================== --%>
	<div class="row event-content">
		<c:choose>
			<c:when test="${not empty eventList}">
				<c:forEach var="event" items="${eventList}">
					  <div class="col-sm-6 col-md-4">
					    <div class="thumbnail goDetail" data-num="${event.evnt_num}">
					      <img src="/uploadStorage/gallery/thumbnail/"+${event.evnt_thumb}>
					      <div class="caption">
					        <h3>${event.evnt_title}</h3>
					        <p>${event.evnt_content}</p>
							<p>${event.evnt_startDate} - ${event.evnt_endDate}</p>
							<p>${event.evnt_rgstDate}</p>
					      </div>
					    </div>
					  </div>
				</c:forEach>
			</c:when>
		</c:choose>
		
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail goDetail" data-num="${event.evnt_num}">
	      <img src="/resources/images/event/eventDefault.jpg">
	      <div class="caption">
	        <h3>이벤트 제목</h3>
	        <p>이벤트 부제목이 들어갈 자리 입니다.</p>
			<p>이벤트 시작일 + 이벤트 종료일</p>
			<p>글 등록일 </p>
	      </div>
	    </div>
	  </div>
	  
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail goDetail" data-num="${event.evnt_num}">
	      <img src="/resources/images/event/eventDefault.jpg">
	      <div class="caption">
	        <h3>이벤트 제목</h3>
	        <p>이벤트 부제목이 들어갈 자리 입니다3.</p>
			<p>이벤트 시작일 + 이벤트 종료일</p>
			<p>글 등록일 </p>
	      </div>
	    </div>
	  </div>
	  
	</div>
	<%--====================이벤트 thumbnail 출력종료=================== --%>
</div>