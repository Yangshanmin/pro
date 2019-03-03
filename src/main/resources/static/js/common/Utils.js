var NULL_VALUE = '-';
/**
 * 显示操作结果，并在指定时间后自动消失
 */
function showMessage(msg, delay) {
	top.$("#messageDiv").html(msg);
	top.$("#messageDiv").delay(200).fadeIn().delay(delay || 2000).fadeOut(1000);
}

// 使用jquer-confirm提示框，在default.jsp中先引入相应js和css
function alertMsg(msg, title, callback) {
	$.alert({
		title : title || '提示信息',
		content : msg,
		backgroundDismiss : false,
		confirmButton : '确定',
		confirmButtonClass : 'btn-primary',
		confirm : callback || function() {
		}
	});
}

function confirmMsg(msg, title, callbackConfirm, callbackCancel) {
	$.confirm({
		title : title || '提示信息',
		content : msg,
		confirmButton : '确定',
		confirmButtonClass : 'btn-primary',
		cancelButton : '取消',
		cancelButtonClass : 'btn-inverse',
		confirm : callbackConfirm || function() {
		},
		cancel : callbackCancel || function() {
		}
	});
}

/**
 * 获取文件上传进度，结合进度条显示百分比
 */
var timer = null;
function uploadStart() {
	timer = setInterval("updateProgress()", 1000);
	$("#progressText").html('0%');
	$("#progressBar").css("width", '5%');
	$("#progressDiv").show();
}
function uploadComplete(success) {
	window.clearInterval(timer);
	if (success) {
		$("#progressText").html('100%');
		$("#progressBar").css("width", '100%');
	} else {
		$("#progressText").html('上传出错了...');
	}
	$("#progressDiv").delay(1000).hide(0);
}
function updateProgress() {
	var now = new Date();
	$.ajaxPostJson(ctx + "/common/getUploadProgress?date=" + now.getTime(), {}, function(result) {
		$("#progressBar").css("width", result.percent);
		$("#progressText").html(result.percent);
	});
}

/**
 * 合并单元格
 * 
 * @param colsCount
 *            合并的列数
 */
function merge(colsCount) {
	var $tbody = $("#table tbody")
	var totalCols = $tbody.find("tr:eq(0)").find("td").length;
	var totalRows = $tbody.find("tr").length;
	for (var i = colsCount - 1; i >= 0; i--) {
		for (var j = totalRows - 1; j >= 1; j--) {
			startCell = $tbody.find("tr").eq(j).find("td:eq(" + i + ")");
			targetCell = $tbody.find("tr").eq(j - 1).find("td:eq(" + i + ")");
			if (startCell.text() == targetCell.text() && targetCell.text() != "") {
				targetCell.attr("rowSpan", (startCell.attr("rowSpan") == undefined) ? 2 : (eval(startCell.attr("rowSpan")) + 1));
				startCell.remove();
			}
		}
	}
}

/**
 * 拼接字符串
 */
function mergeStrByArray(array, splitStr) {
	var result = '';
	for (var i = 0; i < array.length; i++) {
		result += array[i];
		if (i < array.length - 1) {
			result += splitStr;
		}
	}
	return result;
}
/**
 * 切换主页面url
 */
function switchMainUrl(url) {
	top.$("#mainFrame").attr('src', url);
}

/**
 * 在主页面里面显示详情时，隐藏主页面，新建iframe用于显示详情
 */
function showDetailUrl(url) {
	if($("#divMain").length==0){
		alertMsg("尚未设置divMain");
		return;
	}
	$("#divMain").hide();
	parent.$("#btnClose_").hide();
	if ($("#frmDetail_").length == 0) {
		var html = '<div id="divDetail_" style="height:100%;overflow:hidden;position:relative;">';
		html += '<div id="btnClose_" style="position:absolute;margin-top:12px;margin-left:20px;height:auto;"><a href="#" id="back">返回</a></div>';
		html += '<iframe id="frmDetail_" src="' + url + '" style="overflow:visible;" scrolling="auto" frameborder="no" width="100%" height="100%"></iframe>';
		html += '</div>';
		$(html).appendTo('body');
		$("#btnClose_").unbind('click').click(function() {
			$("#divDetail_").hide();
			$("#divMain").show();
			try{
				detailCloseCallBack();
			}catch(e){
			}
			parent.$("#btnClose_").show();
		});
	} else {
		$("#divDetail_").show();
		$("#frmDetail_").attr("src", url);
	}
}

function getTableHeight() {
	return $(window).height() - $('#divSearch').outerHeight(true);
}

/**
 * <pre>
 * 	getTop():获取最顶层window
 * 	tranDateStr(dateStr):转yyyyMMddHHmmss为yyyy-MM-dd
 * </pre>
 */
