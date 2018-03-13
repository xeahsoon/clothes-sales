$(document).ready(function(){

    $('#good_select').multiselect({
    	maxHeight: 200,
    	enableFiltering: true,
    	includeFilterClearBtn: false,
    	templates: {
    		filter: '<li class="multiselect-item filter"><input class="form-control multiselect-search" style="height: 26px; padding: 0px 20px 0px 20px;" type="text"></li>'
    	}
	});
    
    $('.select').multiselect({
    	maxHeight: 200,
    	buttonWidth: 75
	});
    	
	$("#inStorageTable").DataTable({
		"language": {
			url: "assets/dataTables/plug-in/Chinese.json"
		},
		"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-4'i><'col-sm-8'p>>",
		//默认按入会时间降序展示
        "order": [[ 0, "desc" ]],
        //设置操作栏 排序为 false
        "columnDefs": [
            { "orderable": false, "targets": 6 }
          ]
	});
});