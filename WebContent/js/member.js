$(document).ready(function(){
	// 注册框动画
    var i=1;
    $("#symbol").click(function(){
        $("#addForm").fadeToggle();
        $("#symbol").css("transform", "rotate(" + (45*i) + "deg)");
        i++;
    });
    // 创建DateTable
    $('#memberTable').DataTable( {
    	//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
        //默认按入会时间降序展示
        "order": [[ 6, "desc" ]],
        //设置操作栏 排序为 false
        "columnDefs": [
            { "orderable": false, "targets": 7 }
          ],
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
        buttons: [
            'copy', 'excel', 'pdf'
        ]
    });
	// 初始化日期选择器
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        format: "yyyy-mm-dd"
    });
});