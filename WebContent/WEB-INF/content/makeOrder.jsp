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
        </script>

    </head>
    
    <body>
        <div class="container col-md-12" style="background-color: transparent;">
            <div class="row">
                <h2 class="page-header">选项</h2>
            </div>
            <form action="postOrder" class="form-controll">
                <div class="row">
                    <div class="input-group col-md-3 pull-left">
                        <span class="input-group-addon">收银：</span>
                        <input type="text" class="form-control" value="九江万达店"disabled="disabled" style="width: 120px;">
                    </div>
                    <div class="input-group col-md-3 pull-left">
                        <span class="input-group-addon">导购：</span>
                        <select id="staff_multiselect" multiple="multiple">
                            <option value="1" selected="selected">松子</option>
                            <option value="6">婷婷</option>
                            <option value="2">小黑</option>
                            <option value="3">倩倩</option>
                            <option value="5">景云</option>
                        </select>
                    </div>
                    <div class="input-group col-md-3 pull-left">
                        <span class="input-group-addon">会员卡：</span>
                        <input type="text" class="form-control" style="width: 120px;">
                    </div>
                    <div class="input-group col-md-3 pull-left">
                        <!--<span class="input-group-addon">支付：</span>-->
                        <input type="text" value="98.9" class="form-control" style="font-weight: 600" disabled="disabled">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default" data-toggle="dropdown">
                                <span class="caret"></span>
                            </button>
                            <ul id="paylist" class="dropdown-menu" style="min-width:100%;">
                                <li><a href="###">银行卡</a></li>
                                <li><a href="###">支付宝</a></li>
                                <li><a href="###">微信</a></li>
                                <li><a href="###">现金</a></li>
                            </ul>
                            <input id="paytext" type="submit" class="btn btn-default" value="银行卡" style="width: 66px;">
                        </div><!-- /btn-group -->
                    </div><!-- /input-group -->
                </div>


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
                        		<span class="pull-left">备注：&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        		<input type="text" name="remark" class="form-control" style="height:20px; width:78%; background-color:#f9f9f9;"/>
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