$(document).ready(function(){
	var index = null;
	var usertable = $("#user_table").DataTable({
		//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
        "select": {
            style: 'single'
        },
        "order": [[ 0, "asc" ]],
        "dom": "<'row'<'col-sm-6'B><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-4'i><'col-sm-8'p>>",
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
		"buttons" : [{
            text: "修改",
            className : 'btn btn-default btn-sm opt',
			action : function(e, dt, node, conf) {
				// 避免按钮属性为disabled仍触发事件
				if($(node).attr("disabled")=="disabled"){
					return;
				}
				
				$("#right .panel-title").text("修改用户");
				$("#left").animate({width: '76%'}, '888');
				$("#right").show('888');
				
				var rowData = usertable.rows( index ).data().toArray();
				$("#loginname").val(rowData[0][1]);
				$("#loginname").attr("readonly", true);
				$("#username").val(rowData[0][2]);
				$("#userphone").val(rowData[0][3]);
			}
        },{
			text : '审核',
			className : 'btn btn-default btn-sm opt',
			action : function(e, dt, node, conf) {
				// 避免按钮属性为disabled仍触发事件
				if($(node).attr("disabled")=="disabled"){
					return;
				}
				
				var rowData = usertable.rows( index ).data().toArray();
			
				$.ajax({
					url: "checkUser",
					type: "POST",
					data: {
						loginname: rowData[0][1]
					},
					success: function(data) {
						if(data == 1) {
							showAtRight("user");
							toastr.success("操作成功！");
						} else {
							toastr.error("操作失败！");
						}
					},
					error: function(jqXHR) {
						toastr.error("发生错误： " + jqXHR.status);
					}
				});
			}
		},{
			text : '重置密码',
			className : 'btn btn-default btn-sm opt',
			action : function(e, dt, node, conf) {
				// 避免按钮属性为disabled仍触发事件
				if($(node).attr("disabled")=="disabled"){
					return;
				}
				
				var rowData = usertable.rows( index ).data().toArray();
				
				$.ajax({
					url: "resetUserPwd",
					type: "POST",
					data: {
						loginname: rowData[0][1]
					},
					success: function(data) {
						if(data == 1) {
							showAtRight("user");
							toastr.success("操作成功！");
						} else {
							toastr.error("操作失败！");
						}
					},
					error: function(jqXHR) {
						toastr.error("发生错误： " + jqXHR.status);
					}
				});
			}
		}]
	});
	// 不择手段的初始化opt按钮为disabled
	setTimeout(function() {
		$(".opt").attr("disabled", true);
	}, 100);
	// 监听获取表格当前选中行
	usertable.on( 'select', function ( e, dt, type, indexes ) {
		$(".opt").attr("disabled", false);
		index = indexes[0];
	});
	
	usertable.on( 'deselect', function ( e, dt, type, indexes ) {
		$(".opt").attr("disabled", true);
	});
	
	$("#cancel").on("click", function() {
		$("#right").hide('888');
		$("#left").animate({width: '100%'}, '888');
	});
});