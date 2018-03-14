$(document).ready(function(){
    var config = null;
	$.ajax({
		type: "GET",
		url: "assets/dataTables/plug-in/Chinese.json",
		async: false,
		dataType: "json",
		success: function(data) {
			data.sInfo = "_START_ 到 _END_ / 共 _TOTAL_ 项"
			config = data;
		},
		error: function(jqXHR) {
			toastr.error("获取Chinese.json文件失败: " + jqXHR.status);
		}
	});
    
    $(".test-panel-table").DataTable({
		"language": config,
		"lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
		"dom": "<'row'<'col-sm-6'i><'col-sm-6'f>><'row'<'col-sm-12'>tr><'row'<'col-sm-12'p>>",
        "order": [[ 0, "desc" ]]
	});
    
    // 创建panel快速搜索，搜索内容为panel-heading
	$('input#panel-search').quicksearch('.panel-item',{
		selector: ".panel-heading"
	});
    
    $(".panel-list").on("click", ".panel-heading", function() {
    	$(this).next().slideToggle();
    });
});