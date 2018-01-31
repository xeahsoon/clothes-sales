<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>

        <script type="text/javascript">
            $(document).ready(function() {
            	// 创建员工multiselect
                $('#staff_multiselect').multiselect({
                	maxHeight: 200
                });
                // 支付操作按钮
                $("#paylist li").click(function() {
                    var i = $("#paylist li").index(this);
                    var t = ["银行卡","支付宝","微信","现金"];

                    $("#paytext").val(t[i]);
                });
                
                //计算价格
                $("#temp_order_table .tdinput").change(function() {
                	
                	var discount = parseFloat($(this).val()).toFixed(2);
                	if(isNaN(discount) || discount < 0.1 || 1.0 < discount) {
						$(this).val("1.00");
						discount = 1.00;
		            	$('#myAlert').fadeIn(100).delay(200).fadeOut(200)
		            		.fadeIn(100).delay(200).fadeOut(200)
		            		.fadeIn(100).delay(1500).fadeOut(500);
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
                				$('#myAlert').fadeIn(100).delay(200).fadeOut(200)
	    		            		.fadeIn(100).delay(200).fadeOut(200)
	    		            		.fadeIn(100).delay(1500).fadeOut(500);
                			} else {
                				//设置输入框折扣
                				$(".tdinput").val(discount.toFixed(2));
                				$(".tdinput").trigger("change");
                			}
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
                						alert("未找到该商品信息！");
                					} else if(data == 0) {
                						alert("该唯一码已扫过！");
                					} else {
                    					showAtRight('makeOrder');
                    					document.getElementById('bar_code').focus(); //--无效
                					}
                				},
                				error: function(jqXHR) {
                					$("#dismissButton").click();
                					alert("发生错误： " + jqXHR.status);
                				}
                			});
                		}
                	}
                });
            });
            
            /**
    	     * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
    	     */
    	    $("#member_id").bsSuggest({
    	        url: "memberSuggest",
    	        effectiveFieldsAlias:{phone: "卡号", name: "姓名"},
    	        allowNoKeyword: false,   //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
    	        autoSelect: true,
    	        ignorecase: true,
    	        showHeader: true,
    	        showBtn: false,     //不显示下拉按钮
    	        delayUntilKeyup: true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
    	        clearable: true,
    	        inputWarnColor: 'transparant', //输入框内容不是下拉列表选择时的警告色
    	        processData: function(json){ //url 获取数据时，对数据的处理，作为 getData 的回调函数                
                    var i, len, data = {value: []};            
                    if(!json || json.length == 0) {
                        return false;
                    }
                    len = json.length;            
                    for (i = 0; i < len; i++) {
                        data.value.push({
                            "phone": json[i].phone,
                            "name":json[i].name
                        });
                    }
                    /* var data = JSON.parse(json); */
                    console.log(data);
                    return data;            
                }
    	    }).on('onDataRequestSuccess', function (e, result) {
    	        console.log('onDataRequestSuccess: ', result);
    	    }).on('onSetSelectValue', function (e, keyword, data) {
    	        console.log('onSetSelectValue: ', keyword, data);
    	    }).on('onUnsetSelectValue', function () {
    	        console.log("onUnsetSelectValue");
    	    });
            
            // 商品款号搜索建议
    	    $("#good_id").bsSuggest({
    			url : "goodSuggest",
    			/*effectiveFields: ["userName", "shortAccount"],
    			searchFields: [ "shortAccount"],*/
    			effectiveFieldsAlias : {
    				id : "编号",
    				type : "类型"
    			},
    			autoSelect : true,
    			autoMinWidth : false,
    	        allowNoKeyword: false,   //是否允许无关键字时请求数据。为 false 则无输入时不执行过滤请求
    			ignorecase : true,
    			showHeader : true,
    			showBtn : false, //不显示下拉按钮
    			delayUntilKeyup : true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
    			idField : "id",
    			clearable : true,
    	        inputWarnColor: 'transparant', //输入框内容不是下拉列表选择时的警告色
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
    						"price" : json[i].price
    					});
    				}
    				/* var data = JSON.parse(json); */
    				console.log(data);
    				return data;
    			}
    		});
        </script>

    </head>
    
    <body>
        <div class="container col-md-12" style="background-color: transparent;">
            <div class="row">
                <h2 class="page-header">选项</h2>
            </div>
            <form action="postOrder" class="form-controll">
                <table class="order-info">
                <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon">收银：</span>
                        <input type="text" class="form-control" value="${sessionScope.user.name }" readOnly="readonly">
                    </div>
                </td>
                <td>
                	<div class="input-group">
                        <span class="input-group-addon" style="border-radius: 4px; border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">会员：</span>
                        <input type="text" id="member_id" class="form-control">
                        <div class="input-group-btn">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
	                        </ul>
	                    </div>
                    </div>
                </td>
                <td style="padding-right: 0px;">
                    <div class="input-group">
                        <span class="input-group-addon">导购：</span>
                        <select id="staff_multiselect" multiple="multiple">
                        <!-- 输出所有通过审核的员工，并且默认勾选最近一笔开单的员工 -->
                        <c:forEach items="${requestScope.verified_staffs }" var="staff">
	                        <c:choose>
	                        	<c:when test="${staff.status == 1 }">
	                        		<option value="${staff.id }" selected="selected">${staff.name }</option>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<option value="${staff.id }">${staff.name }</option>
	                        	</c:otherwise>
	                        </c:choose>
                        </c:forEach>
                        </select>
                    </div>
                </td>
                <td class="pay-button">
                	<div class="input-group pull-right">
						<span id="paymoney" class="input-group-addon" data-toggle="dropdown" style="width:88px; font-weight:bold; text-align: right;">
							￥0.00
						 </span>
                		<ul id="paylist" class="dropdown-menu" style="min-width:100%;">
                            <li><a href="###">银行卡</a></li>
                            <li><a href="###">支付宝</a></li>
                            <li><a href="###">微信</a></li>
                            <li><a href="###">现金</a></li>
                        </ul>
                        <input id="paytext" type="button" class="form-control btn btn-primary" value="银行卡" style="width: 66px;">
						
					</div>
                </td>
                </tr>
                </table>

                <div class="table-responsive" style="margin-top: 30px">
                    <h3 class="page-header">销售</h3>
                </div>
                <table class="order-info">
                <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon">条形码：</span>
                        <input id="bar_code" type="text" class="form-control" autofocus>
                    </div>
                </td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="border-radius: 4px; border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">款号：</span>
                        <input type="text" id="good_id" class="form-control">
                        <div class="input-group-btn">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
	                        </ul>
	                    </div>
                    </div>
                </td>
                <td style="padding-right: 0px;">
                	<div id="myAlert" class="alert-box pull-right">
						<strong>警告！</strong>折扣必须为数字且在0.1~1.0之间
					</div>
                </td>
                </tr>
                </table>

                <div class="table-responsive">
                    <table id="temp_order_table" class="table table-striped">
                        <thead>
                        <tr>
                            <th width="16%">#</th>
                            <th width="14%">款号</th>
                            <th width="10%">类型</th>
                            <th width="10%">颜色</th>
                            <th width="10%">大小</th>
                            <th width="10%">原价</th>
                            <th width="10%">折扣</th>
                            <th width="10%">金额</th>
                            <th width="10%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.temp_list }" var="temp">
                        	<tr>
                        		<td><fmt:formatNumber value="${temp.storage_id }" pattern="00000000000"/></td>
                        		<td><fmt:formatNumber value="${temp.good.id }" pattern="00000000"/></td>
                        		<td>${temp.good.type }</td>
                        		<td>${temp.color }</td>
                        		<td>${temp.size }</td>
                        		<td><fmt:formatNumber value="${temp.good.price }" pattern=".00"/></td>
                        		<td><input type="text" value="1.00" class="tdinput"></td>
                        		<td>SUM</td>
	                            <td>
	                            	<span style="color:transparent;">/</span>
	                            	<span class="glyphicon glyphicon-remove-circle operator" title="删除条目" onclick="deleteItem('${temp.id}')"></span>
	                            </td>
                        	</tr>
                        </c:forEach>
                        <tr style="border-bottom: 2px solid #ddd">
                        	<td colspan="5">
                        		<span class="pull-left">备注：&nbsp;&nbsp;</span>
                        		<input type="text" id="remark" name="remark" placeholder="此处填写备注.." style="height:20px; width:88%; background-color:transparent; border:none"/>
                        	</td>
                            <td>合计：</td>
                            <td id="temp_num">0件</td>
                            <td id="temp_money">0.00</td>
                            <td>
                            	<span style="color:transparent;">/</span>
                            	<span class="glyphicon glyphicon-trash operator" title="取消订单" onclick="deleteTempTable()"></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            </div>
        </div>

    </body>

</html>