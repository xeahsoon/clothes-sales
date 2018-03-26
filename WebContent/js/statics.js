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
});

var numsChart = echarts.init(document.getElementById('nums_statics'));
var moneyChart = echarts.init(document.getElementById('money_statics'));

var table = $("#statics_table").DataTable({
	"language": {
		url: "assets/dataTables/plug-in/Chinese.json"
	},
    "lengthMenu": [[8], [8]],
	"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-12'p>>",
	"ordering": false,
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
        totalNum = api.column(1).data().reduce(function(a, b) {
            return intVal(a) + intVal(b);
        }, 0);
        totalPrice = api.column(2).data().reduce( function (a, b) {
            return intVal(a) + intVal(b);
        }, 0);
        // Update footer
        $(api.column(1).header()).html(totalNum+"件");
        $(api.column(2).header()).html(totalPrice+"元");
    }
});

function initGraphs(rawData) {
	// x轴公用显示field，yData1存储num，yData2存储price
	var xData=[], yData1=[], yData2=[];
	for(var item of rawData) {
		xData.push(item.field);
		yData1.push(item.num);
		yData2.push(item.price);
	}
	
	var data1={}, data2={};
	
	data1["title"] = "商品件数";
	data1["xData"] = xData;
	data1["seriesName"] = "件数";
	data1["yData"] = yData1;
	
	data2["title"] = "商品金额";
	data2["xData"] = xData;
	data2["seriesName"] = "金额";
	data2["yData"] = yData2;
	
    // 使用刚指定的配置项和数据显示图表。
	numsChart.setOption(createOption(data1));
	moneyChart.setOption(createOption(data2));
}

function initTable(rawData) {
	var dataSet = [];
	for(var item of rawData) {
		var row=[];
		row.push(item.field);
		row.push(item.num);
		row.push(item.price);
		dataSet.push(row);
	}
	// 偏方刷新DataTable
	table.clear();
	table.rows.add(dataSet).draw();
}

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
				verticalAlign : 'bottom',
			},
			itemGap : 18
	    },
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
	    grid : {
	    	top : 68,
	    	bottom : 38
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : data.xData
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            boundaryGap: ['0%', '10%']
	        }
	    ],
	    series : [
	        {
	            name:data.seriesName,
	            type:'bar',
	            data:data.yData,
	            barCategoryGap: '40%',
	            barMaxWidth: 28,
	            itemStyle : {
	            	normal : {
	            		color: function(params) {
	            		    var colorList = ['#c23531','#2f4554', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'];
	            		    return colorList[params.dataIndex];
	            		},
		            	opacity : 0.8
	            	}
	            }, 
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

// 查询数据
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
		data["to_date"] = to_date + " 23:59:59";
	}
	
	// 请求数据
	$.ajax({
		url: "getStatics",
		type: "POST",
		data: {
			params: JSON.stringify(data)
		},
		dataType: "json",
		success: function(data) {
			// 刷新柱形图
			initGraphs(data);
			// 刷新表格
			initTable(data);
		},
	});
}