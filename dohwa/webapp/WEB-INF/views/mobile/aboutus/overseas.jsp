<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- 지도-->
<!-- 영상-->
<!-- paging-->
<!-- location-->
<!DOCTYPE html>
<!--[if IE 7]><html lang="<%=response.getLocale().getLanguage()%>" class="ie7"><![endif]-->
<!--[if IE 8]><html lang="<%=response.getLocale().getLanguage()%>" class="ie8"><![endif]-->
<!--[if IE 9]><html lang="<%=response.getLocale().getLanguage()%>" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="<%=response.getLocale().getLanguage()%>">
	<!--<![endif]-->
	<head>
		<%@ include file="/WEB-INF/views/mobile/layout/head.jsp" %>
	</head>
	<body>
		<!--[if lte IE 8]>
			<p class="browserupgrade">
				You are using an
				<strong>outdated</strong>
				browser. Please
				<a href="https://browsehappy.com/">upgrade your browser</a>
				to improve your experience and security.
			</p>
		<![endif]-->
		<div class="intro" id="wrap">
			<%@ include file="/WEB-INF/views/mobile/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual intro06 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.001" text="COMPANY INFO" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.ABOUTUS" text="회사소개" /></h2>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
							<div class="grid-ico-wrap" aria-hidden="true">
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
								<div class="grid-ico" aria-hidden="true"></div>
							</div>
							<div class="grid-line-wrap">
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
							</div>
						</div>
					</div>
					<div class="page-tab-section">
						<div class="tab-menu-type01 center swiper-container">
							<%@ include file="/WEB-INF/views/mobile/layout/overview_tab_list.jsp" %>
						</div>
					</div>
					<div class="contents no-btm-type">
						<div class="section-cont">
							<div class="tab-menu-type02">
								<ul class="tab-list">
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/contactus" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.009" text="연락처 &middot; 본사위치" /></span></a>
									</li>
									<li class="active">
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/overseas" />"><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.010" text="해외지사" /></span></a>
									</li>
									<li>
										<a class="item" href="<c:url value="${mobileStartPath}aboutus/custInqr"/> "><span class="txt" data-id=""><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.001.011" text="문의사항" /></span></a>
									</li>
								</ul>
							</div>
							<div class="inner-tab-cont active">
								<div class="location-wrap">
									<div class="location-map" id="map">
									</div>
								</div>
								<div class="overseas-wrap">
									<h3 class="title-sect">
										<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.008" text="Global Network of
										<br />
										Regional offices" />
									</h3>
									<div class="branch-box-wrap">
										<div class="branch-box" data-lat="20.8295618" data-lng="105.3407925">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.009" text="베트남" /></em>
												<i class="ico-country-vnm" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.010" text="R185, 호아빈 국제 타워, 106 Hoang Quoc Viet ST.,
													<br />
													Cau Giay Dist. 베트남 하노이"/>
												</p>
												<p class="txt-tel">844-3755-7164 ~ 5</p>
											</div>
										</div>
										<div class="branch-box" data-lat="14.5616386" data-lng="121.0142255">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.047" text="필리핀" /></em>
												<i class="ico-country-phl" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.048" text="필리핀, Unit 2204 Philippine AXA Life Center, Sen. Gil Puyat Ave., Brgy. San Antonio, Tindalo St., Makati City 1203" /></p>
												<p class="txt-tel">+632-83625317 / +632-79335904</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-6.2236107" data-lng="106.804828">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.014" text="인도네시아" /></em>
												<i class="ico-country-idn" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.015" text="JI 플라자 플라자 9 층 Jendral Sudirman, Kav.59,
													<br />
													자카르타 12190, 인도네시아"/>
												</p>
												<p class="txt-tel">62-21-5140-0996,7</p>
											</div>
										</div>
										<div class="branch-box" data-lat="41.6889163" data-lng="44.7698291">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.016" text="조지아" /></em>
												<i class="ico-country-geo" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.017" text="Besiki Business Centre, Room 211, 2층,
													<br />
													4 Besiki Street, Tbilisi, Georgia"/>
												</p>
												<p class="txt-tel">995-322-609551</p>
											</div>
										</div>
										<div class="branch-box" data-lat="33.707763" data-lng="73.047834">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.018" text="파키스탄" /></em>
												<i class="ico-country-pak" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.019" text="No.706-A, Tower-A, Centaurus Mall,
													<br />
													1 jinnah Avenue, F-8, Pakistan"/>
												</p>
												<p class="txt-tel">92-307-589-4545</p>
											</div>
										</div>
										<div class="branch-box" data-lat="33.4543195" data-lng="73.8606763">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.020" text="파키스탄" /></em>
												<i class="ico-country-pak" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.021" text="120MW Gulpur 수력 발전소 사무실,
													<br />
													Barali, Kotli, AJ &amp; K, 파키스탄"/>
												</p>
												<p class="txt-tel">92-058-2640-0041</p>
											</div>
										</div>
										<div class="branch-box" data-lat="36.7407444" data-lng="3.0453775">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.022" text="알제리" /></em>
												<i class="ico-country-dza" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.023" text="Billa N 5, la Cite ENA Djenane El Malik, Hydra, Alger, 알제리" /></p>
												<p class="txt-tel">213-21-60-6133</p>
											</div>
										</div>
										<div class="branch-box" data-lat="42.8769795" data-lng="74.5218214">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.024" text="키르기스스탄" /></em>
												<i class="ico-country-kgz" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.025" text="Room 401, Manas 40, Bishkek, Kyrgyz Republic 720001" /></p>
												<p class="txt-tel">996- (312) 311-833</p>
											</div>
										</div>
										<div class="branch-box" data-lat="4.6449161" data-lng="-74.0633935">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.026" text="콜롬비아" /></em>
												<i class="ico-country-col" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.027" text="Transversal 19A # 98-12 Oficina 403, Barrio Chico, Bogotá, Colombia
													<br />
													보고타, 콜롬비아"/>
												</p>
												<p class="txt-tel">57-601-6413523</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-17.8026212" data-lng="-63.2201125">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.028" text="볼리비아" /></em>
												<i class="ico-country-bol" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.029" text="Av. Hilanderia Nro. S / N Barrio Hilanderia
													<br />
													UV 111 MZA 021, 산타 크루즈, 볼리비아"/>
												</p>
												<p class="txt-tel">591-6777-9167</p>
											</div>
										</div>
										<div class="branch-box" data-lat="41.8121003" data-lng="-87.9674989">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.030" text="미국" /></em>
												<i class="ico-country-usa" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.031" text="일리노이 주 쿡 카운티" /></p>
												<p class="txt-tel">-</p>
											</div>
										</div>
										<div class="branch-box" data-lat="23.5982312" data-lng="58.5371176">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.032" text="오만" /></em>
												<i class="ico-country-omn" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.033" text="PO Box : 1657
													<br />
													우편 번호 : 112 Ruwi Sultanate of Oman"/>
												</p>
												<p class="txt-tel">968-24560152, 968-91382060</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-12.0903613" data-lng="-77.0148681">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.034" text="페루" /></em>
												<i class="ico-country-per" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.035" text="Av. Rivera Navarrete 395, oficina 2104, Urb. Jardín, San Isidro, Lima, Perú"/>
												</p>
												<p class="txt-tel">51-943-550-779</p>
											</div>
										</div>
										<div class="branch-box" data-lat="23.7807777" data-lng="90.3492858">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.036" text="방글라데시" /></em>
												<i class="ico-country-bgd" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.037" text="House-336 / A, n / a 23, Gulshan, Dhaka-1206" /></p>
												<p class="txt-tel">880-019-5499-5543</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-25.9750309" data-lng="32.583577">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.038" text="모잠비크" /></em>
												<i class="ico-country-moz" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.039" text="모잠비크, Maputo Codade DISTRITO URBANO 1 Central. Rua Tomas Nduda,<br />nº 123, 2º andar" /></p>
												<p class="txt-tel">258 8222 99160, 070-7783-4204</p>
											</div>
										</div>
										<div class="branch-box" data-lat="12.588912" data-lng="-86.2811995">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.040" text="니카라과" /></em>
												<i class="ico-country-nic" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.041" text="R185, 호아빈 국제 타워, 106 Hoang Quoc Viet ST., Cau Giay Dist. 베트남 하노이" /></p>
												<p class="txt-tel">844-3755-7164 ~ 5</p>
											</div>
										</div>
										<div class="branch-box" data-lat="34.6865712" data-lng="136.0832546">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.042" text="일본" /></em>
												<i class="ico-country-jpn" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.043" text="일본 미에현 이가시 오타키
													<br />
													1258 518-1154"/>
												</p>
												<p class="txt-tel">81-0595-39-1008</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-1.265912" data-lng="36.8065213">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.044" text="케냐" /></em>
												<i class="ico-country-ken" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.045" text="케냐, 나이로비 4 층 디자인 센터, Mogotio Road와 Westlands 휴대 전화 Tausi Road의 교차로에있는 Muthithi Road" /></p>
												<p class="txt-tel">844-3755-7164 ~ 5</p>
											</div>
										</div>
										<div class="branch-box" data-lat="-6.3424386" data-lng="30.4942969">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.046" text="탄자니아" /></em>
												<i class="ico-country-tza" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.049" text="Ocean drive Residence plot no 418 office no 2A2, Mahando street, Kinondoni, dar es Salaam, Tanzania P.O.box 9838" /></p>
												<p class="txt-tel">255-745-344-547</p>
											</div>
										</div>
										<div class="branch-box" data-lat="43.2609119" data-lng="76.9544649">
											<div class="title-wrap">
												<!--s: 20200904 텍스트 변경, subtit 삭제, 아이콘 클래스 변경-->
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.012" text="카자흐스탄" /></em>
												<!--span.branch-box-subtit 카자흐스탄-->
												<i class="ico-country-kzh" aria-hidden="true"></i>
												<!--e: 20200904 텍스트 변경, subtit 삭제, 아이콘 클래스 변경-->
											</div>
											<div class="branch-box-desc">
												<p class="txt-add">
													<spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.013" text="룸 608, Saihan 투자 비즈니스 센터, 고골 성 (39),
													<br />
													알마티, 카자흐스탄"/>
												</p>
												<p class="txt-tel">7-7272-590152</p>
											</div>
										</div>
										<div class="branch-box" data-lat="13.7084295" data-lng="-89.2146499">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.050" text="엘살바도르" /></em>
												<i class="ico-country-els" aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.051" text="엘살바도르, Colonia Miramonte, Calle Orizaba, Poligono “U”, Casa #2, San Salvador, San Salvador, El Salvador" /></p>
												<p class="txt-tel">-</p>
											</div>
										</div>
										<div class="branch-box" data-lat="50.0497909" data-lng="19.9613782">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.052" text="폴란드" /></em>
												<i class=ico-country-pol aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.053" text="폴란드, Street Zablocie 25/31, Kraków, Poland (30-701)"/></p>
												<p class="txt-tel">48-790-338-569</p>
											</div>
										</div>
										<div class="branch-box" data-lat="28.63013" data-lng="77.38210">
											<div class="title-wrap">
												<em class="branch-box-tit"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.054" text="인도" /></em>
												<i class=ico-country-india aria-hidden="true"></i>
											</div>
											<div class="branch-box-desc">
												<p class="txt-add"><spring:message code="FRONT.COMMON.MENU.ABOUTUS.006.002.055" text="Suit No. 101, First Floor, Plot No. H-74, Sector-63, Gautam Buddha Nagar, Noida, Uttar Pradesh, India 201301"/></p>
												<p class="txt-tel">+91 120 4254652</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btm-full-banner">
						<%@ include file="/WEB-INF/views/mobile/layout/intro_link2.jsp" %>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/mobile/layout/after_script.jsp" %>
		<script type="text/javascript">

		function initMap() {

			var markers = [], infowindows = [];

			function contentString(obj){

				var sb = new StringBuilder();

				sb.append('<div class="tooltip-cont">');
				sb.append('	<em class="tooltip-tit">{0}</em>', $(obj).find('.branch-box-tit').text());
				sb.append('	<div class="tooltip-txt">');
				sb.append('		<p>{0}</p>', $.trim($(obj).find('.txt-add').text()));
				sb.append('		<p>Tel. {0}</p>', $.trim($(obj).find('.txt-tel').text()));
				sb.append('	</div>');
				sb.append('</div>');

				return sb.toString();
			};

			var mapOptions = {
				zoom: 2,
				center: new google.maps.LatLng(19.2899233, 150.6138514),
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById('map'), mapOptions);

			$('.branch-box').each(function(idx, box) {

				markers.push(new google.maps.Marker({
					position: new google.maps.LatLng($(this).data('lat'), $(this).data('lng')),
					map: map,
					title: $(this).find('.branch-box-tit').text(),
					icon: {
						url: "/resources/images/common/pin_ico.png",
						scaledSize: new google.maps.Size(42, 50)
					}
				}));

				infowindows.push(new google.maps.InfoWindow({
					content: contentString($(this)),
				}));

				markers[idx].addListener("mouseover",function(e){
					infowindows[idx].open(map, markers[idx]);
				});

				markers[idx].addListener("mouseout",function(e){
					infowindows[idx].close();
				});
			});
		};
		</script>
    	<!-- <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2vgxy-gUfx_XBxO9g6EVTZbevdkuojfQ&callback=initMap&language=${_lang }&region=KR">
	    </script> -->
		<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBezTSgt9AXleuuIqgNLN46t0gmY2P_gi4&callback=initMap&language=${_lang }&region=KR">
	    </script>    
	</body>
</html>