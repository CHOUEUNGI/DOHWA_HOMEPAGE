
var ComponentUI = function(){
    var _this = $(this);

    //- selectBox index
    var _index = 0;


    //Design SelectBox Component
    this.selectBox = function(_el, _duration){
        var _el,
            _target;

        var _check,
            _idx;

        function init(){
            _el     = $(_el);
            _target = _el.next().children();
            _check  = true;
            _idx = 0;

            setEvents();
            setTargetEvents();

        };

        // Click Events
        function setEvents(){

            _el.on('click', function(e){
                e.stopPropagation();

                // 버튼 비활성화 : button data-state="disabled"
                if( _el.data('state') == 'disabled' ){
                    return false;
                }

                if(_check){
                    setState(true, _duration);
                }else if(!_check){
                    setState(false, _duration);
                }
            });

            $(document).on('click', function(e){
                if(!$(e.target).hasClass('open')){
                    setState(false, _duration);
                }
            });

        };

        // SelectList Events
        function setTargetEvents(){
            _target.attr('tabindex', 0);

            _target.each(function(index, item){
                $(item).attr('data-index', index);
                $(item).attr('data-value', $(item).children().text());
            });



            _target.on('click', function(e){
                e.preventDefault();
                _index = $(this).index();

                setIndex(_index);
                setState(false, _duration);

            });

            _el.parent().keydown(function(e){
                if(e.keyCode == '40'){
                    _target.eq(_idx).focus();
                    _idx ++;
                    if(_idx > _target.length){
                        _target.eq(0).focus();
                        _idx = 1;
                    }
                    console.log(_idx);

                }
            });
            _el.parent().keyup(function(e){
                if(e.keyCode == '38'){
                    _target.eq(_idx).focus();
                    _idx --;
                    if(_idx < 0){
                        _target.eq(_target.length).focus();
                        _idx = _target.length-1;
                    }
                    console.log(_idx);

                }
            })
        }

        // 셀렉트 박스 Active, deActive
        function setState($check, $duration){
            _check = $check;

            if($check == true){
                _el.addClass('open');
                _el.next().stop().slideDown($duration);
                _el.next().attr('data-state', 'active');

                _check = false;

            }else if($check == false){
                _el.removeClass('open');
                _el.next().stop().slideUp($duration);
                _el.next().attr('data-state', '');

                _check = true;

            }
        };

        //getter & setter
        function getIndex(){
            return _index;
        }

        function setIndex($index){
            return _el.children().text( _target.eq($index).attr('data-value') );
        };

        // 셀렉트 박스 리셋
        function resetState(){
            setState(false, _duration);
            setTargetEvents();

            _el.children().text( _el.attr('data-default') );
        };


        return {
            init: init(),
            getIndex: getIndex,
            setIndex: setIndex,
            resetState: resetState
        }
    };

    this.tabContent = function(_el, _contents, _callback){
        var _el,
            _elList,
            _contents;

        var _index = 0;

        function init(){
            _el       = $(_el);
            _contents = $(_contents);
            _elList   = _el.children();

            // if(_check){
            //     // console.log(11);
            //     setNativeSelectBoxUI();
            // }else if(!_check){
            //     // console.log(222);
            // }

            setState();
            setEvents(_callback);

        }

        function setNativeSelectBoxUI(){
            console.log('native SelectBox!!!');

        }

        function setState(){
           listController(_index);
           contentsController(_index);
        }

        function setIndex($index){
            listController($index);
            contentsController($index);
        }

        function setEvents(_callback){
            _elList.on('click', function(e){
                e.preventDefault();
                _index = $(this).index();

                listController(_index);
                contentsController(_index);

                setTimeout(_callback, 0)

            })
        }

        function listController($index){
            if(_elList.eq($index).hasClass('active')){
                return false;
            }
            _elList.removeClass('active');
            _elList.eq($index).addClass('active');
        }

        function contentsController($index){
            _contents.hide();
            _contents.removeClass('active');

            _contents.eq($index).show();
            _contents.eq($index).addClass('active');
        }

        function resetTabContents(){

        }

        return {
            init: init(),
            setIndex: setIndex
        }
    }

    this.modalPopUp = function(_el){
        var el;
        var _closeBtn,
            _closeBtn2;

        function init(){
            el         = $(_el);
            _closeBtn  = el.find('.layer-close');
            _closeBtn2 = el.find('.btn-close');
    
			setCloseEvents();

            return this;
        }

        function open(){
            if($(document).width() > 1440){
                $('body').css({
                    'overflow' : 'hidden',
                    'margin-left' : '-17px'
                });
                el.addClass('active');
                $('.sub-page-grid').hide();
            }else {
                $('body').css('overflow', 'hidden');
                el.addClass('active');

            }
        };

        function close(){
            if($(document).width() > 1440){
                $('body').css({
                    'overflow' : 'visible',
                    'margin-left' : '0'
                });
                $('.header-content').css({
                    'width' : 'auto',
                    'transition' : '.5s cubic-bezier(.77,0,.18,1)'
                });
                $('.page-tab-section').css({
                    'width' : '100%',
                    'transition' : '.5s cubic-bezier(.77,0,.18,1)'
                });
                $('.sub-page-grid').show();
    
                el.removeClass('active');
            }else {
                $('body').css('overflow','visible');
                el.removeClass('active');
            }
            
        };

        function setCloseEvents(){
            _closeBtn.on('click', function(){
                close();
            });

            _closeBtn2.on('click', function(){
                _closeBtn.trigger('click');
  				close();
            })
        }

        return {
            init: init(),
            open: open,
            close: close
        }

    }

    this.loading = function(){
        var el;

        function init(){
            el = $('body').append("<div class='loading'><img src='/images/pc/ico_loading.gif' alt='loading'/></div>");

            return this;
        }
        
        function start(){
            // $('body').addClass('overflow');
            $('.loading').show();
            $('.dimm').fadeIn(150);
        };

        function stop(){
            $('.loading').remove();
            // $('body').removeClass('overflow');
            $('.dimm').fadeOut(150);
        };

        return {
            init:init(),
            start: start,
            stop: stop
        }
    }
}