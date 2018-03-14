<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>库存进货</title>
    <script>
		$.getScript("js/storageIn.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">库存进货</h2>
    </div>
    <div class="row">
    
    	<div class="col-md-3">
	        <div class="input-group">
	            <span class="input-group-addon">条形码：</span>
	            <input type="text" class="primary-input form-control" id="bar_code" placeholder="请输入商品条形码..">
            </div>
        </div>
    	<div class="col-md-3" style="width: 200px">
	        <div class="input-group">
	            <span class="input-group-addon">款号：</span>
				<select id="good_select">
				<c:forEach items="${requestScope.good_list }" var="good">
					<option value="${good.id }">${good.id }</option>
				</c:forEach>
				</select>
	        </div>
        </div>
        <div class="col-md-2">
	        <div class="input-group">
	            <span class="input-group-addon">颜色：</span>
				<select id="color_select" class="select">
					<option>黑色</option>
					<option>蓝色</option>
					<option>白色</option>
					<option>红色</option>
				</select>
	        </div>
        </div>
        <div class="col-md-2">
	        <div class="input-group">
	            <span class="input-group-addon">尺码：</span>
	            <select id="size_select" class="select">
					<option>S</option>
					<option>M</option>
					<option>L</option>
					<option>XL</option>
					<option>XXL</option>
				</select>
	        </div>
        </div>
        <div class="col-md-2 pull-right">   
        	<input type="button" value="入库" class="btn btn-primary pull-right">
	        <input type="button" value="存单" class="btn btn-default pull-right" style="margin-right: 15px;">
	    </div>
    </div>
    <div style="margin-top: 30px">
        <h3 class="page-header">入库明细</h3>
    </div>
    <div class="table-responsive">
        <table id="inStorageTable" class="table table-striped">
        	<thead>
        	<tr>
        		<th>#</th>
        		<th>款号</th>
        		<th>类型</th>
        		<th>颜色</th>
        		<th>尺码</th>
        		<th>价格</th>
        		<th>操作</th>
        	</tr>
        	</thead>
        	<tfoot>
        	<tr>
        		<th>#</th>
        		<th>款号</th>
        		<th>类型</th>
        		<th>颜色</th>
        		<th>尺码</th>
        		<th>价格</th>
        		<th>操作</th>
        	</tr>
        	</tfoot>
        	<tbody>
        	<c:forEach begin="1" end="50" var="i">
       		<tr>
       			<td>000000000<fmt:formatNumber value="${i }" pattern="00"></fmt:formatNumber></td>
       			<td>000000<fmt:formatNumber value="${i }" pattern="00"></fmt:formatNumber></td>
       			<td>T恤</td>
       			<td>白色</td>
       			<td>L</td>
       			<td>95.00</td>
       			<td><span class="glyphicon glyphicon-trash"></span></td>
       		</tr>
        	</c:forEach>
        	</tbody>
        </table>
    </div>

</div>
</body>
</html>