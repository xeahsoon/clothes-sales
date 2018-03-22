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
	<div id="left" style="float:left; padding:0px 15px;	width:100%;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">商品列表</h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
		        	<table id="goods_table" class="table table-striped table-hover" style="white-space: nowrap;">
		        	<thead>
		        	<tr>
		        	<th>#款号</th>
		        	<th>类型</th>
		        	<th>面料</th>
		        	<th>价格</th>
		        	<th>颜色</th>
		        	<th>尺码</th>
		        	<th>图片</th>
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
		        	</tr>
		        	</tfoot>
		        	<tbody>
		        	<c:forEach items="${requestScope.good_list }" var="good">
		        	<tr>
		        	<td>${good.id }</td>
		        	<td>${good.type }</td>
		        	<td>${good.fabric }</td>
		        	<td>${good.price }</td>
		        	<td>
						<c:forEach items="${good.good_color }" var="color">${color.good_color } </c:forEach>
					</td>
		        	<td>
		        		<c:forEach items="${good.good_size }" var="size">${size.good_size } </c:forEach>
		        	</td>
		        	<td>${good.picture }</td>
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
				<h3 class="panel-title">商品信息</h3>
			</div>
			<div class="panel-body" style="min-height: 508px;">
				<div class="input-group">
					<span class="input-group-addon">款号</span>
					<input type="text" id="good_id" class="form-control" placeholder="款号..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">类型</span>
					<input type="text" id="good_type" class="form-control" placeholder="类型..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">面料</span>
					<input type="text" id="good_fabric" class="form-control" placeholder="面料..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">价格</span>
					<input type="number" id="good_price" min="0" class="form-control" placeholder="价格..">
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">颜色</span>
					<select id="good_color" class="select" multiple="multiple">
						<option value="黑色">黑色</option>
						<option value="白色">白色</option>
						<option value="灰色">灰色</option>
						<option value="浅灰色">浅灰色</option>
						<option value="红色">红色</option>
						<option value="粉色">粉色</option>
						<option value="绿色">绿色</option>
						<option value="军绿色">军绿色</option>
						<option value="蓝色">蓝色</option>
						<option value="浅蓝色">浅蓝色</option>
						<option value="藏青色">藏青色</option>
						<option value="棕色">棕色</option>
					</select>
				</div>
				<div class="input-group" style="margin: 15px 0px;">
					<span class="input-group-addon">大小</span>
					<select id="good_size" class="select" multiple="multiple">
					<optgroup label="上衣尺码">
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
						<option value="XXL">XXL</option>
						<option value="XXXL">XXXL</option>
					</optgroup>
					<optgroup label="裤子尺码">
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
						<option value="32">32</option>
						<option value="33">33</option>
						<option value="34">34</option>
						<option value="35">35</option>
						<option value="36">36</option>
					</optgroup>
					<optgroup label="鞋子尺码">
						<option value="38">38</option>
						<option value="39">39</option>
						<option value="40">40</option>
						<option value="41">41</option>
						<option value="42">42</option>
						<option value="43">43</option>
					</optgroup>
					</select>
				</div>
				<div style="margin: 15px 0px;">
					<input id="good_file" type="file">
					<div class="thumbnail" id="good_preview" style="display: none; margin-top: 15px;">
						<img id="good_img" src="images/category/t-shirt.jpg" alt="暂无预览">
					</div>
				</div>
				<div>
					<input type="button" id="save" value="保存" class="btn btn-primary pull-right" onclick="saveGood()">
					<input type="button" id="cancel" value="取消" class="btn btn-default pull-right" style="margin-right:15px;">
				</div>
			</div>
		</div>
	</div>
    </div>
</div>
</body>
</html>