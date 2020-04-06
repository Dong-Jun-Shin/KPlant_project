<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css"
	href="/admin/resources/include/css/hotdeal/createHotdeal.css" />
<link rel="stylesheet" type="text/css"
	href="/admin/resources/include/css/hotdeal/searchModal.css" />

<script type="text/javascript" src="/admin/resources/include/js/hotdeal/hotdeal.js"></script>
<script type="text/javascript">
	$(function(){
		$("#prdSearchFormBtn").click(function(){
			$('#prdSearchModal').modal();
		});
	});
</script>	

<h2 class="sub-header">핫딜 생성</h2>
<div id="create-hotdeal">
	<div class="product-info">
		<div class="body-title">상품 정보 입력</div>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>상품번호<span class="write-point">*</span></td>
				<td><input type="text"
					class="form-control write-control prd-search"
					placeholder="상품을 검색해주세요." readonly="readonly" />
					<button type="button" id="prdSearchFormBtn" class="btn btn-style">상품 검색</button></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" class="form-control write-control"
					placeholder="상품번호를 선택하면 자동으로 부여됩니다." readonly="readonly" /></td>
			</tr>
			<tr>
				<td>상품 단가<span class="write-point">*</span></td>
				<td><input type="text" class="form-control write-control"
					placeholder="상품번호를 선택하면 자동으로 부여됩니다." readonly="readonly" /></td>
			</tr>
		</table>
	</div>
	<div class="hotdeal-info">
		<div class="body-title">핫딜 정보 입력</div>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>할인율<span class="write-point">*</span></td>
				<td><input type="text" class="form-control write-control"
					placeholder="할인율을 입력해주세요." maxlength="3" /></td>
			</tr>
			<tr>
				<td>종료일<span class="write-point">*</span></td>
				<td><input type="date" class="form-control write-control" /></td>
			</tr>
		</table>
	</div>
</div>
<div class="hotdeal-footer">
	<button type="button" class="btn btn-style">핫딜 생성</button>
</div>

<%-- 등록 화면 영역(modal) --%>
<%-- 
				data-backdrop : 배경 클릭 시, 모달 닫힘 off(static)
				data-keyboard : Esc 키가 눌렸을 때, 모달 닫힘 (true)
			--%>
<div class="modal fade" id="prdSearchModal" tabindex="-1" role="dialog"
	aria-labelledby="prdSearchModalLabel" aria-hidden="true"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="prdSearchModalLabel">상품 검색</h4>
			</div>
			<div class="modal-body">
				<div>
					<label>상품명</label>
					<input type="text" class="form-control write-search"
					placeholder="상품명을 입력해주세요."/>
					<button type="button" class="btn btn-style">검색</button>
				</div>
				<div class="table-head">
					<span>상품번호</span>
					<span>상품명</span>
					<span>가격</span>
				</div>
				<div class="prd-list">
					<table>
						<colgroup>
							<col width="20%">
							<col width="60%">
							<col width="20%">
						</colgroup>
						<tbody>
							<c:choose>
								<c:when test="${not empty productList }">
									<c:forEach var="product" items="${productList }" varStatus="status">
										<tr>
											<td>product.prd_num</td>
											<td>product.prd_name</td>
											<td>product.prd_price</td>
										</tr>
										<tr>
											<td>product.prd_num</td>
											<td>product.prd_name</td>
											<td>product.prd_price</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3">
											<div class="no-list">
												<img alt="noList" src="/admin/resources/images/hotdeal/bg_nodata.png"/>
												<label>검색된 상품이 없습니다.</label>
											</div>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-style" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>