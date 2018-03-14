<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品信息管理</title>
    <script>
    	$.getScript("js/good.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div>
        <h3 class="page-header">商品信息管理</h3>
    </div>
    <div class="row">
	<div class="col-md-9">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">商品列表</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
		        	<table id="goods_table" class="table table-striped">
		        	<thead>
		        	<tr>
		        	<th>#款号</th>
		        	<th>类型</th>
		        	<th>面料</th>
		        	<th>价格</th>
		        	<th>颜色</th>
		        	<th>尺码</th>
		        	<th>图片</th>
		        	<th>操作</th>
		        	</tr>
		        	</thead>
		        	<tfoot>
		        	<tr>
		        	<th>#款号</th>
		        	<th>类型</th>
		        	<th>面料</th>
		        	<th>价格</th>
		        	<th>颜色</th>
		        	<th>尺码</th>
		        	<th>图片</th>
		        	<th>操作</th>
		        	</tr>
		        	</tfoot>
		        	<tbody>
		        	<c:forEach begin="1" end="18">
		        	<tr>
		        	<td>17200101</td>
		        	<td>T恤</td>
		        	<td>100%棉</td>
		        	<td>99.00</td>
		        	<td>黑色  蓝色 白色</td>
		        	<td>S M L XL XXL XXL</td>
		        	<td>17200101.jpg</td>
		        	<td><span style="color: transparent;">/</span><span class="glyphicon glyphicon-edit operator"></span></td>
		        	</tr>
		        	</c:forEach>
		        	</tbody>
		        	</table>
		        </div>
			</div>
		</div>
	</div>
	<div class="col-md-3">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">新增商品信息</h3>
			</div>
			<div class="panel-body">
				<div class="input-group">
					<span class="input-group-addon">款号</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">类型</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">面料</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">价格</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">颜色</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">大小</span>
					<input type="text" class="form-control">
				</div><br>
				<div class="input-group">
					<span class="input-group-addon">图片</span>
					<input type="text" class="form-control">
				</div><br>
				<div>
					<input type="button" value="保存" class="btn btn-primary pull-right">
					<input type="button" value="取消" class="btn btn-default pull-right" style="margin-right:15px;">
				</div>
			</div>
		</div>
	</div>
    </div>
</div>
</body>
</html>