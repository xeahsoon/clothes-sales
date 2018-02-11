/**
 * Created by xeahsoon on 2017/11/8.
 */

// 搜索函数
function search(id) {
	var url = document.getElementById("search_url").value;
	var name = document.getElementById("search_name").value;
	
	//如果没有传id进来，则从输入文本域获取
	if(!id) {
		id = document.getElementById("search_id").value;
	}
	
	if(isNaN(id) || id.length == 0) {
		toastr.error("请输入有效的参数！");
	} else {
		$.ajax({
   			type: "POST",
   			url: url,
   			data: {
   				id: id
   			},
   			dataType: "json",
   			success: function(result) {
   				if(result == 0) {
   					toastr.info("未搜索到该数据!");
   				} else {
   	    			showAtRight(name + '/' + id);
   				}
   			},
   			error: function(jqXHR) {
   				toastr.error("发生错误: " + jqXHR.status);
   			}
   		});
	}
}

// 更新备注 设置模态框内容
function setModalContent() {
	var id = document.getElementById("hidden_id").value;
	var remark = document.getElementById("hidden_remark").value;
	$("#order_id").val(id);
	/* 不可设为disabled，否则表单无法提交order_id */
	document.getElementById("order_id").readOnly="readOnly";
	
	//解决一次更新备注，二次更新模态框内容仍为初始值
	var temp = document.getElementById("remark_content").value;
	if(temp.length == 0) {
		$("#remark_content").val(remark);
	} else {
		$("#remark_content").val(temp);
	}
}

// ajax提交备注信息
function sendRemark() {
	$.ajax({
		type: "POST",
		url: "addRemark",
		data: {
			id: document.getElementById("order_id").value,
			remark: document.getElementById("remark_content").value
		},
		dataType: "json",
		success: function(data) {
			$("#dismissButton").click();
			//window.location.reload();
			document.getElementById("table_remark").innerHTML = data.remark;
		},
		error: function(jqXHR) {
			$("#dismissButton").click();
			toastr.error("发生错误: " + jqXHR.status);
		}
	});
}

// ajax添加会员信息
function addMember() {
	var phone = document.getElementById("member_phone").value;
	var name = document.getElementById("member_name").value;
	var birth = document.getElementById("member_birth").value;
	
	if(phone.length == 0 || name.length == 0 || birth.length == 0) {
		toastr.error("请将信息填写完整！");
	} else {
		$.ajax({
			type: "POST",
			url: "addMember",
			data: {
				phone: phone,
				name: name,
				birth: birth
			},
			dataType: "json",
			success: function(data) {
				if(data == 1) {
					toastr.success("添加会员成功！");
					showAtRight('member');
				} else{
					toastr.error("添加会员失败，该手机号码已经存在！");
				}
			},
			error: function(jqXHR) {
				toastr.error("发生错误： " + jqXHR.status);
			}
		});	
	}
}

// ajax删除会员信息
function deleteMember(id, name, phone) {
	if(confirm("确定删除该条信息?且删除后不可恢复！\n会员姓名："+name+"\n手机号码："+phone)) {
		$.ajax({
			type: "POST",
			url: "deleteMember",
			data: {
				id: id
			},
			dataType: "json",
			success: function(data) {
				if(data == 1) {
					toastr.success("删除成功！");
					showAtRight('member');
				} else{
					toastr.error("删除失败！");
				}
			},
			error: function(jqXHR) {
				toastr.error("发生错误： " + jqXHR.status);
			}
		});
	}
}

// 设置member模态框内容
function setMemberModal(phone, name, birth, discount) {
	//alert("setting member modal...\n" + name +" " +phone+" "+birth+" "+discount);
	$("#modal_phone").val(phone);
	$("#modal_name").val(name);
	$("#modal_birth").val(birth);
	$("#modal_discount").val(discount);
	//选中select指定value
	$("#modal_discount option[value=discount]").attr("selected","selected"); 
}

// ajax修改会员信息
function editMember() {
	
	var phone = document.getElementById("modal_phone").value;
	var name = document.getElementById("modal_name").value;
	var birth = document.getElementById("modal_birth").value;
	var discount = document.getElementById("modal_discount").value;
	
	/*此处应有表单内容未作出改变的时候 函数return*/
	
	if(name.length == 0 || birth.length == 0 || discount.length == 0) {
		toastr.error("请将信息填写完整！");
	} else {
		$.ajax({
			type: "POST",
			url: "editMember",
			data: {
				phone: phone,
				name: name,
				birth: birth,
				discount: discount
			},
			dataType: "json",
			success: function(data) {
				$("#dismissButton").click();
				if(data == 1) {
					toastr.success("修改会员信息成功！");
					showAtRight('member');
				} else{
					toastr.error("修改信息失败！");
				}
			},
			error: function(jqXHR) {
				toastr.error("发生错误： " + jqXHR.status);
			}
		});	
	}
}

