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

		<title>글쓰기 화면</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/board.css" /> -->
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
					var fileIndex = $('input[type="file"]').length; 
					
					var addData = '<div class="row">' ;
					addData += '	<div class="col-md-11">' ;
					addData += 	'   	<input type="file" name="images[0].files['+ fileIndex +']" class="margin_top btn-block" /></div>';
					addData += '	<div class="col-md-1">' ;
					addData += '		<span class="closeBtn">&times;</span></div></div>'

					$('.table tr:nth-child(5) td:eq(0)').attr("rowspan",fileIndex+1)
					$('.table tr:nth-child(5) td:eq(1)').append(addData);
				});
				
				$(document).on("click", ".closeBtn", function(){
					var fileIndex = $('input[type="file"]').length; 
					$('.table tr:nth-child(5) td:eq(0)').attr("rowspan",1);
					$(this).parents("div.row").remove();
					$("div.row .col-md-11 input[type='file']").each(function(index){
						console.log(fileIndex + " / " + index);
						$(this).attr("name", "images[0].files["+ index +"]");
					})
				});	
				
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardInsertBtn").click(function(){
					//입력값 체크
					if (!chkData('#prd_num',"상품번호를"))	return;
					else if (!chkData('#prd_name',"상품명을"))	return;
					else if (!chkData('#prd_price',"상품 단가를"))	return;
					/* else if (!chkSubmit($('#file'),"첨부파일을"))	return;
					else if (!chkFile($('#file'))) return; */
					else if (!chkData('#prd_qty',"재고 수량을"))	return;
					else {
						$('.file').each(function(){
							if($(this).val()!=""){
								if(!chkFile($(this))) return;
							} 
						});
						
						$("div.row .col-md-11 input[type='file']").each(function(){
							if($(this).val()==""){
								$(this).parents("div.row").remove();
							}
						});
						
						$("div.row .col-md-11 input[type='file']").each(function(index){
							var fileIndex = $(".existing_file").length; 
							if($(this).val()!=""){
								$(this).attr("name", "images["+ fileIndex +"].files["+ index++ +"]");
							}
						});
						
						$("#f_writeForm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/admin/product/productInsert"
						});
						$("#f_writeForm").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardCancelBtn").click(function(){
					$("#f_writeForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#multipleBoardListBtn").click(function(){
					location.href="/admin/product/productList";
				});
				
			
			});
		</script>
	</head>
	<body>	
		<div class="contentContainer container">
			<div class="contentTit page-header"><h3 class="text-center">상품 등록 화면</h3></div> 
	
			<div class="contentTB text-center">
				<form id="f_writeForm" name="f_writeForm">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tr>
							<td>상품번호</td>
							<td class="text-left"><input type="text" name="prd_num" id="prd_num" class="form-control" /></td>
						</tr>
						<tr>
							<td>상품명</td>
							<td class="text-left"><input type="text" name="prd_name" id="prd_name" class="form-control" /></td>
						</tr>
						<tr>
							<td>상품단가</td>
							<td class="text-left"><input type ="number" name="prd_price" id="prd_price" class="form-control" /></td>
						</tr>
						<tr>
							<td>상품종류</td>
							<td class="text-left">
								<select id = "typeSelect"  name="prd_type">
									<option value = "관엽/공기정화/분채">관엽/공기정화/분채</option>
									<option value = "다육/선인장">다육/선인장</option>
									<option value = "동양란/서양란">동양란/서양란</option>
									<option value = "꽃바구니/꽃상장">꽃바구니/꽃상장</option>
									<option value = "꽃다발">꽃다발</option>
								</select>
							</td>
							
						</tr>
						<tr>
							<td>재고수량</td>
							<td class="text-left"><input type="number" name="prd_qty" id="prd_qty" class="form-control" /></td>
						</tr>
						<tr>
							<td><button type="button" id="addFile" class="btn btn-default btn-block">첨부파일추가</button></td>
							<td class="text-left"></td>
						</tr>		
					</table>
				</form>
			</div>
				
			<div class="text-right">
				<input type="button" value="저장" id="multipleBoardInsertBtn" class="btn btn-primary">
				<input type="button" value="취소" id="multipleBoardCancelBtn" class="btn btn-primary">
				<input type="button" value="목록" id="multipleBoardListBtn" class="btn btn-primary">
			</div>
		</div>
	</body>
</html>