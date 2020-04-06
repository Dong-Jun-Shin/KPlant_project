<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="content">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<a class="navbar-brand" href="/admin"> <img alt="Brand" src="/admin/resources/images/template/logo.png" ></a> 
		<p class="navbar-text">관리자 페이지입니다.</p>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-right">
        	<c:if test="${not empty m_id}">
        		<li><a>${m_name}님 환영합니다.</a></li>
        	</c:if>
        	<c:if test="${not empty m_id}">
        		<li><a id="adminLogout"href="/admin/*">로그아웃</a></li>
        	</c:if>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li role="presentation"  class="active"><a href="/admin/member/memberList">회원 관리</a></li>
		<li role="presentation"><a href="/admin/product/productList">상품 관리</a></li>
		<li role="presentation"><a href="/admin/hotdeal/hotdealList">핫딜 관리</a></li>
		<li role="presentation"><a href="/admin/order/orderList">주문 관리</a></li>
		<li role="presentation"><a href="/admin/event/eventList">이벤트 관리</a></li>
		<li role="presentation"><a href="/admin/faq/faqList">FAQ 관리</a></li>
		<li role="presentation"><a href="/admin/consult/consultList">1:1상담 관리</a></li>
	</ul>
</div>