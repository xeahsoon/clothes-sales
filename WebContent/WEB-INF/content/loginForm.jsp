<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="images/icon_blue.png">

  <title>欢迎登入迈克服装收银系统</title>

  <!-- Bootstrap core CSS -->
  <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <!--<link href="css/signin.css" rel="stylesheet">-->
  <script type="text/javascript" src="assets/jquery-3.3.1.min.js"></script>
  <script>
  function checkLoginName() {
	  var loginname = $("#regist_loginname").val();
	  $.ajax({
			url: "checkLoginName/" + loginname,
 			type: "POST",
 			success: function(result) {
				var ln = document.getElementById("regist_loginname");
 				if(result > 0) {
					ln.setCustomValidity("该登录名已存在");
 				} else {
					ln.setCustomValidity("");
 				}
 			},
 			error: function(jqXHR) {
 				console.error("发生错误: " + jqXHR.status);
 			}
 		});
  }
  
  function checkPasswords() {
      var pass = document.getElementById("regist_password");
      var pass1 = document.getElementById("regist_password1");
      
      if (pass.value != pass1.value) {
    	  pass1.setCustomValidity("两次输入的密码不匹配");
      } else {
    	  pass1.setCustomValidity("");
      }
      
      if(pass1.value == '') {
    	  pass1.setCustomValidity("请再次确定密码");
      }
  }
  </script>
</head>

<body style="background: url(images/icon_blue.png) no-repeat; background-size: 36%; background-position: 666px 50px; ">
  <form id="loginForm" action="login" style="width: 330px; margin: 280px 330px 0;">
    <h2>Please login</h2>
    <font color="red">${requestScope.message }</font>
    <div class="input-group">
      <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
      <input type="text" name="loginname" id="loginname" class="form-control" placeholder="Username" required autofocus>
    </div>
    <div class="input-group" style="margin-top: 6px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
    </div>
    <div class="checkbox">
      <label class="col-md-5">
        <input type="checkbox" id="remember_tag"> Remember me
      </label>
      <a onclick="$('#loginForm').hide();$('#registForm').show();" class="pull-right" style="cursor:pointer;">Registration</a>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
  </form>
  
  <form id="registForm" action="register" style="width: 330px; margin: 200px 330px 0; display: none;">
    <h2>Registration</h2>
    <font color="red">${requestScope.message }</font>
    <div class="input-group">
      <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
      <input type="text" name="regist_loginname" id="regist_loginname" class="form-control" placeholder="Login Name" onchange="checkLoginName()" required autofocus>
    </div>
    <div class="input-group" style="margin-top: 6px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-credit-card"></span></span>
      <input type="text" name="regist_name" id="regist_name" class="form-control" placeholder="Username" required>
    </div>
    <div class="input-group" style="margin-top: 6px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
      <input type="text" name="regist_phone" id="regist_phone" class="form-control" placeholder="Phone" required>
    </div>
    <div class="input-group" style="margin-top: 6px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
      <input type="password" name="regist_password" id="regist_password"
      	class="form-control" placeholder="Password" required">
    </div>
    <div class="input-group" style="margin-top: 6px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
      <input type="password" name="regist_password1" id="regist_password1"
      	class="form-control" placeholder="Confirm Password" required>
    </div>
    <div class="checkbox">
      <a onclick="$('#registForm').hide();$('#loginForm').show();" class="pull-right" style="cursor:pointer;">Login</a>
    </div>
    <button class="btn btn-lg btn-primary btn-block" onclick="checkPasswords()" type="submit">Register</button>
  </form>
  
  <script type="text/javascript" color="66,139,202" opacity='0.7' src="assets/canvas-nest.js"></script>
</body>
</html>