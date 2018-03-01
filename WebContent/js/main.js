/**
 * Created by xeahsoon on 2018/1/26.
 */

$(document).ready(function() {
	
	generateDate();
	generateScrollingData();
	
	// 设置全局toastr属性
	toastr.options = {
        positionClass: "toast-bottom-right",  
        showDuration: "500",  
        hideDuration: "300", 
        timeOut: 2500
	};
	
	// 搜索框动画
	$("#search_menu").on("focus", function() {
	    $("#search_menu").css("color","black");
	    $("#search_icon").fadeIn("slow");
	    $("#search_menu").animate({height:'34px'},"fast");
	});
	
	$("#search_menu").on("blur", function() {
	    $("#search_menu").css("color","white");
	    $("#search_icon").fadeOut("fast");
	    $("#search_menu").animate({height:'20px'});
	});
	
	// 创建菜单栏quicksearch
	$('input#search_menu').quicksearch('ul.nav li', {
		// 搜索前展开所有菜单列表
		'onBefore' : function() {
			$(".collapse").addClass("in");
		}
	});
	
    // 点击菜单加载页面
	$("a[data-url]").on("click", function() {
		showAtRight($(this).data("url"));
        $("ul.nav li").removeClass("active");
        $(this).parent().addClass("active");
    });
	
	// 注册自定义的echarts主题
	var theme = new Theme();
	echarts.registerTheme("blue", theme.getTheme("blue"));

	var name = new Array("商品金额比例图", "商品数量比例图", "员工业绩比例图", "剩余库存比例图");
	// 基于准备好的dom，初始化echarts实例
	var myChart0 = echarts.init(document.getElementById('test_div_0'));
	var myChart1 = echarts.init(document.getElementById('test_div_1'), "blue");
	var myChart2 = echarts.init(document.getElementById('test_div_2'));
	var myChart3 = echarts.init(document.getElementById('test_div_3'), "blue");
	
	// ajax请求4次
	for(var i=0; i<4; i++) {
		if(i==0) {
			getChartData(i, name[i], myChart0);
		} else if(i==1) {
			getChartData(i, name[i], myChart1);
		} else if(i==2) {
			getChartData(i, name[i], myChart2);
		} else if(i==3) {
			getChartData(i, name[i], myChart3);
		}
	}

	$('#orders_table').DataTable({
		//导入中文包
		"language" : {
			"url" : "assets/dataTables/plug-in/Chinese.json"
		},
		"order": [[ 0, "desc" ]],
		//设置操作栏 排序为 false
		"columnDefs" : [{
			"orderable" : false,
			"targets" : 8
		}],
		"dom" : 'Bfrtip',
		"buttons" : [
			{
				extend: 'copy',
	            text: "<span class='glyphicon glyphicon-duplicate table-buttons' title='复制文本'></span>"
	        },{
	            extend: 'colvis',
	            text: "<span class='glyphicon glyphicon-stats table-buttons' title='列可视调整'></span>"
	        },{
				extend: 'excel',
	            text: "<span class='glyphicon glyphicon-download-alt table-buttons' title='导出Excel'></span>"
	        }
	    ]
	});

	window.setInterval("generateDate()", 1000);
});

// 设置顶部栏时间
function generateDate() {
	var week = ["日","一","二","三","四","五","六"];
	var now = new Date();
	var date = now.getFullYear() + "年" + (now.getMonth()+1) + "月" + now.getDate() + "日 星期" + week[now.getDay()];
	var time = checkTime(now.getHours()) + ":" + checkTime(now.getMinutes()) + ":" + checkTime(now.getSeconds());
	
	$("#date").text(date);
	$("#time").text(time);
}
function checkTime(i) {
	if (i<10){
		i="0" + i;
	}
	return i;
}

// 初始化滚动列表
function generateScrollingData() {
	var data = [];
	$("#orders_table").find("tr").each(function(index) {
		if(2<=index && index <=4) {
	    	var str = $(this).find("td").eq(4).text() +" ￥"+ $(this).find("td").eq(2).text();
	    	toastr.info(str);
	    	data.push(str);
		}
    });
	
	$("#run_hello").append("您好！<i>" + $("#top_username").text() + "&nbsp;</i>");
	
	for(var i=0; i<data.length; i++) {
		$("#run_data").append("<li>" +
				"<span class='glyphicon glyphicon-flag'></span>&nbsp;" +
				data[i] + "</li>");
	}
	
	$('#run_data').newsTicker({
        row_height: 14,
        max_rows: 1,
        duration: 8000,
        pauseOnHover: 1,
        hasMoved: function() {
        	// 去除问候
        	$("#run_hello").remove();
        }
    });
}

// 通过ajax从后台获取数据并创建ECharts
function getChartData(number, name, chart) {
	$.ajax({
		type : "POST",
		url : "getDiagram/" + number,
		success : function(data) {
			// 使用后台传回的json数据设置图表选项
			chart.setOption(createOption(name, data));
		},
		error : function(jqXHR) {
			toastr.error("发生错误: " + jqXHR.status);
		}
	});
}

// 主页面构造ECharts option函数，参数data为ajax请求得到的json对象
function createOption(title, data) {
	var option = {
		title : {
			text : title,
			x : 'center',
			y : 'bottom',
			textStyle : {
				fontSize : 14,
				fontWeight : 'normal',
				color : '#888'
			}
		},
		tooltip : {
			trigger : 'item',
			formatter : "{a} <br/>{b}: {c} ({d}%)"
		},
		series : [ {
			name : title.substr(0,4),
			type : 'pie',
			center : [ '50%', '44%' ], //圆心坐标
			radius : [ '80%', '88%' ], //圆环宽度
			avoidLabelOverlap : false,
			label : {
				normal : {
					show : false,
					position : 'center'
				},
				emphasis : {
					show : true,
					textStyle : {
						fontSize : '20',
						fontWeight : 'bold'
					}
				}
			},
			labelLine : {
				normal : {
					show : false
				}
			},
			data : data
		} ]
	};
	return option;
}