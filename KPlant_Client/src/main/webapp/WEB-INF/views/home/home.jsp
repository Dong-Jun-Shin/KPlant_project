<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="/resources/include/css/template/mainLayoutCss.css" />
<!-- Site CSS // 위에 슬라이드바 문제 생김-->
<link rel="stylesheet" type="text/css" href="/resources/include/css/main/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/main/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/main/custom.css">
<!-- Slide CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/main/mainHome.css">

	<!-- ALL JS FILES -->
    <script type="text/javascript" src="/resources/include/js/popper.min.js"></script>
    <!-- ALL PLUGINS -->
    <script type="text/javascript" src="/resources/include/js/jquery.superslides.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/bootstrap-select.js"></script>
    <script type="text/javascript" src="/resources/include/js/inewsticker.js"></script>
    <script type="text/javascript" src="/resources/include/js/bootsnav.js"></script>
    <script type="text/javascript" src="/resources/include/js/images-loded.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/isotope.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/baguetteBox.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/form-validator.min.js"></script>
    <script type="text/javascript" src="/resources/include/js/contact-form-script.js"></script>
    <script type="text/javascript" src="/resources/include/js/custom.js"></script>
<%-- script --%>
	<script type="text/javascript">
		$(function () {
			$("#goEventDetail").click(function () {
				
			});
		});
	</script>
<%-- script end --%>

<section class="eventSlide">
	<div class="eventSlide">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="/resources/images/main/slider/1.jpg" alt="...">
		      <div class="carousel-caption">
			    <h1>서울 식물원과 함께하는 초대권 이벤트</h1>
			    <p>...</p>
			  </div>
		    </div>
		    <div class="item">
		      <img src="/resources/images/main/slider/2.jpg" alt="...">
		      <div class="carousel-caption">
			    <h1>KINGTENRI와 여름을 준비해보세요</h1>
			    <p>...</p>
			  </div>
		    </div>
		    <div class="item">
		      <img src="/resources/images/main/slider/3.jpg" alt="...">
		      <div class="carousel-caption">
			    <h1>편안함을 주는 내곁의 식물</h1>
			    <p></p>
			  </div>
		    </div>
		  </div>
		  
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		  
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		  
		</div>
	</div>
</section>

<%-- 제품보여주는 페이지 --%>
<section>
	<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="title-all text-center">
                <h1>인기 상품</h1>
                <p>어떤 것들을 골라야 좋을지 고민이라면, 이런것들은 어때요? 인기상품만 모아봤어요</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid5">
                <div class="product-image5">
                    <a href="#">
                        <img class="pic-1" src="/resources/images/main/mainProduct/main1.jpg">
                        <img class="pic-2" src="/resources/images/main/mainProduct/main2.jpg">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">미니다육A-B세트</a></h3>
                    <div class="price">3000원 - 2500원</div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-grid5">
                <div class="product-image5">
                    <a href="#">
                        <img class="pic-1" src="/resources/images/main/mainProduct/main3.jpg">
                        <img class="pic-2" src="/resources/images/main/mainProduct/main4.jpg">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="">미니다육B-C세트</a></h3>
                    <div class="price">$10.00 - $12.00</div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-grid5">
                <div class="product-image5">
                    <a href="#">
                        <img class="pic-1" src="/resources/images/main/mainProduct/main5.jpg">
                        <img class="pic-2" src="/resources/images/main/mainProduct/main6.jpg">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">제품명/식물명</a></h3>
                    <div class="price">$11.00 - $15.00</div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="product-grid5">
                <div class="product-image5">
                    <a href="#">
                        <img class="pic-1" src="/resources/images/main/mainProduct/main7.jpg">
                        <img class="pic-2" src="/resources/images/main/mainProduct/main9.jpg">
                    </a>
<!--                     <ul class="social"> -->
<!--                         <li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li> -->
<!--                         <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li> -->
<!--                         <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li> -->
<!--                     </ul> -->
<!--                     <a href="#" class="select-options"><i class="fa fa-arrow-right"></i> Select Options</a> -->
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">제품명 /식물명</a></h3>
                    <div class="price">10000원 - 15000원</div>
                </div>
            </div>
        </div>
    </div>
</div>
<hr>
</section>

<section>
	<!-- Start Categories  -->
    <div class="categories-shop">
        <div class="container">
        	<div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>기획전</h1>
                        <p>찾으시는 항목에 접속하세요</p>
                    </div>
                </div>
            </div>
        	
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/event/eventDefault.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">관엽/공기정화/분채</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/event/eventDefault.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">식물 분류 출력</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/event/eventDefault.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">식물 분류 출력</a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Categories -->
</section>

