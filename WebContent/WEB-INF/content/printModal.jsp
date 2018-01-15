<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal fade" id="printModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="display:none">
	<div class="modal-dialog" style="width: 28%; font-size: 12px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">确认打印</h4>
			</div>
			<!--modal body-->
			<div class="modal-body form-controll" id="div_print">
				<h4 style="text-align: center">
					<i>MyClothes</i>商品销售单
				</h4>
				<br>
				<p>
					销售单号：
					<fmt:formatNumber value="${order.id }" pattern="00000000" />
				</p>
				<p>
					日期：
					<fmt:formatDate value="${order.create_date }" type="both" />
				</p>
				<p>打印次数：${order.print_count }</p>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>商品</th>
								<th>类型</th>
								<th>原价</th>
								<th>折扣</th>
								<th>合计</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order.details }" var="detail">
								<tr>
									<td><fmt:formatNumber value="${detail.good.id }"
											pattern="00000000" />/ ${detail.color }/${detail.size }</td>
									<td>${detail.good.type }</td>
									<td>${detail.price }</td>
									<td><fmt:formatNumber value="${detail.discount }"
											pattern="0.00" /></td>
									<td>${detail.dis_price }</td>
								</tr>
							</c:forEach>

							<tr style="border-bottom: 2px solid #ddd">
								<td colspan="3">合计</td>
								<td>${order.nums }件</td>
								<td>${order.sum_money }</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p>
					收银：<span>${order.user.name }</span>
				</p>
				<p>
					导购：
					<c:forEach items="${order.staffs }" var="staff">
						<span>${staff.staff.name }</span>
					</c:forEach>
				</p>
				<p>
					银行卡付款： <span>${order.sum_money }</span>
				</p>
				<p>备注：${order.remark }</p>
			</div>
			<div class="modal-footer" id="footer">
				<script>
                    $(document).ready(function() {
                        $("#printButton").click(function(){
                        	//$("#printForm").submit();
                            $("#div_print").jqprint();
                        });
                    });
                </script>
                <!-- 打印计数 -->
                <form id="printForm" action="printOrder/${order.id }" method="post"></form>
				<input type="button" class="btn btn-default" data-dismiss="modal"
					value="关闭"> <input id="printButton" type="submit"
					class="btn btn-primary" value="打印"/>
			</div>
		</div>
	</div>
</div>