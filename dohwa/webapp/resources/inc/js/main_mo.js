
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

            // registUI('.sample_class', uiSampleFunction, false);

            //Main Visual Swiper
            registUI('.main-visual', mainVisualSwiperController, false);


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
}(jQuery);

var mainVisualSwiperController = function(){
    var el;

    var _swiper,
        _swiperContainer,
        _slideList,
        _slideTextList,
        _slideImg;
    
    var _timer;

    var _index = 0;
    var _idx = 1;

    function init(_el){
        el = $(_el);
        _swiperContainer = el.find('.main-slide');
        _slideList       = _swiperContainer.find('.swiper-slide');
        _slideTextList   = _slideList.find('.txt-list');
        _slideImg        = _slideList.find('.img-box');
        
        setTween();
        setSwiper();

        
        return this;
    }

    function setTween(){
        // setTimeout(function(){
        //     TweenMax.set(_slideTextList.eq(0), {opacity:1, y:0});
        // },0);
        TweenMax.set(_slideTextList, {opacity:0});
        TweenMax.set(_slideImg, {opacity:0});
        // slideMotionControl();
    }

    function setSwiper(){

        _swiper = new Swiper(_swiperContainer, {
            speed:600,
            slidesPerView: 'auto',
            loop:true,
            navigation: {
                nextEl: _swiperContainer.find(".swiper-button-next"),
                prevEl: _swiperContainer.find(".swiper-button-prev")
            },
            on: {
                init : function () {
                    TweenMax.fromTo(_swiperContainer.find(".swiper-button-next"), .8, {x: 20, 'opacity': 0}, {x: 0, 'opacity': 1, delay: .5});
                    TweenMax.fromTo(_swiperContainer.find(".swiper-button-prev"), .8, {x: - 20, 'opacity': 0}, {x: 0, 'opacity': 1, delay: .5});
                },
                slideChangeTransitionStart : function (e) {
                    setTimeout(function(){
                        TweenMax.fromTo($('.swiper-slide-active').find('.txt-list').eq(0), .8, {opacity:0, y:30},{
                            delay:.3, opacity:1, y:0
                        });
                        TweenMax.fromTo($('.swiper-slide-active').find('.img-box').eq(0), .8, {opacity:0},{
                            opacity:1
                        });
                        TweenMax.fromTo($('.swiper-slide-active').find('.btn-wrap'), .8, {opacity:0},{
                            delay:.3, opacity:1
                        });
                    },0);
                    
                    clearTimeout(_timer);
                    slideMotionControl();
                    _idx = 1;
                }
            }
        });
    }

    function slideMotionControl(){
        _timer = setInterval(function(){
            if($('.swiper-slide-active').find('.img-box').length == 1){
                clearInterval(_timer);
                return false;
            }
            TweenMax.to($('.swiper-slide-active').find('.img-box').eq(_idx-1), .8, {
                opacity:0, 'z-index':1
            });
            TweenMax.to($('.swiper-slide-active').find('.img-box').eq(_idx), .8, {
                opacity:1, 'z-index':2
            });
            TweenMax.to($('.swiper-slide-active').find('.txt-list').eq(_idx-1), .8, 
            {
                opacity:0
            });
            TweenMax.to($('.swiper-slide-active').find('.txt-list').eq(_idx), .8, 
            {
                delay:.3, opacity:1
            });

            _idx ++;
            if(_idx > $('.swiper-slide-active').find('.img-box').length -1){
                _idx = 0;
            }
            
        },5000);
    }

    return {
        init: init
    }
}

var sectionMotionFunc = (function () {
    var el, scrollTop;

    (function init () {
        el = $('.main-cont-box');

        scrollTop = $(window).scrollTop();

        el.each(function (_idx) {
            var _target = el.eq(_idx),
                _tit = _target.find('.ui-tit'),
                _subTit = _target.find('.ui-sub-tit'),
                _targetTop = _target.offset().top - ( $(window).height() - 300);

            _initMotion(_target, _tit, _subTit);

            if(scrollTop > _targetTop){
                _scrollMotion(_target, _tit, _subTit);
            }
        })

        $(window).on('scroll', function () {
            scrollTop = $(window).scrollTop();

            el.each(function (_idx) {
                var _target = el.eq(_idx),
                    _tit = _target.find('.ui-tit'),
                    _subTit = _target.find('.ui-sub-tit'),
                    _targetTop = _target.offset().top - ( $(window).height() - 300);

                if(scrollTop > _targetTop){
                    _scrollMotion(_target, _tit, _subTit);
                }
            })
        })
    })();

    function _initMotion (el, tit, subTit) {
        TweenMax.set(tit, {y: 30, 'opacity': 0});
        TweenMax.set(subTit, {y: 30, 'opacity': 0});
        TweenMax.set(el.find('.swiper-container'), {y: 30, 'opacity': 0});

        TweenMax.set(el.find('.ui-cont'), {y: 30, 'opacity': 0});

        TweenMax.set(el.find('.bttn-more'), {scale: 0.5, 'opacity': 0});

        el.find('.box-inner').css('display','block');
    }

    function _scrollMotion (el, tit, subTit) {
        if (el.hasClass('business')) {
            el.addClass('enter');

        } else if (el.hasClass('carrer')) {
            el.find('.txt-box').addClass('on');
        } else {
            TweenMax.to(el.find('.bttn-more'), .5, {scale: 1, 'opacity': 1, delay: 1});
        }

        setTimeout(function () {
            TweenMax.to(tit, .8, {y: 0, 'opacity': 1});
            TweenMax.to(subTit, .8, {y: 0, 'opacity': 1, delay: 0.2});
            TweenMax.to(el.find('.swiper-container'), .8, {y: 0, 'opacity': 1, delay: 0.35});

            TweenMax.to(el.find('.ui-cont'), .8, {y: 0, 'opacity': 1, delay: 0.35});
        }, 300)
    }
})()
