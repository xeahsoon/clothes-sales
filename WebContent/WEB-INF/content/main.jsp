<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="A Clothes Sales Management System">
	<meta name="author" content="xeahsoon">
	<link rel="icon" href="images/icon_blue.png">
	
	<title>迈克服装收银系统-首页</title>
	
	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet"
		href="css/bootstrap/css/bootstrap-multiselect.css">
	<link rel="stylesheet"
		href="css/bootstrap/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" type="text/css"
		href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/buttons.bootstrap.css">
	
	<!-- Custom styles for this template -->
	<link href="css/dashboard.css" rel="stylesheet">
	<link rel="stylesheet" href="css/base.css">
	
	<script src="css/bootstrap/js/jquery.min.js"></script>
	<!--解决 jqprint所需jquery 和bootstrap版本不一致问题-->
	<script src="js/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="js/showRight.js"></script>
	<script src="js/echarts-theme.js"></script>
	<script src="js/main.js"></script>
	<script src="js/base.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img src="images/icon.png" class="pull-left"
					style="height: 36px; margin: 7px;" alt="icon">
				<a class="navbar-brand" href="main">MyClothes</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Sales</a>
						<ul class="dropdown-menu">
							<li><a onclick="showAtRight('makeOrder')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售打单
							</a></li>
							<li><a onclick="showAtRight('orderDetail')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售单管理
							</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Statics</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="showAtRight('staffsales')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>导购员业绩统计
							</a></li>
							<li><a href="#" onclick="showAtRight('statics')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售统计
							</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">Storages</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="showAtRight('searchGood')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>商品资料查询
							</a></li>
							<li><a href="#"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>库存进货
							</a></li>
							<li><a href="#"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>库存出货
							</a></li>
							<li><a href="#"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>库存盘点
							</a></li>
						</ul></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown">System</a>
						<ul class="dropdown-menu">
							<li><a href="#" onclick="showAtRight('member')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>会员管理
							</a></li>
							<li><a href="#" onclick="showAtRight('staff')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>导购员管理
							</a></li>
							<li><a href="#" onclick="showAtRight('test')"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>测试页面
							</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">
						${sessionScope.user.name }</a>
						<ul class="dropdown-menu">
							<li><a><span class="glyphicon glyphicon-user"
									style="width: 25px"> </span>${sessionScope.user.loginname }</a></li>
							<li><a><span class="glyphicon glyphicon-phone"
									style="width: 25px"> </span>${sessionScope.user.phone }</a></li>
							<li class="divider"></li>
							<li><a href="logout"> <span
									class="glyphicon glyphicon-log-out" style="width: 25px"></span>注销登录
							</a></li>
						</ul></li>

				</ul>
				<!--<form action="searchOrder" class="navbar-form navbar-right">
            <input type="text" name="search" class="form-control" placeholder="请输入销售单号...">
          </form>-->
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list1">销售管理</a>
				</div>
				<div id="list1" class="collapse in">
					<ul class="nav nav-sidebar">
						<li><a onclick="showAtRight('makeOrder')">销售打单</a></li>
						<li><a onclick="showAtRight('orderDetail')">销售单管理</a></li>
					</ul>
				</div>

				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list2">报表统计</a>
				</div>
				<div id="list2" class="collapse">
					<ul class="nav nav-sidebar">
						<li><a href="#" onclick="showAtRight('staffsales')">导购员业绩统计</a></li>
						<li><a href="#" onclick="showAtRight('statics')">销售统计</a></li>
					</ul>
				</div>

				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list3">库存管理</a>
				</div>
				<div id="list3" class="collapse">
					<ul class="nav nav-sidebar">
						<li><a href="#" onclick="showAtRight('searchGood')">商品资料查询</a></li>
						<li><a href="#">库存进货</a></li>
						<li><a href="#">库存出货</a></li>
						<li><a href="#">库存盘点</a></li>
					</ul>
				</div>

				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list4">系统管理</a>
				</div>
				<div id="list4" class="collapse">
					<ul class="nav nav-sidebar">
						<li><a href="#" onclick="showAtRight('member')">会员管理</a></li>
						<li><a href="#" onclick="showAtRight('staff')">导购员管理</a></li>
						<li><a href="#" onclick="showAtRight('test')">测试页面</a></li>
					</ul>
				</div>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div id="content">
					<h1 class="page-header">昨日销售</h1>

					<div class="row placeholders">
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="test_div_0" style="width: 175px; height: 200px; margin: 0 auto;"></div>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="test_div_1" style="width: 175px; height: 200px; margin: 0 auto;"></div>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="test_div_2" style="width: 175px; height: 200px; margin: 0 auto;"></div>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder">
							<div id="test_div_3" style="width: 175px; height: 200px; margin: 0 auto;"></div>
						</div>
					</div>

					<h2 class="sub-header">清单</h2>
					<div class="table-responsive">
						<table id="orders_table" class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>单号</th>
									<th>金额</th>
									<th>收银员</th>
									<th>导购员</th>
									<th>会员卡号</th>
									<th>支付方式</th>
									<th>操作</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>#</th>
									<th>单号</th>
									<th>金额</th>
									<th>收银员</th>
									<th>导购员</th>
									<th>会员卡号</th>
									<th>支付方式</th>
									<th>操作</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${requestScope.order_list }" var="order">
									<tr>
										<td><fmt:formatDate value="${order.create_date }"
												type="both" /></td>
										<td><fmt:formatNumber value="${order.id }"
												pattern="00000000" /></td>
										<td>${order.sum_money }</td>
										<td>${order.user.name }</td>
										<td>
											<c:forEach items="${order.staffs }" var="staff">
											${staff.staff.name }
											</c:forEach>
										</td>
										<td>${order.member.phone }</td>
										<c:if test="${order.pay_mode == 1 }">
											<td>银行卡</td>
										</c:if>
										<c:if test="${order.pay_mode == 2 }">
											<td>支付宝</td>
										</c:if>
										<c:if test="${order.pay_mode == 3 }">
											<td>微信</td>
										</c:if>
										<c:if test="${order.pay_mode == 4 }">
											<td>现金</td>
										</c:if>
										<td><span style="color: transparent">/</span> <span
											class="glyphicon glyphicon-share operator" title="详细"
											onclick="showAtRight('orderDetail/${order.id}')"></span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="css/bootstrap/js/bootstrap.min.js"></script>
	<script src="css/bootstrap/js/bootstrap-multiselect.js"></script>
	<script src="css/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script src="css/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>

	<script src="js/jquery.dataTables.js"></script>
	<script src="js/dataTables.bootstrap.js"></script>

	<script src="js/dataTables.buttons.js"></script>
	<script src="js/buttons.bootstrap.js"></script>

	<script src="js/echarts.js"></script>

	<script src="js/jquery.jqprint-0.3.js"></script>
	
	<script src="js/bootstrap-suggest.js"></script>
	
	<script src="js/jquery.quicksearch.js"></script>
	
	<script src="js/json2.js"></script>

	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!--<script src="css/bootstrap/js/holder.min.js"></script>-->
</body>
</html>
