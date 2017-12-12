<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script>
        $(document).ready(function(){
            var i=1;
            $("#symbol").click(function(){
                $("#symbol").css("transform", "rotate(" + (45*i) + "deg)");
                $(".add").fadeToggle();
                i++;
            });
        });
    </script>

</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">导购员管理</h2>
    </div>

    <div class="row">
        <div class="col-md-3">
            <form action="search_good" class="form-controll">
                <div class="input-group ">
                    <span class="input-group-addon">姓名：</span>
                    <input type="text" class="form-control" placeholder="请输入导购员姓名..">
                </div>
            </form>
        </div>
        <div class="col-md-9 pull-right">
            <div class="col-md-1">
                <style>
                    #symbol {
                        line-height: 32px;
                        text-align: center;
                        width: 32px;

                        transition: All 0.2s ease-in-out;
                        -webkit-transition: All 0.2s ease-in-out;
                        -moz-transition: All 0.2s ease-in-out;
                        -o-transition: All 0.2s ease-in-out;
                    }

                    #symbol:hover {
                        cursor: pointer;
                    }
                </style>
                <span id="symbol" class="glyphicon glyphicon-plus" title="新增导购员"></span>
            </div>
            <form action="/add_staff" method="post" class="add" style="display: none">
                <div class="input-group col-md-3 pull-left">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" placeholder="导购员姓名.." style="width: 88%;">
                </div>
                <div class="input-group col-md-3 pull-left">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                    <input type="text" class="form-control" placeholder="手机号码.." style="width: 88%;">
                </div>
                <div class="input-group col-md-2 pull-left" style="width: 66px;">
                    <input type="submit" class="btn btn-default" value="新增导购员">
                </div>
            </form>
            <div class="input-group col-md-2 pull-left add" style="margin-left: 20px; width: 66px; display: none">
                <button class="btn btn-default" data-toggle="modal" data-target="#addmore">填写详细信息</button>
            </div>
            <!--modal-->
            <div class="modal fade" id="addmore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/add">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">添加导购员信息</h4>
                            </div>
                            <!--modal body-->
                            <div class="modal-body">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" name="staffname" class="form-control" placeholder="员工姓名..">
                                </div>
                                <div class="input-group" style="margin-top: 10px;">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                    <input type="text" name="phone" class="form-control" placeholder="手机号码..">
                                </div>
                                <div class="input-group" style="margin-top: 10px;">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-credit-card"></span></span>
                                    <input type="text" name="idcard" class="form-control" placeholder="身份证号..">
                                </div>
                                <div class="input-group" style="margin-top: 10px;">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                                    <input type="text" name="address" class="form-control" placeholder="家庭地址..">
                                </div>
                            </div> <!--modal body end-->
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                                <input type="submit" class="btn btn-primary" value="新增">
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>

    </div>
    <div class="table-responsive" style="margin-top: 30px">
        <h3 class="page-header">导购员列表</h3>
    </div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>姓名</th>
                <th>电话</th>
                <th>身份证号</th>
                <th>联系地址</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr>
                <td>1001</td>
                <td>小黑</td>
                <td>13245677890</td>
                <td>368729777821992711</td>
                <td>江西省九江市浔阳区沿江路***小区18栋1502</td>
                <td>待审核</td>
                <td>
                    <a href="###" class="glyphicon glyphicon-pencil" title="编辑"></a>
                    <span style="color: #ddd;">/</span>
                    <a href="###" class="glyphicon glyphicon-cog" title="审核/反审核"></a>
                </td>
            </tr>
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="6">合计</td>
                <td>9位</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: "yyyy/mm/dd"
    });
</script>

</body>
</html>