<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <!-- Include Twitter Bootstrap and jQuery: -->
        <link rel="stylesheet" href=" css/bootstrap/css/bootstrap.min.css" type="text/css"/>
        <script type="text/javascript" src=" css/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src=" css/bootstrap/js/jquery.min.js"></script>

        <!-- Include the plugin's CSS and JS: -->
        <script type="text/javascript" src=" css/bootstrap/js/bootstrap-multiselect.js"></script>
        <link rel="stylesheet" href=" css/bootstrap/css/bootstrap-multiselect.css" type="text/css"/>

        <!-- Custom styles for this template -->
        <link href=" css/dashboard.css" rel="stylesheet">
        <link rel="stylesheet" href=" css/base.css">

        <script type="text/javascript">
            $(document).ready(function() {
                $('#staff_multiselect').multiselect();
                
                $("#paylist li").click(function() {
                    var i = $("#paylist li").index(this);
                    var t = ["银行卡","支付宝","微信","现金"];

                    $("#paytext").val(t[i]);
                });
            });
            
            /**
    	     * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
    	     */
    	    $("#member_id").bsSuggest({
    	        url: "memberSuggest",
    	        effectiveFieldsAlias:{phone: "卡号", name: "姓名"},
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
        </script>

    </head>
    
    <body>
        <div class="container col-md-12" style="background-color: transparent;">
            <div class="row">
                <h2 class="page-header">选项</h2>
            </div>
            <form action="postOrder" class="form-controll">
            	<style>
            		.order-info td {
            			width: 25%;
            			padding-right: 50px;
            		}
            		
            		.order-info .pay-button {
            			text-align: right;
            			padding-left: 88px;
            			padding-right: 0px;
            		}
            	</style>
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
                            <option value="1" selected="selected">松子</option>
                            <option value="6">婷婷</option>
                            <option value="2">小黑</option>
                            <option value="3">倩倩</option>
                            <option value="5">景云</option>
                        </select>
                    </div>
                </td>
                <td class="pay-button">
                	<div class="input-group pull-right">
						<span id="paymoney" class="input-group-addon" data-toggle="dropdown" style="width:88px; font-weight:bold; text-align: right;">
							988.00
						 </span>
                		<ul id="paylist" class="dropdown-menu" style="min-width:100%;">
                            <li><a href="###">银行卡</a></li>
                            <li><a href="###">支付宝</a></li>
                            <li><a href="###">微信</a></li>
                            <li><a href="###">现金</a></li>
                        </ul>
                        <input id="paytext" type="button" class="form-control" value="银行卡" style="width: 66px;">
						
					</div>
                </td>
                </tr>
                </table>

                <div class="table-responsive" style="margin-top: 30px">
                    <h3 class="page-header">销售</h3>
                </div>

                <div class="table-responsive">
                    <div class="input-group col-md-4 pull-left">
                        <span class="input-group-addon">条形码：</span>
                        <input type="text" class="form-control" value="" style="width: 200px;">
                    </div>
                    <div class="input-group col-md-4 pull-left">
                        <span class="input-group-addon">款号：</span>
                        <input type="text" class="form-control" style="width: 150px;">
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th width="16%">#</th>
                            <th width="12%">款号</th>
                            <th width="12%">类型</th>
                            <th width="12%">颜色</th>
                            <th width="12%">大小</th>
                            <th width="12%">原价</th>
                            <th width="12%">折扣</th>
                            <th width="12%">金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="tdinput"></td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="form-control tdinput"></td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="form-control tdinput"></td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="form-control tdinput"></td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="form-control tdinput"></td>
                            <td>90</td>
                        </tr>
                        <tr>
                            <td>10000000001</td>
                            <td>17202001</td>
                            <td>T恤</td>
                            <td>红色</td>
                            <td>S</td>
                            <td>90</td>
                            <td><input type="text" value="1.00" class="form-control tdinput"></td>
                            <td>90</td>
                        </tr>
                        </tr>
                        <tr style="border-bottom: 2px solid #ddd">
                        	<td colspan="5">
                        		<span class="pull-left">备注：&nbsp;&nbsp;</span>
                        		<input type="text" name="remark" style="height:20px; width:78%; background-color:transparent; border:none"/>
                        	</td>
                            <td>合计</td>
                            <td>9件</td>
                            <td>810.0</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            </div>
        </div>

    </body>

</html>