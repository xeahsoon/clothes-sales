$(document).ready(function() {
	
	// 盘点单间货品
    $("#bar_code").keydown(function(e) {
    	//监听回车
    	var theEvent = window.event || e;
		var keycode = theEvent.keyCode || theEvent.which;
    	if(keycode == 13) {
    		var code = document.getElementById("bar_code").value;
    		if(isNaN(code) || code.length == 0) {
    			toastr.error("请输入正确的条形码！");
    		} else {
    			$.ajax({
    				type: "POST",
    				url: "checkOneStorage",
    				data: {
    					id: document.getElementById("bar_code").value
    				},
    				success: function(data) {
    					if(data == 1) {
        					showAtRight("checkStorage");
    					} else if(data == 0) {
    						toastr.error("该条形码不存在！");
    					} else if(data == -1) {
    						toastr.error("该唯一码已盘点！");
    					}
    				},
    				error: function(jqXHR) {
    					toastr.error("发生错误： " + jqXHR.status);
    				}
    			});
    		}
    	}
	});
	
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
	
	//创建DateTable
    $('#uncheckedTable').DataTable( {
    	"language": config,
    	"dom": "<'row'<'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-2'i><'col-sm-10'p>>",
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data; 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
            // Total over all pages
            total = api
                .column( 5 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            // Total over this page
            pageTotal = api
                .column( 5, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            // Update footer
            $( api.column( 4 ).footer() ).html(
                '￥'+pageTotal +' / ￥'+ total
            );
        }
    });
    $('#checkedTable').DataTable( {
    	"language": config,
    	"dom": "<'row'<'col-sm-6'l><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-2'i><'col-sm-10'p>>",
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data; 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
            // Total over all pages
            total = api
                .column( 5 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            // Total over this page
            pageTotal = api
                .column( 5, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            // Update footer
            $( api.column( 4 ).footer() ).html(
                '￥'+pageTotal +' / ￥'+ total
            );
        }
    });
});