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
            <form action="searchOrderDetail" class="form-controll">
                <div class="input-group pull-left">
                    <span class="input-group-addon">单号：</span>
                    <input type="text" name="order_id" class="form-control" placeholder="请输入流水单号..">
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
                    <label>备注：&nbsp;&nbsp;</label>${order.remark }
                    <!-- 
                    <marquee behavior="scroll" direction="left" style="width: 88%; height:16px;">
                        ${order.remark }
                    </marquee>
                    -->
                </td>
                <td>
                	<span class="glyphicon glyphicon-edit operator" title="详细" data-toggle="modal" data-target="#remarkModal" onclick="setModalContent('<fmt:formatNumber value="${order.id }" pattern="00000000"/>', '${order.remark }')"></span>
                	<span style="color: #ddd;">/</span>
                    <span class="glyphicon glyphicon-print operator" title="打印" data-toggle="modal" data-target="#printModal"></span>
                </td>
                <td>合计</td>
                <td>${order.nums }件</td>
                <td>${order.sum_money }</td>
            </tr>
            </tbody>
        </table>
        <!-- add remark modal -->
		<div class="modal fade" id="remarkModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="addRemark" method="post">
						<!-- 提交方式必须为post，否则中文会乱码，原因不清 -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">添加备注</h4>
						</div>
						<div class="modal-body">
							<p>
								<span>备注信息：</span> <span class="pull-right"> 单号： <input
									id="order_id" name="order_id" type="text"
									style="height: 20px; width: 62px; background-color: transparent; border: none;" />
								</span>
							</p>
							<textarea id="remark" name="remark" class="form-control"
								rows="3" style="width: 100%; resize: none"></textarea>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default"
								data-dismiss="modal" value="关闭">
							<input type="submit" class="btn btn-primary"
							 value="保存">
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- printing modal -->
        <c:import url="printModal.jsp"></c:import>
    </div>
</div>
</body>
</html>