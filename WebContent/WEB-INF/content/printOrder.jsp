<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style type="text/css">
	table{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#efefef;}
	th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
	th{font-weight:bold;background:#ccc;}
</style>
</head>
<body>
<div class = "print">

	<h3>商品销售单</h3>
	<p>销售单号：<fmt:formatNumber value="${requestScope.order.id }" pattern="00000000" /></p>
	<p>日期：${requestScope.order.create_date }</p>
	<p>打印次数：${requestScope.order.print_count }</p>
	<br>
	
	<table border="1">
		<tr>
			<th>商品</th><th>原价</th><th>折扣</th><th>数量</th><th>合计</th>
		</tr>
		<c:forEach items="${requestScope.detail_list }" var="detail">
			<tr>
				<td>
					${detail.storage_id }
				</td>
				<td>${detail.price }</td>
				<td>${detail.discount }</td>
				<td>${detail.num }</td>
				<td>${detail.sum_price }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan='3'>合计</td>
			<td>${requestScope.order.nums }</td>
			<td>${requestScope.order.sum_money }</td>
		</tr>
	</table>
	
	<p>收银：${requestScope.order.user.name }</p>
	<p>
		导购：
		<c:forEach items="${requestScope.staff_list }" var="staff">
			<span>${staff.name }</span>
		</c:forEach>
	</p>
	<p>
		<c:if test="${requestScope.order.pay_mode == 1 }">银行卡付款：</c:if>
		<c:if test="${requestScope.order.pay_mode == 2 }">支付宝付款：</c:if>
		<c:if test="${requestScope.order.pay_mode == 3 }">微信付款：</c:if>
		<span>${requestScope.order.sum_money }</span>
	</p>
	<p>备注：${requestScope.order.remark }</p>
</div>
</body>
</html>