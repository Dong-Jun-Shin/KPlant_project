<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type = "text/css">
	.caption{
		border-top: 1px solid lightgray;
		    margin-top: 20px;
	}
</style>

<script type="text/javascript">
	
</script>



<%-- 화면구성 --%>
<div>
   <div class="page-header product-title">
      <h1>FLOWER</h1>
      <p >판매중인 제품 입니디.</p>
 </div>
 
 <div class="product-banner">
      <div class="banner-style">
         <h1>다육/선인장</h1>
      </div>
   </div>
   <%-- 상세페이지로 이동하기 위한 hidden form --%>
   <form id="detailForm">
      <input type="hidden" id="prd_num" name="prd_num"/>
   </form>

	<%-- product 썸네일 출력 --%>
	<c:choose>
		<c:when test="${not empty productList}">
			<c:forEach var="product" items="${productList}">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail goDetail" data-num="${product.prd_num}">
						<a href = "/product/productDetail?prd_num=${product.prd_num}"><img src="/KplantUploadStorage/product/${product.img_prd}"
							style="width: 600px; height: 300px;"></a>
						<div class="caption">
							<h3>${product.prd_name}</h3>
							<p>${product.prd_price}원</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
</div> 