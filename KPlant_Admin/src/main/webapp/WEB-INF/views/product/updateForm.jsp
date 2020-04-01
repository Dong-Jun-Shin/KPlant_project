<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title>글수정 화면</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->		
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" /> -->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
						
				/* 첨부파일추가 버튼 클릭 시 처리 이벤트 */
				$("#addFile").click(function(){ 
					var fileIndex = $('.existing_file').length; 
					var index = $('.add_file').length; 
					console.log("fileIndex" + fileIndex);
					var addData = '<div class="row">' ;
					addData += '	<div class="col-md-11">' ;
					addData += 	'   	<input type="file" name="images['+ fileIndex +'].files['+ index +']" class="margin_top btn-block file add_file" /></div>';
					addData += '	<div class="col-md-1">' ;
					addData += '		<span class="closeBtn">&times;</span></div></div>'
					
					$('.table tr:nth-child(7) td:eq(0)').attr("rowspan",index+1)
					$('.table tr:nth-child(7) td:eq(1)').append(addData);
				});
				
				$(document).on("click", ".closeBtn", function(){
					var fileIndex = $('.existing_file').length; 
					var index = 0;
					$('.table tr:nth-child(7) td:eq(0)').attr("rowspan",1);
					$(this).parents("div.row").remove();
					$("div.row .col-md-11 input[type='file']").each(function(index){
						console.log(fileIndex + " / " + index);
						$(this).attr("name", "images["+ fileIndex +"].files["+ index++ +"]" );
					})
				});	
				
				
				/* 수정 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardUpdateBtn").click(function(){
					//입력값 체크
					if (!chkSubmit($('#m_title'),"제목을"))	 return;
					else if (!chkSubmit($('#m_content'),"작성할 내용을"))	return;
					else{
						// 첨부파일 체크
						$('.file').each(function(index){
							console.log("index : " + index);
							if($(this).val()!=""){
								if(!chkFile($(this))) {return false;}
								if(!$(this).hasClass("add_file")){
									if(!$(this).next().next().is(":checked")){
										alert("수정할 대상인 이미지 파일을 선택하지 않으셨습니다.");
										return false;
									}
								}
							}
						});
						
						$("div.row .col-md-11 input[type='file']").each(function(){
							if($(this).val()==""){
								$(this).parents("div.row").remove();
							}
						})
						
						$("div.row .col-md-11 input[type='file']").each(function(index){
							var fileIndex = $(".existing_file").length; 
							if($(this).val()!=""){
								$(this).attr("name", "images["+ fileIndex +"].files["+ index++ +"]");
							}
						})
						
						$("#f_updateForm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/product/productUpdate"
						});
						
						$("#f_updateForm").submit();
					}
				});
				
				$(".clearBtn").click(function(){
					$(this).prev().val("");
					$(this).next().prop("checked", false);
				});	
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});				
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardListBtn").click(function(){
				//var queryString = "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
					location.href="/admin/product/productList"; //+queryString;
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="m_num" name="m_num" value="${updateData.m_num}" />
					<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${data.amount}">
					
					<table class="table table-bordered">
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tbody>
							<tr>
								<td>글번호</td> 
								<td class="text-left">${updateData.m_num}</td>
								<td>작성일</td> 
								<td class="text-left">${updateData.m_date}</td> 
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="text-left">${updateData.m_name}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="m_title" id="m_title" value="${updateData.m_title}" class="form-control" />
								</td>
							</tr>
							<tr class="table-height">
								<td>내용</td>
								<td colspan="3" class="text-left">
									<textarea name="m_content" id="m_content" class="form-control" rows="8">${updateData.m_content}</textarea>
								</td>
							</tr>
							<tr class="form-inline">
								<td>비밀번호</td>
								<td colspan="3" class="text-left">
									<input type="password" name="m_pwd" id="m_pwd" class="form-control" maxlength="18"/>
									<label>수정할 비밀번호를 입력해 주세요.</label>
								</td>
							</tr>
							<c:if test="${not empty updateData.images}">
								<tr>
									<td class="text-center">첨부파일 이미지</td>
									<td colspan="3" id="multipleImage" class="text-left">
										<c:forEach var="image" items="${updateData.images}" varStatus="status">
											<input type="hidden" name="images[${status.index}].m_num" value="${updateData.m_num}" />
											<input type="file" name="images[${status.index}].files[0]" class="file existing_file">
											<span class="clearBtn" title="checkbox와 file 값 초기화">&times;</span>
											<input type="checkbox" name="images[${status.index}].i_num" class="choice" value="${image.i_num}" />
											<img src="/uploadStorage/multiple/${image.i_file}" />
											<input type="hidden" name="images[${status.index}].i_file" value="${image.i_file}" />
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<tr>
								<td><button type="button" id="addFile" class="btn btn-default btn-block">첨부파일추가</button></td>
								<td colspan="3" class="text-left"></td>
							</tr> 	
						</tbody>	
					</table>
				</form>
			</div>	
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="multipleBoardUpdateBtn" class="btn btn-primary" />
				<input type="button" value="취소" id="multipleBoardCancelBtn" class="btn btn-primary" />				
				<input type="button" value="목록" id="multipleBoardListBtn" class="btn btn-primary" />
			</div>
		</div>
	</body>
</html>
