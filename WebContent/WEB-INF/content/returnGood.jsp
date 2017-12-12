<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script>
        $(document).ready(function(){
            var i=0;
            $("#check_ok").click(function(){
                $(":checkbox").click();
                $("#check_ok").hide();
                $("#check_remove").slideDown();
            });

            $("#check_remove").click(function(){
                $(":checkbox").click();
                $("#check_remove").hide();
                $("#check_ok").fadeIn();
            });
        });
    </script>

</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">销售退换货</h2>
    </div>
    <div class="row">
        <div class="col-md-4">
            <form action="search_good" class="form-controll">
                <div class="input-group ">
                    <span class="input-group-addon">单号：</span>
                    <input type="text" class="form-control" placeholder="请输入流水单号..">
                </div>
            </form>
        </div>
    </div>
    <div class="table-responsive" style="margin-top: 30px">
        <h3 class="page-header">清单明细</h3>
        <table class="table table-striped" id="info">
            <style>
                #info td:nth-child(3n) {
                    color: #dddddd;
                }
            </style>
            <tr style="border-bottom:1px solid #ddd;">
                <td>时间：</td><td>2017-12-01 15:14:32</td><td>/</td>
                <td>单号：</td><td>12345678</td><td>/</td>
                <td>收银：</td><td>店长1</td><td>/</td>
                <td>导购：</td><td>松子 小黑 倩倩</td><td>/</td>
                <td>支付：</td><td>支付宝</td>
                <td>/</td><td>会员：</td><td>15270926232</td>
            </tr>
        </table>
    </div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th width="15%">条形码</th>
                <th width="11%">款号</th>
                <th width="11%">类型</th>
                <th width="11%">颜色</th>
                <th width="11%">大小</th>
                <th width="11%">原价</th>
                <th width="11%">折扣</th>
                <th width="11%">金额</th>
                <th width="8%">
                    <span id="check_ok" class="glyphicon glyphicon-ok"></span>
                    <span id="check_remove" class="glyphicon glyphicon-remove" style="display: none"></span>
                </th>
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
                <td>1.00</td>
                <td>90</td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td>10000000001</td>
                <td>17202001</td>
                <td>T恤</td>
                <td>红色</td>
                <td>S</td>
                <td>90</td>
                <td>1.00</td>
                <td>90</td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td>10000000001</td>
                <td>17202001</td>
                <td>T恤</td>
                <td>红色</td>
                <td>S</td>
                <td>90</td>
                <td>1.00</td>
                <td>90</td>
                <td><input type="checkbox"></td>
            </tr>
            <tr>
                <td>10000000001</td>
                <td>17202001</td>
                <td>T恤</td>
                <td>红色</td>
                <td>S</td>
                <td>90</td>
                <td>1.00</td>
                <td>90</td>
                <td><input type="checkbox"></td>
            </tr>
            </tr>
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="5">
                    <label>备注：&nbsp;&nbsp;</label>
                    邮寄至顾客家，地址及联系方式见记事簿，经手人：松子
                </td>
                <td>合计</td>
                <td>9件</td>
                <td>810.0</td>
                <td>
                    <span class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-list"></span>
                        <!--<b class="caret"></b>-->
                    </span>
                    <ul class="dropdown-menu dropdown-menu-right" style="margin-top: -10px;">
                        <li><a href="###">退货</a></li>
                        <li><a href="###">换货</a></li>
                    </ul>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>