<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="content">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<a class="navbar-brand" href="http://192.168.0.107:8080/admin/"> <img alt="Brand" src="/resources/images/template/logo.png" ></a> 
		<p class="navbar-text">관리자 페이지입니다.</p>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-right">
			<li><a>관리자님 환영합니다.</a></li>
			<li ><input type="button" class="btn btn-default navbar-btn" value="로그아웃" id="adminLogout"></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->

<div class="col-sm-3 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li role="presentation" class="active"><a href="#">회원 관리</a></li>
		<li role="presentation"><a href="#">상품 관리</a></li>
		<li role="presentation"><a href="#">핫딜 관리</a></li>
		<li role="presentation"><a href="#">주문 관리</a></li>
		<li role="presentation"><a href="#">이벤트 관리</a></li>
	</ul>
</div>