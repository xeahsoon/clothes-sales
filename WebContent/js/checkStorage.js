$(document).ready(function() {
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