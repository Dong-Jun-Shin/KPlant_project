<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		//close 인스턴스 메서드가 호출되는 즉시 실행
		$("errorAlert").on("closed.bs.alert", function(){
			location.href = "/";
		});
		$("#main").click(function(){
			location.href = "/";
		})
	})
</script>

<%-- 이 부분은 개발 당시에는 사용 --%>
<h4><c:out value="${exception.getMessage() }"></c:out></h4> 
<ul> 
 	<c:forEach  var="stack" items="${exception.getStackTrace() }"> 
 		<li><c:out value="${stack }"></c:out></li> 
	</c:forEach> 
 </ul> 

<%-- 이 부분은 개발 완료 후 사용 
<div class="alert alert-danger alert-dismissible fade in" role="alert" id="errorAlert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4>예상하지 못한 오류가 발생했습니다.</h4>
	<p>
		일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요. <br />
		계속 발생하는 경우 홈페이지를 통해 문의해 주세요. <br />
		감사합니다. <br />
	</p>
	<p>
		<button type="button" class="btn btn-danger" id="main">홈으로</button>
	</p>
</div>--%>
