<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
	<link rel="shortcut icon" href="/resources/images/template/icon.png" />
	<link rel="apple-touch-icon" href="/resources/images/template/icon.png" />

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/css/template/navbar-static-top.css" />
	<link rel="stylesheet" type="text/css" href="/resources/include/css/customer.css" />
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>
    <nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0px;">
    	<tiles:insertAttribute name="header" />
    </nav>
	
	
    <div class="section container">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<tiles:insertAttribute name="left"/>
		</nav>
    	<tiles:insertAttribute name="body" />
    </div>

    <footer>
    	<tiles:insertAttribute name="footer" />
    </footer>
  </body>
</html>