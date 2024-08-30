(function ($) {

    /**
     * Table 의 칼럼 영역길이 조절 스크립트
     */
    (function () {
        var dragElement,
            curIdx,
            startOffset,
            resizable = $('.resizeableTable'),
            rowspanIdx = -1,
            idx = -1,
            hasColspan = false;

        resizable.find('th').each(function (i,th) {

            if ($(th).attr('colspan')) {
                var colspan = parseInt($(th).attr('colspan'));
                rowspanIdx = rowspanIdx + colspan;
                hasColspan = true;
                return;
            }

            rowspanIdx = rowspanIdx + 1;
            idx = idx + 1;

            $(th).css({ position: 'relative' });

            var grip = document.createElement('div');
            $(grip).addClass('ui-grip');
            $(grip).appendTo(th);

            if ($(th).attr('rowspan')) {
                $(grip).attr('data-idx', rowspanIdx);
                if (hasColspan) {
                    idx = idx - 1;
                }
            } else {
                $(grip).attr('data-idx', idx);
            }

            $(grip).on('mousedown', function (evt) {
                dragElement = th;
                curIdx = $(this).attr('data-idx');
                startOffset = dragElement.offsetWidth - evt.pageX;
                resizable.css('user-select', 'none');
            });

            $(document).on('mousemove', function (evt) {
                if (dragElement) {
                    var _resizeElem,
                        _cols = resizable.find('colgroup col');

                    /**
                     * colgroup 이 존재하면 col width 를 변경. 그렇지 않다면 th width 변경
                     */
                    if (_cols.length && _cols.eq(curIdx).length) {console.log(curIdx);
                        _resizeElem = _cols.eq(curIdx)[0];
                    } else {
                        _resizeElem = dragElement;
                    }

                    _resizeElem.style.width = startOffset + evt.pageX + 'px';
                }
            });

            $(document).on('mouseup', function () {
                if (dragElement) {
                    dragElement = undefined;
                    curIdx = undefined;
                    resizable.css('user-select', 'auto');
                }
            });
        });
    })();

    /**
     * [공통] 열고 닫기 기능 스크립트
     */
    $(function () {

        $('.ui-open-close').each(function (i, el) {
            var root        = $(el),
                openBtn     = root.find('.bx-btn.a-right > a').eq(0),
                closeBtn    = root.find('.bx-btn.a-right > a').eq(1),
                lis         = root.find('li.depth1');

            lis.each(function (i, el) {

                // depth 2
                $(el).find('> a').on('click', function (e) {
                    e.preventDefault();
                    if ($(this).hasClass('on')) {
                        $(this).removeClass('on');
                        $(this).parent().find('ul.depth2-list').hide();
                    } else {
                        $(this).addClass('on');
                        $(this).parent().find('ul.depth2-list').show();
                    }
                });

                // depth 3
                $(el).find('li.hold-3dth > a').on('click', function (e) {
                    e.preventDefault();
                    if ($(this).hasClass('on')) {
                        $(this).removeClass('on');
                        $(this).parent().find('ul').hide();
                    } else {
                        $(this).addClass('on');
                        $(this).parent().find('ul').show();
                    }
                });
            });

            openBtn.on('click', function (e) {
                e.preventDefault();
                lis.find('> a').removeClass('on');
                lis.find('> a').trigger('click');
            });

            closeBtn.on('click', function (e) {
                e.preventDefault();
                lis.find('> a').addClass('on');
                lis.find('> a').trigger('click');
            });
        });
    });

		/**
     * [공통] 테이블 제목, 합계 고정 좌,우 스크롤 스크립트
     */
		$(function () {
			// BodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('.BodyScroll').scroll(function () {
				// BodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('.BodyScroll').scrollLeft();

				// 가져온 x좌표를 HeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('.HeadScroll').scrollLeft(xPoint);
				// 가져온 x좌표를 FootScroll 적용시켜 같이 움직일수 있도록 합니다.
				$('.FootScroll').scrollLeft(xPoint);
			});
		});
})(jQuery);