(function() {
	if (!window.Utils) {
		window.Utils = {};
	}
	window.Utils = {

		getTop : function() {
			return top;
		},

		tranDateStr : function(dateStr) {
			return dateStr && (dateStr.length == 14 || dateStr.length == 8) ? dateStr.substr(0, 4) + '-' + dateStr.substr(4, 2) + '-' + dateStr.substr(6, 2) : NULL_VALUE;
		},

		tranDateHourStr : function(dateStr) {
			return dateStr && dateStr.length == 14 ? dateStr.substr(0, 4) + '-' + dateStr.substr(4, 2) + '-' + dateStr.substr(6, 2) + ' ' + dateStr.substr(8, 2) + ':00'
					: NULL_VALUE;
		},

		tranTimeStr : function(dateStr) {
			return dateStr && dateStr.length == 14 ? dateStr.substr(0, 4) + '-' + dateStr.substr(4, 2) + '-' + dateStr.substr(6, 2) + ' ' + dateStr.substr(8, 2) + ':'
					+ dateStr.substr(10, 2) + ':' + dateStr.substr(12, 2) : NULL_VALUE;
		},

		tranOnlyTimeStr : function(dateStr) {
			return (dateStr && dateStr.length == 6) ? dateStr.substr(0, 2) + ':' + dateStr.substr(2, 2) : NULL_VALUE;
		},
		isInt : function(val, zeroFlag) {
			var exp = zeroFlag ? /^[0-9][0-9]*$/ : /^[1-9][0-9]*$/;
			return exp.test(val);
		},
		isDecimal : function(val) {
			var exp = /^[0-9]+(.[0-9]+)?$/;
			return exp.test(val);
		},
		notNull : function (val,defaultVal) {
			return val?val:defaultVal||'';
		},
		hasSubmit : function (val,button) {
			return val?button:'';
        }

	};
})();

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function(fmt) { // author: meizz
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
};
/**
 * 对Date的扩展，将 Date 转化为指定格式的String 月(M)、日(d)、12小时(h)、24小时(H)、分(m)、秒(s)、周(E)、季度(q)
 * 可以用 1-2 个占位符 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) eg: (new
 * Date()).pattern("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 (new
 * Date()).pattern("yyyy-MM-dd E HH:mm:ss") ==> 2009-03-10 二 20:09:04 (new
 * Date()).pattern("yyyy-MM-dd EE hh:mm:ss") ==> 2009-03-10 周二 08:09:04 (new
 * Date()).pattern("yyyy-MM-dd EEE hh:mm:ss") ==> 2009-03-10 星期二 08:09:04 (new
 * Date()).pattern("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
 */
Date.prototype.pattern = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, // 小时
		"H+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
	// 毫秒
	};
	var week = {
		"0" : "/u65e5",
		"1" : "/u4e00",
		"2" : "/u4e8c",
		"3" : "/u4e09",
		"4" : "/u56db",
		"5" : "/u4e94",
		"6" : "/u516d"
	};
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	if (/(E+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		}
	}
	return fmt;
};

// 比较两个日期的大小date1>date2 unit为比较的单位：year month，day，hour，minute，seconds
function compairDate(date1, date2, unit) {
	var date1_year = date1.getFullYear(); // 获取系统的年；
	var date1_month = date1.getMonth() + 1; // 获取系统月份，由于月份是从0开始计算，所以要加1
	var date1_day = date1.getDate(); // 获取系统日，
	var date1_hour = date1.getHours(); // 获取系统时，
	var date1_minute = date1.getMinutes(); // 分
	var date1_seconds = date1.getSeconds(); // 秒
	var date2_year = date2.getFullYear(); // 获取系统的年；
	var date2_month = date2.getMonth() + 1; // 获取系统月份，由于月份是从0开始计算，所以要加1
	var date2_day = date2.getDate(); // 获取系统日，
	var date2_hour = date2.getHours(); // 获取系统时，
	var date2_minute = date2.getMinutes(); // 分
	var date2_seconds = date2.getSeconds(); // 秒
	if (unit == 'year') {
		return date1_year - date2_year;
	} else if (unit == 'month') {
		var year = compairDate(date1, date2, 'year');
		return year == 0 ? (date1_month - date2_month) : year;
	} else if (unit == 'day') {
		var month = compairDate(date1, date2, 'month');
		return month == 0 ? (date1_day - date2_day) : month;
	} else if (unit == 'hour') {
		var day = compairDate(date1, date2, 'day');
		return day == 0 ? (date1_hour - date2_hour) : day;
	} else if (unit == 'minute') {
		var hour = compairDate(date1, date2, 'hour');
		return hour == 0 ? (date1_minute - date2_minute) : hour;
	} else if (unit == 'seconds') {
		var minute = compairDate(date1, date2, 'minute');
		return minute == 0 ? (date1_seconds - date2_seconds) : minute;
	}
}