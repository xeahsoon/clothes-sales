<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>销售统计</title>
    <script>
    	$.getScript("js/statics.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">销售数据</h2>
    </div>
    <div class="row">
    	<div class="col-md-3">
	    	<div class="input-group">
	    		<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	    		<input type="text" id="from_date" class="form-control date" placeholder="请选择起始日期..">
	    	</div>
    	</div>
    	<div class="col-md-3">
	    	<div class="input-group">
	    		<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	    		<input type="text" id="to_date" class="form-control date" placeholder="请选择结束日期..">
	    	</div>
    	</div>
    	<div class="col-md-3">
	    	<div class="input-group">
	    		<span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
	    		<select id="search_select" class="form-control">
	    			<option value="good_id">款号</option>
	    			<option value="good_type">类型</option>
	    			<option value="user_id">收银员</option>
	    			<option value="pay_mode">支付方式</option>
	    		</select>
	    	</div>
    	</div>
    	<div class="col-md-3">
    		<input type="button" value="查询" class="btn btn-primary pull-right"
    			onclick="getStatics()">
    		<input type="button" value="重置" class="btn btn-default pull-right"
    			onclick="resetSearch()" style="margin-right: 15px;">
    	</div>
    </div>
    <div class="row" style="margin-top: 30px;">
    <div class="col-md-9">
    	<div class="panel panel-default">
			<div class="panel-body" style="background-color: #fafafa;">
			<div class="col-md-6">
				<div id="nums_statics" style="min-height:388px;"></div>
			</div>
			<div class="col-md-6">
				<div id="money_statics" style="min-height:388px;"></div>
			</div>
			</div>
		</div>
    </div>
    <div class="col-md-3">
    	<div class="panel panel-default">
			<div class="panel-body" style="background-color: #fafafa;">
			<div class="table-responsive" style="min-height:388px;">
	        	<table id="statics_table" class="table table-hover">
	        	<thead>
		        	<tr>
		        	<th>#</th>
		        	<th>条目</th>
		        	<th>数量</th>
		        	<th>金额</th>
		        	</tr>
	        	</thead>
	        	<tbody>
	        	<c:forEach begin="1" end="8" var="i">
		        	<tr>
		        	<td>${i }</td>
		        	<td>导购员${i }</td>
		        	<td>${i }</td>
		        	<td>${i }00</td>
		        	</tr>
	        	</c:forEach>
	        	</tbody>
	        	</table>
        	</div>
			</div>
		</div>
    </div>
    </div>
</div>
</body>
</html>