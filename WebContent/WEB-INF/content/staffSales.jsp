<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导购员业绩</title>
    <script>
    	$.getScript("js/staffSales.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="row">
        <h2 class="page-header">导购员业绩统计</h2>
    </div>
    <div class="row">
    <form>
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
    	<div class="col-md-3 pull-right">
    		<input type="button" value="查询" class="btn btn-primary pull-right"
    			onclick="getStaffSales()">
    		<input type="reset" value="重置" class="btn btn-default pull-right"
    			style="margin-right: 15px;">
    	</div>
    </form>
    </div>
    <div class="row" style="margin-top: 30px;">
	    <div class="col-md-8">
	    	<div class="panel panel-default">
				<div class="panel-body" style="background-color: #fafafa;">
	    		<div class="table-responsive" style="min-height:388px;">
			        <table id="sales_table" class="table table-hover">
			            <thead>
			            <tr>
			                <th>#</th>
			                <th>姓名</th>
			                <th>件数</th>
			                <th>票数</th>
			                <th>附加</th>
			                <th>单效</th>
			                <th>业绩</th>
			            </tr>
			            </thead>
			            <tbody>
			            <tr style="border-bottom: 2px solid #ddd">
			                <th>合计</th>
			                <th>7位</th>
			                <th>70</th>
			                <th>28</th>
			                <th>2.5</th>
			                <th>160</th>
			                <th>4480.00</th>
			            </tr>
			            </tbody>
			        </table>
			    </div>
	    	</div>
	    	</div>
	   	</div>
	   	<div class="col-md-4">
	    	<div class="panel panel-default">
				<div class="panel-body" style="background-color: #fafafa;">
				<div id="staff_statics" style="min-height:388px;"></div>
				</div>
	    	</div>
	   	</div>
   	</div> 
</div>
</body>
</html>