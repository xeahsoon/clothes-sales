<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">销售清单查询</h2>
    </div>
    <div class="row">
        <div class="col-md-4">
            <form action="search_good" class="form-controll">
                <div class="input-group pull-left">
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
                <th width="16%">条形码</th>
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
                <td>1.00</td>
                <td>90</td>
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
            </tr>
            </tr>
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="4">
                    <label>备注：&nbsp;&nbsp;</label>
                    <marquee behavior="scroll" direction="left" style="width: 88%; height: 16px">
                        邮寄至顾客家，地址及联系方式见记事簿，经手人：松子 //就像歌词唱的，你的爱太多，想随身带走，想你的时候，就咬上一口，我温热着被呵护的感受，却又担心降了温的要求。
                    </marquee>
                </td>
                <style>
                    #send:hover {
                        color: #337ab7;
                        cursor: pointer;
                    }
                </style>
                <td>
                    <span id="send" class="glyphicon glyphicon-print" data-toggle="modal" data-target="#print"></span>
                </td>
                <td>合计</td>
                <td>9件</td>
                <td>810.0</td>
            </tr>
            </tbody>
        </table>
        <!--modal-->
        <div class="modal fade" id="print" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog"  style="width: 28%; font-size: 12px">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">打印</h4>
                    </div>
                    <!--modal body-->
                    <div class="modal-body form-controll" id="div_print">
                        <h4 style="text-align: center">
                            <i>MyClothes</i>商品销售单
                        </h4>
                        <br>
                        <p>销售单号：00001234</p>
                        <p>日期：2017/12/8 09:53</p>
                        <p>打印次数：1</p>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>商品</th><th>原价</th><th>折扣</th><th>数量</th><th>合计</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr>
                                    <td>17202010/黑色/XXl</td>
                                    <td>120.00</td>
                                    <td>1.00</td>
                                    <td>2</td>
                                    <td>240.00</td>
                                </tr>
                                <tr style="border-bottom: 2px solid #ddd">
                                    <td colspan="3">合计</td>
                                    <td>5</td>
                                    <td>840.00</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <p>收银：店长1</p>
                        <p>
                            导购：
                            <span>松子</span><span>小倩</span>
                        </p>
                        <p>
                            银行卡付款：
                            <span>840.00</span>
                        </p>
                        <p>备注：
                    <div class="modal-footer">
                        <script>
                            /*$(document).ready(function() {
                                $("#printButton").click(function(){
                                    window.open();
                                });
                            });*/

                            function printdiv(printpage)
                            {
                                var headstr = "<html><head><title></title></head><body>";
                                var footstr = "</body>";
                                var newstr = document.all.item(printpage).innerHTML;
                                var oldstr = document.body.innerHTML;
                                document.body.innerHTML = headstr+newstr+footstr;
                                window.print();
                                document.body.innerHTML = oldstr;
                                return false;
                            }
                        </script>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                        <input id="printButton" type="button" class="btn btn-primary" onclick="printdiv('div_print')" value="打印">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
</body>
</html>