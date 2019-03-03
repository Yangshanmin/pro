(function($) {
	/**
	 * 获取表单数据
	 */
	getFormData = function(el) {
		var inputs = el.find("input,textarea,select");
		var o = {};
		$.each(inputs, function(i, n) {
			switch (n.nodeName.toUpperCase()) {
			case "INPUT":
				if ($(n).is(":checkbox")) {
					if ($(n).is(":checked")) {
						if(!o[n.name]){
							o[n.name] = [];
						}
						o[n.name].push($(n).val());
					}
				} else if ($(n).is(":radio")) {
					if ($(n).is(":checked")) {
						o[n.name] = n.value;
					}
				} else if (!$(n).is(":file")){
					o[n.id] = n.value;
				}

				break;
			case "TEXTAREA":
				o[n.id] = $(n).val();
				break;
			case "SELECT":
				o[n.id] = n.value;
				break;
			}
		});
		return o;
	};

	/**
	 * 获取表单数据
	 */
	$.fn.getFormObject = function() {
		var obj = getFormData($(this));
		var obj2 = {};
		for ( var x in obj) {
			if($.isArray(obj[x])){
				obj2[x] = obj[x];
			}else if ($.trim(obj[x]) != '') {
				obj2[x] = $.trim(obj[x]);
			}
		}
		return obj2;
	};

	/**
	 * 获取查询表单数据
	 */
	$.fn.getSearchFormObject = function() {
		var obj = getFormData($(this));
		var obj2 = {};
		for ( var x in obj) {
			if (x.indexOf('search_') != -1 && $.trim(obj[x]) != '') {
				obj2[x.replace('search_', '')] = $.trim(obj[x]);
			}
		}
		return obj2;
	};

	$.fn.setFormObject = function(data) {
		this.clearForm();// 先清空表单
		var els = this.find(':input').get();
		$.each(els, function() {
			if (this.name && (data[this.name] || data[this.name] == 0)) {
				var names = data[this.name];
				var $this = $(this);
				if (Object.prototype.toString.call(names) !== '[object Array]') {
					names = [ names ]; // backwards compat to old version of
										// this code
				}
				if (this.type == 'checkbox' || this.type == 'radio') {
					var val = $this.val();
					var found = false;
					for (var i = 0; i < names.length; i++) {
						if (names[i] == val) {
							found = true;
							break;
						}
					}
					//$this.attr("checked", found);
					if(found){
						$this.trigger("click");
					}
				} else {
					$this.val(names[0]);
				}
			}
		});
	};

	/**
	 * 清理表单,includeHidden使用jquery选择器表达式选择hidden元素
	 */
	$.fn.clearForm = function(includeHidden) {
		return this.each(function() {
			$('input,select,textarea', this).clearFields(includeHidden || true);
		});
	};

	/**
	 * Clears the selected form elements.
	 */
	$.fn.clearFields = function(includeHidden) {
		var re = /^(?:color|date|datetime|email|month|number|password|range|search|tel|text|time|url|week)$/i; // 'hidden'
																												// is
																												// not
																												// in
																												// this
																												// list
		return this.each(function() {
			var t = this.type, tag = this.tagName.toLowerCase();
			if (re.test(t) || tag == 'textarea') {
				this.value = '';
			} else if (t == 'checkbox') {
				this.checked = false;
			} else if (t == 'radio') {
				this.checked = false;
				document.getElementsByName(this.name)[0].checked = true;
			} else if (tag == 'select') {
				this.selectedIndex = 0;
			} else if (t == "file") {
				if (/MSIE/.test(navigator.userAgent)) {
					$(this).replaceWith($(this).clone(true));
				} else {
					$(this).val('');
				}
			} else if (includeHidden) {
				// includeHidden can be the value true, or it can be a selector
				// string
				// indicating a special test; for example:
				// $('#myForm').clearForm('.special:hidden')
				// the above would clean hidden inputs that have the class of
				// 'special'
				if ((includeHidden === true && /hidden/.test(t)) || (typeof includeHidden == 'string' && $(this).is(includeHidden))) {
					this.value = '';
				}
			}
		});
	};

	$.ajaxPost = function(url, data, callback) {
		$.ajax({
			url : url,
			data : data || {},
			method : "post",
			contentType : "application/x-www-form-urlencoded",// 发送信息至服务器时内容编码类型:键值对
			datatype : "json",// 服务器返回的数据类型
			beforeSend : function() {
			},
			complete : function(data) {
			},
			success : function(msg) {
				if (typeof callback != 'undefined')
					callback.call(this, msg);
			}
		});
	};

	$.ajaxPostJson = function(url, data, callback, errorCallBackExt) {
		$.ajax({
			url : url,
			data : JSON.stringify(data || {}),
			method : "post",
			contentType : "application/json",// 发送信息至服务器时内容编码类型:json格式
			datatype : "json",// 服务器返回的数据类型
			beforeSend : function() {
			},
			complete : function(data) {
			},
			success : function(msg) {
				if (typeof callback != 'undefined')
					callback.call(this, msg);
			},
			error : function(jqXHR, textStatus, errorThrown){
				ajaxError(jqXHR, textStatus, errorThrown, errorCallBackExt);
			}
		});
	};
	
})(jQuery);