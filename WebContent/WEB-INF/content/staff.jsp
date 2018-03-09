<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>员工管理</title>
    <script type="text/javascript" class="init">
		$.getScript("js/staff.js");
    </script>
</head>
<body>
	<div class="container col-md-12">
		<div class="col-md-9 pull-right">
			<div class="col-md-1 pull-right" style="margin-right: -39px;">
				<style>
				#symbol {
					line-height: 32px;
					text-align: center;
					width: 32px;
					transition: All 0.2s ease-in-out;
					-webkit-transition: All 0.2s ease-in-out;
					-moz-transition: All 0.2s ease-in-out;
					-o-transition: All 0.2s ease-in-out;
				}
				
				#symbol:hover {
					cursor: pointer;
				}
				</style>
				<span id="symbol" class="glyphicon glyphicon-plus operator"
					title="新增导购员"></span>
			</div>
			<div class="add" style="display: none; margin-right: -150px;">
				<div class="input-group col-md-3 pull-left">
					<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
					<input id="staff_name" type="text" class="form-control" placeholder="员工姓名.." style="width: 88%;">
				</div>
				<div class="input-group col-md-3 pull-left">
					<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					<input id="staff_phone" type="text" class="form-control" placeholder="手机号码.." style="width: 88%;">
				</div>
				<div class="input-group col-md-2 pull-left" style="width: 66px;">
					<input type="submit" class="btn btn-default" onclick="addSimpleStaff()" value="新增导购员">
				</div>
				<div class="input-group col-md-2 pull-left" style="margin-left: 20px; width: 66px;">
					<button class="btn btn-default" data-toggle="modal" data-target="#addmore"
						onclick="setStaffDetailModal()">填写详细信息</button>
				</div>
			</div>
			<!-- add more detail modal -->
			<div class="modal fade" id="addmore" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">添加导购员信息</h4>
						</div>
						<!--modal body-->
						<div class="modal-body" style="width: 50%; margin-left: 25%">
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span></span> <input type="text"
									id="detail_name" class="form-control" placeholder="员工姓名..">
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-phone"></span></span> <input type="text"
									id="detail_phone" class="form-control" placeholder="手机号码..">
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-credit-card"></span></span> <input type="text"
									id="detail_idcard" class="form-control"
									placeholder="身份证号..">
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-home"></span></span>
								<textarea id="detail_address" class="form-control"
									placeholder="家庭地址.." style="resize: none"></textarea>
							</div>
						</div>
						<!--modal body end-->
						<div class="modal-footer">
							<input type="button" class="btn btn-default"
								data-dismiss="modal" value="关闭">
							<input type="button" class="btn btn-primary"
								onclick="addStaff()" value="新增">
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>

		<div>
			<h2 class="page-header">导购员列表</h2>
		</div>
		<div class="table-responsive">
			<table id="staffTable" class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>电话</th>
						<th>身份证号</th>
						<th>联系地址</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>#</th>
						<th>姓名</th>
						<th>电话</th>
						<th>身份证号</th>
						<th>联系地址</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${requestScope.staff_list }" var="staff">
						<tr>
							<td><fmt:formatNumber value="${staff.id }" pattern="0000" /></td>
							<td>${staff.name }</td>
							<td>${staff.phone }</td>
							<td>${staff.idcard }</td>
							<td>${staff.address }</td>
							<td><c:if test="${staff.status == 1 }">审核</c:if> <c:if
									test="${staff.status == 0 }">待审核</c:if></td>
							<td><span class="glyphicon glyphicon-edit operator" title="编辑" 
								data-toggle="modal" data-target="#editStaffModal"
								onclick="setStaffModal('${staff.name}','${staff.phone }','${staff.idcard }','${staff.address }')"></span>
								<span style="color: #ddd;">/</span> <span
								class="glyphicon glyphicon-check operator" title="审核/反审核"
								onclick="checkStaff('${staff.id}', this)"></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- edit staff modal -->
			<div class="modal fade" id="editStaffModal" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">修改导购员信息</h4>
						</div>
						<div class="modal-body" style="width: 50%; margin-left: 25%">
							<div class="input-group">
								<span class="input-group-addon">姓名</span>
								<input type="text" id="modal_name" class="form-control" readonly="readOnly"/>
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon">电话</span>
								<input type="text" id="modal_phone" class="form-control"/>
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon">ID卡</span>
								<input type="text" id="modal_idcard" class="form-control"/>
							</div>
							<div class="input-group" style="margin-top: 10px;">
								<span class="input-group-addon">地址</span>
								<textarea id="modal_address" class="form-control" style="resize: none"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" id="dismissButton"
								data-dismiss="modal" value="关闭"> <input type="button"
								class="btn btn-primary" onclick="editStaff()" value="保存">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>