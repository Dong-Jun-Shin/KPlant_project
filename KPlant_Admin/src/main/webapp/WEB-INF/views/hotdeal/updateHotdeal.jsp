<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/hotdeal/updateHotdeal.css" />
<link rel="stylesheet" type="text/css" href="/admin/resources/include/css/hotdeal/searchModal.css" />

<script type="text/javascript" src="/admin/resources/include/js/hotdeal/hotdeal.js"></script>

<h2 class="sub-header">핫딜 수정</h2>
<div id="update-hotdeal">
	<div class="product-info">
		<div class="body-title">상품 정보 수정</div>
		<table>
			<colgroup>
				<col width="13%">
				<col width="87%">
			</colgroup>
			<tr>
				<td>상품번호<span class="write-point">*</span></td>
				<td>
					<input type="text" class="form-control write-control prd-search"
					value="hotdealVO-prd_num"/>
					<button type="button" class="btn btn-style">상품 검색</button>
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" class="form-control write-control"
					value="hotdealVO-prd_name"/></td>
			</tr>
			<tr>
				<td>상품 단가<span class="write-point">*</span></td>
				<td><input type="text" class="form-control write-control"
					value="hotdealVO-prd_price" /></td>
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
				<td>
					<input type="text" class="form-control write-control"
					value="hotdealVO-deal_discount" maxlength="3"/></td>
			</tr>
			<tr>
				<td>종료일<span class="write-point">*</span></td>
				<td><input type="date" class="form-control write-control" value="hotdealVO-deal_enddate"/></td>
			</tr>
		</table>
	</div>
</div>
<div class="hotdeal-footer">
	<button type="button" class="btn btn-style">핫딜 수정</button>
</div>