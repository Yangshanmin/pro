
/**
 * 定义字符串缓存类
 * @returns
 */
function StringBuffer(){  
    this.string = new Array;  
}  
  
StringBuffer.prototype.append = function(str){  
    this.string .push(str);  
}  ;
  
StringBuffer.prototype.toString = function(){ 
    return this.string.join("");  
};

String.prototype.getlength = function() 
{ 
return this.replace(/[^\x00-\xff]/g,"xx").length;
};

/**
 * string 去除空格方法
 * @returns
 */
String.prototype.trim = function() { 
	return this.replace(/(^\s*)|(\s*$)/g, ""); 
};
String.prototype.ltrim = function() { 
	return this.replace(/(^\s*)/g, ""); 
};
String.prototype.rtrim = function() { 
	return this.replace(/(\s*$)/g, ""); 
} ;
String.prototype.trimAll= function() { 
	return this.replace(/\s+/g, ""); 
};

String.prototype.endWith=function(str){
		if(str==null||str==""||this.length==0||str.length>this.length)
		  return false;
		if(this.substring(this.length-str.length)==str)
		  return true;
		else
		  return false;
		return true;
	};

	String.prototype.startWith=function(str){
		if(str==null||str==""||this.length==0||str.length>this.length)
		  return false;
		if(this.substr(0,str.length)==str)
		  return true;
		else
		  return false;
		return true;
	};

/**
 * 字符串替换
 */
String.prototype.replaceAll = function(old_sChars,new_sChars){
	return this.replace(new RegExp(old_sChars,"g"),new_sChars);
};