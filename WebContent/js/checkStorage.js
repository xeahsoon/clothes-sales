$(document).ready(function() {
	//创建DateTable
    $('#uncheckedTable').DataTable( {
    	//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
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
    	//导入中文包
    	"language": {
            "url": "assets/dataTables/plug-in/Chinese.json"
        },
        "lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],"footerCallback": function ( row, data, start, end, display ) {
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