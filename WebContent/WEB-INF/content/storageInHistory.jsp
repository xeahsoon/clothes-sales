<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>入库查询</title>
    <script>
    	var data = '${requestScope.storagein_list }';
    	console.log(data);
		$.getScript("js/storageInHistory.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">入库查询</h2>
    </div>
    <div class="row">
	    <div class="col-md-3">
			<div class="input-group">
				<span class="input-group-addon">单号：</span>
				<input type="text" id="panel-search" class="form-control primary-input" placeholder="请输入入库单号.."/>
			</div>
		</div>
	</div>
    <div style="margin-top:30px;">
        <h3 class="page-header"><font title="默认显示近16项结果">查询结果</font></h3>
    </div>
    <div class="row panel-list">
	<c:forEach items="${requestScope.storagein_list }" var="storagein">
	<div class="col-md-6 panel-item">
		<div class="panel panel-default">
		    <div class="panel-heading">
		        <div>
		        	<span><fmt:formatNumber value="${storagein.id }" pattern="000000"></fmt:formatNumber> / ${storagein.nums }件 / ${storagein.user.name }</span>
		        	<span class="pull-right"><fmt:formatDate value="${storagein.create_date }" type="both"></fmt:formatDate></span>
		        </div>
		    </div>
		    <div class="panel-body" style="display: none">
		        <div class="table-responsive">
		        	<table class="table table-hover panel-table">
		        		<thead>
	        			<tr>
	        				<th>#</th>
	        				<th>款号</th>
	        				<th>类型</th>
	        				<th>颜色</th>
	        				<th>大小</th>
	        			</tr>
		        		</thead>
		        		<tfoot>
	        			<tr>
	        				<th>#</th>
	        				<th>款号</th>
	        				<th>类型</th>
	        				<th>颜色</th>
	        				<th>大小</th>
	        			</tr>
		        		</tfoot>
		        		<tbody>
		        		<c:forEach items="${storagein.details }" var="detail">
		        		<tr>
		        			<td><fmt:formatNumber value="${detail.storage.id }" pattern="00000000000"></fmt:formatNumber></td>
		        			<td><fmt:formatNumber value="${detail.storage.good.id }" pattern="00000000"></fmt:formatNumber></td>
		        			<td>${detail.storage.good.type }</td>
		        			<td>${detail.storage.color }</td>
		        			<td>${detail.storage.size }</td>
		        		</tr>
		        		</c:forEach>
		        		</tbody>
		        	</table>
		        </div>
		    </div>
		</div>
	</div>
	</c:forEach>
    </div>
</div>
</body>
</html>