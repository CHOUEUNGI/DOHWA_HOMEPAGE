var HistoryUI = function(){
    var _this = $(this);

    var _listContainer,
        _visualContainer;

    var _containerList,
        _list,
        _anchorList,
        _anchorBtn,
        _detailContainer,
        _backBtn,
        _backBtn2,
        _progress;

    var _listLength,
        _listWidth,
        _zIndex;

    var curentPos;

    var init = function(){

        _visualContainer = $('.page-visual.intro04');
        _listContainer   = $('.history-container');
        _containerList   = $('.history-select-item');
        _anchorList      = $('.history-container').find('.history-anchor');
        _list            = $('.history-select-item .history-anchor');
        _detailContainer = $('.history-detail');
        _backBtn         = $('.history-back-btn');
        _backBtn2        = $('.history-back-btn2');
        _progress        = $('.progress-wrap');
        _anchorBtn       = _progress.find('.progress-anchor');

        _zIndex    = 89;
        $('.cnt-grid-wrap').hide();

        setTween();
        setEvents();
        setTouchEvents();
        historyTouchEvents();
        
        return this;
    }

    function setEvents(){
        _anchorList.on('click', function(e){
            $('#content').off('touchstart touchend');
            if($(this).parent().parent().hasClass('on')){
                return false;
            }
            var $idx = $(this).parent().parent().index();
            setTimeout(function(){
                anchorListTouchEvents( $idx );
                setHistoryList( $idx );
            },0);
        });

        _backBtn.on('click', function(){
            setTouchEvents();
            resetHistoryList( $(this).parent().parent().index() );
        });

        _backBtn2.on('click', function(){
            _anchorList.off('touchstart touchend');
            _backBtn.trigger('click');
        });

        //하단 프로그래스 바
        _anchorBtn.on('click', function(e){
            e.preventDefault();
            TweenMax.to($('.progress-anchor').eq($(this).index()).find('.bar'), 0, {opacity:0});
            
            if($(this).hasClass('active')) return false;
            _anchorBtn.removeClass('active');
            $(this).addClass('active');
            $('.detail-list').scrollLeft(0);
            $('.progress-wrap').addClass('on');
            $('.progress-anchor').find('.bar').width(0);
            _list.parent().parent().off('mousewheel DOMMouseScroll');    
            _zIndex ++;
            TweenMax.fromTo($('.history-detail').eq($(this).index()), 1.2, {
                left:'100%',
                'z-index': _zIndex,
                ease: Power3.easeOut
            },{
                left:0,
                ease: Power3.easeOut
            });
    
            setHistoryList($(this).index());
        });
    }

    function resetHistoryList($index){
        _backBtn.hide();
        $('.ico-arrow-right').hide();
        _progress.removeClass('on');
        TweenMax.to(_progress, 1, {display:'none', bottom:-_progress.outerHeight(), ease: Power3.easeOut});
        TweenMax.to(_detailContainer.eq($index), 1, {left:'100%', ease: Power3.easeOut, onComplete:function(){
            $('.detail-list').scrollLeft(0);
        }});
        TweenMax.to(_progress, .5, {display:'none', bottom:- _progress.outerHeight(), ease: Power3.easeOut});
        
        TweenMax.fromTo(_anchorList.eq($index).find('.title-main'), 1, 
        {
            opacity:0, y:20, onComplete:function(){
                _containerList.eq($index).removeClass('on');
            }
        },
        { 
            delay:.1, opacity:1, y:0, ease:Power3.easeOut
        });
        TweenMax.fromTo(_anchorList.eq($index).find('.txt'), 1, 
        {
            opacity:0, y:20
        },
        {
            delay:.15, opacity:1, y:0, ease:Power3.easeOut
        });
        switch($index){
            case 0 :
                TweenMax.to(_containerList.eq($index), 1, {top:0, height:'33.33%', ease: Power3.easeOut});
                break;
            case 1 :
                TweenMax.to(_containerList.eq($index), 1, {top:'33.33%', height:'33.33%', ease: Power3.easeOut});
                break;
            case 2 :
                TweenMax.to(_containerList.eq($index), 1, {bottom:0, top:'auto', height:'33.33%', ease: Power3.easeOut});
                break;
        }
    }

    function setHistoryList($index){
        _containerList.css('z-index','1');
        _containerList.eq($index).css('z-index','10');
        if($('.history-container').hasClass('on')){
            TweenMax.to(_progress, 1, {display:'block', bottom:0, ease: Power3.easeOut});

        }
        // TweenMax.fromTo(_progress, 1, {
        //     display:'none', bottom: - _progress.outerHeight(), ease: Power3.easeOut
        // },{
        //     display: 'block', bottom: 0, ease: Power3.easeOut
        // });

        TweenMax.to(_containerList, .8, {height:'33.33%', ease: Power3.easeOut});
        TweenMax.to(_containerList.eq($index), .8, {top:0, height:'100%', ease: Power3.easeOut, onComplete:function(){
            TweenMax.fromTo(_containerList.eq($index).find('.history-back-btn'), 1.2, 
            {
                opacity:0, x:20, 'display':'block'
            },
            {
                delay:-.02, opacity:1, x:0, ease: Power3.easeOut
            });
            TweenMax.fromTo(_containerList.eq($index).find('.ico-arrow-right'), 1.2, 
            {
                opacity:0, x:-10, display:'block', ease: Power3.easeOut
            },
            {
                delay:.3,opacity:1, x:'-50%', ease: Power3.easeOut
            });
        }});

        // anchor 클릭시 텍스트 크게
        TweenMax.fromTo(_anchorList.eq($index).find('.title-main'), 1.2, 
        {
            opacity:0, y:20, display:'none', onComplete:function(){
                _containerList.eq($index).addClass('on');
            }
        },
        { 
            delay:0.6, opacity:1, y:0, display:'block', ease:Power3.easeOut
        });
        TweenMax.fromTo(_anchorList.eq($index).find('.txt'), 1.2, 
        {
            opacity:0, y:20, display:'none'
        },
    {
            delay:0.65, opacity:1, y:0, display:'block', ease:Power3.easeOut
        });

        // _list.parent().parent().eq($index).addClass('active');
        $('.progress-anchor').removeClass('active');
        $('.progress-anchor').eq($index).addClass('active');

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

        //연혁 스크롤 영역
        $('.detail-list').off('scroll').on('scroll', function(){
            TweenMax.to($('.progress-anchor').eq($index).find('.bar'), 0, {delay:1, opacity:1});
            _listLength = $('.history-detail').eq($index).find('.detail-anchor').length;
            _listWidth = $('.history-detail').eq($index).find('.detail-anchor').eq(0).outerWidth(true) * _listLength;
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

    function setTween(){
        TweenMax.set(_visualContainer, {height:$(window).innerHeight()});
        TweenMax.set(_listContainer, {height:$(window).innerHeight()});

        TweenMax.to(_anchorList.find('.title-main'), 1.2, {opacity:0, y:50, ease: Power3.easeOut});
        TweenMax.to(_anchorList.find('.txt'), 1.2, {delay:.4, opacity:0, y:50, ease: Power3.easeOut});
    }

    function setTouchEvents(){
        var startX,
            startY,
            endX,
            endY;
        $('#content').on('touchstart', function(e){
           startX = e.originalEvent.changedTouches[0].screenX;
           startY = e.originalEvent.changedTouches[0].screenY;
        });

        $('#content').on('touchend', function(e){
            endX = e.originalEvent.changedTouches[0].screenX;
            endY = e.originalEvent.changedTouches[0].screenY;
            // console.log('startY : ' + startY);
            // console.log('endY : ' + endY);
            currentPos = startY - endY;
            console.log(currentPos);
            // alert(currentPos);            
            if(currentPos > 50){
                console.log('up');
                // $(this).off('touchstart touchend');
                setPosInit(true);
                _listContainer.addClass('on');
            }else if(currentPos > 10  && currentPos < 10){
                console.log('!!!!!!');
                // $('#content').off('touchstart touchend');
            }else if(currentPos < -50){
                console.log('down');
                // alert('down!!')
                _anchorList.off('touchstart touchend')
                setPosInit(false);
                _listContainer.removeClass('on');
                TweenMax.to(_detailContainer, 1, {left:'100%'});

            }
        });
    }

    function historyTouchEvents(){
        var startY,
            endY;

        _detailContainer.on('touchstart', function(e){
            $('#content').off('touchstart touchend');
            startY = e.originalEvent.changedTouches[0].screenY;
        });

        _detailContainer.on('touchend', function(e){
            $('#content').off('touchstart touchend');
            endY = e.originalEvent.changedTouches[0].screenY;
            
            if(startY - endY > 100){
                console.log('history up');
            }else if(startY == endY){
                // $(this).off('touchstart touchend');
                
            }else if(startY - endY < 100){
                console.log('history down');
            }
        });
    }

    function anchorListTouchEvents($index){
        var startY,
            endY;

        _anchorList.eq($index).on('touchstart', function(e){
            startY = e.originalEvent.changedTouches[0].screenY;
        });

        _anchorList.eq($index).on('touchend', function(e){
            endY = e.originalEvent.changedTouches[0].screenY;
            
            if(startY - endY > 100){
                console.log('anchor up');
                
            }else if(startY == endY){
                console.log(24244);
                // $(this).off('touchstart touchend');
            }else if(startY - endY < 100){
                console.log('anchor down');
                setDetailList($index);
            }
        });
    }

    //스크롤 영역 나타내기
    function setDetailList($index){
        TweenMax.fromTo(_detailContainer.eq($index), 1, {
            left:'100%', onComplete:function(){
                _progress.removeClass('on');
            }
        },
        {
            left:0, ease: Power3.easeOut, onComplete:function(){
                _progress.addClass('on');
            }
        });
    }

    function setPosInit($check){
        if($check){
            TweenMax.to(_listContainer, .8, {top:0, ease: Power3.easeOut});
            TweenMax.to(_anchorList.find('.title-main'), 1.2, {delay:.4, opacity:1, y:0, ease: Power3.easeOut});
            TweenMax.to(_anchorList.find('.txt'), 1.2, {delay:.6, opacity:1, y:0, ease: Power3.easeOut});
            $check = false;
        }else if(!$check){
            TweenMax.to(_listContainer, .8, {top:'100%', ease: Power3.easeOut});
            TweenMax.to(_anchorList.find('.title-main'), 1.2, {opacity:0, y:50, ease: Power3.easeOut});
            TweenMax.to(_anchorList.find('.txt'), 1.2, {opacity:0, y:50, ease: Power3.easeOut});
            $check = true;
        }
    }



    return {
        init: init(),
    }
}