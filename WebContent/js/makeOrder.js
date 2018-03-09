$(document).ready(function() {
	
	/**
	 * 2018/2/25 NOTICE!!
	 * 将makeOrder表格换成dataTables
	 * 表格数据源为ajax
	 * 当输入一件商品，调用dataTables的ajax.reload()方法重新刷新表格数据
	 * 禁止刷新整个页面！
	 */
	
	// 创建员工multiselect
    $('#staff_multiselect').multiselect({
    	maxHeight: 200,
        nonSelectedText: '未选择',
        nSelectedText: '项选中',
        allSelectedText: '全部选中',
        onDropdownHide: function () {
        	// 下拉框关闭时检测选择是否为空
        	/* if($("#staff_multiselect option:selected").length == 0) {
        		
        		alert("请选择至少一个导购！\n将为您自动选择列表项第一位导购员：" + $("#staff_multiselect option:first").text());
        		// 官网地址: http://davidstutz.de/bootstrap-multiselect/
            	// 没查到正确的api浪费大半个下午，JS源文件里一般都有包括网址信息 
        		$('#staff_multiselect').multiselect('select', '1');
        	} */
        }
    });
    // 支付操作按钮
    $("#paylist li").on("click", function() {
        var i = $("#paylist li").index(this);
        var t = ["银行卡","支付宝","微信","现金"];
		$("#paymode").val(i+1);
        $("#paytext").val(t[i]);
    });
    
    // 计算价格 事件委托
    $("#temp_order_table").on("change", ".tdinput", function() {
    	
    	var discount = parseFloat($(this).val()).toFixed(2);
    	if(isNaN(discount) || discount < 0.1 || 1.0 < discount) {
			$(this).val("1.00");
			discount = 1.00;
        	toastr.error("折扣必须为数字且在<strong>0.1~1.0</strong>之间");
    	} else {
    		$(this).val(discount);
    	}
    	
    	//输入框前一个单元格为金额，后一个为单品折后价
    	var td_price = $(this).parent().prev();
    	var td_sum = $(this).parent().next();
    	
    	//设置每一行的总金额，精度为小数点后两位
    	var sum = ( parseFloat(td_price.text()) * discount ).toFixed(2);
    	td_sum.text(sum);
    	
    	var total_num = 0, total_sum = 0;
    	//遍历非首尾行
    	$("#temp_order_table tr:not(:first):not(:last)").each(function() {
    		total_num ++;
    		total_sum += parseFloat($(this).find("td").eq(7).text());
    	});
    	//设置尾行总数
    	$("#temp_num").text(total_num + "件");
    	$("#temp_money").text(total_sum.toFixed(2));
    	//设置支付按钮金额
    	$("#paymoney").text(total_sum.toFixed(2));
    });
    $(".tdinput").trigger("change");
    
    // 批量修改折扣操作
    $("#bar_code").keydown(function(e) {
    	//监听回车
    	var theEvent = window.event || e;
		var code = theEvent.keyCode || theEvent.which;
    	if(code == 13) {
    		var code = document.getElementById("bar_code").value;
    		var pre = code.substr(0, 2);
    		if(pre == "z/" || pre == "Z/") {
    			var discount = parseFloat(code.substr(2));
    			if(isNaN(discount) || discount < 0.1 || 1.0 < discount) {
	            	toastr.error("折扣必须为数字且在<strong>0.1~1.0</strong>之间");
    			} else {
    				//设置输入框折扣
    				$(".tdinput").val(discount.toFixed(2));
    				$(".tdinput").trigger("change");
    			}
    		} else if(isNaN(code) || code.length == 0) {
    			toastr.error("请输入正确的条形码！");
    		} else {
    			//查找商品
    			$.ajax({
    				type: "POST",
    				url: "getOneStorage",
    				data: {
    					id: document.getElementById("bar_code").value
    				},
    				dataType: "json",
    				success: function(data) {
    					if(data == -1) {
    						toastr.info("未找到该商品信息！");
    					} else if(data == 0) {
    						toastr.info("该唯一码已扫过！");
    					} else {
    						$.ajax({
    							url: "refreshTempOrder",
    							success: function(result) {
        					        $("#temp_order_table tbody").html(result);
                    				$(".tdinput").trigger("change");
        					    }
    						});
        					//showAtRight('makeOrder');
        					document.getElementById('bar_code').focus(); //--无效
    					}
    				},
    				error: function(jqXHR) {
    					$("#dismissButton").click();
    					toastr.error("发生错误： " + jqXHR.status);
    				}
    			});
    		}
    	}
    });
});

/**
 * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
 */
$("#member_phone").bsSuggest({
    url: "memberSuggest",
    effectiveFields: ['phone', 'name'],
    effectiveFieldsAlias:{phone: "卡号", name: "姓名"},
    allowNoKeyword: false,   //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
    autoSelect: true,
    ignorecase: true,
    showHeader: true,
    showBtn: false,     //不显示下拉按钮
    delayUntilKeyup: true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
    clearable: true,
    inputWarnColor: 'rgba(255,0,0,.1)', //输入框内容不是下拉列表选择时的警告色
    processData: function(json){ //url 获取数据时，对数据的处理，作为 getData 的回调函数                
        var i, len, data = {value: []};            
        if(!json || json.length == 0) {
            return false;
        }
        len = json.length;            
        for (i = 0; i < len; i++) {
            data.value.push({
            	"phone": json[i].phone,
                "name": json[i].name,
                "discount": json[i].discount
            });
        }
        /* var data = JSON.parse(json); */
        console.log(data);
        return data;            
    }
}).on('onDataRequestSuccess', function (e, result) {
    console.log('onDataRequestSuccess: ', result);
}).on('onSetSelectValue', function (e, keyword, data) {
    //alert('onSetSelectValue: ' + "\n" + JSON.stringify(keyword) +"\n"+ JSON.stringify(data));
    //设置会员折扣
    $(".tdinput").val(data.discount.toFixed(2));
	$(".tdinput").trigger("change");
}).on('onUnsetSelectValue', function () {
});

// 商品款号搜索建议
$("#bar_code").bsSuggest({
	url : "storageSuggest",
	/*effectiveFields: ["userName", "shortAccount"],
	searchFields: [ "shortAccount"],*/
	effectiveFieldsAlias : {
		id : "条形码",
		info : "商品信息"
	},
	autoSelect : true,
	autoMinWidth : false,
    allowNoKeyword: false,   //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
	ignorecase : true,
	showHeader : true,
	showBtn : false, //不显示下拉按钮
	delayUntilKeyup : true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
	clearable : true,
    inputWarnColor: 'rgba(255,0,0,0.1)', //输入框内容不是下拉列表选择时的警告色
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
				"id" : (Array(11).join(0) + json[i].id).slice(-11), //填充0
				"info" : json[i].good_id + "/" + json[i].color + "/" + json[i].size
			});
		}
		/* var data = JSON.parse(json); */
		console.log(data);
		return data;
	}
});