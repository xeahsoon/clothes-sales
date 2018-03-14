$(document).ready(function() {
	
	$("#goods_table").DataTable({
		//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
        "order": [[ 0, "desc" ]],
        //设置操作栏 排序为 false
        "columnDefs": [
            { "orderable": false, "targets": 7 }
          ],
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
	});
});