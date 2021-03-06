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
<!-- event CSS -->
<link rel="stylesheet" type="text/css" href="/resources/include/css/event/eventMain.css">
	
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
			/*이벤트 단락 클릭시 상세 페이지로 이동하기 위한 처리 이벤트*/
			$(".goDetail").click(function () {
				var evnt_num=$(this).attr("data-num");
				$("#evnt_num").val(evnt_num);
				$("#detailForm").attr({
					"method" : "get",
					"action" : "/event/eventDetail"
				});
				$("#detailForm").submit();
				
			});
		});//상위 $ 함수 끝
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
<%--     	<c:forEach> --%>
<%--     		<c:when test=""> --%>
    			
<%--     		</c:when> --%>
<%--     	</c:forEach> --%>
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
                    <h3 class="title"><a href="#">미니다육B-C세트</a></h3>
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
        	
        	<%-- 이벤트 홈으로 넘어갈수 있도록 처리하기 --%>
        	<form id="detailForm">
				<input type="hidden" id="evnt_num" name="evnt_num"/>
			</form>
			
            <div class="row">
            	<!--<c:choose>
            		<c:when test="${not empty mainEventList}">
            			<c:forEach var="event" items="${mainEventList}">
			                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			                    <div class="shop-cat-box">
			                    	<div class="caption">
				                        <img src="/KplantUploadStorage/event/thumbnail/${event.evnt_thumb}" style="width: 100%;">
				                        <a class="btn hvr-hover" href="#">${event.evnt_title}</a>
			                        </div>
			                    </div>
			                </div>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			                    <div class="shop-cat-box">
			                    	<div class="caption">
				                        <img src="/resources/images/event/eventDefault.jpg" >
				                        <a class="btn hvr-hover" href="#">조회된 이벤트가 존재하지 않습니다.</a>
			                        </div>
			                    </div>
			                </div>
	                </c:otherwise>
                </c:choose>-->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/main/plan/관엽식물.jpg" alt="" style="height: 200px;"/>
                        <a class="btn hvr-hover" href="/product/productList">관엽/공기정화/분채</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/main/plan/다육식물.jpg" alt="" style="height: 200px;"/>
                        <a class="btn hvr-hover" href="/product/productList2">다육식물</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/main/plan/꽃다발1.jpg" alt="" style="height: 200px;"/>
                        <a class="btn hvr-hover" href="/product/productList5">꽃다발</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="/resources/images/main/plan/동서양란.jpg" alt="" style="height: 200px;"/>
                        <a class="btn hvr-hover" href="/product/productList3">동서양란</a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- End Categories -->
</section>

<%--
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
			<div class="row">
				<h2 class="text-center"> KTENRI EVENT</h2>
				<c:choose>
					<c:when test="${not empty mainEventList}">
            			<c:forEach var="event" items="${mainEventList}">
							<div class="col-lg-4 col-sm-12">
								<div class="thumbnail goDetail" data-num="${event.evnt_num}">
									<img class="img-fluid home-eventImg" src="/KplantUploadStorage/event/thumbnail/${event.evnt_thumb}" style="width: auto; height: 200px;"/>
									<div class="caption">
								        <h3>${event.evnt_title}</h3>
										<p>${event.evnt_startDate}부터  - ${event.evnt_endDate}까지</p>
										<p>${event.evnt_rgstDate}</p>
								    </div>
								</div>
							</div>
            			</c:forEach>
            		</c:when>
            		<c:otherwise>
            			<div class="col-lg-4 col-sm-12">
								<div class="thumbnail goDetail" data-num="${event.evnt_num}">
									<img class="img-fluid home-eventImg" src="/KplantUploadStorage/event/thumbnail/${event.evnt_thumb}" style="width: auto; height: 200px;"/>
									<div class="caption">
								        <h3>${event.evnt_title}</h3>
										<p>${event.evnt_startDate}부터  - ${event.evnt_endDate}까지</p>
										<p>${event.evnt_rgstDate}</p>
								    </div>
								</div>
							</div>
            		</c:otherwise>
				</c:choose>
<!-- 				<div class="col-lg-6 col-sm-12"> -->
<!-- 					<div class="offer-box-products"> -->
<!-- 						<img class="img-fluid home-eventImg" src="/resources/images/event/eventDefault.jpg"/> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-6 col-sm-12"> -->
<!-- 					<div class="offer-box-products"> -->
<!-- 						<img class="img-fluid home-eventImg" src="/resources/images/event/eventDefault.jpg"/> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
 --%>
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
            
            <%-- 상세페이지로 이동하기 위한 hidden form --%>
<!-- 		   <form id="detailForm"> -->
<%-- 		      <input type="hidden" id="prd_num" name="prd_num" value="${detail.prd_num}"/> --%>
<!-- 		   </form> -->
		   
            <%--<c:choose>
            	<c:when test="${not empty productList}">
            		<c:forEach var="product" items="${productList}">
            			<div class="col-sm-6 col-md-4 special-grid best-seller">
            				<div class="products-single fix">
            					<div class="box-img-hover">
            						<div class="type-lb">
		                                <p class="sale">Sale</p>
		                            </div>
									<a href = "/product/productDetail?prd_num=${product.prd_num}"><img src="/KplantUploadStorage/product/${product.img_prd}"
										style="width: 600px; height: 300px;"></a>
            					</div>
								<div class="thumbnail" data-num="${product.prd_num}">
									<div class="why-text">
										<h3>${product.prd_name}</h3>
										<p>${product.prd_price}원</p>
									</div>
								</div>
							</div>
						</div>
            		</c:forEach>
            	</c:when>
            </c:choose>  --%>
            
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
                <div class="col-lg-3 col-md-6 special-grid best-seller">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="/resources/images/event/eventDefault.jpg" class="img-fluid" alt="Image" style="width: 100%">
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $7.79</h5>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 special-grid top-featured">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="new">New</p>
                            </div>
                            <img src="/resources/images/event/eventDefault.jpg" class="img-fluid" alt="Image" style="width: 100%">
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $9.79</h5>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 special-grid top-featured">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="/resources/images/event/eventDefault.jpg" class="img-fluid" alt="Image" style="width: 100%">
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $10.79</h5>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 special-grid best-seller">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="/resources/images/event/eventDefault.jpg" class="img-fluid" alt="Image" style="width: 100%">
<!--                             <div class="mask-icon"> -->
<!--                                 <ul> -->
<!--                                     <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li> -->
<!--                                     <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li> -->
<!--                                     <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li> -->
<!--                                 </ul> -->
<!--                                 <a class="cart" href="#">Add to Cart</a> -->
<!--                             </div> -->
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $15.79</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Products  -->
</section>

<%-- 위로 올라가기 --%>
<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	
