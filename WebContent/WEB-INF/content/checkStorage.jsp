<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>库存盘点</title>
    <script>
    	$.getScript("js/checkStorage.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">库存盘点</h2>
    </div>
    <div class="row">
        <div class="col-md-3">
	        <div class="input-group">
	            <span class="input-group-addon">条形码：</span>
	            <input type="text" id="bar_code" class="primary-input form-control" placeholder="请输入商品条形码..">
	        </div>
        </div>
        <div id="controlButtons" class="col-md-3 pull-right">
        	<style>
        	.buttons-excel{
        		display: none;
        	}
        	</style>
        	<div class="btn-group" style="padding-left: 45px;">
				<button type="button" class="btn btn-default dropdown-toggle" 
						data-toggle="dropdown">
					导出文件 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu" style="margin-left: 45px;">
					<li><a data-file="uncheckedTable">未盘点Excel</a></li>
					<li><a data-file="checkedTable">已盘点Excel</a></li>
				</ul>
			</div>
        	
        	<!-- <input type="button" value="结算盘点" class="btn btn-primary pull-right"> -->
	        <input type="button" value="清空盘点" class="btn btn-primary pull-right" onclick="uncheckAllStorages()">
        </div>
    </div>
    <div style="margin-top: 30px">
        <h3 class="page-header" title="左侧表格为未盘点库存，右侧为已盘点">明细</h3>
    </div>
    <div class="row">
	    <div class="table-responsive col-md-6">
	        <table id="uncheckedTable" class="table table-striped">
	        <thead>
	        <tr>
	        	<th>#未盘点</th>
	        	<th>款号</th>
	        	<th>类型</th>
	        	<th>颜色</th>
	        	<th>大小</th>
	        	<th>价格</th>
	        </tr>
	        </thead>
	        <tfoot>
	        <tr>
	        	<th>#未盘点</th>
	        	<th>款号</th>
	        	<th>类型</th>
	        	<th>颜色</th>
	        	<th colspan="2" class="text-right">大小</th>
	        	<!-- <th>价格</th> -->
	        </tr>
	        </tfoot>
	        <tbody>
	        <c:forEach items="${requestScope.unchecked_list }" var="unchecked">
		       	<tr>
		       		<td><fmt:formatNumber value="${unchecked.id }" pattern="00000000000"/></td>
		       		<td>${unchecked.good.id }</td>
		       		<td>${unchecked.good.type }</td>
		       		<td>${unchecked.color }</td>
		       		<td>${unchecked.size }</td>
		       		<td>${unchecked.good.price }</td>
		       	</tr>
	        </c:forEach>
	        </tbody>
	        </table>
	    </div>
	    <div class="table-responsive col-md-6">
	        <table id="checkedTable" class="table table-striped">
	        <thead>
	        <tr>
	        	<th>#已盘点</th>
	        	<th>款号</th>
	        	<th>类型</th>
	        	<th>颜色</th>
	        	<th>大小</th>
	        	<th>价格</th>
	        </tr>
	        </thead>
	        <tfoot>
	        <tr>
	        	<th>#已盘点</th>
	        	<th>款号</th>
	        	<th>类型</th>
	        	<th>颜色</th>
	        	<th colspan="2" class="text-right">大小</th>
	        	<!-- <th>价格</th> -->
	        </tr>
	        </tfoot>
	        <tbody>
	        <c:forEach items="${requestScope.checked_list }" var="checked">
		       	<tr>
		       		<td><fmt:formatNumber value="${checked.id }" pattern="00000000000"/></td>
		       		<td>${checked.good.id }</td>
		       		<td>${checked.good.type }</td>
		       		<td>${checked.color }</td>
		       		<td>${checked.size }</td>
		       		<td>${checked.good.price }</td>
		       	</tr>
	        </c:forEach>
	        </tbody>
	        </table>
	    </div>
    </div>
</div>
</body>
</html>