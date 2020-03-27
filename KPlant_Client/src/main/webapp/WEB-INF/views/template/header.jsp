<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="status-login status-background">
   	<%-- <c:if test=""></c:if> --%>
   	<%-- 로그인
   	<div class="container text-right myinfo">
	   	<!-- 로그인 했을 때 헤더와 라이트메뉴-->
		<span class="member">홍길동</span>님, 환영합니다!
		<button class="btn logout" type="button">로그아웃</button>
   	</div>
   	--%>
</div>
<div class="container">
	<div class="navbar-header">
      <a class="navbar-brand" href="http://192.168.0.107:8080/" style="padding: 5px">
      	<img alt="logo" src="/resources/images/template/logo.png" width="200px">
      </a>
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="menu navbar-left"><a class="menu-left-font" href="#">FLOWER</a></li>
        <li class="menu navbar-left"><a class="menu-left-font" href="#">HOT DEAL</a></li>
        <li class="menu navbar-left dropdown">
          <a href="#" class="dropdown-toggle menu-left-font" data-toggle="dropdown" data-hover="dropdown" role="button">EVENT <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-sub" role="menu">
            <li><a href="#">진행중인 이벤트</a></li>
            <li><a href="#">지난 이벤트</a></li>
          </ul>
        </li>
        <li class="menu navbar-left"><a class="menu-left-font" href="#contact">CUSTOMER</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a class="menu menu-right-font" href="/join/memberAgree">회원가입</a></li>
        <li><a class="menu menu-right-font" href="/login/login">로그인</a></li>
        <li><a href = "/mypage/">마이페이지</a></li>

      	<%-- <c:if test=""></c:if> --%>
      	<%-- 로그인
        <li><a class="menu menu-right-icon" href="#"><span class="glyphicon glyphicon-user icon-margin" aria-hidden="true" ></span></a></li>
         --%>
        <li><a class="menu menu-right-icon" href="/order/cart"><span class="glyphicon glyphicon-shopping-cart icon-margin" aria-hidden="true" ></span><span class="basket">0</span></a></li>
      </ul>
    </div>
</div>