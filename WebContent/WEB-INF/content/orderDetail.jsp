<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <form action="searchOrder" class="form-controll">
                <div class="input-group pull-left">
                    <span class="input-group-addon">单号：</span>
                    <input type="text" name="order_id" class="form-control" placeholder="请输入流水单号..">
                </div>
            </form>
        </div>
    </div>
    
    <div class="table-responsive" style="margin-top: 30px" id="test">
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
					<c:if test="${order.pay_mode == 2 }">支付宝</td></c:if>
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
            <c:forEach items="${order.details }" var="detail">
            	<tr>
            		<td><fmt:formatNumber value="${detail.storage_id }" pattern="00000000000"/></td>
            		<td><fmt:formatNumber value="${detail.good_id }" pattern="00000000"/></td>
            		<td></td>
            		<td>${detail.color }</td>
            		<td>${detail.size }</td>
            		<td>${detail.price }</td>
            		<td><fmt:formatNumber value="${detail.discount }" pattern="0.00" /></td>
            		<td>${detail.dis_price }</td>
            	</tr>
            </c:forEach>
            
            <tr style="border-bottom: 2px solid #ddd">
                <td colspan="4">
                    <label>备注：&nbsp;&nbsp;</label>
                    <marquee behavior="scroll" direction="left" style="width: 88%; height: 16px">
                        ${order.remark }
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
                <td>${order.nums }件</td>
                <td>${order.sum_money }</td>
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
                        <p>销售单号：<fmt:formatNumber value="${order.id }" pattern="00000000"/></p>
                        <p>日期：<fmt:formatDate value="${order.create_date }" type="both"/></p>
                        <p>打印次数：${order.print_count }</p>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>商品</th><th>原价</th><th>折扣</th><th>合计</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${order.details }" var="detail">
                                	<tr>
                                	<td>
                                		<fmt:formatNumber value="${detail.good_id }" pattern="00000000"/>/
                                		${detail.color }/${detail.size }
                                	</td>
                                	<td>${detail.price }</td>
                                	<td><fmt:formatNumber value="${detail.discount }" pattern="0.00"/></td>
                                	<td>${detail.dis_price }</td>
                                	</tr>
                                </c:forEach>
                             
                                <tr style="border-bottom: 2px solid #ddd">
                                    <td colspan="2">合计</td>
                                    <td>${order.nums }</td>
                                    <td>${order.sum_money }</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <p>收银：<span>${order.user.name }</span></p>
                        <p>导购：
                        	<c:forEach items="${order.staffs }" var="staff">
                        		<span>${staff.staff.name }</span>
                        	</c:forEach>
                        </p>
                        <p>银行卡付款：
                            <span>${order.sum_money }</span>
                        </p>
                        <p>备注：${order.remark }</p>
                    </div>
                    <div class="modal-footer" id="footer">
                        <script>
                            $(document).ready(function() {
                                $("#printButton").click(function(){
                                    $("#div_print").jqprint();
                                });
                            });
                        </script>
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭">
                        <input id="printButton" type="button" class="btn btn-primary" value="打印">
                    </div>
            	</div>
        	</div>
    	</div>
    </div>
</div>
</body>
</html>