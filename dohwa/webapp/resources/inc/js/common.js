

//jQuery.noConflict();
!function($) {
	'use strict';

	$(function(){
		initUI.setup();
	});

	var initUI = (function(){
		var isLoaded;

		function setup(){
			if(isLoaded){
				return;
			}
			isLoaded = true;

			//header
			registUI('#header', haederUiController, false);

			//footer
			registUI('#footer', footerUiController, false);

			//Overview water
			registUI('.water', businessWaterEventController, true);

			//business Swiper
			// registUI('.business-project-slide', businessSwiperController, false);

			//project-view Swiper
			registUI('.bbs-img-slide', projectSwiperController, false);

			//mixin grid
			registUI('.visual-grid-wrap', visualGridFunction, false);
			registUI('.sub-page-grid', subPageGridController, true);

			//overView
			registUI('.overview', overViewUIController, false);

			//공통 비주얼 모션
			registUI('.page-visual', visualAnimationController, false);

			//스크롤모션
			registUI('.visual-area', scrollAnimation, false);

			//vision
			registUI('.vision', visionController, false);

			//CSR
			registUI('.csr', csrController, false);

			//채용절차
			registUI('.recruit', recruitController, false);

			//공통 ScrollBar
			registUI('.scrollbar-inner', scrollBarController, false);

		}

		function registUI(el, fn, saveData){
			if(saveData === undefined){
				saveData = true;
			}

			var _inst;

			$(el).each(function(idx, obj){
				_inst = new fn();
				_inst.init(obj, el);
				if(saveData){
					$(el).data('_inst', _inst);
				}
			});
		}

		return {
			setup: setup
		};
	})();

	var haederUiController = function(){
		var el;

		var	_header_inner, _gnb, _gnbMenuLink;
		var	_lnb;

		var _check = true;
		var _currentScroll = $(window).scrollTop();

		function init(_el){
			el            = $(_el);
			_header_inner = el.find('.header-content');
			_gnb          = el.find('.bttn-all-menu');
			_gnbMenuLink  = el.find('.gnb-menu-link');
			_lnb          = $('.page-tab-section');
			
			//공통 언어변경 셀렉트박스
			var component = new ComponentUI();
			component.selectBox('.bttn-lang-sel', 200);

			_header_inner.addClass('transition');

			if (!$('body').hasClass('main-body')) {
				_header_inner.addClass('on');

				//연혁 헤더 UI 분기처리
				if($('#wrap').hasClass('intro-history')){
					$('.header-content').removeClass('on');
				}
			}
			setScroll();

			checkCurrentGnb();

			gnbEvents();

			for (var _i = 0; _i < _gnbMenuLink.length; _i++) {
				(function (_i) {
					_gnbMenuLink.eq(_i).on('mouseenter', function () {
						_gnbMenuLink.removeClass('on');
						_gnbMenuLink.eq(_i).addClass('on');
					})

					$('.gnb-sub-list').eq(_i).on('mouseenter', function () {
						_gnbMenuLink.removeClass('on');
						_gnbMenuLink.eq(_i).addClass('on');
					})

					_header_inner.on('mouseleave', function () {
						_gnbMenuLink.removeClass('on');
						checkCurrentGnb();
					})

				})(_i);
			}

			return this;
		}

		function gnbEvents(){
			_gnb.on('click', function(){
				_header_inner.css('z-index',31);
				setState(_check);
			});

			_header_inner.on('mouseleave', function(){
				_header_inner.css('z-index',31);
				setState(false);
			})

			$('.gnb-menu-list').off().on('mouseenter', function(){
				_header_inner.css('z-index',31);
				setState(true);
			})
		}

		function setState($check){
			if($check){
				_header_inner.addClass('active');
				// _disabledScroll();

				$check = false;
			}else if(!$check){
				_header_inner.removeClass('active');
				// _activeScroll();

				$check = true;
			}

			return _check = $check;
		}

		function setScroll(){
			$(window).on('scroll', function(){
				var $scrollTop = $(document).scrollTop();
				
				// scroll 값에 따른 class 제어
				if($scrollTop > 0) {
					_header_inner.addClass('transition on');
					TweenMax.to($('.noti-scroll'), .4, {opacity:0, y:50, ease: Power3.easeOut});

				}else if($scrollTop == 0 && $('body').hasClass('main-body')){
					TweenMax.to($('.noti-scroll'), .4, {opacity:1, y:0, ease: Power3.easeOut});

					_header_inner.removeClass('on');
				}

				// gnb, lnb 가 맞닿는 순간 gnb, lnb 의 position 제어
				_movedHeader();
				_fixedLnb();
			});

			//moyusewheel
			//스크롤 방향체크
			if(!$('body').hasClass('main-body') && !$('#wrap').hasClass('intro-history')){
				$(window).on('mousewheel DOMMouseScroll', function(e, delta){
					var $scrollTop = $(window).scrollTop();
					var _overlapTiming = _lnb.offset().top - _header_inner.outerHeight();
	
					if(delta > 0){
						console.log('up');
						if($('.dim-pop-wrap').is(':visible') == true){
							return false;
						}
						if(_header_inner.hasClass('active')){
							return false;
						}
						setTimeout(function(){
							_header_inner.addClass('transition');
							_header_inner.css('top', 0);
						},350);
						if($scrollTop == 0){
							_lnb.css('top', 0);
							// return false;
						}else {
	
							_lnb.css('top', _header_inner.outerHeight());
						}
						
					}else {
						console.log('down');
						if($('.dim-pop-wrap').is(':visible') == true){
							return false;
						}
						if(_header_inner.hasClass('active')){
							return false;
						}
						if($scrollTop >= _overlapTiming){
							_header_inner.removeClass('transition');
							_header_inner.css('top', _overlapTiming - $scrollTop);
							// return false;
						}else {
								
						}
						setTimeout(function(){
							_header_inner.addClass('transition');
							_header_inner.css('top', -_header_inner.outerHeight());
						},350);
						_lnb.css('top',0);
					}
				});
			}
			

			// if(_scrollTop > _currentScroll){
			// 	console.log('down');
					
			// }else {
			// 	console.log('up');
				
			// }
			// _currentScroll = _scrollTop;
		}

		function _disabledScroll () {
			$('html, body').css('overflow', 'hidden');
		}

		function _activeScroll () {
			$('html, body').removeAttr('style');
		}

		function _movedHeader () {
			if (!_lnb[0]) return false;

			var _scrollTop = $(window).scrollTop();
			var _overlapTiming = _lnb.offset().top - _header_inner.outerHeight();
			if(_header_inner.hasClass('active')){
				return false;
			}
			if (_scrollTop >= _overlapTiming) {
				_header_inner.removeClass('transition');
				_header_inner.css('top', _overlapTiming - _scrollTop);
				
				

			} else {
				_header_inner.css('top', 0);
				_lnb.css('top', _header_inner.outerHeight());

			}
		}

		function _fixedLnb () {
			if (!_lnb[0]) return false;

			var _scrollTop = $(window).scrollTop();
			var _fixedTiming = $('.page-visual').offset().top + $('.page-visual').outerHeight(true);

			if (_scrollTop >= _fixedTiming - _header_inner.outerHeight()) {
				if(_header_inner.hasClass('active')){

					return false;
				}
				_lnb.addClass('fixed');
				
			} else {
				_lnb.css('top',0);		
				_lnb.removeClass('fixed');
			}
		}

		function checkCurrentGnb () {

			var _className = $('#wrap').attr('class'),
				_afterStr = _className ? _className.split(" ") : '',
				_gnbMenuLink = $('.gnb-wrap .gnb-menu-link');

			switch (_afterStr[0]) {
				case 'intro':
					_gnbMenuLink.eq(0).addClass('on');

					break;
				case 'business':
					_gnbMenuLink.eq(1).addClass('on');

					break;
				case 'invest':
					_gnbMenuLink.eq(2).addClass('on');

					break;
				case 'pr':
					_gnbMenuLink.eq(3).addClass('on');

					break;
				case 'recruit':
					_gnbMenuLink.eq(4).addClass('on');

					break;
			}
		}

		return {
			init: init
		}
	}

	var footerUiController = function(){
		var el;
		var _topBtn;

		function init(_el){
			el 		= $(_el);
			_topBtn = el.find('.btn-goTop .btn-top');

			setEvents();
			setFamilyBox();

			return this;
		}

		function setEvents(){
			_topBtn.on('click', function(){
				goTopController();
			})
		}

		function goTopController(){
			TweenMax.to($('html, body'), 1.4, {scrollTop:0, ease: Power3.easeOut});
		}

		function setFamilyBox(){
			var component = new ComponentUI();
			component.selectBox('.family-btn', 150);
		}

		return {
			init: init
		}
	}

	//서브 공통비주얼 모션, Scroll text
	var visualAnimationController = function(){
		var el;

		var _subTit,
			_tit,
			_tit2;

		function init(_el){
			el      = $(_el);
			_subTit = el.find('.title-main-sub');
			_tit    = el.find('.title-main');
			_tit2   = el.find('.title-depth2');

			setAnimation();


			return this;
		}

		function setAnimation(){
			// TweenMax.fromTo(el, 3, {'background-size':'105%'},{'background-size':'100%',ease: Power3.easeOut});
			TweenMax.fromTo(_subTit, 1.5, {opacity:0, y:60}, {opacity:1, y:0, ease: Power3.easeOut});
			TweenMax.fromTo(_tit, 1.6, {opacity:0, y:30}, {delay:.45, opacity:1, y:0, ease: Power3.easeOut});
			TweenMax.fromTo(_tit2, 1.6, {opacity:0, y:25}, {delay:.55, opacity:1, y:0, ease: Power3.easeOut});


		}

		return {
			init: init
		}
	}

	//window scroll Event는 haeder에 있음.
	var scrollAnimation = function(){
		var el;

		var _scroll,
			_line01,
			_line02;

		function init(_el){
			el      = $(_el);
			_scroll = el.find('.noti-scroll>.txt');
			_line01 = el.find('.noti-scroll>.ico01');
			_line02 = el.find('.noti-scroll>.ico02');

			if(!$('body').hasClass('main-body')){
				TweenMax.set(_line02, {'background-color':'#ffffff'});
			}else {
				TweenMax.set(_line02, {'background-color':'#333333'});
			}

			setScroll();
			setScrollAni();
			return this;
		}

		function setScroll(){
			TweenMax.set($('.noti-scroll'), {opacity:1});
		}

		function setScrollAni(){
			TweenMax.fromTo(_scroll, .7, {y:15}, {y:0, yoyo:true, repeat:-1, ease: Circ.easeOut});
			TweenMax.fromTo(_line01, .7, {height:60}, {height:75, yoyo:true, repeat:-1, ease: Circ.easeOut});
			TweenMax.fromTo(_line02, .7, {height:75}, {height:60, yoyo:true, repeat:-1, ease: Circ.easeOut});
		}

		return {
			init: init
		}
	}

	// grid
	// subPage VisualGrid function
	var visualGridFunction = function(){
		var el;

		var _line01,
			_line02,
			_line03,
			_line04,
			_line05,
			_line06,
			_line07,
			_line08;

		var _gridPos,
			_grid_ico01,
			_grid_ico02;

        var _defaultWidth,
            _defaultHeight;

		function init(_el){
			el      = $(_el);
			_line01 = el.find('.grid-line').eq(0);
			_line02 = el.find('.grid-line').eq(1);
			_line03 = el.find('.grid-line').eq(2);
            _line04 = el.find('.grid-line').eq(3);

			// active line
			_line05 = el.find('.grid-line-act').eq(0);
			_line06 = el.find('.grid-line-act').eq(1);
			_line07 = el.find('.grid-line-act').eq(2);
			_line08 = el.find('.grid-line-act').eq(3);

			//grid icon
			_grid_ico01 = el.find('.grid-ico').eq(1);
			_grid_ico02 = el.find('.grid-ico').eq(3);

			_gridPos = $('.btn-gnb-wrap').offset().left-5;

			setTimeout(function(){
				setGridPosition();
				selfCallback();
			},0)
			reSizeEvents();

			return this;
		}

		function reSizeEvents(){
			$(window).on('resize', function(){
				_gridPos = $('.btn-gnb-wrap').offset().left-5;

				setGridPosition();
				// selfCallback();
			})
		}

		function setGridPosition(){
            _defaultWidth  = $(document).width();
			_defaultHeight = $('.visual-area').outerHeight();

			//grid-ico position
			_grid_ico01.css({left:_gridPos});
			_grid_ico02.css({left:_gridPos});

            //- Main Visual Area
            // base line
			_line01.css({width: _defaultWidth});
			_line02.css({height: _defaultHeight});
			_line03.css({width: _defaultWidth});
			_line04.css({height: _defaultHeight, left:_gridPos+5});
            // moved line
			_line05.css({width: _line01.width() / 1.5});
			_line06.css({height: _defaultHeight / 1.5});
			_line07.css({width: _line03.width() / 1.5, top:_line03.offset().top});
            _line08.css({height: _defaultHeight / 1.5, left:_gridPos+5});
        }

        function selfCallback () {
            setTimeout(gridAnimation, 2200);
			// gridAnimation();
            setTimeout (selfCallback, 5500);
        }

		function gridAnimation(){
            TweenMax.fromTo(_line05, 1.5, {x: - _defaultWidth}, {x: _defaultWidth})
            TweenMax.fromTo(_line07, 1.5, {x: _defaultWidth}, {x: - _defaultWidth})

            TweenMax.fromTo(_line06, 1.5, {y: _defaultHeight}, {y: - _defaultHeight, delay: 0.5})
			TweenMax.fromTo(_line08, 1.5, {y: - _defaultHeight}, {y: _defaultHeight, delay: 0.5})

			TweenMax.fromTo(_line05, 1, {opacity: 1}, {opacity: 0.1})
            TweenMax.fromTo(_line07, 1, {opacity: 1}, {opacity: 0.1})

            TweenMax.fromTo(_line06, 1, {opacity: 1}, {opacity: 0.1, delay: 0.5})
            TweenMax.fromTo(_line08, 1, {opacity: 1}, {opacity: 0.1, delay: 0.5})
		}

		return {
			init: init
		}
	}

	// subPage contentGrid function
	var subPageGridController = function(){
		var el;

		var _gridIco01,
			_gridIco02,
			_gridIco03,
			_gridIco04,
			_gridLine01,
			_gridLine02,
			_gridLine03;

		var _footerLine02;
		var _footerLine02;

		var _topPos,
			_leftPos,
			_bottomPos,
			_contentsHeight,
			_iconHalfHeight,
			_tabHeight;

		function init(_el){
			el = $(_el);
			_gridIco01 = el.find('.grid-ico').eq(0);
			_gridIco02 = el.find('.grid-ico').eq(1);
			_gridIco03 = el.find('.grid-ico').eq(2);
			_gridIco04 = el.find('.grid-ico').eq(3);

			_gridLine01 = el.find('.grid-line').eq(0);
			_gridLine02 = el.find('.grid-line').eq(1);
			_gridLine03 = el.find('.grid-line').eq(2);

			_footerLine02 = $('.footer-grid-wrap').find('.grid-line').eq(1);


			// _topPos         = $('.page-visual').outerHeight();
			// _leftPos        = $('.btn-gnb-wrap').offset().left;
			// _bottomPos      = $('#footer').offset().top;
			// _contentsHeight = $('#content').outerHeight() - $('.page-visual').outerHeight();

			if($('body').hasClass('main-body')){
				el.hide();

				return false;
			}

			setTimeout(setGridPos, 0);
			gridResizePos();


			return this;
		}

		function setGridPos(){
			if($('#wrap').hasClass('intro-history')){
				$('#footer').hide();
				//초기화
				_topPos         = 0;
				_leftPos        = $('.btn-gnb-wrap').offset().left;
				_bottomPos      = 0;
				_contentsHeight = $('#content').outerHeight() - $('.page-visual').outerHeight();
				_iconHalfHeight = _gridIco01.height() / 2;

				_tabHeight = 120;
				
				// _gridIco01.css({top:_topPos +114});
				// _gridIco02.css({top:_topPos +114, left:_leftPos -5});
				// _gridIco03.css({top:_bottomPos -5});
				// _gridIco04.css({top:_bottomPos -5, left:_leftPos -5});

				_gridIco01.hide();
				_gridIco02.hide();
				_gridIco03.hide();
				_gridIco04.hide();

				// _gridLine01.css({top:_topPos + 119});
				_gridLine01.hide();
				//vertical
				_gridLine02.css({top:_topPos, height:_contentsHeight});
				_gridLine03.css({top:_topPos, left:_leftPos, height:_contentsHeight});

				_footerLine02.css({left:_leftPos});

				return false;
			}

			//초기화
			_topPos         = 0;
			_leftPos        = $('.btn-gnb-wrap').offset().left;
			_bottomPos      = 0;
			_contentsHeight = $('#content').outerHeight() - $('.page-visual').outerHeight();
			_iconHalfHeight = _gridIco01.height() / 2;

			_tabHeight = 120;

			_gridIco01.css({top: _tabHeight - _iconHalfHeight});
			_gridIco02.css({top: _tabHeight - _iconHalfHeight, left:_leftPos - _iconHalfHeight});
			_gridIco03.css({bottom:_bottomPos - _iconHalfHeight});
			_gridIco04.css({bottom:_bottomPos - _iconHalfHeight, left:_leftPos - _iconHalfHeight});

			_gridLine01.css({top: _tabHeight});
			//vertical
			_gridLine02.css({top:_topPos});
			_gridLine03.css({top:_topPos, left:_leftPos});

			_footerLine02.css({left:_leftPos});
		}

		function gridResizePos(){
			$(window).on('resize', function(){
				setGridPos();
			})

		}

		return {
			init: init,
			setGridPos: setGridPos
		};
	}

	var businessWaterEventController = function(){
		var el;

		var _txtLineClamp;

		var _depth1Idx = 0,
			_depth2Idx = 0;

		var _animation,
			_tabList,
			_txtBox;

		var _tween1,
			_tween2;

		function init(_el){
			el            = $(_el)
			_txtLineClamp = $('.business-detail-txt');
			_tabList      = $('.business-tab-list');
			_txtBox       = $('.business-summary-inner');

			setState();
			setEvents();
			setLineClamp(0, 0);
			setLottie();

			return this;
		}

		function setLottie(){
			_animation = [
				//물
				bodymovin.loadAnimation({
					container: document.getElementById('bg0'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: '/images/svg/water/dh_line.json'
				}),
				//도시
				bodymovin.loadAnimation({
					container: document.getElementById('bg1'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: '/images/svg/city/dh_line.json'
				}),
				//교통
				bodymovin.loadAnimation({
					container: document.getElementById('bg2'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: '/images/svg/transportation/dh_line.json'
				}),
				//에너지
				bodymovin.loadAnimation({
					container: document.getElementById('bg3'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: '/images/svg/energy/dh_line.json'
				}),
			]

			_animation[0].play();
			setTween();
		}

		function setState(){
			$('.bttn-area').hide();
		}

		function setTween(){
			_tween1 = TweenMax.fromTo(_tabList, 1.2, {
				opacity:0,
			},{
				delay:.8,
				opacity:1,
				ease: Power3.easeOut
			});
			_tween2 = TweenMax.fromTo(_txtBox, 1.2, {
				opacity:0,
			},{
				delay:.8,
				opacity:1,
				ease: Power3.easeOut
			});
		}

		// 1depth list
		function setEvents(){
			$('.tab-list-2depth').find('li').on('click', function(){
				_depth1Idx = $(this).index();
				_animation[$(this).index()].goToAndPlay(0);
				_tween1.kill();
				_tween2.kill();
				setTween();

				return setSubEvents();
			});

			setSubEvents();

		}

		function initCategoryIndex($index){
			$('.tab-list-2depth').find('li').removeClass('active');
			$('.tab-list-2depth').find('li').eq($index).addClass('active');

			$('.business-tab-cont').hide();
			$('.business-tab-cont').eq($index).show();

			_depth1Idx = $index;
			_animation[$index].goToAndPlay(0);
			_tween1.kill();
			_tween2.kill();
			setTween();

			setSubEvents();
		}
		// 2depth list
		function setSubEvents(){

			resetContentsList();

			$('.contents-2depth').eq(_depth1Idx).find('.tab-list').find('li').on('click', function(){

				_depth2Idx = $(this).index();
				setLineClamp( _depth1Idx, _depth2Idx );

				console.log(_depth1Idx, _depth2Idx);
			});
		}

		function setLineClamp($2depth, $3depth){
			// $('.contents-2depth').eq($2depth).find('.contents-3depth').eq($3depth).find('.business-detail-txt').find('span').text();
			// console.log($('.contents-2depth').eq($2depth).find('.inner-tab-cont').eq($3depth).find('.business-detail-txt').find('span').text().length)

			var $length = $('.contents-2depth').eq($2depth).find('.inner-tab-cont').eq($3depth).find('.business-detail-txt').find('span');
			var $txtBox = $('.contents-2depth').eq($2depth).find('.inner-tab-cont').eq($3depth).find('.business-detail-txt').find('p');

			if($txtBox.height() > 154){
				$txtBox.height(154);
				$length.addClass('line-clamp');
				$txtBox.next('.bttn-area').show();
				// $('.contents-2depth').eq($2depth).find('.inner-tab-cont').eq($3depth).find('.business-detail-txt').find('span').text(
				// 	$('.contents-2depth').eq($2depth).find('.inner-tab-cont').eq($3depth).find('.business-detail-txt').find('span').text().substr(0, 563) +'···'
				// );
			}

			//더보기
			$txtBox.next('.bttn-area').on('click', function(){
				$(this).prev('p').children('span').removeClass('line-clamp');
				$(this).prev('p').height($(this).prev('p').children('span').height()+10);
				$(this).hide();
			})
		}

		function resetContentsList(){
			//3뎁스 리스트 초기화
			$('.contents-2depth').find('.tab-list').find('li').removeClass('active');
			$('.contents-2depth').eq(_depth1Idx).find('.tab-list').find('li').eq(0).addClass('active');
			$('.contents-2depth').find('.inner-tab-cont').hide();
			$('.contents-2depth').eq(_depth1Idx).find('.inner-tab-cont').eq(0).show();
			setLineClamp(_depth1Idx, 0);
		}

		return {
			init: init,
			initCategoryIndex: initCategoryIndex
		}
	}


	var businessSwiperController = function(){
		var el;

		function init(_el){
			el = $(_el);

			setSwiper();

			return this;
		}

		function setSwiper(){
			var swiper = new Swiper(el, {
				observer: true,
				observeParents: true,
				observeSlideChildren: true,
				slidesPerView: 4,
				slidesPerGroup: 4,
				pagination: {
					el: '.swiper-pagination',
					type: 'bullets',
				},
			})
		}

		return {
			init: init
		}
	}

	var projectSwiperController = function(){
		var el;

		function init(_el){
			el = $(_el);

			setSwiper();

			return this;
		}

		function setSwiper(){
			if(el.find('.swiper-slide').length < 2){
				el.find('.swiper-pagination').hide();
				el.find('.swiper-button-next').hide();
				el.find('.swiper-button-prev').hide();
				return false;
			}else {
				el.find('.swiper-pagination').show();
				el.find('.swiper-button-next').show();
				el.find('.swiper-button-prev').show();
			}

			var swiper = new Swiper(el, {
				slidesPerView: 1,
				loop:true,
				pagination: {
					el: '.swiper-pagination',
					type: 'bullets',
				}, 
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			})
		}

		return {
			init: init
		}
	}

	var overViewUIController = function(){
		var el,
			_bar,
			_ctrlBtn;

		var _awardSwiper,
			_licenseSwiper,
			_slideList,
			_swiper,
			_tween;

		var _arr = [];
		var _idx = 0;

		var _time = 4000;
		var _isPlay = true;

		var _licensePopUpList;

		function init(_el){
			el                = $(_el);
			_bar              = $('.paging-active');
			_ctrlBtn          = $('.btn-control');
			_licensePopUpList = $('.license-slide').find('.swiper-slide a');
			_slideList        = $('.e-slide-li');
			_swiper           = $('.award-container');

			setEvents();
			setSwiper();
			setBarState();

			licenseSwiper();
			setPopUp();

			return this;
		}

		function setEvents(){
			_slideList.on('click', function(){
				_slideList.removeClass('on');
				$(this).addClass('on');
				
				_arr[$('.inner-tab-cont.active').index()-1].slideToLoop($(this).parent().parent().index());

			})
		}

		function licenseSwiper(){
			if($('.license-container').find('.swiper-slide').length <= 1){
				$('.license-slide').find('.swiper-pagination').hide();
				$('.license-slide').find('.btn-next-mid').hide();
				$('.license-slide').find('.btn-prev-mid').hide();

				return false;
			};

			_licenseSwiper = new Swiper($('.license-container'),{
				slidesPerView: 6,
				spaceBetween: 32,
				slidesPerGroup: 6,
				pagination: {
					el: $('.license-slide').find('.swiper-pagination'),
					clickable: true,
				},
				navigation: {
					nextEl: $('.license-slide').find('.btn-next-mid'),
					prevEl: $('.license-slide').find('.btn-prev-mid'),
				}
			})
		}

		function setBarState(){
			TweenMax.set(_bar, {width:0});
		}

		function setSwiper(){
			_swiper.each(function(index, item){
				_arr.push(item);

				_arr[index] = new Swiper(_arr[index],{
					observer: true,
					observeParents: true,
					observeSlideChildren:true,
					speed:600,
					loop:true,
					pagination: {
						el: $(_arr).eq(index).find('.swiper-pagination'),
						type: 'fraction',
					},
					navigation: {
						nextEl: $(_arr).eq(index).find('.btn-next-small'),
						prevEl: $(_arr).eq(index).find('.btn-prev-small'),
					},
					autoplay: {
						delay:_time,
						disableOnInteraction: false,
					},
					on : {
						init : function(){
							_tween = TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
							Power0.easeNone});
							$('.inner-tab-cont').eq(index).find(_slideList).removeClass('on');
							$('.inner-tab-cont').eq(index).find(_slideList).eq(this.realIndex).addClass('on');
						},
						slideChange: function(){
							if(_ctrlBtn.hasClass('on')){setBarState(); return false;}

							_tween = TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
							Power0.easeNone});
							$('.inner-tab-cont').eq(index).find(_slideList).removeClass('on');
							$('.inner-tab-cont').eq(index).find(_slideList).eq(this.realIndex).addClass('on');

						}
					}
				})
			});

			_ctrlBtn.on('click', function(){
				if(_isPlay){
					_ctrlBtn.addClass('on');
					_arr[0].autoplay.stop();
					_arr[1].autoplay.stop();
					setBarState();
					_isPlay = false;
				}else if(!_isPlay){
					_ctrlBtn.removeClass('on');
					_arr[0].autoplay.start();
					_arr[1].autoplay.start();
					_tween = TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
						Power0.easeNone});
					_isPlay = true;
				}
			});
			$('.award-tab .tab-list').find('li').on('click', function(){
				_arr[$(this).index()].update();
				_arr[$(this).index()].slideToLoop(0);

				$('.inner-tab-cont').find(_slideList).removeClass('on');
				$('.inner-tab-cont').eq($(this).index()).find(_slideList).eq(0).addClass('on');

				return _idx = $(this).index()
			});

		}

		function setPopUp(){
			var $lnbWidth = $('.page-tab-section').width();
			var $headerWidth = $('.header-content').width();
			_licensePopUpList.on('click', function(e){
				e.preventDefault();
				$('.page-tab-section').css({
					'width' : $lnbWidth,
					'transition' : 'none'
				});
				$('.header-content').css({
					'width' : $headerWidth,
					'transition' : 'none'
				});
				var $listItem  = $(this).find('.img-box > img').attr('src');
				var $listTitle  = $(this).find('.type').text();

				component.modalPopUp('.dim-pop-wrap').open();
				$('.dim-pop-wrap').find('.img-box > img').attr('src', $listItem);
				$('.dim-pop-wrap').find('.dim-title .line-clamp').text($listTitle);

			})
		}

		return {
			init: init
		}
	}

	var visionController = function(){
		var el;

		var _item,
			_tit,
			_txt,
			_ico;

		function init(_el){
			el    = $(_el);
			_item = $('.vision-list').children();
			_tit  = $('.ani-tit');
			_txt  = $('.ani-txt');
			_ico  = $('.ico');

			setEvents();


			return this;
		}

		function setEvents(){
			_item.on('click', function(){
				setActive($(this).index());
			});
		}

		function setActive($index){
			_item.removeClass('active');
			_item.eq($index).addClass('active');

			if($index == 0){
				$('.vision-wrap').removeClass('value').removeClass('vision');
				$('.vision-wrap').addClass('mission');
			}else if($index == 1){
				$('.vision-wrap').removeClass('mission').removeClass('vision');
				$('.vision-wrap').addClass('value');
			}else if($index == 2){
				$('.vision-wrap').removeClass('value').removeClass('mission');
				$('.vision-wrap').addClass('vision');
			}
		}

		return {
			init: init
		}
	}

	var csrController = function(){
		var el;

		var _licenseList,
			_awardSwiper,
			_bar,
			_slideList;

		var _csr1,
			_csr2,
			_csr3,
			_fund;

		var _time = 4000;

		var _ctrlBtn;
		var _isPlay = true;

		function init(_el){
			el              = $(_el);
			_licenseList    = $('.license-wrap > .license-item');
			_ctrlBtn        = $('.btn-control');
			_bar            = $('.paging-active');
			_slideList      = $('.list-type-dot').find('.e-slide-li');

			setCsrImages();
			setBarState();
			setEvents();
			setLottie();
			setLottieBg();
			setSwiper();
			setScrollEvents();

			return this;
		}

		function setCsrImages(){
			if($('html').attr('lang') == 'en'){
				$('.csr-diagram').find('img').attr('src', '/images/pc/img_csr_diagram_en.png');
			} else if($('html').attr('lang') == 'es'){
				$('.csr-diagram').find('img').attr('src', '/images/pc/img_csr_diagram_es.jpg');
			}
		}

		function setScrollEvents(){
			// $(document).on('scroll', function(){
			// 	var $scrollTop = $(window).scrollTop();

			// 	if($scrollTop > $('.tab-menu-type02').offset().top - 200){
			// 		$(document).off('scroll');
			// 		setTimeout(function(){
			// 			_csr1.goToAndPlay(0);
			// 			_csr2.goToAndPlay(0);
			// 			_csr3.goToAndPlay(0);
			// 		},0)
					
			// 	}
			// });

			setTimeout(function(){
				_csr1.goToAndPlay(0);
				_csr2.goToAndPlay(0);
				_csr3.goToAndPlay(0);
			},2000);
		}

		function setLottieBg(){
			_csr1 = bodymovin.loadAnimation({
				container: document.getElementById('bg'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/csr1/dh_txt.json'
			});
			_csr2 = bodymovin.loadAnimation({
				container: document.getElementById('bg1'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/csr2/dh_txt.json'
			});
			_csr3 = bodymovin.loadAnimation({
				container: document.getElementById('bg2'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/csr3/dh_txt.json'
			});
		}

		function setLottie(){
			if($('html').attr('lang') == 'en'){
				$('.fund-box').append("<img src='/images/pc/img_fundbox_en.png' alt='' style='width:100%'/>");

				return false;
			}else if($('html').attr('lang') == 'es'){
				$('.fund-box').append("<img src='/images/pc/img_fundbox_es.jpg' alt='' style='width:100%'/>");

				return false;
			}

			_fund = bodymovin.loadAnimation({
				container: document.getElementById('fund-box'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/dh_count.json'
			});

			// $(window).on('scroll', function(){
			// 	var $scrollTop = $(window).scrollTop();
			// 	if($('.fund-box').length == 0) return false;
			// 	if($scrollTop > $('.fund-box').offset().top - 300){
			// 		if($('.fund-box').hasClass('active')) return false;
			// 		$('.fund-box').addClass('active');
			// 		_fund.goToAndPlay(0);
			// 	}
			// });

			if($('.fund-box').length == 0) return false;
			setTimeout(function(){
				_fund.goToAndPlay(0);
			},2300)
		}

		function setBarState(){
			TweenMax.set(_bar, {width:0});
		}

		function setEvents(){
			_licenseList.find('.bttn-view').on('click', function(e){
				e.preventDefault();
				
				setPopUp($(this).parent().parent().index());
			});

			//사회공헌 주요활동 슬라이드 텍스트
			_slideList.on('click', function(){
				_slideList.removeClass('on');
				$(this).addClass('on');

				_awardSwiper.slideToLoop($(this).parent().index());
			})
		}
		//csr_pages02 popup
		function setPopUp($index){
			var $lnbWidth = $('.page-tab-section').width();
			var $headerWidth = $('.header-content').width();

			$('.page-tab-section').css({
				'width' : $lnbWidth,
				'transition' : 'none'
			});
			$('.header-content').css({
				'width' : $headerWidth,
				'transition' : 'none'
			});
			component.modalPopUp('.dim-pop-wrap').open();
			
			$('.dim-pop-wrap').find('.img-box img').attr('src', _licenseList.eq($index).find('img').attr('src') );
			$('.dim-pop-wrap').find('.dim-title .line-clamp').text(_licenseList.eq($index).find('.name').text());

		}

		function setSwiper(){
			_awardSwiper = new Swiper($('.award-container'),{
				speed:600,
				loop:true,
				pagination: {
					el: $('.award-container').find('.swiper-pagination'),
					type: 'fraction',
				  },
				  navigation: {
					nextEl: $('.award-container').find('.btn-next-small'),
					prevEl: $('.award-container').find('.btn-prev-small'),
				  },
				autoplay: {
					delay:_time,
					disableOnInteraction: false,
				},
				on : {
					init: function(){
						if(_ctrlBtn.hasClass('on')){setBarState(); return false;}
						TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
						Power0.easeNone});
						_slideList.removeClass('on');
						_slideList.eq(this.realIndex).addClass('on');
					},
					slideChange: function(){
						if(_ctrlBtn.hasClass('on')){setBarState(); return false;}
						TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
						Power0.easeNone});
						_slideList.removeClass('on');
						_slideList.eq(this.realIndex).addClass('on');
					}
				}
			});

			_ctrlBtn.on('click', function(){
				if(_isPlay){
					$(this).addClass('on');
					_awardSwiper.autoplay.stop();
					setBarState();
					_isPlay = false;
				}else if(!_isPlay){
					$(this).removeClass('on');
					_awardSwiper.autoplay.start();
					TweenMax.fromTo(_bar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
						Power0.easeNone});
					_isPlay = true;
				}
			})
		}

		return  {
			init: init
		}
	}

	var scrollBarController = function(){
		var el;

		function init(_el){
			el = $(_el);

			setScrollBar();


			return this;
		}

		function setScrollBar(){
			el.scrollbar();
		}

		return {
			init: init
		}
	}

	var recruitController = function(){
		var el;

		var _procedure,
			_benefit;

		function init(_el){
			el = $(_el);
			
			setLottieBg();
			setScroll();
			return this;
		}

		function setScroll(){
			// $(document).on('scroll', function(){
			// 	var $scrollTop = $(window).scrollTop();

			// 	if($scrollTop > $('.tab-menu-type02').offset().top - 200){
			// 		$(document).off('scroll');
			// 		_procedure.goToAndPlay(0);
			// 		_benefit.goToAndPlay(0);
			// 	}
			// })

			setTimeout(function(){
				_procedure.goToAndPlay(0);
				_benefit.goToAndPlay(0);
			},2000);
		}

		function setLottieBg(){
			_procedure = bodymovin.loadAnimation({
				container: document.getElementById('bg1'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/procedure/dh_txt.json'
			});

			_benefit = bodymovin.loadAnimation({
				container: document.getElementById('bg2'),
				renderer: 'svg',
				loop: false,
				autoplay: false,
				path: '/images/svg/benefit/dh_txt.json'
			});
		}

		return {
			init: init
		}
	}










































}(jQuery);