/**
 * Datepicker 적용 스크립트
 */
function drawDatePicker () {
    $('.datepicker').datepicker({
        showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true,
        yearRange: 'c-99:c+99',
    }).attr('readonly','readonly');

    $('.datepicker_week').datepicker({
        showMonthAfterYear: true,
        dateFormat: 'yy-mm-d D',
        changeMonth: true,
        changeYear: true,
        yearRange: 'c-99:c+99',
    }).attr('readonly','readonly');
};

/**
 * 좌측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 */
function lpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str;
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str = padStr + str;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}

/**
 * 우측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 */
function rpad(str, padLen, padStr) {
    if (padStr.length > padLen) {
        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
        return str + "";
    }
    str += ""; // 문자로
    padStr += ""; // 문자로
    while (str.length < padLen)
        str += padStr;
    str = str.length >= padLen ? str.substring(0, padLen) : str;
    return str;
}

var StringBuilder = function(){ 
    this.buffer = new Array();  
}


// 문자열의 형식을 지정해서 추가한다. 
StringBuilder.prototype.append = function()
{ 
    var count = arguments.length;
    if( count < 2 ) {
    	this.buffer[this.buffer.length] = arguments[0];
    } else {
    	var strValue = arguments[0];
    	for(var i=1; i<count; i++) 
    		strValue = strValue.replace("{"+ (i-1) + "}", arguments[i] );
    	this.buffer[this.buffer.length] = strValue;
    } 
}


// 해당하는 위치에 문자열을 추가한다. (문자위치가 아님);
StringBuilder.prototype.insert = function( idx, strValue ) 
{ 
    this.buffer.splice( idx, 0, strValue );     //IE5.5 NS4 
}


// 해당문자열을 새로운 문자열로 바꾼다. 
// (배열방 단위로 바꾸므로 배열방 사이에 낀 문자열은 바꾸지 않음)
StringBuilder.prototype.replace = function( from, to ) 
{ 
    for( var i=this.buffer.length-1; i>=0; i--)
        this.buffer[i] = this.buffer[i].replace(new RegExp(from, "g"), to); //IE4  NS3 
}


// 문자열로 반환한다.
StringBuilder.prototype.toString = function() 
{ 
	return this.buffer.join("");   //IE4 NS3
}


// 초기화
StringBuilder.prototype.clear = function()
{
	this.buffer.splice( 0, this.buffer.length );
}


/**
 * 데모용. 아래와 같이 원하는 시점에 drawDatePicker 함수를 호출해주세요.
 */
$(function () {
    drawDatePicker();
    
    $('[data-btn="clear"]').on('click', function(e) {
		$("#searchStartDate").val('');
		$("#searchEndDate").val('');
	});

	$('[data-date]').on('click', function(e) {
		var data = $(this).data('date');
		var xDate = new Date();
		var yDate = new Date(Date.parse(xDate) - data * 1000 * 60 * 60 * 24)

		$("#searchStartDate").datepicker("setDate", yDate);
		$("#searchEndDate").datepicker("setDate", xDate);
	});
});

/*
* CKEditor 생성

*/
var CKEditor = function(target) {
	
	if (!Array.isArray(target)) {
		throw new Error('[Error] target is Not Array');
	}
	
	let result = new Array();
	for (var v of target) {
		
		ClassicEditor
	        .create( document.querySelector( v ), {
				toolbar: {
					items: [ 'heading', '|', 'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', '|', 'bold', 'italic', 'underline', 'strikethrough', 'link', '|',
						'alignment', '|', 'bulletedList', 'numberedList', '|', 'indent', 'outdent', '|', 'blockQuote', 'insertTable', '|', 'undo', 'redo'
					]
				},
				language: 'ko',
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells',
						'tableCellProperties',
						'tableProperties'
					]
				},
				licenseKey: '',
			} )
	        .then( editor => {
	        	
	        	result.push( editor );
	        } )
	        .catch( error => {
	            console.error( error );
	        } );
	}
	
	return result;
}
