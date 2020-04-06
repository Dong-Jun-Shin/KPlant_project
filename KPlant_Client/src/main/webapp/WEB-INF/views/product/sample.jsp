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
         var evnt_num=$(this).attr("data-num");
         $("#evnt_num").val(evnt_num);
         $("#detailForm").attr({
            "method" : "get",
            "action" : "/event/eventDetail"
         });
         $("#detailForm").submit();
         
      });
   });//상위 $ 함수 끝
   
   
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
                     <img src="/KplantUploadStorage/event/thumbnail/${event.evnt_thumb}" style="width: 600px; height: 300px;">
                     <div class="caption">
                       <h3>${event.evnt_title}</h3>
                     <p>${event.evnt_startDate}부터  - ${event.evnt_endDate}까지</p>
                     <p>${event.evnt_rgstDate}</p>
                     </div>
                   </div>
                 </div>
            </c:forEach>
         </c:when>
         <c:otherwise>
              <div class="col-sm-6 col-md-4">
                <div class="thumbnail goDetail">
                  <img src="/resources/images/event/eventDefault.jpg">
                  <div class="caption">
                    <h3>등록된 이벤트가 존재하지 않습니다.</h3>
                    <p>새로운 이벤트를 준비중입니다!</p>
                    <p>기대해주세요!</p>
                  </div>
                </div>
              </div>
         </c:otherwise>
      </c:choose>
   </div>
   <%--====================이벤트 thumbnail 출력종료=================== --%>
</div>