// ajax审核/反审核员工信息
function checkStaff(id, obj) {
	//获取当前点击行的status单元格
	var td_status = $(obj).parent().prev();
	$.ajax({
		type: "POST",
		url: "checkStaff",
		data: {
			id : id
		},
		dataType: "json",
		success: function(data) {
			if(data == -1) {
				toastr.error("操作失败！");
			} else {
				//showAtRight('staff');
				if(data == 1) {
					td_status.text("审核");
				} else if(data == 0){
					td_status.text("待审核");
				}
				toastr.success("审核/反审核操作成功！");
			}
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
	});
}

// 设置staff模态框内容
function setStaffModal(name, phone, idcard, address) {
	//alert("haha " + name + " " + idcard);
	$("#modal_name").val(name);
	$("#modal_phone").val(phone);
	$("#modal_idcard").val(idcard);
	if(idcard.length != 0) {
		document.getElementById("modal_idcard").readOnly= true;
	} else {
		//else必不可少 否则多次点击已为readOnly的始终为readOnly
		document.getElementById("modal_idcard").readOnly= false;
	}
	
	$("#modal_address").val(address);
}

// ajax修改导购员信息
function editStaff() {

	var name = document.getElementById("modal_name").value;
	var phone = document.getElementById("modal_phone").value;
	var idcard = document.getElementById("modal_idcard").value;
	var address = document.getElementById("modal_address").value;
	
	/*此处应有表单内容未作出改变的时候 函数return*/
	
	$.ajax({
		type: "POST",
		url: "editStaff",
		data: {
			name: name,
			phone: phone,
			idcard: idcard,
			address: address
		},
		dataType: "json",
		success: function(data) {
			$("#dismissButton").click();
			if(data == 1) {
				toastr.success("修改员工信息成功！");
				showAtRight('staff');
			} else{
				toastr.error("修改信息失败！");
			}
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
	});	
}

// 设置添加员工信息模态框内容
function setStaffDetailModal() {
	//alert("setStaffDetailModal");
	var name = document.getElementById("staff_name").value;
	var phone = document.getElementById("staff_phone").value;
	
	$("#detail_name").val(name);
	$("#detail_phone").val(phone);
}

// 简单添加员工信息
function addSimpleStaff() {
	setStaffDetailModal();
	addStaff();
}

// ajax增加导购员
function addStaff() {
	//alert("I'm here to add a staff!");
	var name = document.getElementById("detail_name").value;
	var phone = document.getElementById("detail_phone").value;
	var idcard = document.getElementById("detail_idcard").value;
	var address = document.getElementById("detail_address").value;
	
	if(name.length == 0 || phone.length == 0) {
		toastr.error("请将信息填写完整！");
	} else {
		$.ajax({
			type: "POST",
			url: "addStaff",
			data: {
				name: name,
				phone: phone,
				idcard: idcard,
				address: address
			},
			dataType: "json",
			success: function(data) {
				if(data == 1) {
					toastr.success("添加导购员成功！");
					showAtRight('staff');
				} else{
					toastr.error("添加导购员失败，姓名已经存在！");
				}
			},
			error: function(jqXHR) {
				$("#dismissButton").click();
				toastr.error("发生错误： " + jqXHR.status);
			}
		});
	}
}
// 删除临时订单条目
function deleteItem(id) {
	$.ajax({
		type: "POST",
		url: "deleteItem",
		data: {
			id: id
		},
		dataType: "json",
		success: function(data) {
			if(data == 1) {
				showAtRight('makeOrder');
			} else{
				toastr.error("删除失败！");
			}
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
	});
}

// 清空临时订单
function deleteTempTable() {
	$.ajax({
		type: "POST",
		url: "deleteTempTable",
		dataType: "json",
		success: function(data) {
			if(data >= 1) {
				toastr.success("清空成功！");
				showAtRight('makeOrder');
			} else{
				toastr.error("没有条目信息！");
			}
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
	});
}

// 订单支付
function payForOrder() {
	/* 收银员user_id、会员 member_id、 总金额pay_money、 支付方式pay_mode、 备注remark、 导购staffs、 条目折扣discounts */
	var user_id = $("#user_id").val();
	var member_phone = $("#member_phone").val();
	// ----此处应有member_id不为空是否存在检测----
	var bgc = document.getElementById("member_phone").style.backgroundColor;
	if(bgc == "rgba(255, 0, 0, 0.1)") {
		toastr.error("请输入有效的会员信息！");
		return;
	}
	
	var pay_money = $("#paymoney").text();
	var pay_mode = $("#paymode").val();
    var remark = $("#remark").val();
	
    var types = new Array();
    var prices = new Array();
    var discounts = new Array();
    var dis_prices = new Array();
    $("#temp_order_table tr:not(:first):not(:last)").each(function() {
    	types.push($(this).find("td").eq(2).text());
    	prices.push($(this).find("td").eq(5).text());
    	discounts.push($(this).find("input").val());
    	dis_prices.push($(this).find("td").eq(7).text());
    });
	
	var staffs = new Array();  //定义数组   
    $("#staff_multiselect option:selected").each(function(){  //遍历所有选中option  
    	staffs.push($(this).val());  //添加到数组中 
    })
    // ----此处应有staffs为空处理----
    if(staffs.length == 0) {
    	toastr.error("请选择至少一位导购员！")
    	return;
    }
    if(types.length == 0) {
    	toastr.error("请先选择商品！")
    	return;
    }
    
    var confirmPay = confirm("确认完成如下支付？\n" + $("#paytext").val() + "：[" + pay_money + "]");
	if (confirmPay == false) {
		return;
	}
    
    $.ajax({
    	type: "POST",
    	url: "payForOrder",
    	data: {
    		user_id: user_id,
    		member_phone: member_phone,
    		pay_money: pay_money,
    		pay_mode: pay_mode,
    		remark: remark,
    		types: types,
    		prices: prices,
    		discounts: discounts,
    		dis_prices: dis_prices,
    		staffs: staffs
    	},
    	dataType: "json",
    	success: function(data) {
    		if(data == 1) {
    			toastr.success("支付成功！");
    		} else {
    			toastr.error("支付失败！");
    		}
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
    });
}