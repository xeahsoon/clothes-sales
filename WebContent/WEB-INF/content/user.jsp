<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>店长信息管理</title>
    <script>
    	$.getScript("js/user.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div>
        <h3 class="page-header">店长信息管理</h3>
    </div>
    <div class="row">
	<div id="left" style="float:left; padding:0px 15px;	width:100%;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">用户列表</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
		        	<table id="user_table" class="table table-striped table-hover" style="white-space: nowrap;">
		        	<thead>
		        	<tr>
		        	<th>#</th>
		        	<th>登录名</th>
		        	<th>姓名</th>
		        	<th>联系方式</th>
		        	<th>状态</th>
		        	</tr>
		        	</thead>
		        	<tfoot>
		        	<tr>
		        	<th>#</th>
		        	<th>登录名</th>
		        	<th>姓名</th>
		        	<th>联系方式</th>
		        	<th>状态</th>
		        	</tr>
		        	</tfoot>
		        	<tbody>
		        	<c:forEach items="${requestScope.user_list }" var="user">
		        	<tr>
		        	<td>${user.id }</td>
		        	<td>${user.loginname }</td>
		        	<td>${user.name }</td>
		        	<td>${user.phone }</td>
		        	<td>${user.status }</td>
		        	</tr>
		        	</c:forEach>
		        	</tbody>
		        	</table>
		        </div>
			</div>
		</div>
	</div>
	<div id="right" style="float:right; padding:0px 15px; width:24%; display:none;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">用户信息</h3>
			</div>
			<div class="panel-body" style="min-height: 416px;">
				<div class="input-group">
					<span class="input-group-addon">登录名</span>
					<input type="text" id="loginname" class="form-control" placeholder="登录名..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">用户名</span>
					<input type="text" id="username" class="form-control" placeholder="用户名..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">电&nbsp;&nbsp;&nbsp;话</span>
					<input type="text" id="userphone" class="form-control" placeholder="联系方式..">
				</div>
				<div>
					<input type="button" id="save" value="保存" class="btn btn-primary pull-right" onclick="saveUser()">
					<input type="button" id="cancel" value="取消" class="btn btn-default pull-right" style="margin-right:15px;">
				</div>
			</div>
		</div>
	</div>
    </div>
</div>
</body>
</html>