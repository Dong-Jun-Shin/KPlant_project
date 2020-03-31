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
	<link rel="shortcut icon" href="/admin/resources/images/template/icon.png" />
	<link rel="apple-touch-icon" href="/admin/resources/images/template/icon.png" />

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="/admin/resources/include/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/admin/resources/include/dist/css/bootstrap-theme.css" />
	<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/template/admin-header-footer-nav.css" />
	
	<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/faq/header.css" />
	
	<script type="text/javascript" src="/admin/resources/include/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/admin/resources/include/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/admin/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript" src="/admin/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="/admin/resources/include/dist/assets/js/docs.min.js"></script>
  </head>

  <body>
    <nav class="navbar navbar-default navbar-fixed-top">
    	<tiles:insertAttribute name="header" />
    </nav>
		
   	<!-- 내용 시작 -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
         <tiles:insertAttribute name="body" />
    </div>
  </body>
  
</html>
