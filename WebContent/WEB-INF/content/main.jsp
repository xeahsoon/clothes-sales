<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="A Clothes Sales Management System">
	<meta name="author" content="xeahsoon">
	<link rel="icon" href="images/icon_blue.png">
	
	<title>迈克服装收银系统-首页</title>
	
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/bootstrap-multiselect/bootstrap-multiselect.css">
	<link rel="stylesheet" href="assets/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="assets/dataTables/css/dataTables.bootstrap.min.css">
	<link rel="stylesheet" href="assets/dataTables/css/buttons.bootstrap.min.css">
	<link rel="stylesheet" href="assets/toastr/toastr.min.css">
	<link rel="stylesheet" href="css/dashboard.css">
	<link rel="stylesheet" href="css/base.css">
	
	<script type="text/javascript" src="assets/jquery-3.3.1.min.js"></script>
		
	<script src="assets/showRight.js"></script>
	<script src="js/base.js"></script>
	<script src="js/main.js"></script>
	
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header" style="min-width: 210px;">
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
			<div class="navbar-left navbar-box col-sm-0">
				<ul class="date-top">
					<li class="glyphicon glyphicon-calendar"></li>
					<li id="date"></li>
				</ul>
				<ul class="digital">
					<li class="glyphicon glyphicon-time"></li>
					<li id="time"></li>
				</ul>
				<ul id="run_data" class="running-text">
					<li id="run_hello">
						<span class="glyphicon glyphicon-comment"></span>
					</li>
				</ul>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><span id="tp-weather-widget" style="display: block; padding-top: 10px;"></span></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown">Sales</a>
						<ul class="dropdown-menu">
							<li><a data-url="makeOrder"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售打单
							</a></li>
							<li><a data-url="orderDetail"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售单管理
							</a></li>
						</ul></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown">Statics</a>
						<ul class="dropdown-menu">
							<li><a data-url="staffsales"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>导购员业绩统计
							</a></li>
							<li><a data-url="statics"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>销售统计
							</a></li>
						</ul></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown">Storages</a>
						<ul class="dropdown-menu">
							<li><a data-url="searchGood"> <span
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
					<li><a class="dropdown-toggle" data-toggle="dropdown">System</a>
						<ul class="dropdown-menu">
							<li><a data-url="member"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>会员管理
							</a></li>
							<li><a data-url="staff"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>导购员管理
							</a></li>
							<li><a data-url="test"> <span
									class="glyphicon glyphicon-chevron-right" style="width: 25px"></span>测试页面
							</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" style="font-style: italic;">
						<span class="glyphicon glyphicon-user" style="display: inline-block; width: 20px; height: 20px;"></span>${sessionScope.user.loginname }</a>
						<ul class="dropdown-menu">
							<li><a><span class="glyphicon glyphicon-cog"
									style="width: 25px"></span><span id="top_username">${sessionScope.user.name }</span></a></li>
							<li><a><span class="glyphicon glyphicon-phone"
									style="width: 25px"></span><span>${sessionScope.user.phone }</span></a></li>
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
				<div class="menu-search">
					<span id="search_icon" class="search-icon glyphicon glyphicon-search"></span>
					<input id="search_menu" type="text" class="form-control" title="单击此处以搜索"/>
				</div>
				
				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list1" style="margin-top: 0px;">销售管理</a>
				</div>
				<div id="list1" class="collapse in">
					<ul class="nav nav-sidebar">
						<li><a data-url="makeOrder">销售打单</a></li>
						<li><a data-url="orderDetail">销售单管理</a></li>
					</ul>
				</div>

				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list2">报表统计</a>
				</div>
				<div id="list2" class="collapse">
					<ul class="nav nav-sidebar">
						<li><a data-url="staffsales">导购员业绩统计</a></li>
						<li><a data-url="statics">销售统计</a></li>
					</ul>
				</div>

				<div class="menu">
					<a data-toggle="collapse" data-parent="#accordion" href="#list3">库存管理</a>
				</div>
				<div id="list3" class="collapse">
					<ul class="nav nav-sidebar">
						<li><a data-url="searchGood">商品资料查询</a></li>
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
						<li><a data-url="member">会员管理</a></li>
						<li><a data-url="staff">导购员管理</a></li>
						<li><a data-url="test">测试页面</a></li>
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
						<table id="orders_table" class="table table-striped table-hover">
							<thead>
								<tr>
									<th>#</th>
									<th>单号</th>
									<th>金额</th>
									<th>收银员</th>
									<th>导购员</th>
									<th>会员卡号</th>
									<th>支付方式</th>
									<th>退货</th>
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
									<th>退货</th>
									<th>操作</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${requestScope.order_list }" var="order">
									<tr>
										<td><fmt:formatDate value="${order.create_date }"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td><fmt:formatNumber value="${order.id }"
												pattern="00000000" /></td>
										<td><fmt:formatNumber value="${order.sum_money }"
												pattern=".00" /></td>
										<td>${order.user.name }</td>
										<td>
											<c:forEach items="${order.staffs }" var="staff">
											${staff.staff.name }&nbsp;
											</c:forEach>
										</td>
										<td><c:if test="${empty order.member.phone }">无会员信息</c:if>${order.member.phone }</td>
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
										<td>${order.return_flag }</td>
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

	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="assets/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="assets/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>

	<script src="assets/dataTables/jquery.dataTables.min.js"></script>
	<script src="assets/dataTables/dataTables.bootstrap.min.js"></script>
	<script src="assets/dataTables/dataTables.buttons.min.js"></script>
	<script src="assets/dataTables/buttons.bootstrap.min.js"></script>
	
	<script src="assets/dataTables/jszip.min.js"></script>
	<script src="assets/dataTables/pdfmake.min.js"></script>
	<script src="assets/dataTables/vfs_fonts.js"></script>
	<script src="assets/dataTables/buttons.html5.min.js"></script>
	<script src="assets/dataTables/buttons.print.min.js"></script>
	<script src="assets/dataTables/buttons.colVis.min.js"></script>
	
	<script src="assets/newsTicker/jquery.newsTicker.min.js"></script>
	<script src="assets/thinkPageWeather.js"></script>
	
	<script src="assets/toastr/toastr.min.js"></script>

	<script src="assets/echarts/echarts-theme.js"></script>
	<script src="assets/echarts/echarts.js"></script>

	<script src="assets/jqprint/browser.js"></script>
	<script src="assets/jqprint/jquery.jqprint-0.3.js"></script>
	
	<script src="assets/quicksearch/jquery.quicksearch.js"></script>
	<script src="assets/bootstrap-suggest/bootstrap-suggest.js"></script>

	<script src="assets/json2.js"></script>

	
</body>
</html>
