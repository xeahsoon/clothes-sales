$(document).ready(function() {
	
    $("#fork_link").fadeIn();
    
	//jQuery QuickSearch测试
	var qs = $('input#menu_search').quicksearch('ul.nav li');
	
	$.ajax({
		url: "loading",
		data: {
			delay: 3
		},
		success: function() {
			console.log("Display Loading.");
		}
	});
	
	/**
	 * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
	 */
	$("#testNoBtn").bsSuggest({
		url : "goodSuggest",
		/*effectiveFields: ["userName", "shortAccount"],
		searchFields: [ "shortAccount"],*/
		effectiveFieldsAlias : {
			id : "编号",
			type : "类型"
		},
		autoSelect : true,
		autoMinWidth : true,
		ignorecase : true,
		showHeader : true,
		showBtn : false, //不显示下拉按钮
		delayUntilKeyup : true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
		idField : "id",
		clearable : true,
		processData : function(json) { //url 获取数据时，对数据的处理，作为 getData 的回调函数                
			var i, len, data = {
				value : []
			};
			if (!json || json.length == 0) {
				return false;
			}
			len = json.length;
			for (i = 0; i < len; i++) {
				data.value.push({
					"id" : json[i].id,
					"type" : json[i].type,
					"fabric" : json[i].fabric,
					"price" : json[i].price
				});
			}
			/* var data = JSON.parse(json); */
			console.log(data);
			return data;
		}

	}).on('onDataRequestSuccess', function(e, result) {
		console.log('onDataRequestSuccess: ', result);
	}).on('onSetSelectValue', function(e, keyword, data) {
		console.log('onSetSelectValue: ', keyword, data);
	}).on('onUnsetSelectValue', function() {
		console.log("onUnsetSelectValue");
	});
});