//搜索函数
function search() {
	var url = document.getElementById("search_url").value;
	var name = document.getElementById("search_name").value;
	var id = document.getElementById("search_id").value;
	if(id.length == 0) {
		alert("参数不能为空！");
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
   					alert("未搜索到该数据!");
   				} else {
   	    			showAtRight(name + '/' + id);
   				}
   			},
   			error: function(jqXHR) {
   				alert("发生错误: " + jqXHR.status);
   			}
   		});
	}
}

//更新备注 设置模态框内容
function setModalContent(id, remark) {
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

//ajax提交备注信息
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
			alert("发生错误: " + jqXHR.status);
		}
	});
}

//ajax添加会员信息
function addMember() {
	var phone = document.getElementById("member_phone").value;
	var name = document.getElementById("member_name").value;
	var birth = document.getElementById("member_birth").value;
	
	if(phone.length == 0 || name.length == 0 || birth.length == 0) {
		alert("请将信息填写完整！");
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
					alert("添加会员成功！");
					showAtRight('member');
				} else{
					alert("添加会员失败，该手机号码已经存在！");
				}
			},
			error: function(jqXHR) {
				alert("发生错误： " + jqXHR.status);
			}
		});	
	}
}

//ajax删除会员信息
function deleteMember(id, name, phone) {
	if(confirm("确定删除该条信息?\n会员姓名："+name+"\n手机号码："+phone)) {
		$.ajax({
			type: "POST",
			url: "deleteMember",
			data: {
				id: id
			},
			dataType: "json",
			success: function(data) {
				if(data == 1) {
					alert("删除成功！");
					showAtRight('member');
				} else{
					alert("删除失败！");
				}
			},
			error: function(jqXHR) {
				alert("发生错误： " + jqXHR.status);
			}
		});
	}
}

//设置member模态框内容
function setMemberModal(phone, name, birth, discount) {
	//alert("setting member modal...\n" + name +" " +phone+" "+birth+" "+discount);
	$("#modal_phone").val(phone);
	$("#modal_name").val(name);
	$("#modal_birth").val(birth);
	$("#modal_discount").val(discount);
	for(var i=0; i<$("#modal_discount").length; i++) {
		if($("#modal_discount").get(0).option[i].value == discount) {
			$("#modal_discount").get(0).option[i].selected = true;
			break;
		}
	}
}

//ajax修改会员信息
function editMember() {
	
	var phone = document.getElementById("modal_phone").value;
	var name = document.getElementById("modal_name").value;
	var birth = document.getElementById("modal_birth").value;
	var discount = document.getElementById("modal_discount").value;
	
	if(!$("#modal_phone").change()) {
		return;
	}
	
	if(name.length == 0 || birth.length == 0 || discount.length == 0) {
		alert("请将信息填写完整！");
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
					alert("修改会员信息成功！");
					showAtRight('member');
				} else{
					alert("修改信息失败！");
				}
			},
			error: function(jqXHR) {
				alert("发生错误： " + jqXHR.status);
			}
		});	
	}
}