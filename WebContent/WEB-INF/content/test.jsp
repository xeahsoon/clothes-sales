<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test DataTable</title>

<script type="text/javascript">
	$(document).ready(function() {
		
	    $("#fork_link").fadeIn();
	    
		//jQuery QuickSearch测试
		var qs = $('input#menu_search').quicksearch('ul.nav li');
		
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
</script>
</head>
<body>
	<div id="fork_link" style="position: fixed; bottom: 0; right: 0; display:none;">
		<a href="https://github.com/xeahsoon" target="_Blank">
		<img src="images/fork.png" alt="Fork me on GitHub"/></a>
	</div>
	
	<div class="container col-md-12" style="height: 100%;">
		<div class="row">
			<h2 class="page-header">这是一个测试
			</h2>
			
		</div>
        <div class="row">
        	<div class="col-md-2">
        		<h5>Bootstrap Suggest</h5>
        	</div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" id="testNoBtn">
                    <div class="input-group-btn" style="max-width: 100px;">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        </ul>
                    </div>
                    <!-- /btn-group -->
                </div>
            </div>
            
            <div class="col-md-2">
        		<h5>JQuery QuickSearch</h5>
        	</div>
        	<div class="col-md-4">
        		<input type="text" class="form-control" id="menu_search"/>
        	</div>
        </div>
        
        <div id="test_jquery_load" style="background-color: #ddd">
        </div>
	</div>
</body>
</html>