<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Test DataTable</title>

</head>
<body>
	<div class="container col-md-12">
		<div class="row">
			<h2 class="page-header">这是一个测试</h2>
			<span class="fa fa-facebook"></span>
		</div>

		<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
		<div id="test_div" style="width: 100%; height: 450px;"></div>
		<script type="text/javascript">
		$(document).ready(function() {
		
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('test_div'));

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
    </script>

	</div>
</body>
</html>