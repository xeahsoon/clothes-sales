<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>销售打单</title>

        <script type="text/javascript">
            $.getScript("js/makeOrder.js");
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
                	<!-- 隐式提交收银员编号 -->
                	<input type="hidden" id="user_id" value="${sessionScope.user.id }">
                    <div class="input-group">
                        <span class="input-group-addon">收银：</span>
                        <input type="text" class="form-control" value="${sessionScope.user.name }" readOnly="readonly">
                    </div>
                </td>
                <td>
                	<div class="input-group">
                        <span class="input-group-addon" style="border-radius: 4px; border-top-right-radius: 0; border-bottom-right-radius: 0; border-right: none;">
                        	会员：
                        </span>
                        <input type="text" id="member_phone" class="form-control" placeholder="请输入会员卡号..">
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
                	<!-- 隐式提交支付方式 -->
	                <input id="paymode" type="hidden" value="1"/>
                	<div class="input-group pull-right">
						<span id="paymoney" class="input-group-addon" data-toggle="dropdown" style="width:88px; font-weight:bold; text-align: right;">
							￥0.00
						 </span>
                		<ul id="paylist" class="dropdown-menu" style="min-width:100%;">
                            <li><a>银行卡</a></li>
                            <li><a>支付宝</a></li>
                            <li><a>微信</a></li>
                            <li><a>现金</a></li>
                        </ul>
                        <input id="paytext" type="button" class="form-control btn btn-primary"
                        	value="银行卡" style="width: 66px;" onclick="payForOrder()">
					</div>
                </td>
                </tr>
                </table>
                <div style="margin-top: 30px">
                    <h3 class="page-header">销售</h3>
                </div>
                <table>
                <tr>
                <td>
	                <div class="input-group">
	                    <span class="input-group-addon" style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; 
	                    	border-right: none;">条形码：</span>
	                    <input id="bar_code" type="text" class="primary-input form-control" placeholder="请输入商品条形码.." autofocus />
	                    <div class="input-group-btn">
		                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		                        <span class="caret"></span>
		                    </button>
		                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
		                    </ul>
	                 	</div>
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
                        <c:if test="${empty requestScope.temp_list}">
                        	<tr>
                        		<td colspan="9" style="text-align: center;">表中数据为空</td>
                        	</tr>
                        </c:if>
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
                        </tbody>
                        <tfoot>
                        	<tr style="border-bottom: 2px solid #ddd">
	                        	<td colspan="5">
	                        		<span class="pull-left">备注：&nbsp;&nbsp;</span>
	                        		<input type="text" id="remark" name="remark" class="tdremark" placeholder="--此处填写备注--"/>
	                        	</td>
	                            <td>合计：</td>
	                            <td id="temp_num">0件</td>
	                            <td id="temp_money">0.00</td>
	                            <td>
	                            	<span style="color:transparent;">/</span>
	                            	<span class="glyphicon glyphicon-trash operator" title="取消订单" onclick="deleteTempTable()"></span>
	                            </td>
	                        </tr>
                        </tfoot>
                    </table>
                </div>
            </form>
    	</div>
    </body>
</html>