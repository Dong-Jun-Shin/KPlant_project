`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- html5 : 파일의 인코딩 방식 지정 - 한국어 처리를 위한 euc-kr과 다국어 처리를 위한 utf-8로 설정. -->
		<meta charset="UTF-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
		<title></title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->
      	
		<!-- 모바일 웹 페이지 설정 - 이미지 경로 위치는 각자 변경 -->
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		
		<script type = "text/javascript" src ="/resources/include/js/jquery-3.3.1.min.js"></script>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/product/productDetail.css">
		
		<script type="text/javascript">
			$(function () {
				
				//- 가격 빼기
				$("#subtract").click(function() {
					var su = $("#su").val();
					var subtractSu = Number(su)-1;

					if(subtractSu > = ${})
				})
					
				//+ 가격 더하기
				$("#plus").click(function() {
					var su = $("#su").val();
					var plusSu = Number(su)+Number(1);
					$("#su").val(sum);
				});
				
				//장바구니 버튼
				$("#basket").click(function() {
					location.href="/order/cart";
				})
				
				//구매하기 버튼
				$("#purchasev").click(function() {
					location.href="/order/cart";
				})
				
			});
		</script>
	</head>
	<body>
		<div class="container">
			<form id="p_form" name="p_form" class="form_horizontal form-inline">
				
				<input type="hidden" name="prd_num">
			
				<div id="div">
					<div id="p_div">
						<img id="p_img" name="p_img" src="/KplantUploadStorage/product/${detail.img_prd}">
					</div>
					<div id="p_table">
						<h1>${detail.prd_name}</h1>
						<h3>${detail.prd_price}</h3>
						<hr>
						<div>
							<label>상품 종류: </label>
							<label>${detail.prd_type}</label>
						</div>
						<div>
							<label>재고 수량: </label>
							<label>${detail.prd_qty}</label>
						</div>
						<hr>
						<div id="money-div">
							<div id = "left">
								<label>상품명:</label>
								<label>${detail.prd_name}</label>
							</div>
							
							<div id = "right">
								<label> ${detail.prd_price}</label>
								<div class="row">
									<div>
										<div class="input-group">
										  <span class="input-group-btn">
										     <input class="btn btn-default" type="button" id="subtract" value="-" min="1"></input>
										   </span>
										   <input type="text" id="su" class="form-control" width="50px;"  value="1" min="1">
										     <span class="input-group-btn">
										       <input class="btn btn-default" type="button" id="plus" value="+" min="1"></input>
										     </span>
										 </div><!-- /input-group -->
									</div><!-- /.col-lg-6 -->
								</div>
							</div>
						</div>
						
						<div class="text-right">
							<label>총 상품금액: </label>
							<label>${detail.prd_price}</label>
						</div>
						<hr>
						
						<div>
							<input type="button" id="basket" value="장바구니">
							<input type="button" id="purchasev" value="구매하기">
						</div>
						
					</div>
				</div>
		
		
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
					<li role="presentation" class="active"><a href="#home"
						id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">상세 정보</a></li>
					<li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile"
						aria-expanded="false">상품 문의</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
						
						<img id="detail" src="/resources/images/join/air_0001.png">

					</div>
					<div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">

						<img id="notice" src="/KplantUploadStorage/product/${detail.img_prd}">
						
					</div>
				</div>
			</div>
			
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
					<li role="presentation" class="active"><a href="#seller-table"
						id="seller-tab" role="tab" data-toggle="tab" aria-controls="home"
						aria-expanded="true">판매자 정보</a></li>
					<li role="presentation" class=""><a href="#seller-notice" role="tab" id="seller-tab" data-toggle="tab" aria-controls="profile"
						aria-expanded="false">배송/반품/교환</a></li>
				</ul>

				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade active in" id="seller-table" aria-labelledby="seller-tab">
						
						<table id="seller">
							<tr>
								<th>상호</th>
								<td>킹텐리 농장</td>
								<th>사업자 번호</th>
								<td>128-23-45267</td>
								<th>통신 판매업 번호</th>
								<td>제 2019-고양덕양구-0693 호</td>
							</tr>
							<tr>
								<th>대표자명</th>
								<td>곽예리, 고준영, 고석현, 김소명, 신동준</td>
								<th>연락처/영업소재지</th>
								<td colspan="3">02-441-6006/서울특별시 성동구 왕십리 303 4층</td>
							</tr>
						</table>

					</div>
					<div role="tabpanel" class="tab-pane fade" id="seller-notice" aria-labelledby="seller-tab">

						<img id="notice" src="/resources/images/join/notice.png">
						
					</div>
				</div>
			</div>
			</form>
		</div>
	</body>
</html>