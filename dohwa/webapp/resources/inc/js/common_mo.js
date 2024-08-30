
//jQuery.noConflict();
!function($) {
    'use strict';

    // 퍼그 하단에서 실행되는 컴포넌트 함수의 객체 생성
    window.component = new ComponentUI();

	$(function(){
        // 돔이 그려지면 그리드를 생성합니다.
        setTimeout(function () {
			visualGridFunction().init('.visual-grid-wrap');

            window.contentsGridFunction = new ContentsGridFunction();
            contentsGridFunction.init('.cnt-grid-wrap');
        }, 0)

		initUI.setup();
	});

	var initUI = (function(){
		var isLoaded;

		function setup(){
			if(isLoaded){
				return;
			}
			isLoaded = true;

			// registUI('.sample_class or #sample_id', uiSampleFunction, false);
            registUI('.header_content', headerFunc, false);
            registUI('.ui-selectbox', changeSelectCnt, false);

            registUI('.intro', introFunc, false);
            registUI('.business', businessFunc, true);
            registUI('.csr', csrFunc, false);

            //footer
            registUI('#footer', footerUiController, false);

            //overview
            registUI('.intro-overview', overviewUiController, false);

            //스크롤모션
            registUI('.visual-area', scrollAnimation, false);


            //project-view
            registUI('.bbs-img-slide', projectViewSlide, false);

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


var visualGridFunction = function(){
    var el;

    var baseLine01, baseLine02, baseLine03, baseLine04;
    var activeLine01, activeLine02, activeLine03, activeLine04;

    var setWidth, setHeight;

    function init(_el){
        el = $(_el);

        if (!$(_el)[0]) return false;

        // base lind
        baseLine01 = el.find('.grid-line').eq(0);
        baseLine02 = el.find('.grid-line').eq(1);
        baseLine03 = el.find('.grid-line').eq(2);
        baseLine04 = el.find('.grid-line').eq(3);

        // active line
        activeLine01 = el.find('.grid-line-act').eq(0);
        activeLine02 = el.find('.grid-line-act').eq(1);
        activeLine03 = el.find('.grid-line-act').eq(2);
        activeLine04 = el.find('.grid-line-act').eq(3);

        setGridPosition();
        selfCallback();
    }

    function setGridPosition() {
        setWidth = $(document).innerWidth();
        setHeight = $('body').hasClass('main') ? $('.main-visual').height() : $('.page-visual').outerHeight(true);

        // base line
        // horizontal
        baseLine01.css({width: setWidth});
        baseLine03.css({width: setWidth});
        // vertical
        baseLine02.css({height: setHeight});
        baseLine04.css({height: setHeight});

        // moved line
        // horizontal
        activeLine01.css({width: setWidth});
        activeLine03.css({width: setWidth});
        // vertical
        activeLine02.css({height: setHeight});
        activeLine04.css({height: setHeight});
    }

    function gridActiveLineAnimation(){
        var _moveWidth = setWidth,
            _moveHeight = setHeight;

        // horizontal
        TweenMax.fromTo(activeLine01, 1, {x: - _moveWidth, opacity: 1}, {x: _moveWidth, opacity: 0.2})
        TweenMax.fromTo(activeLine03, 1, {x: _moveWidth, opacity: 1}, {x: - _moveWidth, opacity: 0.2})

        // vertical
        TweenMax.fromTo(activeLine02, 1.5, {y: _moveHeight, opacity: 1}, {y: - _moveHeight, opacity: 0.2, delay: 0.3})
        TweenMax.fromTo(activeLine04, 1.5, {y: - _moveHeight, opacity: 1}, {y: _moveHeight, opacity: 0.2, delay: 0.3})
    }

    function selfCallback () {
        gridActiveLineAnimation();

        setTimeout (selfCallback, 5000);
    }

    return {
        init: init
    }
}


var ContentsGridFunction = function(){
    var el;

    var verticalLine01, verticalLine02;
    var horizontalLine01, horizontalLine02, horizontalLine03, horizontalLine04, horizontalLine05, horizontalLine06, horizontalLine07;
    var icon01, icon02;

    this.init = function (_el) {
        el = $(_el);

        if (!$(_el)[0]) return false;
        //Error 페이지의 경우 그리드 없음.
        if($('#wrap').hasClass('etc-error')) return false;

        // vertical
        verticalLine01 = el.find('.grid-line').eq(0);
        verticalLine02 = el.find('.grid-line').eq(1);

        // horizontal
        horizontalLine01 = el.find('.grid-line').eq(2);
        horizontalLine02 = el.find('.grid-line').eq(3);
        horizontalLine03 = el.find('.grid-line').eq(4);
        horizontalLine04 = el.find('.grid-line').eq(5);
        horizontalLine05 = el.find('.grid-line').eq(6);
        horizontalLine06 = el.find('.grid-line').eq(7);
        horizontalLine07 = el.find('.grid-line').eq(8);

        // icon
        icon01 = el.find('.grid-ico').eq(0);
        icon02 = el.find('.grid-ico').eq(1);
        icon03 = el.find('.grid-ico').eq(2);
        icon04 = el.find('.grid-ico').eq(3);


        setTimeout(function(){
            _setGridPosition();
        },0);

        if ($('body').hasClass('main')) return false;
        setTimeout(function(){
            _setIconPosition();
        },0)
    }

    this.reset = function () {
        _setGridPosition();

        if ($('body').hasClass('main')) return false;
        _setIconPosition();
    }

    function _setGridPosition(){
        if($('#wrap').hasClass('etc-error')) return false;
        var _setTop =  $('body').hasClass('main') ? $('.main-cont-wrap').offset().top : $('.page-visual').offset().top + $('.page-visual').outerHeight(true),
            _setHeight = $('body').hasClass('main') ? $('.main-cont-wrap').outerHeight() - $('.company').outerHeight() : $('body').height() - $('.page-visual').outerHeight(true);

        verticalLine01.css({
            top    : _setTop,
            height : _setHeight
        });
        verticalLine02.css({
            top    : _setTop,
            height : _setHeight
        });

        horizontalLine01.css({width : $(document).innerWidth()});
        horizontalLine02.css({width : $(document).innerWidth()});
        horizontalLine03.css({width : $(document).innerWidth()});
        horizontalLine04.css({width : $(document).innerWidth()});
        horizontalLine05.css({width : $(document).innerWidth()});
        horizontalLine06.css({width : $(document).innerWidth()});
        horizontalLine07.css({width : $(document).innerWidth()});
    }

    function _setIconPosition () {
        var _setBottom = $('#footer').offset().top;
        var _iconheight = $('.cnt-grid-wrap .grid-ico').height() / 2;

        icon01.css('top', $('.page-visual').offset().top + $('.page-visual').outerHeight(true) + 49 - _iconheight);
        icon02.css('top', $('.page-visual').offset().top + $('.page-visual').outerHeight(true) + 49 - _iconheight);

        icon03.css('top', $('#footer').offset().top - _iconheight);
        icon04.css('top', $('#footer').offset().top - _iconheight);
    }
}

var headerFunc = function () {
    var el

    var tab;
    var btnAllMneu, allMenu, allMenu, menuItem, menuItemBtn, itemList, dimm;

	this.init = function (_el) {
        el = $(_el);

        tab = $('.page-tab-section');

        btnAllMneu = el.find('.bttn-all-menu');
        closeAllMneu = el.find('.bttn-menu-close');
        allMenu = el.find('.header-all-menu');
        menuItem = el.find('.all-menu-item');
        menuItemBtn = menuItem.children('a');
        itemList = menuItem.find('.gnb-sub-list');
        dimm = $('.dimm');


        // init
        if ($(window).scrollTop() > 0) {
            el.addClass('on');
        } else {
            el.removeClass('on');
        }

        TweenMax.set(allMenu, {x: $(window).width()});

        checkCurrentSeo();

        setTimeout(function () {
            setTabSectionSwiper();
        }, 500)

        // scroll
        $(window).on('scroll', function(){
            var winTop = $(window).scrollTop();

            if (winTop > 0) {
                el.addClass('on');
            } else {
                el.removeClass('on');
            }

            fixedTabSection();
        });

		// control all menu
		btnAllMneu.on('click', function () {
            resetItem();
            checkCurrentSeo();
            openAllMenu();
        })
        closeAllMneu.on('click', function () {
			closeAllMenu();
        })
        $('.dimm').on('click', function () {
			closeAllMenu();
        })

        // control item in all menu
        menuItemBtn.on('click', function () {
            var _thisParent = $(this).parent('li'),
                _thisList = $(this).next('.gnb-sub-list');

            if (!_thisParent.hasClass('active')) {

                activeOnlyOneItem(_thisParent, _thisList);
            } else {
                disabledItem(_thisParent, _thisList);
            }
        })
    }

    function fixedTabSection () { // page-tab-section
        if (!tab[0]) return false;

        var _scrollTop = $(window).scrollTop();
        var _overlapTiming = $('.page-visual').offset().top + $('.page-visual').height();

        var _defaultMargin = 80;

        if (_scrollTop >= _overlapTiming) {
            tab.css({
                'top' : el.outerHeight(),
            });
            tab.addClass('on');

            if ($('.contents > .section-cont')[0]) {
                $('.contents > .section-cont').css('margin-top', _defaultMargin + tab.outerHeight(true));
                $('.tab-menu-type02').addClass('on');
                $('.financial-summary').addClass('on');

            } else {
                $('.contents').css('margin-top', tab.outerHeight(true));


            }

        } else {
            tab.css({
                'top' : 0
            });
            tab.removeClass('on');
            $('.tab-menu-type02').removeClass('on');
            $('.financial-summary').removeClass('on');
            if ($('.contents > .section-cont')[0]) {
                $('.contents > .section-cont').css('margin-top', _defaultMargin)
            } else {
                $('.contents').css('margin-top', 0)
            }
        }
    }

    function setTabSectionSwiper () {
        var swiper = new Swiper(tab.find('.swiper-container'), {
            slidesPerView: 'auto',
            centeredSlides: true,
            centeredSlidesBounds: true,
            on: {
                init : function () {
                    var _activeIndex = tab.find('.swiper-slide.active').index();

                    this.slideTo(_activeIndex);

                    if (_activeIndex >= tab.find('.swiper-slide').length - 1) {
                        tab.addClass('last');
                    } else if (_activeIndex == 0) {
                        tab.addClass('start');
                    }
                },
                reachBeginning : function () {
                    tab.addClass('start');
                },
                reachEnd : function () {
                    tab.addClass('last');
                },
                fromEdge : function () {
                    tab.removeClass('start last');
                }

            }
		});
    }

    function checkCurrentSeo () {
        var _className = $('#wrap').attr('class'),
            afterStr = _className ? _className.split(" ") : '';

        switch (afterStr[0]) {
            case 'intro':
                menuItem.eq(0).addClass('active');
                itemList.eq(0).css('display','block');

                break;
            case 'business':
                menuItem.eq(1).addClass('active');
                itemList.eq(1).css('display','block');

                break;
            case 'invest':
                menuItem.eq(2).addClass('active');
                itemList.eq(2).css('display','block');

                break;
            case 'pr':
                menuItem.eq(3).addClass('active');
                itemList.eq(3).css('display','block');

                break;
            case 'recruit':
                menuItem.eq(4).addClass('active');
                itemList.eq(4).css('display','block');

                break;
        }
    }

	function openAllMenu () {
        disabledScroll();

        allMenu.css('z-index', 999);

        TweenMax.to(allMenu, 1, {x: 0, ease: Power4.easeOut}); // CustomEase.create("custom", ".4,.31,.19,1")
        TweenMax.fromTo(dimm, 0.8, {opacity: 0, display: 'block'}, {opacity: 0.6, ease: Power4.easeOut});
	}

	function closeAllMenu () {
        activeScroll();

        TweenMax.to(allMenu, 0.8, {x: allMenu.width(), ease: Power4.easeOut});
        TweenMax.to(dimm, 0.8, {opacity: 0, display: 'none', ease: Power4.easeOut});
    }

    function activeOnlyOneItem (_thisParentItem, _thisList) {
        menuItem.removeClass('active');
        itemList.slideUp();

        _thisParentItem.addClass('active');
        _thisList.slideDown();
    }

    function disabledItem (_thisParentItem, _thisList) {
        _thisParentItem.removeClass('active');
        _thisList.slideUp();
    }

    function resetItem () {
        menuItem.removeClass('active');
        itemList.css('display','none');
    }

    function disabledScroll () {
        $('html, body').css('overflow','hidden');
    }

    function activeScroll () {
        $('html, body').removeAttr('style');
    }
}

var changeSelectCnt = function () {
    var el, selectBox;

     this.init = function (_el) {
        el = $(_el);
        selectBox = el.find('select');

        setSelectIndex();

        selectBox.on('change', function () {
            var _cnt, _actvieIndex;

            _cnt = el.find('.inner-tab-cont');
            _actvieIndex = getSelectIndex();

            _cnt.removeClass('active')
            _cnt.eq(_actvieIndex).addClass('active')

            setTimeout(function () {
                contentsGridFunction.reset();
            }, 0)
        })
    }

    function setSelectIndex () {
        var _list = selectBox.find('option');

        _list.each(function (_i) {
            $(this).attr('data-index', _i);
        })
    }

    function getSelectIndex () {
        var _target, _thisIndex;

        _target = selectBox;
        _thisIndex = _target.find('option:selected').attr('data-index');

        return _thisIndex;
    }
}

var introFunc = function () {
    var el;

    var awardSwiper, awardSwiperTarget, progressBar, playBtn;
    var licenseSwiper, licenseSwiperTarget, _licensePopUpList;

    var _isPlay, _tween;

    this.init = function (_el) {
        el = $(_el);

        awardSwiper         = [];
        awardSwiperTarget   = el.find('.award-slide .swiper-container');
        progressBar         = el.find('.paging-active');
        playBtn             = el.find('.btn-control');
		_licensePopUpList   = $('.license-slide').find('.swiper-slide a');
        licenseSwiperTarget = el.find('.license-slide .license-container');
        _isPlay = true;

        _tween;

        setProgressSwiper();
        setLicenseSwiper();
        setPopUp();

        $('.award-tab .item').on('click', function () {
            _tween.kill()
            awardSwiper[0].destroy();
            awardSwiper[1].destroy();
            setProgressSwiper();
        })

        playBtn.on('click', function(){
            if(_isPlay){
                playBtn.addClass('on');
                if(awardSwiper.length > 1){
                    awardSwiper[0].autoplay.stop();
                    awardSwiper[1].autoplay.stop();
                }else {
                    awardSwiper[0].autoplay.stop();
                }
                

                setBarState();
                _isPlay = false;
            }else if(!_isPlay){
                playBtn.removeClass('on');
                if(awardSwiper.length > 1){
                    awardSwiper[0].autoplay.start();
                    awardSwiper[1].autoplay.start();
                }else {
                    awardSwiper[0].autoplay.start();

                }
                _tween = TweenMax.fromTo(progressBar, 4, {width:0}, {width:$('.paging-bar').width(), ease: Power0.easeNone});
                _isPlay = true;
            }
        });
    }

    function setPopUp(){
        _licensePopUpList.on('click', function(e){
            e.preventDefault();
            var $listItem  = $(this).find('.img-box > img').attr('src');
            var $listTitle  = $(this).find('.line-clamp').text();

            component.modalPopUp('.dim-pop-wrap').open();
            $('.dim-pop-wrap').find('.img-box > img').attr('src', $listItem);
            $('.dim-pop-wrap').find('.dim-title .line-clamp').text($listTitle);

        })
    }

    function setBarState(){
        TweenMax.set(progressBar, {width:0});
    }

    function setProgressSwiper () {
        awardSwiperTarget.each(function (_index, _target) {
            var _thisTarget = $(_target);

            awardSwiper[_index] = new Swiper(_thisTarget,{
                observer: true,
                observeParents: true,
                observeSlideChildren:true,
                speed: 600,
                loop:true,
                autoplay: {
                    delay: 4000,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: _thisTarget.find('.paging-box'),
                    type: 'fraction',
                },
                navigation: {
                    nextEl: _thisTarget.find('.btn-next-small'),
                    prevEl: _thisTarget.find('.btn-prev-small'),
                },
                on : {
                    init : function () {
                        if(playBtn.hasClass('on')){setBarState(); return false;}

                        _tween = TweenMax.fromTo(progressBar, 4, {width:0}, {width:$('.paging-bar').width(), ease: Power0.easeNone});
                    },
                    slideChange: function(){
                        if(playBtn.hasClass('on')){setBarState(); return false;}

                        _tween = TweenMax.fromTo(progressBar, 4, {width:0}, {width:$('.paging-bar').width(), ease:
                        Power0.easeNone});

                    }
                }
            })
        })
    }

    function setLicenseSwiper () {
        licenseSwiper = new Swiper(licenseSwiperTarget, {
			slidesPerView: 'auto',
			// slidesPerColumn: 2,
            //- spaceBetween: 10,
            // slidesPerGroup: 6,
			pagination: {
				el: '.license-slide .swiper-pagination',
				type: 'fraction',
			},
			navigation: {
			    nextEl: '.license-slide .btn-next-mid',
			    prevEl: '.license-slide .btn-prev-mid',
			},
		});
    }
}

var businessFunc = function () {
    var el;

    var projectSwiper, projectSwiperTarget;

    function init(_el) {
        el = $(_el);

        projectSwiper = [];
        projectSwiperTarget = el.find('.business-project-slide');

        setLineClamp($('.inner-tab-cont.active'));
        // setProjectSwiper();

        // 셀렉트 박스
        $('.ui-selectbox select').on('change', function () {
            var _this = $(this);

            setTimeout(function () {
                // setProjectSwiper();
                setLineClamp(_this.parents('.content-inner').find('.inner-tab-cont.active'));
            }, 0);
        })

        // 물, 도시, ... 탭 버튼
        $('.business-tab-area .item').on('click', function () {
            setTimeout(function () {
                // setProjectSwiper();
                setLineClamp($('.business-tab-cont.active .inner-tab-cont.active'));
            }, 0);
            // projectSwiper[$(this).index()].slideToLoop(0);
        })

        // 더보기 버튼
        $('.bttn-link-bd').on('click', function () {
            $('.inner-tab-cont.active .business-detail-txt').removeClass('active-line-clamp').addClass('on')
        });

        return this;
    }

    function initCategoryIndex($index){
        setTimeout(function () {
            // setProjectSwiper();

            setLineClamp($('.business-tab-cont.active .inner-tab-cont.active'));
        }, 0);

        $('.tab-list-2depth').find('li').removeClass('active');
        $('.tab-list-2depth').find('li').eq($index).addClass('active');

        $('.business-tab-cont').hide();
        $('.business-tab-cont').eq($index).show();
    }

    function setProjectSwiper () {
        destroySwiper(projectSwiper);

        projectSwiperTarget.each(function (_index, _target) {
            var _thisTarget = $(_target);

            projectSwiper[_index] = new Swiper(_thisTarget,{
                slidesPerView: 'auto',
                initialSlide: 0,
            });
            setTimeout(function(){
                projectSwiper[_index].slideToLoop(0);
            },1700);
        });

    }

    function destroySwiper () {
        if (projectSwiper.length > 0) {
            for (var _i = 0; _i < projectSwiper.length; _i ++) {
                projectSwiper[_i].destroy();
            }
        }
    }

    function compareHeight (txtBoxHeight, lineClampHeight) {
        var _bool;

        if (lineClampHeight > txtBoxHeight) {
            _bool = true;
        } else {
            _bool = false;
        }

        return _bool;
    }

    function setLineClamp (target) {
        var _businessDetailTxt, _txtBoxHeight, _lineClampHeight, _checkHeight;

        _businessDetailTxt = target.find('.business-detail-txt');

        // init
        _businessDetailTxt.removeClass('active-line-clamp on');

        _txtBoxHeight = _businessDetailTxt.find('.txt-box').height();
        _lineClampHeight = _businessDetailTxt.find('.line-clamp').height() - 1;
        _checkHeight = compareHeight(_txtBoxHeight, _lineClampHeight);

        if (_checkHeight) {
            _businessDetailTxt.addClass('active-line-clamp');
        } else {
            _businessDetailTxt.removeClass('active-line-clamp');
        }
    }

    return  {
        init: init,
        initCategoryIndex: initCategoryIndex
    }

}

var footerUiController = function(){
    var el;
	var _topBtn;


    function init(_el){
        el      = $(_el);
        _topBtn = el.find('.btn-top');

        setEvents();
        setFamilyBox();

        return this;
    }

    function setFamilyBox(){
        var component = new ComponentUI();
        component.selectBox('.family-btn', 150);
    }

    function setEvents(){
        _topBtn.on('click', function(){
            goTopController();
        })
    }

    function goTopController(){
        TweenMax.to($('html, body'), 1.4, {scrollTop:0, ease: Power3.easeOut});
    }

    return {
        init: init
    }
}

var csrFunc = function(){
    var el;
    var _licensePopUpList;

    function init(_el){
        el                  = $(_el);
        _licensePopUpList   = $('.license-item');

        setPopUp();
        setCsrImages();
        setCsrFundImages();

        return this;
    }

    function setPopUp(){
        _licensePopUpList.on('click', function(e){
            e.preventDefault();
            var $listItem  = $(this).find('.img-box > img').attr('src');
            var $listTitle  = $(this).find('.info-name').text();

            component.modalPopUp('.dim-pop-wrap').open();
            $('.dim-pop-wrap').find('.img-box > img').attr('src', $listItem);
            $('.dim-pop-wrap').find('.dim-title .line-clamp').text($listTitle);

        })
    }

    function setCsrFundImages(){
        if($('html').attr('lang') == 'en'){
            $('.fund-box').children().remove();
            $('.fund-box').append("<img src='/images/mobile/img_csr_fundbox_en.png' alt='' style='width:100%'/>")
        }else if($('html').attr('lang') == 'es'){
            $('.fund-box').children().remove();
            $('.fund-box').append("<img src='/images/mobile/img_csr_fundbox_es.jpg' alt='' style='width:100%'/>")
        }
    }

    function setCsrImages(){
        if($('html').attr('lang') == 'en'){
            $('.csr-diagram').find('img').attr('src', '/images/mobile/img_csr_diagram_en.png');
        }else if($('html').attr('lang') == 'es'){
            $('.csr-diagram').find('img').attr('src', '/images/mobile/img_csr_diagram_es.jpg');
        }
    }

    return {
        init:init
    }
}

var overviewUiController = function(){
    var el;
    var _countIndex = 0,
        _timeout;

    function init(_el){
        el = $(_el);

        setScroll();

        return this;
    }

    function setScroll(){
        $(document).on('scroll', function(){
            var $scrollTop = $(window).scrollTop();

            if($scrollTop > $('.company-status').offset().top){
                if($('.company-status').hasClass('count')) return false;
                $('.company-status').addClass('count');
                section03();
            }
            // else if($scrollTop < $('.company-status').offset().top){
            //     $('.company-status').removeClass('count');
            // }
        })
    }

    function section03 () {
        // count
        var options = {
            useEasing: false,
            easingFn: function (t, b, c, d) {
                    var ts = (t /= d) * t;
                    var tc = ts * t;
                    return b + c * (tc + -3 * ts + 3 * t);
            },
            useGrouping: true,
            separator: ',',
            decimal: ''
        }

        new CountUp("capital_ko", 0, 5750 /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
		new CountUp("proceeds_ko", 0, 207 /*최종 값*/, 0 /*소수점 자리*/, 0.8 /*애니메이션 시간*/, options).start();
		new CountUp("capital", 0, 420.2 /*최종 값*/, 1 /*소수점 자리*/, 0.8 /*애니메이션 시간*/,".", options).start();
		new CountUp("proceeds", 0,1.5 /*최종 값*/, 1 /*소수점 자리*/, 0.8 /*애니메이션 시간*/,".", options).start();

        $('.ani.creditNum span').css('opacity','0');

        _countUp($('.ani.creditNum span').eq(0), ['A', 'B', 'C', 'D']);


        setTimeout(function () {
            clearTimeout(_timeout);
            $('.ani.creditNum span').eq(0).text('A');

            $('.ani.creditNum span').eq(1).fadeIn();
            _countUp($('.ani.creditNum span').eq(1), ['1', '2', '3','4','5','6','7','8','9']);

            setTimeout(function () {
                clearTimeout(_timeout);
                $('.ani.creditNum span').eq(1).text('2');
            }, 500)

            setTimeout(function () {
                TweenMax.to($('.ani.creditNum span').eq(2), 0.4, {opacity: 1});
            }, 500)
        }, 500)
    }

    function _countUp (target, arr, i) {
        TweenMax.to(target, 0.4, {opacity: 1});

        if (_countIndex >= arr.length) _countIndex = 0;

        target.text(arr[_countIndex]);

        _countIndex ++

        _timeout = setTimeout(function () {
            _countUp(target, arr);
        }, 50)
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
        TweenMax.fromTo(_line01, .7, {y:15}, {y:0, yoyo:true, repeat:-1, ease: Circ.easeOut});
        // TweenMax.fromTo(_line02, .7, {height:75}, {height:60, yoyo:true, repeat:-1, ease: Circ.easeOut});
    }

    return {
        init: init
    }
}

var projectViewSlide = function(){
    var el;

    function init(_el){
        el = $(_el);

        setSwiper();


        return this;
    }

    function setSwiper(){
        if($('.bbs-img-slide').find('.swiper-slide').length < 2){
            el.find('.swiper-pagination').hide();

            return false;
		}
		var projectSwiper = new Swiper('.bbs-img-slide', {
			slidesPerView: 1,
			slidesPerView: 'auto',
			pagination: {
				el: '.bbs-img-slide .swiper-pagination',
			},
		});
    }

    return {
        init: init
    }
}