<section>
	<div class="box-add-products">
		<div class="intobox">
			<div class="row">
				<div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>진행중인 이벤트</h1>
                    </div>
                </div>
			</div>
			
			<%-- 이벤트 홈으로 넘어갈수 있도록 처리하기 --%>
        	<form id="eventDetailForm">
				<input type="hidden" id="evnt_num" name="evnt_num"/>
			</form>
			<%-- 이벤트 단 --%>
			<div class="row">
				<h2 class="text-center"> KTENRI EVENT</h2>
				<c:choose>
					<c:when test="${not empty MainEventList}">
	           			<c:forEach var="event" items="${MainEventList}">
							<div class="col-lg-4 col-sm-12">
								<div class="offer-box-products goEventDetail">
									<div>
										<a id="evnt_title" href="/event/eventDetail?evnt_num=${event.evnt_num}"><img class="img-fluid home-eventImg" src="/KplantUploadStorage/event/thumbnail/${event.evnt_thumb}" id="evnt_thumb" name="evnt_thumb"/></a>
									</div>
									<div>
										<p>${event.evnt_title}</p>
						                <p>${event.evnt_startDate}부터  - ${event.evnt_endDate}까지</p>
						            </div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="col-lg-12">
							<div class="offer-box-products">
								<img src="/resources/images/event/eventDefault.jpg"/>
								<p>${event.evnt_startDate}부터  - ${event.evnt_endDate}까지</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

    <!-- Start Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>인기 판매 상품</h1>
                        <p>#bestItem #봄맞이 #우리집에도 봄이</p>
                        <p>식물과 함께하는 일상을 즐기는 핀란드의 문화를 한국에 전파하는 것이 우리의 목표 입니다.</p>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".top-featured">Top featured</button>
                            <button data-filter=".best-seller">Best seller</button>
                        </div>
                    </div>
                </div>
            </div>
			
			<div class="row special-list">
				<c:choose>
					<c:when test="${not empty MainProductList}">
						<c:forEach var="product" items="${MainProductList}">
			                <div class="col-lg-3 col-md-6 special-grid best-seller">
			                    <div class="products-single fix">
			                        <div class="box-img-hover">
			                            <div class="type-lb">
			                                <p class="sale">Sale</p>
			                            </div>
			                            <div class="thumbnail goDetail" data-num="${product.prd_num}">
				                            <a href="/product/productDetail?prd_num=${product.prd_num}">
				                            	<img src="/KplantUploadStorage/product/${product.img_prd}" class="img-fluid" alt="Image" style="width: 100%; height: 280px;">
				                            </a>
			                            </div>
			                        </div>
			                        <div class="why-text">
			                            <h4>${product.prd_name}</h4>
			                            <h5> ${product.prd_price} 원</h5>
			                        </div>
			                    </div>
			                </div>
						</c:forEach>
					</c:when>
					<c:when test="${not empty MainProductList1}">
						<c:forEach var="product1" items="${MainProductList1}">
							<div class="col-lg-3 col-md-6 special-grid top-featured">
			                    <div class="products-single fix">
			                        <div class="box-img-hover">
			                            <div class="type-lb">
			                                <p class="sale">Sale</p>
			                            </div>
			                            <div class="thumbnail goDetail" data-num="${product1.prd_num}">
				                            <a href="/product/productDetail?prd_num=${product1.prd_num}">
				                            	<img src="/KplantUploadStorage/product/${product1.img_prd}" class="img-fluid" alt="Image" style="width: 100%; height: 280px;">
				                            </a>
			                            </div>
			                        </div>
			                        <div class="why-text">
			                            <h4>${product1.prd_name}</h4>
			                            <h5> ${product1.prd_price} 원</h5>
			                        </div>
			                    </div>
			                </div>
						</c:forEach>
					</c:when>
					
					<c:otherwise>
						<div class="col-lg-3 col-md-6 special-grid">
		                    <div class="products-single fix">
		                        <div class="box-img-hover">
		                            <div class="type-lb">
		                                <p class="sale">Sale</p>
		                            </div>
		                            <img src="/resources/images/event/eventDefault.jpg" class="img-fluid" alt="Image" style="width: 100%">
		                        </div>
		                        <div class="why-text">
		                            <h4>등록된 제품이 없습니다.</h4>
		                            <h5>최대한빠른 시일내 등록하도록 하겠습니다.</h5>
		                        </div>
		                    </div>
		                </div>
					</c:otherwise>
				</c:choose>
			</div>
        </div>
    </div>
    <!-- End Products  -->
</section>

<%-- 위로 올라가기 --%>
<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	
