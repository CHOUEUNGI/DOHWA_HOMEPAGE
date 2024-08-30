//jQuery.noConflict();
!function($) {
	'use strict';

	$(function(){
        setTimeout(function () {
            contentsGridFunction().init('.cnt-grid-wrap');
        }, 0)
	});
}(jQuery);

var contentsGridFunction = function(){
    var el;

    var verticalLine01, verticalLine02;
    var horizontalLine01, horizontalLine02, horizontalLine03, horizontalLine04, horizontalLine05, horizontalLine06, horizontalLine07;

    function init(_el){
        el = $(_el);

        if (!$(_el)[0]) return false;

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

        setGridPosition();
    }

    function setGridPosition(){
        var _setTop =  $('body').hasClass('main') ? $('.main-cont-wrap').offset().top : 0,
            _setHeight = $('body').hasClass('main') ? $('.main-cont-wrap').outerHeight() - $('.company').outerHeight() : $('.contents').outerHeight(true) + $('.page-tab-section').height();

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

    return {
        init: init
    }
}