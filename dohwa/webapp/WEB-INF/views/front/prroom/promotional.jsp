<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<%@ include file="/WEB-INF/views/front/layout/head.jsp" %>
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
		<div class="pr" id="wrap">
			<%@ include file="/WEB-INF/views/front/layout/header.jsp" %>
			<div id="container">
				<div id="content" role="main">
					<div class="page-visual promotion01 visual-area">
						<div class="page-title-sec">
							<span class="title-main-sub"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.001" text="PR ROOM" /></span>
							<h2 class="title-main"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.002" text="홍보센터" /></h2>
						</div>
						<div class="noti-scroll none">
							<span class="txt"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.013" text="Scroll" /></span>
							<span class="ico01" aria-hidden="true"></span>
							<span class="ico02" aria-hidden="true"></span>
						</div>
						<div class="visual-grid-wrap" aria-hidden="true">
							<div class="grid-ico-wrap" aria-hidden="true">
								<div class="grid-ico" aria-hidden="true"></div>
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
								<div class="grid-line" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
								<div class="grid-line-act" aria-hidden="true"></div>
							</div>
						</div>
					</div>
					<div class="contents-wrap" style="position:relative">
						<div class="page-tab-section">
							<div class="tab-menu-type01 center">
								<ul class="tab-list">
									<li><a class="item" href="<c:url value="/prroom/ci" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.003" text="CI소개" /></a></li>
									<li><a class="item" href="<c:url value="/prroom/news" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.004" text="최신뉴스" /></a></li>
									<!--<c:if test="${'ko' eq _lang}">
										<li><a class="item" href="<c:url value="/prroom/press" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.017" text="보도자료" /></a></li>
									</c:if>-->
									<li><a class="item" href="<c:url value="/prroom/brochure" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.005" text="기업브로슈어" /></a></li>
									<li class="active"><a class="item" href="<c:url value="/prroom/promotional" />" data-id=""><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.006" text="홍보영상" /></a></li>
								</ul>
							</div>
						</div>
						<div class="contents no-btm-type clfix">
							<span class="page-decs">
								<strong>04 <spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.001" text="PR ROOM" /></strong>
								<spring:message code="FRONT.COMMON.MENU.ABOUTUS.001.001.005" text="DOHWA ENGINEERING" />
							</span>
							<div class="section-cont first-cont">
								<h3 class="title-sect"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.008" text="2020 도화엔지니어링 홍보영상" />
								</h3>
								<div class="video-wrap">
									<ul class="video-tab-wrap">
										<li ${'ko' eq _lang ? 'class="active"' : ''}>
											<button type="button" data-btn="ko" style="outline:none"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.009" text="KOR" /></button>
										</li>
										<li ${'en' eq _lang ? 'class="active"' : ''}>
											<button type="button" data-btn="en" style="outline:none"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.010" text="ENG" /></button>
										</li>
										<li ${'es' eq _lang ? 'class="active"' : ''}>
											<button type="button" data-btn="es" style="outline:none"><spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.011" text="ESP" /></button>
										</li>
									</ul>
									<button id="btn_business" type="button" style="outline:none">
										<img id="businessImg" src=${'ko' eq _lang ? '"/images/pc/img_prroom_business.png"' : '"/images/pc/img_prroom_business_en.png"'} alt="Business">
									</button>
									<button id="btn_brand" type="button" style="outline:none">
										<img id="brandImg" style="display:${'es' eq _lang ? 'none' : ''};" src=${'ko' eq _lang ? '"/images/pc/img_prroom_brand_n.png"' : '"/images/pc/img_prroom_brand_en_n.png"'} alt="Brand">
									</button>
									<button id="btn_job_intr" type="button" style="outline:none">
										 <img id="jobintrImg" style="display:${'en' eq _lang || 'es' eq _lang ? 'none' : ''};" src=${'ko' eq _lang ? '"/images/pc/img_prroom_job_intr_n.png"' : ''} alt="JobIntroduction">
									</button>
									<br>
									<br>
									<div class="video-tab-cont active" style="display:${'ko' eq _lang ? 'block' : 'none'};" data-video="ko">
										<div class="video-box" id="ko_business">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/m6Ap7wgJpE0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-box" id="ko_brand" style="display:none;">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/CGZnkCWXUu4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-box" id="ko_job_intr" style="display:none;">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/UwxgTHfNaic" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-desc">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.012" text="안전하고 행복한 삶을 위한 미래를 창조합니다." />
										</div>
									</div>
									<div class="video-tab-cont" style="display:${'en' eq _lang ? 'block' : 'none'};" data-video="en">
										<div class="video-box" id="en_business">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/QD3qF79Pgco" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-box" id="en_brand" style="display:none;">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/2_hHe0E_tl8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-desc">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.014" text="Creating the future for safer and happier living." />
										</div>
									</div>
									<div class="video-tab-cont" style="display:${'es' eq _lang ? 'block' : 'none'};" data-video="es">
										<div class="video-box">
											<iframe width="1312" height="734" src="https://www.youtube.com/embed/39dHCL-Hv60" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
										<div class="video-desc">
											<spring:message code="FRONT.COMMON.MENU.PRROOM.003.002.015" text="Creamos un futuro para una vida segura y feliz." />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btm-full-banner">
							<%@ include file="/WEB-INF/views/front/layout/intro_link.jsp" %>
						</div>
						<div class="sub-page-grid">
							<div class="grid-wrap" aria-hidden="true">
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/front/layout/footer.jsp" %>
		</div>
		<%@ include file="/WEB-INF/views/front/layout/after_script.jsp" %>
		<script>
			var language = "${'es' eq _lang ? 'es' : 'en' eq _lang ? 'en' : 'ko'}";
			$('[data-btn]').off('click').on('click', function() {
				$.each($('[data-video]'), function() {
					$(this).css('display', 'none');
					$(this).removeClass('active');
				});

				$('[data-video="'+ $(this).data('btn') +'"]').css('display', '');
				$('[data-video="'+ $(this).data('btn') +'"]').addClass('active');
				$('[data-btn]').closest('ul').find('li').removeClass('active');
				$(this).closest('li').addClass('active');
				
				if($(this).data('btn') == 'ko'){
					language = 'ko';
					$('#brandImg').css('display','');
					$('#jobintrImg').css('display','');
					$('#businessImg').attr('src','/images/pc/img_prroom_business.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_n.png');
					$('#jobintrImg').attr('src','/images/pc/img_prroom_job_intr_n.png');
				}else if($(this).data('btn') == 'es'){
					language = 'es';
					$('#brandImg').css('display','none');
					$('#jobintrImg').css('display','none');
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en.png');					
				}else{
					language = 'en';
					$('#brandImg').css('display','');
					$('#jobintrImg').css('display','none');
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_en_n.png');	
				}
				
				$('#ko_brand').css('display', 'none');
				$('#ko_brand').removeClass('active');
		
				$('#ko_business').css('display', 'block');
				$('#ko_business').addClass('active');
			
				$('#en_brand').css('display', 'none');
				$('#en_brand').removeClass('active');
				$('#en_business').css('display', 'block');
				$('#en_business').addClass('active');
			});
			
			$('#btn_business').off('click').on('click', function() {
				if(language == 'ko'){
					$('#businessImg').attr('src','/images/pc/img_prroom_business.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_n.png');
					$('#jobintrImg').attr('src','/images/pc/img_prroom_job_intr_n.png');
					
					$('#ko_brand').css('display', 'none');
					$('#ko_brand').removeClass('active');
					$('#ko_job_intr').css('display', 'none');
					$('#ko_job_intr').removeClass('active');
					
					$('#ko_business').css('display', 'block');
					$('#ko_business').addClass('active');
				}else if(language == 'es'){
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en.png');
					$('#en_brand').css('display', 'none');
					$('#en_brand').removeClass('active');
					$('#en_business').css('display', 'block');
					$('#en_business').addClass('active');
				}else{
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_en_n.png');
					$('#en_brand').css('display', 'none');
					$('#en_brand').removeClass('active');
					$('#en_business').css('display', 'block');
					$('#en_business').addClass('active');
				}
			});
			
			$('#btn_brand').off('click').on('click', function() {
				if(language == 'ko'){
					$('#businessImg').attr('src','/images/pc/img_prroom_business_n.png');
					$('#jobintrImg').attr('src','/images/pc/img_prroom_job_intr_n.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand.png');
					$('#ko_business').css('display', 'none');
					$('#ko_business').removeClass('active');
					$('#ko_job_intr').css('display', 'none');
					$('#ko_job_intr').removeClass('active');
					$('#ko_brand').css('display', 'block');
					$('#ko_brand').addClass('active');
				}else if(language == 'es'){
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en.png');
					$('#en_business').css('display', 'none');
					$('#en_business').removeClass('active');
					
					$('#en_brand').css('display', 'block');
					$('#en_brand').addClass('active');
				}else{
					$('#businessImg').attr('src','/images/pc/img_prroom_business_en_n.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_en.png');
					$('#en_business').css('display', 'none');
					$('#en_business').removeClass('active');
					$('#en_brand').css('display', 'block');
					$('#en_brand').addClass('active');
				}
			});
			$('#btn_job_intr').off('click').on('click', function() {
				if(language == 'ko'){
					$('#businessImg').attr('src','/images/pc/img_prroom_business_n.png');
					$('#brandImg').attr('src','/images/pc/img_prroom_brand_n.png');
					$('#jobintrImg').attr('src','/images/pc/img_prroom_job_intr.png');
					
					$('#ko_business').css('display', 'none');
					$('#ko_business').removeClass('active');
					
					$('#ko_brand').css('display', 'none');
					$('#ko_brand').removeClass('active');
					
					$('#ko_job_intr').css('display', 'block');
					$('#ko_job_intr').addClass('active');
				}
			});
		</script>
	</body>
</html>