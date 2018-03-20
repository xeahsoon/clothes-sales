$(document).ready(function() {
	var index = null;
	var goodtable = $("#goods_table").DataTable({
		//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
        "select": {
            style: 'single'
        },
        "order": [[ 0, "desc" ]],
        "dom": "<'row'<'col-sm-6'B><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-4'i><'col-sm-8'p>>",
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
		"buttons" : [{
			extend: 'excel',
			className : 'btn btn-default btn-sm',
    		title: "迈克服装收银系统-商品信息",
    		sheetName: $("li#date").text(),
            text: "导出Excel"
        },{
			text : '新增',
			className : 'btn btn-default btn-sm add',
			action : function(e, dt, node, conf) {
				$("#save").data("opt", "add");;
				$("#good_id").attr("disabled", false);
				
				$("#right .panel-title").text("新增商品");
				$("#left").animate({width: '76%'}, '888');
				$("#right").show('888');
			}
		},{
			text : '修改',
			className : 'btn btn-default btn-sm modify',
			action : function(e, dt, node, conf) {
				$("#save").data("opt", "modify");
				// 避免按钮属性为disabled仍触发事件
				if($(node).attr("disabled")=="disabled"){
					return;
				}
				$("#right .panel-title").text("修改商品");
				$("#left").animate({width: '76%'});
				$("#right").show();
				
				var rowData = goodtable.rows( index ).data().toArray();
				$("#good_id").val(rowData[0][0]);
				$("#good_id").attr("disabled", true);
				$("#good_type").val(rowData[0][1]);
				$("#good_fabric").val(rowData[0][2]);
				$("#good_price").val(rowData[0][3]);
				
				var colors = rowData[0][4].split(" ");
				$("#good_color").multiselect('select', colors);
				
				var sizes = rowData[0][5].split(" ");
				$('#good_size').multiselect('select', sizes);
				
				var picture = rowData[0][6];
				if(picture.length != 0) {
					$("#good_img").attr('src', 'images/goods/'+picture);
					$("#good_preview").show();
				} else {
					$("#good_preview").hide();
				}
			}
		}]
	});
	// 不择手段的初始化modify按钮为disabled
	setTimeout(function() {
		$(".modify").attr("disabled", true);
	}, 100);
	// 监听获取表格当前选中行
	goodtable.on( 'select', function ( e, dt, type, indexes ) {
		$(".modify").attr("disabled", false);
		index = indexes[0];
	});
	
	goodtable.on( 'deselect', function ( e, dt, type, indexes ) {
		$(".modify").attr("disabled", true);
	});
	
	$("#cancel").on("click", function() {
		$("#right").hide('888');
		$("#left").animate({width: '100%'}, '888');
	});

	$('#good_color').multiselect({
    	maxHeight: 200,
    	buttonWidth: 135,
    	numberDisplayed: 5,
        nonSelectedText: '请选择颜色..',
        nSelectedText: '项选中',
        allSelectedText: '全部选中'
	});
	
	$('#good_size').multiselect({
		enableClickableOptGroups: true,
		enableCollapsibleOptGroups: true,
        collapseOptGroupsByDefault: true,
    	maxHeight: 200,
    	buttonWidth: 135,
    	numberDisplayed: 5,
        nonSelectedText: '请选择尺码..',
        nSelectedText: '项选中',
        allSelectedText: '全部选中'
	});
	
	// 允许上传的图片类型
	var allowedType = ["jpg", "png", "gif", "jpeg", "bmp"];
	$("#good_file").filestyle({
		'text' : '图片',
		'btnClass' : 'btn btn-default',
		'buttonBefore' : false,
		'dragdrop' : true,
		'placeholder': '请选择商品图片..',
		'onChange': function() {
			var file = document.getElementById("good_file").files[0];
			var img = document.getElementById("good_img");
			// 取消选择文件时
			if(file == null) {
				$("#good_preview").hide();
				return;
			}
			
			var name = file.name;
			var type = name.split('.')[1];
			
			if(allowedType.indexOf(type) == -1) {
				$("#good_preview").hide();
				$(".bootstrap-filestyle input").css({color: 'red'});
				toastr.error("不支持的文件格式");
			} else {
				$("#good_preview").show();
				$(".bootstrap-filestyle input").css({color: 'black'});
				img.src = window.URL.createObjectURL(file);
			}
		}
	});
});