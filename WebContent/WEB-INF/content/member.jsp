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
                $("#addForm").fadeToggle();
                $("#symbol").css("transform", "rotate(" + (45*i) + "deg)");
                i++;
            });
        });
    </script>

</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">会员管理</h2>
    </div>

    <div class="row">
        <div class="col-md-3">
            <form action="search_good" class="form-controll">
                <div class="input-group ">
                    <span class="input-group-addon">卡号：</span>
                    <input type="text" class="form-control" placeholder="请输入会员手机号码..">
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

                    #symbol {
                        cursor: pointer;
                    }
                </style>
                <span id="symbol" class="glyphicon glyphicon-plus" title="新增会员"></span>
            </div>
            <form action="add_member" method="get" id="addForm" style="display: none">
                <div class="input-group col-md-3 pull-left">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input name="name" type="text" class="form-control" placeholder="会员姓名.." style="width: 88%;">
                </div>
                <div class="input-group col-md-3 pull-left">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                    <input name="phone" type="text" class="form-control" placeholder="手机号码.." style="width: 88%;">
                </div>
                <div class="input-group date form_date col-md-3 pull-left">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    <input name="birth" class="form-control" type="text" placeholder="会员生日.." style="width: 88%;">
                </div>
                <div class="input-group col-md-2 pull-left" style="width: 66px;">
                    <input type="submit" class="btn btn-default" value="注册会员">
                </div>
            </form>
        </div>

    </div>
    <div class="table-responsive" style="margin-top: 30px">
        <h3 class="page-header">会员列表</h3>
    </div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>卡号</th>
                <th>姓名</th>
                <th>生日</th>
                <th>折扣</th>
                <th>积分</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
            <tr>
                <td>1001</td>
                <td><a href="###">15270926232</a></td>
                <td>谢松</td>
                <td>07/11</td>
                <td>1.00</td>
                <td>90</td>
                <td><a href="###">修改</a></td>
            </tr>
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