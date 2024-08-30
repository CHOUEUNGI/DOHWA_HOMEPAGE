//jQuery.noConflict();
!function($) {
	'use strict';

	$(function(){
        setTimeout(function () {
            visualGridFunction().init('.visual-grid-wrap');
        }, 0)
	});
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