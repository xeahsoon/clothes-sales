<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
            <form action="searchReturnGood" class="form-controll">
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
                <td>时间：</td><td><fmt:formatDate value="${order.create_date }" type="both"/></td><td>/</td>
                <td>单号：</td><td><fmt:formatNumber value="${order.id }" pattern="00000000"/></td><td>/</td>
                <td>收银：</td><td>${order.user.name }</td><td>/</td>
                <td>导购：</td><td>
					<c:forEach items="${order.staffs }" var="staff">
						${staff.staff.name }
					</c:forEach>
				</td><td>/</td>
                <td>支付：</td><td>
                	<c:if test="${order.pay_mode == 1 }">银行卡</c:if>
					<c:if test="${order.pay_mode == 2 }">支付宝</c:if>
					<c:if test="${order.pay_mode == 3 }">微信</c:if>
					<c:if test="${order.pay_mode == 4 }">现金</c:if>
                </td>
                <td>/</td><td>会员：</td><td>${order.member.phone }</td>
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
                    <span id="check_ok" class="glyphicon glyphicon-ok operator"></span>
                    <span id="check_remove" class="glyphicon glyphicon-remove operator" style="display: none"></span>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.details }" var="detail">
            	<tr>
            		<td><fmt:formatNumber value="${detail.storage_id }" pattern="00000000000"/></td>
            		<td><fmt:formatNumber value="${detail.good.id }" pattern="00000000"/></td>
            		<td>${detail.good.type }</td>
            		<td>${detail.color }</td>
            		<td>${detail.size }</td>
            		<td>${detail.price }</td>
            		<td><fmt:formatNumber value="${detail.discount }" pattern="0.00"/></td>
            		<td>${detail.dis_price }</td>
            		<td><input type="checkbox"></td>
            	</tr>
            </c:forEach>
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="5">
                    <label>备注：&nbsp;&nbsp;</label>
                  	${order.remark }
                </td>
                <td>合计</td>
                <td>${order.nums }</td>
                <td>${order.sum_money }</td>
                <td>
                    <span class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-list operator"></span>
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