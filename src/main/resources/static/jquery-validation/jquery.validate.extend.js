/**
 * add by LinWei 20140922
 */

/**
 * 获取字符串长度，以[^\x00-\xff]/g.test(s)判断汉字，一个汉字两个字符
 */
function len(val) {
	var valLen = 0;
	if(val){
		for (var i = 0; i < val.length; i++) {
			valLen += /[^\x00-\xff]/g.test(val.charAt(i)) ? 2 : 1;
		}
	}
	return valLen;
}

jQuery.extend(jQuery.validator.messages, {
	required: "必填字段",
	remote: "请修正该字段",
	email: "请输入正确的邮箱地址",
	url: "请输入合法的网址",
	date: "请输入合法的日期",
	dateISO: "请输入合法的日期 (ISO).",
	number : "请输入合法的数字",
	digits: "只能输入整数",
	creditcard: "请输入合法的信用卡号",
	equalTo: "请再次输入相同的值",
	accept: "请输入拥有合法后缀名的字符串",
	maxlength : jQuery.validator.format("长度不可大于{0}个字符"),
	minlength : jQuery.validator.format("长度不可小于{0}个字符"),
	rangelength : jQuery.validator.format("长度必须在{0}和{1}个字符"),
	range : jQuery.validator.format("值必须介于{0}和{1}之间"),
	max : jQuery.validator.format("不可大于{0}"),
	min : jQuery.validator.format("不可小于{0}")
});

jQuery.extend(jQuery.validator.defaults, {
    errorElement: "span"
});

jQuery.extend(jQuery.validator.defaults, {
	//重写错误显示消息方法,以alert方式弹出错误消息
	//showErrors:function(errorMap,errorList) {
	//	var msg = "";
	//	$.each(errorList, function(i,v){
	//		msg += ($(v.element).attr('label')||$(v.element).attr('id'))+v.message+"<br>";
	//	});
	//	if(msg!=""){
	//		$.messager.alert('提示信息',msg);
	//	}
	//},
	//失去焦点时不做验证
	//onfocusout: false,
	//class="ignore"的元素不验证
	ignore: ".ignore",
	onkeyup:function(element, event){}
});

jQuery.extend(jQuery.validator.prototype, {
	//重写长度计算方法,中文算两字符
	getLength: function( value, element ) {
		switch ( element.nodeName.toLowerCase() ) {
		case "select":
			return len($( "option:selected", element ));
		case "input":
			if ( this.checkable( element ) ) {
				return this.findByName( element.name ).filter( ":checked" ).length;
			}
		}
		return len(value);
	}
});

//可以设置 validate 的默认值
//$.validator.setDefaults({  
//    submitHandler: function() { alert("submitted!!!");return false; }  
//});

/**请在以下添加公共的验证方法*/
//邮政编码验证
jQuery.validator.addMethod("zipCode", function(value, element) {
    var regExp = /^[0-9]{6}$/;
    return this.optional(element) || (regExp.test(value));
}, "请正确填写您的邮政编码");
//手机号码验证
jQuery.validator.addMethod("mobile", function(value, element) {
    var length = value.length;
    var mobile =  /^((13|14|15|18)[0-9]{9})$/
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "手机号码有误");
//校验身份证号
jQuery.validator.addMethod("card",function(value, element) {
	return this.optional(element) || checkIdcard(value);
},"请输入正确的身份证号码(15-18位)");
//校验用户登录名称
/*jQuery.validator.addMethod("user",function(value, element) {
	var user = /^[a-zA-Z0-9_-]{3,16}$/;
	return this.optional(element) || (loginName.test(value));
},"请输入正确的登录名(3-16位字母、数字及下划线组合)");*/

//验证身份证函数
function checkIdcard(idcard){
	idcard = idcard.toString();
	//var Errors=new Array("验证通过!","身份证号码位数不对!","身份证号码出生日期超出范围或含有非法字符!","身份证号码校验错误!","身份证地区非法!");
	var Errors=new Array(true,false,false,false,false);
	var area={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"}
	var idcard,Y,JYM;
	var S,M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	//地区检验
	if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];
	//身份号码位数及格式检验
	switch(idcard.length){
		case 15:
			if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性
			}
			if(ereg.test(idcard)) return Errors[0];
			else return Errors[2];
			break;
		case 18:
			//18 位身份号码检测
			//出生日期的合法性检查
			//闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			//平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式
			} else {
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式
			}
			if(ereg.test(idcard)) {//测试出生日期的合法性
				//计算校验位
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
					+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
					+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
					+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
					+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
					+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
					+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
					+ parseInt(idcard_array[7]) * 1
					+ parseInt(idcard_array[8]) * 6
					+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y,1);//判断校验位
				if(M == idcard_array[17]) return Errors[0]; //检测ID的校验位
				else return Errors[3];
			}
			else return Errors[2];
			break;
		default:
			return Errors[1];
			break;
	}
}