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
	
	$('.select').multiselect({
		enableClickableOptGroups: true,
		enableCollapsibleOptGroups: true,
        collapseOptGroupsByDefault: true,
    	maxHeight: 200,
    	buttonWidth: 146,
    	numberDisplayed: 5,
        nonSelectedText: '请选择尺码..',
        nSelectedText: '项选中',
        allSelectedText: '全部选中'
	});
	
	$("#good_file").filestyle({
		'text' : '图片',
		'btnClass' : 'btn btn-default',
		'buttonBefore' : false,
		'dragdrop' : true,
		'placeholder': '请选择商品图片..',
		'onChange': function() {
			$("#good_img").attr("src",URL.createObjectURL($("#good_file")[0].files[0]));
		}
	});
});