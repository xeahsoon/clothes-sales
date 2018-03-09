<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>测试页面</title>
	<script type="text/javascript">
		$.getScript("js/test.js");
	</script>
</head>
<body>
	<div id="fork_link" style="position: fixed; bottom: 0; right: 0; display:none;">
		<a href="https://github.com/xeahsoon" target="_Blank">
		<img src="images/fork.png" alt="Fork me on GitHub"/></a>
	</div>
	
	<div class="container col-md-12" style="height: 100%;">
		<div class="row">
			<h2 class="page-header">这是一个测试
			</h2>
			
		</div>
        <div class="row">
        	<div class="col-md-2">
        		<h5>Bootstrap Suggest</h5>
        	</div>
            <div class="col-md-4">
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
            
            <div class="col-md-2">
        		<h5>JQuery QuickSearch</h5>
        	</div>
        	<div class="col-md-4">
        		<input type="text" class="form-control" id="menu_search"/>
        	</div>
        </div>
        
        <div id="test_jquery_load" style="background-color: #ddd">
        </div>
	</div>
</body>
</html>