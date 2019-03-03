var cache_ = {};
/**
 * <pre>
 * queryDictList(dictType, dictClass, parentId, callback):查询数据字典
 * </pre>
 */
(function() {
	if (!window.BizUtils) {
		window.BizUtils = {};
	}
	window.BizUtils = {

		queryDictList : function(dictType, dictClass, parentId, callback) {
			var param = {
				"dictType" : dictType,
				"dictClass" : dictClass,
				parentEntryId : parentId
			};
			$.ajaxPostJson(ctx + "/common/queryDictList", param, callback);
		},

		initSelect : function(data, $elem, defVal) {
			if (data && data.length > 0) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<option entryDesc='"+data[i].entryDesc+"' value='" + data[i].entryId + "'>" + data[i].entryName + "</option>";
				}
				$elem.append(html);
				$elem.val($.trim(defVal));
			}
		},

		initSelectHomeCity : function(homeProv, cityElemId, homeCity, callback) {
			var $city = $("#" + cityElemId);
			$city.empty().append("<option value=''>请选择</option>");
			if ($.trim(homeProv) != '') {
				var data_ = cache_['dict_'+homeProv];// 读缓存
				if (data_) {
					BizUtils.initSelect(data_, $city, homeCity);
					if (callback) {
						callback();
					}
				} else {
					BizUtils.queryDictList(1002, 102, homeProv, function(data) {
						cache_['dict_'+homeProv] = data;// 写缓存
						BizUtils.initSelect(data, $city, homeCity);
						if (callback) {
							callback();
						}
					});
				}
			}
		},

		initSelectHomeCounty : function(homeCity, countyElemId, homeCounty, callback) {
			var $county = $("#" + countyElemId);
			$county.empty().append("<option value=''>请选择</option>");
			if ($.trim(homeCity) != '') {
				var cache = cache_['dict_'+homeCity];// 读缓存
				if (cache) {
					BizUtils.initSelect(cache, $county, homeCounty);
					if (callback) {
						callback();
					}
				} else {
					BizUtils.queryDictList(1002, 103, homeCity, function(data) {
						cache_['dict_'+homeCity] = data;// 写缓存
						BizUtils.initSelect(data, $county, homeCounty);
						if (callback) {
							callback();
						}
					});
				}
			}
		}

	};
})();