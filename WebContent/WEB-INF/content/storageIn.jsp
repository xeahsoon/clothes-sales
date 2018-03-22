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
					<option value="${good.id }" data-type="${good.type }" data-price="${good.price }">${good.id }</option>
				</c:forEach>
				</select>
	        </div>
        </div>
        <div class="col-md-2">
	        <div class="input-group">
	            <span class="input-group-addon">颜色：</span>
				<select id="color_select" class="select">
				</select>
	        </div>
        </div>
        <div class="col-md-2">
	        <div class="input-group">
	            <span class="input-group-addon">尺码：</span>
	            <select id="size_select" class="select">
				</select>
	        </div>
        </div>
        <div class="col-md-2 pull-right">   
        	<input type="button" value="入库" class="btn btn-primary pull-right"
        		onclick="saveToStorageIn('${sessionScope.user.id }')">
	        <input type="button" value="存单" class="btn btn-default pull-right"
	        	onclick="addToStorageInTemp()" style="margin-right: 15px;">
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
        	<c:forEach items="${requestScope.temp_list }" var="temp">
       		<tr>
       			<td><fmt:formatNumber value="${temp.storage_id }" pattern="00000000000"></fmt:formatNumber></td>
       			<td><fmt:formatNumber value="${temp.good_id }" pattern="00000000"></fmt:formatNumber></td>
       			<td>${temp.type }</td>
       			<td>${temp.color }</td>
       			<td>${temp.size }</td>
       			<td>${temp.price }</td>
       			<td>
       				<span style="color: transparent">/</span>
       				<span class="glyphicon glyphicon-trash operator" onclick="deleteOneStorageInTemp('${temp.id }')"></span>
       			</td>
       		</tr>
        	</c:forEach>
        	</tbody>
        </table>
    </div>

</div>
</body>
</html>