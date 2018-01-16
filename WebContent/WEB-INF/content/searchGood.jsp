<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    
    <script type="text/javascript" class="init">
        $(document).ready(function() {
        	//创建goods dataTable
        	$('#goods_table').DataTable( {
            	"lengthChange": false,
            	"dom": 'lrtip',
            	//设置操作栏 排序为 false
                "columnDefs": [
                    { "orderable": false, "targets": 6 }
                  ],
            	"language": {
                    "url": "plug-ins/Chinese.json"
                }
            });
        });
        
        var table = $('#goods_table').DataTable();
        
        $('#keyword').on( 'keyup', function () {
            table.search( this.value ).draw();
        } );
    </script>
    
</head>
<body>
    <div class="container col-md-12">
        <div class="row">
            <h2 class="page-header">商品信息查询</h2>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="input-group col-md-8">
                	<span class="input-group-addon"><span class="glyphicon glyphicon-filter"></span></span>
		        	<input type="hidden" id="search_url" value="checkGoodID"/>
		        	<input type="hidden" id="search_name" value="searchGood"/>
		            <input id="keyword" type="text" class="form-control" placeholder="请输入搜索关键字..">
		        </div>
                
                <div style="margin-top: 30px">
                    <table class="table col-md-6 table-condensed">
                        <tr>
                            <th>款号</th><td>${requestScope.good.id }</td>
                            <td style="color: #ddd">/</td>
                            <th>价格</th><td><fmt:formatNumber value="${requestScope.good.price }" pattern=".00" /></td>
                        </tr>
                        <tr>
                            <th>类型</th><td>${requestScope.good.type }</td>
                            <td style="color: #ddd">/</td>
                            <th>年份</th>
                            <td>
                            	<!-- 截取款号id前两位为上新年份 -->
                            	<c:set var="string_id" value="${requestScope.good.id }" />
                            	20${fn:substring(string_id, 0, 2)}
                            </td>
                        </tr>
                        <tr style="border-bottom: 1px solid #ddd">
                            <th>面料</th><td>${requestScope.good.fabric }</td>
                            <td style="color: #ddd">/</td>
                            <th>库存</th><td>52</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="container col-md-8"style="height:200px;">
                <div class="table-responsive col-md-6" style="height: 195px; overflow: auto;">
                    <table class="table table-condensed">
                        <thead>
                        <tr>
                        	<th>#</th>
                        	<c:forEach items="${requestScope.good.good_size }" var="size">
                        		<th>${size.good_size }</th>
                        	</c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.good.good_color }" var="color">
                        	<tr>
                        		<td>${color.good_color }</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <img class="thumbnail pull-right" style="height: 195px;" 
                	src="images/${requestScope.good.picture }" onerror="this.src='images/icon_blue.png'" alt="Good Picture Has Gone">
            </div>
        </div>
        <div class="table-responsive">
            <table id="goods_table" class="table table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>类型</th>
                    <th>颜色</th>
                    <th>尺码</th>
                    <th>库存</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>#</th>
                    <th>类型</th>
                    <th>颜色</th>
                    <th>尺码</th>
                    <th>库存</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                </tfoot>
                <tbody>
                
                <c:forEach items="${requestScope.good_list }" var="good">
	            	<tr>
	            		<td><fmt:formatNumber value="${good.id }" pattern="00000000" /></td>
	            		<td>${good.type }</td>
	            		<td>白色 黑色 蓝色 深绿色</td>
	            		<td>S M L XL XXL XXXL</td>
	            		<td>10</td>
	            		<td><fmt:formatNumber value="${good.price }" pattern=".00" /></td>
	            		<td>
				        	<input type="hidden" id="search_id" value="${good.id}"/>
	            			<span style="color: transparent;">/</span>
	            			<span class="glyphicon glyphicon-export operator" title="导出" onclick="search('${good.id }')"></span>
	            		</td>
	            	</tr>
	            </c:forEach>
	            
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>