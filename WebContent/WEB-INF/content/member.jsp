<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员管理</title>

    <script type="text/javascript">
    	$.getScript("js/member.js");
    </script>
</head>
<body>
<div class="container col-md-12">
    <div class="col-md-9 pull-right" style="margin-right: -39px;">
        <div class="col-md-1 pull-right">
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
            <span id="symbol" class="glyphicon glyphicon-plus operator" title="新增会员"></span>
        </div>
        <form method="post" id="addForm" style="display: none">
            <div class="input-group col-md-3 pull-left">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                <input id="member_name"type="text" class="form-control" placeholder="会员姓名.." style="width: 88%;">
            </div>
            <div class="input-group col-md-3 pull-left">
                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                <input id="member_phone" type="text" class="form-control" placeholder="手机号码.." style="width: 88%;">
            </div>
            <div class="input-group date form_date col-md-3 pull-left">
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                <input id="member_birth" class="form-control" type="text" placeholder="会员生日.." style="width: 88%;">
            </div>
            <div class="input-group col-md-2 pull-left" style="width: 66px;">
            	<input type="button" class="btn btn-default" onclick="addMember()" value="注册会员">
            </div>
        </form>
    </div>
    <div>
        <h2 class="page-header">会员列表</h2>
    </div>
    <div class="table-responsive">
        <table id="memberTable" class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>会员卡号</th>
                <th>姓名</th>
                <th>生日</th>
                <th>折扣</th>
                <th>积分</th>
                <th>入会时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>#</th>
                <th>会员卡号</th>
                <th>姓名</th>
                <th>生日</th>
                <th>折扣</th>
                <th>积分</th>
                <th>入会时间</th>
                <th>操作</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${requestScope.member_list }" var="member">
            	<tr>
            		<td><fmt:formatNumber value="${member.id }" pattern="0000"/></td>
            		<td>${member.phone }</td>
            		<td>${member.name }</td>
            		<td><fmt:formatDate value="${member.birthday }" type="date"/></td>
            		<td><fmt:formatNumber value="${member.discount }" pattern="0.00"/></td>
            		<td>${member.score }</td>
            		<td><fmt:formatDate value="${member.intime }" type="both"/></td>
            		<td>
						<span class="glyphicon glyphicon-edit operator" title="编辑" data-toggle="modal" 
							data-target="#editMemberModal" 
							onclick="setMemberModal('${member.phone}', '${member.name }', '<fmt:formatDate value="${member.birthday }" type="date"/>', '<fmt:formatNumber value="${member.discount }" pattern="0.00"/>')"></span>
						<span style="color: #ddd">/</span>
						<span class="glyphicon glyphicon-trash operator" title="删除" 
							onclick="deleteMember('${member.id}', '${member.name }', '${member.phone }')"></span>
					</td>
            	</tr>
            </c:forEach>
            </tbody>
        </table>
    	<!-- edit member modal -->
    	<div class="modal fade" id="editMemberModal" role="dialog"
    		aria-labelledby="myModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
    			<div class="modal-content">
    				<div class="modal-header">
    					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改会员信息</h4>
    				</div>
    				<div class="modal-body" style="width:50%; margin-left:25%">
    					<div class="input-group">
    						<span class="input-group-addon">卡号</span>
    						<input id="modal_phone" type="text" class="form-control" readOnly="readonly"/>
    					</div>
    					<div class="input-group" style="margin-top: 10px;">
    						<span class="input-group-addon">姓名</span>
    						<input id="modal_name" type="text" class="form-control"/>
    					</div>
						<div class="input-group date form_date" style="margin-top: 10px;">
    						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar" style="display:none"></span><span>生日</span></span>
    						<input id="modal_birth" type="text" class="form-control"/>
    					</div>
    					<div class="input-group" style="margin-top: 10px;">
    						<span class="input-group-addon">折扣</span>
    						<select id="modal_discount" class="form-control">
    							<option value="1.00">1.00折</option>
    							<option value="0.95">0.95折</option>
    							<option value="0.85">0.85折</option>
    							<option value="0.75">0.75折</option>
    						</select>
    					</div>
    				</div>
    				<div class="modal-footer">
    					<input type="button" class="btn btn-default"
							id="dismissButton" data-dismiss="modal" value="关闭">
						<input type="button" class="btn btn-primary"
							onclick="editMember()" value="保存">
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
</body>
</html>