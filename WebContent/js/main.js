/**
 * Created by xeahsoon on 2018/1/26.
 */

$(document).ready(function() {
	
	generateDate();
	generateScrollingData();
	
	if(user != "admin") {
		$(".super-entry").remove();
	}
	
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
		"dom" : "<'row'<'col-sm-6'B><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-4'i><'col-sm-8'p>>",
		"buttons" : [
			{
				extend: 'copy',
				className: 'btn btn-default btn-sm',
	            text: "<span class='glyphicon glyphicon-duplicate table-buttons' title='复制文本'></span>"
	        },{
	            extend: 'colvis',
				className: 'btn btn-default btn-sm',
	            text: "<span class='glyphicon glyphicon-stats table-buttons' title='列可视调整'></span>"
	        },{
				extend: 'excel',
				className: 'btn btn-default btn-sm',
	    		title: "迈克服装收银系统-历史清单",
	    		sheetName: $("li#date").text(),
	            text: "<span class='glyphicon glyphicon-download-alt table-buttons' title='导出Excel'></span>"
	        }
	    ]
	});
});

// 设置顶部栏时间
function generateDate() {
	var week = ["日","一","二","三","四","五","六"];
	var now = new Date();
	var date = now.getFullYear() + "年" + (now.getMonth()+1) + "月" + now.getDate() + "日 星期" + week[now.getDay()];
	var time = checkTime(now.getHours()) + ":" + checkTime(now.getMinutes()) + ":" + checkTime(now.getSeconds());
	
	$("#date").text(date);
	$("#time").text(time);
	
	window.setTimeout("generateDate()", 1000);
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
		if(2<=index) {
			
			var time = $(this).find("td").eq(0).text();
			time = time.replace(/-/g,"/");
		
			var timeDiff = GetDateTimeDiff(new Date(time), new Date());
			
	    	var str = $(this).find("td").eq(4).text() +"￥"+ $(this).find("td").eq(2).text() + 
	    		"&nbsp;<span style='font-size: 9px;'>" +
	    		timeDiff.PubTime+"</span>";
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
		// 预期服务器返回的数据类型
		dataType: "json",
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

// 计算时间差
function GetDateTimeDiff(startTime, endTime) {
	var retValue = {};

	var date3 = endTime.getTime() - startTime.getTime(); //时间差的毫秒数  

	//计算出相差天数  
	var days = Math.floor(date3 / (24 * 3600 * 1000));
	retValue.Days = days;

	var years = Math.floor(days / 365);
	retValue.Years = years;

	var months = Math.floor(days / 30);
	retValue.Months = months;

	//计算出小时数  
	var leave1 = date3 % (24 * 3600 * 1000); //计算天数后剩余的毫秒数  
	var hours = Math.floor(leave1 / (3600 * 1000));
	retValue.Hours = hours;

	//计算相差分钟数  
	var leave2 = leave1 % (3600 * 1000); //计算小时数后剩余的毫秒数  
	var minutes = Math.floor(leave2 / (60 * 1000));
	retValue.Minutes = minutes;

	//计算相差秒数  
	var leave3 = leave2 % (60 * 1000); //计算分钟数后剩余的毫秒数  
	var seconds = Math.round(leave3 / 1000);
	retValue.Seconds = seconds;

	var strTime = "";
	if (years >= 1) {
		strTime = years + "年前";
	} else if (months >= 1) {
		strTime = months + "个月前";
	} else if (days >= 1) {
		strTime = days + "天前";
	} else if (hours >= 1) {
		strTime = hours + "小时前";
	} else {
		strTime = minutes + "分钟前";
	}
	retValue.PubTime = strTime; //帖子,文章,博客发表时间的一种简短表示方法  
	return retValue;
}