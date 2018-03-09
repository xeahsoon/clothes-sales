$(document).ready(function(){
	//注册框动画
    var i=1;
    $("#symbol").click(function(){
        $("#symbol").css("transform", "rotate(" + (45*i) + "deg)");
        $(".add").fadeToggle();
        i++;
    });
  	//创建DateTable
    $('#staffTable').DataTable( {
        //导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
      	//设置操作栏 排序为 false
        "columnDefs": [
            { "orderable": false, "targets": 6 }
          ],
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]]
    });
});