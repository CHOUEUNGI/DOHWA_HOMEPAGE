
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