$(document).ready(function(){
	
	getStaffSales();
	
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

var staffsChart = echarts.init(document.getElementById('staff_statics'));

var table = $("#sales_table").DataTable({
	"language": {
		url: "assets/dataTables/plug-in/Chinese.json"
	},
    "lengthMenu": [[8], [8]],
	"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-4'i><'col-sm-8'p>>",
    "order": [[ 0, "asc" ]]
});

// 临时生成随机值
function randomValue() {
	var value = [];
	for(var i=0; i<5; i++) {
		value.push((Math.round(Math.random()*100))*50/100 + 50);
	}
	return value;
}

function createOption(data) {
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
	        data : data.lData,
	        selected : data.lNotSelect
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
	            indicator : data.indicator,
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
	            data : data.sData
	        }
	    ]
	};
	return option;
}

function initRadar(rawData) {
	// pData格式[{'姓名', '件数', '票数', '附加', '单效', '业绩'},{...}]
	//         [['name': {'nums', 'onums', 'addon', 'per_money', 'sum_money'}],[..{...}]]
	var data={};
	var lData = [];
	var lNotSelect = {};
	var indctr = [
		{text : '件数', max : 0},
        {text : '单数', max : 0},
        {text : '附加', max : 0},
        {text : '单效', max : 0},
        {text : '销售', max : 0}];
	var sData = [];
	
	rawData.forEach(function(item, key) {
		// 构建lData
		lData.push(key);
		// 更新indicator的max
		if(item.nums > indctr[0].max) {
			indctr[0].max = item.nums;
		}
		if(item.onums > indctr[1].max) {
			indctr[1].max = item.onums;
		}
		if(item.addon > indctr[2].max) {
			indctr[2].max = item.addon;
		}
		if(item.per_money > indctr[3].max) {
			indctr[3].max = item.per_money;
		}
		if(item.sum_money > indctr[4].max) {
			indctr[4].max = item.sum_money;
		}
		// 插入SData
		var s = {'name': key, 'value': [item.nums, item.onums, item.addon, item.per_money, item.sum_money]};
		sData.push(s);
	});

	for(var i in lData) {
		if(i < 2) {
			lNotSelect[lData[i]] = true;
		} else {
			lNotSelect[lData[i]] = false;
		}
	}
	
	data["lData"] = lData;
	data["lNotSelect"] = lNotSelect;
	data["indicator"] = indctr;
	data["sData"] = sData;
	
	console.log(data);
	staffsChart.setOption(createOption(data));
}

function initSalesTable(rawData) {
	var dataSet = [];
	
	var count = 1;
	rawData.forEach(function(item, key) {
		var row=[count, key, item.nums, item.onums, item.addon, item.per_money, item.sum_money];
		dataSet.push(row);
		count ++;
	});
	
	// 偏方刷新DataTable
	table.clear();
	table.rows.add(dataSet).draw();
}

// 重新计算业绩
function calSales(data) {
	// data格式[{sum_money: 0, snums: 2, name: "小黑", nums: 0},{}]
	var pData = new Map();
	for(var e of data) {
		if(!pData.has(e.name)) {
			pData.set(e.name, {'nums':e.nums, 'onums':1, 'sum_money':e.sum_money});
		} else {
			var value = pData.get(e.name);
			value.nums += e.nums;
			value.onums += 1;
			value.sum_money += e.sum_money;
			pData.set(e.name, value);
		}
	}
	pData.forEach(function(item, key, map) {
		item['addon'] = Math.floor(item.nums / item.onums * 100) / 100;
		item['per_money'] = Math.floor(item.sum_money / item.nums * 100) / 100;
		map.set(key, item);
	});
	console.log(pData);
	
	// pData格式[{'姓名', '件数', '票数', '附加', '单效', '业绩'},{...}]
	initRadar(pData);
	
	initSalesTable(pData);
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
		data["to_date"] = to_date + " 23:59:59";
	}
	
	$.ajax({
		url: "getStaffSales",
		type: "POST",
		data: {
			params: JSON.stringify(data)
		},
		dataType: "json",
		success: function(data) {
			calSales(data);
		},
		error: function(jqXHR) {
			toastr.error("发生错误： " + jqXHR.status);
		}
	});
}