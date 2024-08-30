



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


			//main contents animation
			registUI('.main-body', mainAnimationController, false);

			//main visual
			registUI('.main-visual', mainVisualHandler, false);

			//grid
			// registUI('.visual-grid-wrap', visualGridFunction, false);
			registUI('.cnt-grid-wrap', contentsGridFunction, false);


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

	var mainVisualHandler = function(){
		var el;

		var _slide,
			_slideTimer,
			_textList,
			_video;

		var _idx = 1;

		function init(_el){
			el 	   = $(_el);
			_slide = el.find('.main-slide');
			_video = _slide.find('.video > video').get(0);
			_textList = _slide.find('.txt-wrap > .txt-list');
			// setTween();

			//visual dimm height 초기화
			setSwiper();

			return this;
		}

		function setSlideBg($index){

			// 슬라이드에 비디오가 있을경우 분기처리
			
			if(_slide.find('.swiper-slide').eq($index).find('.video').length != 0){
				_video.play();

				//슬라이드 영역 텍스트 분기처리
				TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.slide-tit'), 0.7, {delay:4, opacity:0, y:50, ease: Power3.easeOut});
				TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.slide-txt'), 0.7, {delay:4.1, opacity:0, y:50, ease: Power3.easeOut});

				// _slide.find('.swiper-slide').eq($index).find('.btn-wrap').find('.line').css('width','100%');
				// _slide.find('.swiper-slide').eq($index).find('.bttn-link').addClass('active');

				// return false;
				
			}else {
				if(_slide.find('.swiper-slide').eq($index).find('.video').length != 0){
					_video.pause();
				}

				// _slide.find('.swiper-slide').eq($index).find('.btn-wrap').find('.bttn-link').eq(0).find('.line').css('width','100%');
				// _slide.find('.swiper-slide').eq($index).find('.bttn-link').eq(0).addClass('active');
				
				_slide.find('.swiper-slide').eq($index).find('.slide-img').eq(0).css('opacity','1');
				// _slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(0).find('.slide-tit').css('opacity', '1');
				// _slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(0).find('.slide-txt').css('opacity', '1');

				// 비주얼 링크 슬라이드
				_slideTimer = setInterval(function(){
					// _slide.find('.swiper-slide').find('.bttn-link').removeClass('active');
					// _slide.find('.swiper-slide').eq($index).find('.bttn-link').eq(_idx).addClass('active');

					//link line
					// TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.bttn-link').eq(_idx-1).find('.line'), 0.01, {
					// 	width:0,
					// 	ease: Power0.easeNone
					// });
					// TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.bttn-link').eq(_idx).find('.line'), 5, {
					// 	width:'100%',
					// 	ease: Power0.easeNone
					// });
					if(_slide.find('.swiper-slide').eq($index).find('.slide-img').length <= 1){
						return false;
					} 
					//bg
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.slide-img').eq(_idx-1), 1, {
						opacity:0,
						ease: Power3.easeOut
					});
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.slide-img').eq(_idx), 1.7, {
						opacity:1,
						ease: Power3.easeOut
					});

					//text
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(_idx-1).find('.slide-tit'), 1, {
						opacity:0,
						ease: Power3.easeOut
					});
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(_idx).find('.slide-tit'), 1.7, {
						opacity:1,
						ease: Power3.easeOut
					});
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(_idx-1).find('.slide-txt'), 1, {
						opacity:0,
						ease: Power3.easeOut
					});
					TweenMax.to(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(_idx).find('.slide-txt'), 1.7, {
						opacity:1,
						ease: Power3.easeOut
					});

					_idx ++;
					if(_idx > $('.swiper-slide').eq($index).find('.slide-img').length -1){
						_idx = 0;
					}
				},5000);
			}

		}

		function setTween(){
			TweenMax.set(_slide.find('.slide-tit'), {opacity:0, y:50});
			TweenMax.set(_slide.find('.slide-txt'), {opacity:0, y:50});
			// TweenMax.set(_slide.find('.btn-wrap .line'), {width:0});
			TweenMax.set(_textList.eq(1), {opacity:0, y:50});
			TweenMax.set(_textList.eq(2), {opacity:0, y:50});
		}

		function setSwiper(){

			var swiper = new Swiper(_slide,{
				initialSlide:0,
				slidesPerView: 1,
				speed:600,
				loop:true,
				allowTouchMove: false,
				navigation: {
					nextEl: el.find('.swiper-button-next'),
					prevEl: el.find('.swiper-button-prev')
				},
				on: {
					slideChange: function(){
						clearInterval(_slideTimer);
						slideTextController(this.activeIndex);
						setSlideBg(this.activeIndex);
						_idx = 1;
					}
				}
			});


			if(_slide.find('.swiper-slide').eq(_idx).find('.slide-img').length <= 1){
				TweenMax.to(_slide.find('.swiper-slide').eq(_idx).find('.slide-img'), .8, {opacity:1});
				TweenMax.fromTo(_slide.find('.swiper-slide').eq(_idx).find('.slide-tit'), .8, 
				{
					opacity:0, y:50
				},
				{
					opacity:1, y:0
				});
				TweenMax.fromTo(_slide.find('.swiper-slide').eq(_idx).find('.slide-txt'), .8, 
				{
					opacity:0, y:50
				},
				{
					opacity:1, y:0
				});
				
			}

			// slideTextController(1);

		}

		function slideTextController($index){

			TweenMax.fromTo(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(0).find('.slide-tit'), 0.7, {delay:.3, opacity:0, y:50, ease: Power3.easeOut},{delay:.8,opacity:1, y:0, ease: Power3.easeOut});
			TweenMax.fromTo(_slide.find('.swiper-slide').eq($index).find('.txt-wrap .txt-list').eq(0).find('.slide-txt'), 0.7, {delay:.3, opacity:0, y:50, ease: Power3.easeOut},{delay:.9,opacity:1, y:0, ease: Power3.easeOut});
			TweenMax.fromTo(_slide.find('.swiper-slide').eq($index).find('.btn-wrap'), 0.7, {delay:.3, opacity:0, ease: Power3.easeOut},{delay:.9,opacity:1, ease: Power3.easeOut});

			$('.swiper-button-prev').children('.slide-name').text(
				$('.swiper-slide').eq($index).find('.prev-slide').text()
			);
			$('.swiper-button-next').children('.slide-name').text(
				$('.swiper-slide').eq($index).find('.next-slide').text()
			);

			// TweenMax.fromTo(_slide.find('.swiper-slide').eq($index).find('.slide-img').eq(_idx),0.01,{opacity:0}, {
			// 	opacity:1, ease: Power3.easeOut
			// })
		}

		return {
			init: init
		}


	}

	var mainAnimationController = function(){
		var el;

		var _section,
			_section01,
			_section02,
			_section03,
			_section04,
			_section05;

		var _visual;

		var _businessList,
			_projectList,
			_newsList,
			_carrerList;

		var _animation;

		var _grid,
			_gridDot01,
			_gridDot02,
			_gridDot03,
			_gridDot04,
			_gridDot05;

		var _company_grid,
			_company_gridDot01,
			_company_gridDot02;
		
		var _projectListItem;


		var controller = new ScrollMagic.Controller();

		function init(_el){
			el            = $(_el);
			_visual       = el.find('.main-visual');
			_section      = el.find('.main-cont-box');
			_section01    = el.find('.business');
			_section02    = el.find('.project');
			_section03    = el.find('.news');
			_section04    = el.find('.carrer');
			_section05    = el.find('.company');

			_businessList = _section01.find('.business-list').children('li');
			_projectList  = _section02.find('.list-type-gallery').find('a');
			_newsList     = _section03.find('.news-list').children();
			_newsList     = _section03.find('.news-list').children();
			_carrerList   = _section04.find('.txt01');
			
			_projectListItem = _section02.find('.list-type-gallery').find('.list-item');

			//company grid 초기화

			_gridDot01    = $('.cnt-grid-wrap').find('.grid-ico').eq(1);
			_gridDot02    = $('.cnt-grid-wrap').find('.grid-ico').eq(3);
			_gridDot03    = $('.cnt-grid-wrap').find('.grid-ico').eq(5);
			_gridDot04    = $('.cnt-grid-wrap').find('.grid-ico').eq(7);
			_gridDot05    = $('.cnt-grid-wrap').find('.grid-ico').eq(9);
			_grid         = $('.cnt-grid-wrap').find('.grid-line').eq(1);

			//company grid 초기화
			_company_grid      = $('.company').find('.grid-line').eq(3);
			_company_gridDot01 = $('.company').find('.grid-ico').eq(1);
			_company_gridDot02 = $('.company').find('.grid-ico').eq(3);

			//- Motion 초기화
			setLottie();
			setResetState();
			setScrollEvents();
			
			return this;
		}

		function setLottie(){
			var activePath01 = "/images/svg/01.json";
			var activePath02 = "/images/svg/02.json";
			var activePath03 = "/images/svg/03.json";
			var activePath04 = "/images/svg/04.json";
			var elem         = $('.business-list .txt-area');
			var cur;


			// svg object
			_animation = [
				bodymovin.loadAnimation({
					container: document.getElementById('list01'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: activePath01
				}),

				bodymovin.loadAnimation({
					container: document.getElementById('list02'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: activePath02
				}),

				bodymovin.loadAnimation({
					container: document.getElementById('list03'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: activePath03
				}),

				bodymovin.loadAnimation({
					container: document.getElementById('list04'),
					renderer: 'svg',
					loop: false,
					autoplay: false,
					path: activePath04
				})
			];

			cur = _animation.currentProgress;
			
			elem.each(function (i) {
				var _totalFrames;
				setTimeout(function () {
					_totalFrames = _animation[i].totalFrames;
					
				}, 1000);

				$(this).on('mouseenter', function () {
					if (_animation[i].currentFrame >= _totalFrames - 1) {
						_animation[i].goToAndStop(0, false);
					}
					_animation[i].playSegments([cur], true);
				})

				$(this).on('mouseleave', function pause() {
					_animation[i].pause();

					cur = _animation[i].currentProgress;
				})


			})
		}

		function setResetState(){

			//title
			TweenMax.set(_section.find('.box-tit'), {'opacity': 0, y: 50});
			TweenMax.set(_section.find('.tit-desc'), {'opacity': 0, y: 50});

			//더보기
			TweenMax.set(_section.find('.bttn-more'), {'opacity': 0, scale:0});

			//business
			TweenMax.set(_businessList,{opacity:0, y:100});

			//project
			TweenMax.set(_projectList,{opacity:0, width:1});
			// TweenMax.set(_projectList.find('img'),{scale:1.2});
			TweenMax.set(_projectList.find('.list-tit'),{opacity:0});

			//news
			TweenMax.set(_newsList,{opacity:0, y:100});

			//carrer
			TweenMax.set(_carrerList,{y:160});
			TweenMax.set(_section04.find('.bttn'),{opacity:0, scale:0});

			//company
			// TweenMax.set(_section05,{'background-size':'106%'});
			TweenMax.set(_section05.find('.box-btm'),{opacity:0, y:60});

			setGridResizePos();

		}

		function setGridResizePos(){
			_grid.css({left:$('.btn-gnb-wrap').offset().left});
			_gridDot01.css({left:$('.btn-gnb-wrap').offset().left -5});
			_gridDot02.css({left:$('.btn-gnb-wrap').offset().left -5});
			_gridDot03.css({left:$('.btn-gnb-wrap').offset().left -5});
			_gridDot04.css({left:$('.btn-gnb-wrap').offset().left -5});
			_gridDot05.css({left:$('.btn-gnb-wrap').offset().left -5});

			_company_grid.css({left:$('.btn-gnb-wrap').offset().left});
			_company_gridDot01.css({left:$('.btn-gnb-wrap').offset().left -5});
			_company_gridDot02.css({left:$('.btn-gnb-wrap').offset().left -5});

			$(window).on('resize', function(){
				_grid.css({left:$('.btn-gnb-wrap').offset().left});
				_gridDot01.css({left:$('.btn-gnb-wrap').offset().left -5});
				_gridDot02.css({left:$('.btn-gnb-wrap').offset().left -5});
				_gridDot03.css({left:$('.btn-gnb-wrap').offset().left -5});
				_gridDot04.css({left:$('.btn-gnb-wrap').offset().left -5});
				_gridDot05.css({left:$('.btn-gnb-wrap').offset().left -5});

				_company_grid.css({left:$('.btn-gnb-wrap').offset().left});
				_company_gridDot01.css({left:$('.btn-gnb-wrap').offset().left -5});
				_company_gridDot02.css({left:$('.btn-gnb-wrap').offset().left -5});
			})
		}

		function setScrollEvents(){
			businessAnimation();
			projectAnimation();
			newsAnimation();
			carrerAnimation();
			companyAnimation();
		}

		function businessAnimation(){
			var tl = new TimelineMax();
			tl.staggerTo([_section01.find('.box-tit'), _section01.find('.tit-desc')], 0.7, {'opacity':1, y:0, ease: Power3.easeOut}, 0.15) // title & sub title
				.to(_section01.find('.bg'), .85, {delay:-1, height:612, ease: Power3.easeOut}) // bg
				.to(_businessList, .95, {delay:-.5, y:0, opacity:1, ease: Power3.easeOut}); // object list

			var scene = new ScrollMagic.Scene({triggerElement: _section01, offset:300})
				.setTween(tl)
				.addTo(controller)
				.on('enter', function () {
					for (var i = 0; i < _animation.length; i ++) {
						(function (_i) {
							_animation[_i].goToAndStop(0, true);
							_animation[_i].play()
						})(i)
					}
				});
		}

		function projectAnimation(){

			var tl = new TimelineMax();
			tl.staggerTo([_section02.find('.box-tit'), _section02.find('.tit-desc')], 0.7, {'opacity':1, y:0, ease: Power3.easeOut}, 0.15) // title & sub title
				.to(_projectList.eq(0), 1.15, {delay:0, width:406, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(1), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(2), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(3), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(4), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(5), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(6), 1.15, {delay:-1.15, width:406, opacity:1, ease: Power4.easeOut})
				.to(_projectList.eq(7), 1.15, {delay:-1.15, width:277, opacity:1, ease: Power4.easeOut})

				.to(_projectList.find('.list-tit'), 1.05, {delay:-.4, opacity:1, ease: Power4.easeOut}) // list text
				.to(_section02.find('.bttn-more'), 1.05, {delay:-1.2, opacity:1, scale:1, ease: Power4.easeOut}); // list text

			var scene = new ScrollMagic.Scene({triggerElement: _section02, offset:_section02.offset().top -1000})
				.setTween(tl)
				.addTo(controller)
		}

		function newsAnimation(){
			var tl = new TimelineMax();
			tl.staggerTo([_section03.find('.box-tit'), _section03.find('.tit-desc')], 0.7, {'opacity':1, y:0, ease: Power3.easeOut}, 0.15) // title & sub title
				.to(_newsList, .95, {delay:-.3, y:0, opacity:1, ease: Power3.easeOut}) // list
				.to(_section03.find('.bttn-more'), 1.05, {delay:-.5, opacity:1, scale:1, ease: Power4.easeOut}); // list text

			var scene = new ScrollMagic.Scene({triggerElement: _section03, offset:_section03.offset().top -750})
				.setTween(tl)
				.addTo(controller);
		}

		function carrerAnimation(){
			_section04.find('.bttn').find('.txt01').removeAttr('style','transform');
			var tl = new TimelineMax();
			tl.staggerTo([_section04.find('.box-tit'), _section04.find('.tit-desc')], 0.7, {'opacity':1, y:0, ease: Power3.easeOut}, 0.15) // title & sub title
				.staggerTo([_carrerList.eq(0), _carrerList.eq(1), _carrerList.eq(2), _carrerList.eq(3), _carrerList.eq(4), _carrerList.eq(5), _carrerList.eq(6), _carrerList.eq(7), _carrerList.eq(8)], .95, {y:0, ease: Power3.easeOut, onComplete:function(){
					_section04.find('.txt-box').addClass('on');
				}}, 0.05) // text list
				.staggerTo([_section04.find('.bttn').eq(0), _section04.find('.bttn').eq(1)], 0.7, {opacity:1, scale:1,y:0, ease: Power3.easeOut}); // btn scale

			var scene = new ScrollMagic.Scene({triggerElement: _section04, offset:_section04.offset().top-700})
				.setTween(tl)
				.addTo(controller);
		}

		function companyAnimation(){
			var tl = new TimelineMax();
			tl.staggerTo([_section05.find('.box-tit'), _section05.find('.tit-desc')], 0.7, {'opacity':1, y:0, ease: Power3.easeOut}, 0.15) // title & sub title
			// .to(_section05, 2.5, {delay:-.5, 'background-size':'100%', ease: Power3.easeOut}) // background scale
			.to(_section05.find('.box-btm'), 1.2, {delay:-.5, y:0, opacity:1, ease: Power3.easeOut}); // list

			var scene = new ScrollMagic.Scene({triggerElement: _section05, offset:_section05.offset().top-600})
				.setTween(tl)
				.addTo(controller);
		}

		return {
			init: init
		}
	}

	//contents area Grid
	var contentsGridFunction = function(){
		var el;

		var _line01,
			_line02,
			_line03,
			_line04,
			_line05,
			_line06,
			_line07,
			_line08,
			_line09;

		function init(_el){
			el      = $(_el);
			_line01 = el.find('.grid-line').eq(0);
			_line02 = el.find('.grid-line').eq(1);

			_line03 = el.find('.grid-line').eq(2);
			_line04 = el.find('.grid-line').eq(3);
			_line05 = el.find('.grid-line').eq(4);
			_line06 = el.find('.grid-line').eq(5);
			_line07 = el.find('.grid-line').eq(6);
			_line08 = el.find('.grid-line').eq(7);
			_line09 = el.find('.grid-line').eq(8);

			setTimeout(function(){
				setGridPosition();
			},0);

			return this;
		}

		function setGridPosition(){
			//- Main Content Area
			_line01.css({
				top    : $('.main-cont-wrap').offset().top,
				height : $('.main-cont-wrap').outerHeight() - $('.company').outerHeight()
			});
			_line02.css({
				top    : $('.main-cont-wrap').offset().top,
				height : $('.main-cont-wrap').outerHeight()- $('.company').outerHeight()
			});

			_line03.css({width : $(document).innerWidth()});
			_line04.css({width : $(document).innerWidth()});
			_line05.css({width : $(document).innerWidth()});
			_line06.css({width : $(document).innerWidth()});
			_line07.css({width : $(document).innerWidth()});
			_line08.css({width : $(document).innerWidth()});
			_line09.css({width : $(document).innerWidth()});

		}

		return {
			init: init
		}
	}












































}(jQuery);

