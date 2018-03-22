$(document).ready(function(){
	
	// 初始化日期选择器
    $('.date').datetimepicker({
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
    
    $("#sales_table").DataTable({
		"language": {
			url: "assets/dataTables/plug-in/Chinese.json"
		},
        "lengthMenu": [[8], [8]],
		"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-4'i><'col-sm-8'p>>",
        "order": [[ 0, "asc" ]]
	});
    
	var option = {
	    title : {
	        text: '导购员技能导向图'
	    },
	    tooltip : {
	        trigger: 'item'
	    },
	    legend: {
	        x : 'center',
	        y : 'bottom',
	        data : ['松子', '婷婷', '小明', '倩倩', '小黑', '景云', '小霞'],
	        selected : {
	        	'小明': false,
	        	'倩倩': false,
	        	'小黑': false,
	        	'景云': false,
	        	'小霞': false
	        }
	    },
	    toolbox: {
	        show : true,
	        feature : {
	        	restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    polar : [
	        {
	            indicator : [
	                {text : '件数', max  : 100},
	                {text : '单数', max  : 100},
	                {text : '附加', max  : 100},
	                {text : '单效', max  : 100},
	                {text : '销售', max  : 100}
	            ],
	            radius : 108
	        }
	    ],
	    series : [
	        {
	            name: '导购员技能',
	            type: 'radar',
	            itemStyle: {
	                normal: {
	                    areaStyle: {
	                        type: 'default'
	                    }
	                }
	            },
	            data : [
	            	{
	                    value : randomValue(),
	                    name : '松子'
	                },
	                {
	                    value : randomValue(),
	                    name : '婷婷'
	                },{
	                    value : randomValue(),
	                    name : '小明'
	                },
	                {
	                    value : randomValue(),
	                    name : '倩倩'
	                },{
	                    value : randomValue(),
	                    name : '小黑'
	                },
	                {
	                    value : randomValue(),
	                    name : '景云'
	                },{
	                    value : randomValue(),
	                    name : '小霞'
	                }
	            ]
	        }
	    ]
	};              

	var staffsChart = echarts.init(document.getElementById('staff_statics'));
	staffsChart.setOption(option);
});

function randomValue() {
	var value = [];
	for(var i=0; i<5; i++) {
		value.push((Math.round(Math.random()*100))*50/100 + 50);
	}
	return value;
}

function getStaffSales() {
	var from_date = $("#from_date").val();
	var to_date = $("#to_date").val();
	
	if(from_date.length != 0 && to_date.length != 0) {
		var from = new Date(from_date.replace(/-/g,"/"));
		var to = new Date(to_date.replace(/-/g,"/"));
		// 判断起始时间是否小于结束时间
		if(from > to) {
			toastr.error("起始日期应小于结束日期！");
			return;
		}
	}
	
	var data={};
	if(from_date.length != 0) {
		data["from_date"] = from_date;
	}
	if(to_date.length != 0) {
		data["to_date"] = to_date;
	}
	
	toastr.info(JSON.stringify(data));
}