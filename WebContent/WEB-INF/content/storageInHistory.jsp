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
	<c:forEach begin="1" end="16" var="i">
	<div class="col-md-6 panel-item">
		<div class="panel panel-default">
		    <div class="panel-heading">
		        <h3 class="panel-title"><span>1000000${i }</span><span class="pull-right">2018-0${i }-14 00:00:00</span></h3>
		    </div>
		    <div class="panel-body" style="display: none">
		        <div class="table-responsive">
		        	<table class="table table-striped test-panel-table">
		        		<thead>
	        			<tr>
	        				<th>#</th>
	        				<th>款号</th>
	        				<th>颜色</th>
	        				<th>大小</th>
	        			</tr>
		        		</thead>
		        		<tfoot>
	        			<tr>
	        				<th>#</th>
	        				<th>款号</th>
	        				<th>颜色</th>
	        				<th>大小</th>
	        			</tr>
		        		</tfoot>
		        		<tbody>
		        		<c:forEach begin="1" end="50" var="i">
		        		<tr>
		        			<td>100000000<fmt:formatNumber value="${i }" pattern="00"></fmt:formatNumber></td>
		        			<td>172000<fmt:formatNumber value="${i }" pattern="00"></fmt:formatNumber></td>
		        			<td>白色</td>
		        			<td>S</td>
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