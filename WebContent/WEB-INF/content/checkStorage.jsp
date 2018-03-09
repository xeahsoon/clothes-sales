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
        <div class="col-md-4">
	        <div class="input-group">
	            <span class="input-group-addon">条形码：</span>
	            <input type="text" class="form-control">
	        </div>
        </div>
        <div class="col-md-3 pull-right">
	        <input type="button" value="结算盘点" class="btn btn-primary pull-right">
	        <input type="button" value="清空盘点" class="btn btn-default pull-right" style="margin-right: 20px;">
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
	        <c:forEach begin="0" end="24" var="i">
		       	<tr>
		       		<td><fmt:formatNumber value="${i+1 }" pattern="00000000000"/></td>
		       		<td>18201014</td>
		       		<td>外套</td>
		       		<td>蓝色</td>
		       		<td>S</td>
		       		<td>${(i+1) * 10 }.00</td>
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
	        <c:forEach begin="0" end="24" var="i">
		       	<tr>
		       		<td><fmt:formatNumber value="${i+1 }" pattern="00000000000"/></td>
		       		<td>18201014</td>
		       		<td>外套</td>
		       		<td>蓝色</td>
		       		<td>S</td>
		       		<td>${(i+1) * 11 }.00</td>
		       	</tr>
	        </c:forEach>
	        </tbody>
	        </table>
	    </div>
    </div>
</div>
</body>
</html>