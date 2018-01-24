<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test DataTable</title>
	
	<script type="text/javascript">
		$(document).ready(function() {
		
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('test_div'), "blue");

        var option = {
        	    title : {
        	        /* text: '某站点用户访问来源',
        	        subtext: '纯属虚构', */
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    /* legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        	    }, */
        	    series : [
        	        {
        	            name: '访问来源',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:335, name:'直接访问'},
        	                {value:310, name:'邮件营销'},
        	                {value:234, name:'联盟广告'},
        	                {value:135, name:'视频广告'},
        	                {value:1548, name:'搜索引擎'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    	
		});

	    /**
	     * 从 data参数中过滤数据
	     */

		/**
	     * 测试(首次从 URL 获取数据，显示 header，不显示按钮，忽略大小写，可清除)
	     */
	    $("#testNoBtn").bsSuggest({
	        url: "testData",
	        /*effectiveFields: ["userName", "shortAccount"],
	        searchFields: [ "shortAccount"],*/
	        effectiveFieldsAlias:{id: "编号", type: "类型"},
	        autoSelect: true,
	        autoMinWidth: true,
	        ignorecase: true,
	        showHeader: true,
	        showBtn: false,     //不显示下拉按钮
	        delayUntilKeyup: true, //获取数据的方式为 firstByUrl 时，延迟到有输入/获取到焦点时才请求数据
	        idField: "id",
	        clearable: true,
	        processData: function(json){ //url 获取数据时，对数据的处理，作为 getData 的回调函数                
                var i, len, data = {value: []};            
                if(!json || json.length == 0) {
                    return false;
                }
                len = json.length;            
                for (i = 0; i < len; i++) {
                    data.value.push({
                        "id": json[i].id,
                        "type": json[i].type,
                        "fabric":json[i].fabric,
                        "price":json[i].price
                    });
                }
                /* var data = JSON.parse(json); */
                console.log(data);
                return data;            
            }
	        
	    }).on('onDataRequestSuccess', function (e, result) {
	        console.log('onDataRequestSuccess: ', result);
	    }).on('onSetSelectValue', function (e, keyword, data) {
	        console.log('onSetSelectValue: ', keyword, data);
	    }).on('onUnsetSelectValue', function () {
	        console.log("onUnsetSelectValue");
	    });
	</script>
</head>
<body>
	<div class="container col-md-12">
		<div class="row">
			<h2 class="page-header">这是一个测试</h2>
			<span class="fa fa-facebook"></span>
		</div>
		
        <div class="row">
            <div class="col-md-3">
                <div class="input-group">
                    <input type="text" class="form-control" id="testNoBtn">
                    <div class="input-group-btn" style="max-width: 100px;">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        </ul>
                    </div>
                    <!-- /btn-group -->
                </div>
            </div>
        </div>
		
		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="test_div" style="width: 100%; height: 300px;"></div>

	</div>
</body>
</html>