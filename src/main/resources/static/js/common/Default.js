function ajaxError(jqXHR, textStatus, errorThrown, errorCallBackExt) {
	switch (jqXHR.status) {
	case (0):
		//Utils.getTop().window.location.href = ctx+"/";
		break;
	case (400):
		var respInfo = JSON.parse(jqXHR.responseText);
		alertMsg(respInfo.resultInfo,null,errorCallBackExt);
		break;
	default:
		alertMsg("未知错误");
	}
}

$.ajaxSetup({
	type : "POST",
	error : ajaxError
});

$.extend($.fn.bootstrapTable.defaults, {
	//toolbar: ".form-search",
	//toolbarAlign: 'right',
	//url:'',
	method : 'post',
	sidePagination : 'server',
	queryParamsType : 'self',
	queryParams : function(params) {
		var pageParam = {
				pageNo : params.pageNumber,
				pageSize : params.pageSize
		};
		var searchParam = $(".form-search").getSearchFormObject();
		return $.extend(pageParam, searchParam);
	},
	onLoadError : ajaxError,
	striped : true,
	pagination : true,
	pageList : [20,50,100],
	pageSize : 20,
	pageNumber : 1
});

// bootstrap 单元格内容过长样式
function ellipsis(value, row, index){
	return {classes:"ellipsis"};
}

// 根据maxlength截断输入框内容
function truncate(target){
	var $target = $(target);
	var val = $.trim($target.val());
	while(len(val)>$target.attr('maxlength')){
		val = val.substring(0,val.length-1);
	}
	$target.val(val);
}

$(function() {
	// bootstrap-ckeditor-modal-fix.js
	$.fn.modal.Constructor.prototype.enforceFocus = function() {
		var $modalElement = this.$element;
		$(document).on('focusin.modal', function(e) {
			var $parent = $(e.target.parentNode);
			if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length
			// add whatever conditions you need here:
			&& !$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {
				$modalElement.focus();
			}
		})
	};
	
	// bootstrap单元格内容过长时mouseover显示所有
	$(".bootstrap-table table").delegate("td[class='ellipsis']","mouseover",function(){$(this).attr('title',$(this).text());});
	//输入框输入去掉前后空格
	$(document).delegate("input", 'blur', function(e) {
		$(this).val($.trim($(this).val()));
	});
	//限制输入框输入长度
	$(document).delegate("input[maxlength],textarea[maxlength]", 'keydown', function(e) {
		//list of functional/control keys that you want to allow always 
		var keys = [ 8, 9, 16, 17, 18, 19, 20, 27, 33, 34, 35, 36, 37, 38, 39, 40, 45, 46, 144, 145 ];
		if ($.inArray(e.keyCode, keys) == -1) {
			if (len($(this).val()) >= $(this).attr('maxlength')) {
				e.preventDefault();
				e.stopPropagation();
			}
		}
	}).delegate("input[maxlength],textarea[maxlength]", 'paste', function(e) {
		setTimeout(function() {truncate(e.target);},1);
	});
	
	//回车搜索
	$(".form-search input").keydown(function(e){
		if(e.keyCode==13){
			$(".form-search #btnSearch").trigger("click");
			e.preventDefault();
		}
	});
	
});