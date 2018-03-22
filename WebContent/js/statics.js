$(document).ready(function(){
	
	$("#search_select").multiselect();
	
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
    
    $("#statics_table").DataTable({
		"language": {
			url: "assets/dataTables/plug-in/Chinese.json"
		},
        "lengthMenu": [[8], [8]],
		"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-12'p>>",
		"ordering": false
	});
    
	var numsChart = echarts.init(document.getElementById('nums_statics'));
	var moneyChart = echarts.init(document.getElementById('money_statics'));

	var data={};
	data["title"] = "商品数量";
	data["xData"] = ['松子','婷婷','小黑','倩倩','小明','景云','小霞'];
	data["seriesName"] = "数量";
	data["yData"] = ['10','20','25','40','30','18','12'];
    // 使用刚指定的配置项和数据显示图表。
	numsChart.setOption(createOption(data));
	moneyChart.setOption(createOption(data));
});

function createOption(data) {
	var option = {
	    title : {
	        text : data.title,
	        textStyle : {
				fontSize : 16
			},
			subtext: '2018-03-01 ~ 2018-03-22',
			subtextStyle : {
				// 为何无效？
				align : 'center',
				verticalAlign : 'bottom'
			}
	    },
	    color : ["#428bca"],
	    tooltip : {
	        trigger: 'axis'
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            magicType : {show: true, type: ['line', 'bar']},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            data : data.xData
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            boundaryGap: ['20%', '20%']
	        }
	    ],
	    series : [
	        {
	            name:data.seriesName,
	            type:'bar',
	            data:data.yData,
	            barCategoryGap: '40%',
	            markPoint : {
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ]
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};
	return option;
}
// 重置查询
function resetSearch() {
	$(".date").val("");
	$('#search_select').multiselect('deselectAll');
	$('#search_select').multiselect('select', ['good_id']);
}
// 获取查询数据
function getStatics() {
	var from_date = $("#from_date").val();
	var to_date = $("#to_date").val();
	var field = $("#search_select").val();
	
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
	data["field"] = field;
	if(from_date.length != 0) {
		data["from_date"] = from_date;
	}
	if(to_date.length != 0) {
		data["to_date"] = to_date;
	}
	
	toastr.info(JSON.stringify(data));
}