var HistoryUI = function(){
    var _this = $(this);

    var _list,
        _backBtn,
        _backBtn2,
        _anchorBtn;

    var _listLength,
        _listWidth,
        _zIndex;

    var init = function(){

        _list      = $('.history-select-item .history-anchor');
        _backBtn   = $('.history-back-btn');
        _backBtn2  = $('.history-back-btn2');
        _anchorBtn = $('.progress-anchor');
        _zIndex    = 20;

        setTween();
        setList();
        setScrollEvents();
        $('body').css('overflow','hidden');
        
        return this;
    }

    function setScrollEvents(){
        $(window).on('mousewheel DOMMouseScroll', function(e, delta){
            var wheelDelta = e.originalEvent.deltaY;
            if(wheelDelta > 0){
                $('.history-container').addClass('fix');
                TweenMax.to($('.history-container'), 1.2, {top:0, ease: Power3.easeOut});
                TweenMax.to(_list.find('.title-main'), 1.2, {delay:.5, opacity:1, y:0, ease: Power3.easeOut});
                TweenMax.to(_list.find('.txt'), 1.2, {delay:.6, opacity:1, y:0, ease: Power3.easeOut});
                // $('body').css('overflow','hidden');
            }else{
                TweenMax.to($('.history-container'), 1.2, {top:1080, ease: Power3.easeOut, onComplete:function(){
                    $('.history-container').removeClass('fix');
                    // $('body').css('overflow-y','visible');
                }});
            }
        });
    }

    function setPosInit(){
        $('.history-container').addClass('fix');
        TweenMax.to($('.history-container'), 1.2, {top:0, ease: Power3.easeOut});
        TweenMax.to(_list.find('.title-main'), 1.2, {delay:.5, opacity:1, y:0, ease: Power3.easeOut});
        TweenMax.to(_list.find('.txt'), 1.2, {delay:.6, opacity:1, y:0, ease: Power3.easeOut});
        
        $('body').css('overflow','hidden');
    }

    function setTween(){
        TweenMax.set(_list.find('.title-main'), {opacity:0, y:50});
        TweenMax.set(_list.find('.txt'), {opacity:0, y:50});
        TweenMax.set(_list.parent().find('.history-back-btn'), {opacity:0});
        TweenMax.set(_list.find('.ico-arrow-right'), {opacity:0, x:30});
    }

    function setList(){
        _list.parent().parent().removeClass('active');

        _list.on('click', function(){
            setHistoryList($(this).parent().parent().index());
        });

        //history container top 값 초기화
        $('.history-container').css({top: $('.visual-area').outerHeight()});

        //뒤로가기 버튼
        _backBtn.on('click', function(){
            resetHistoryList($(this).parent().parent().index());
            setScrollEvents();
        });

        _backBtn2.on('click', function(){
            _backBtn.trigger('click');
        });

        //하단 프로그래스 바
        _anchorBtn.on('click', function(e){
            // e.preventDefault();
            if($(this).hasClass('active')) return false;

            $(window).off('mousewheel DOMMouseScroll');
            TweenMax.to($('.progress-anchor').eq($(this).index()).find('.bar'), 0.01, {opacity:0});
            _anchorBtn.removeClass('active');
            $(this).addClass('active');
            // $('.detail-list').scrollLeft(0);

            $('.progress-wrap').addClass('on');
            _list.parent().parent().off('mousewheel DOMMouseScroll');    
            _zIndex ++;
            TweenMax.fromTo($('.history-detail').eq($(this).index()), 1, {
                left:'100%',
                'z-index': _zIndex,
                ease: Power3.easeOut
            },{
                left:0,
                ease: Power3.easeOut,
                onComplete:function(){
                    $('.detail-list').scrollLeft(0);
                }
            });
            
            setHistoryList($(this).index());
        });
        
    }
    //슬라이드 초기화
    function resetHistoryList($index){
        _list.parent().parent().removeClass('active');
        $('.progress-wrap').removeClass('on');
        $('.progress-anchor').removeClass('active');
        $('.progress-anchor').find('.bar').css({'width':0});
        TweenMax.to($('.progress-wrap'), 1, {delay:0, bottom:-101, 'display':'none', ease: Power3.easeOut});
        TweenMax.to($('.history-detail'), 1.3, {left:'100%', ease: Power3.easeOut, onComplete:function(){
            $('.detail-list').scrollLeft(0);
        }});
        TweenMax.to(_backBtn, .3, {opacity:0, display:'none', ease: Power3.easeOut});
        TweenMax.set(_list.parent().find('.history-back-btn'), {opacity:0});
        _list.parent().parent().off('mousewheel DOMMouseScroll');

        switch($index) {
            case 0 :
                TweenMax.to(_list.parent().parent().eq($index), 1.2, {top:'0', height:'33.33%', ease: Power3.easeOut});
                break;
            case 1 :
                TweenMax.to(_list.parent().parent().eq($index), 1.2, {top:'33.33%', height:'33.33%', ease: Power3.easeOut});
                break;
            case 2 :
                TweenMax.to(_list.parent().parent().eq($index), 1.2, {top:'auto', bottom:'0', height:'33.33%', ease: Power3.easeOut});
                break;

        }

    }

    function setHistoryList($index){
        
        _list.parent().parent().eq($index).addClass('active');
        $('.progress-anchor').removeClass('active');
        $('.progress-anchor').eq($index).addClass('active');
        $('.bar').width(0);
        
        TweenMax.to(_list.parent().find('.history-back-btn'), 1.2, {delay:4, opacity:1, ease: Power3.easeOut});
        TweenMax.fromTo(_list.parent().parent().eq($index).find('.ico-arrow-right'), 1.2, {opacity:0, x:30},{delay:1.5, opacity:1, x:60, ease: Power3.easeOut});
 
        TweenMax.to(_list.parent().parent().eq($index), 1.2, {top:0, height:'100vh', ease: Power3.easeOut})
        TweenMax.to($('.progress-wrap'), 1.2, {delay:.5, bottom:0, 'display':'block', ease: Power3.easeOut});
        TweenMax.to(_list.parent().parent().eq($index).find(_backBtn), 1.2, {opacity:1, display:'block', ease: Power3.easeOut});
        
        setTimeout(function(){
            if($index == 0) {
                $('.progress-anchor').eq(0).find('.bar').css({'width':0});
                $('.progress-anchor').eq(1).find('.bar').css({'width':0});
                $('.progress-anchor').eq(2).find('.bar').css({'width':0});
            }else if($index == 1){
                $('.progress-anchor').eq(0).find('.bar').css({'width':'100%'});
                $('.progress-anchor').eq(1).find('.bar').css({'width':0});
                $('.progress-anchor').eq(2).find('.bar').css({'width':0});
            }else if($index == 2){
                $('.progress-anchor').eq(0).find('.bar').css({'width':'100%'});
                $('.progress-anchor').eq(1).find('.bar').css({'width':'100%'});
                $('.progress-anchor').eq(2).find('.bar').css({'width':0});
            }
        },0)
        
        
        _list.parent().parent().eq($index).on('mousewheel DOMMouseScroll', function(e, delta){
            var wheelDelta = e.originalEvent.wheelDelta;
            $(window).off('mousewheel DOMMouseScroll');
            if(wheelDelta > 0){
                // console.log('up');
                
            }else{
                _listLength = $('.history-detail').eq($index).find('.detail-anchor').length;
                _listWidth = $('.history-detail').eq($index).find('.detail-anchor').eq(0).outerWidth(true) * _listLength;
                // var $per = ($(this).scrollLeft() + $(this).width()) / _listWidth * 100;

                TweenMax.to($('.history-detail').eq($index), 1.7, {left:0, ease: Power3.easeOut});
                $('.progress-wrap').addClass('on');
            };    
        });
        
        // 연혁 스크롤시 좌측에서 나타남
        $('.detail-list').mousewheel(function(e, delta){
            TweenMax.to($(this), 1.2, {scrollLeft:'-=' + (delta * 500) + 'px', ease: Power3.easeOut});
            e.preventDefault();
        });
        
        //연혁 스크롤 영역
        $('.detail-list').off('scroll').on('scroll', function(){
            // $(window).off('mousewheel DOMMouseScroll');
            TweenMax.to($('.progress-anchor').eq($index).find('.bar'), .4, {delay:1, opacity:1});
            _listLength = $(this).find('.detail-anchor').length;
            _listWidth = $(this).find('.detail-anchor').eq(0).width() * _listLength;
            var $per = ($(this).scrollLeft()) / _listWidth * 100;
            // console.log('percent!! : ' + $per);
            
            $('.progress-anchor').eq($index).find('.bar').width(
                $('.progress-anchor').eq($index).find('.progress-line').width() * $per / 100
            );
            
            // if($per >= 100){
            //     $per = 0;
                
            //     $index ++;
            //     _zIndex++;
            //     TweenMax.fromTo($('.history-detail').eq($index), 1.2, {
            //         left:'100%',
            //         'z-index': _zIndex,
            //         ease: Power3.easeOut
            //     },{
            //         left:0,
            //         ease: Power3.easeOut
            //     });
            //     $('.progress-anchor').removeClass('active');
            //     $('.progress-anchor').eq($index).addClass('active');
            //     if($index > 2){
            //         $index = 2;
            //         $('.progress-anchor').eq($index).addClass('active');
            //     }
            // }
        });
    }


    return {
        init: init(),
        setHistoryList: setHistoryList,
        setPosInit: setPosInit
    }
}