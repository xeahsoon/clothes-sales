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
</head>

<body style="background: url(images/icon_blue.png) no-repeat; background-size: 36%; background-position: 666px 50px; ">
  <form id="loginForm" action="login" style="width: 330px; margin: 280px 330px 0; ">
    <h2>Please login</h2>
    
    <font color="red">${requestScope.message }</font>
    <div class="input-group">
      <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
      <input type="text" name="loginname" id="loginname" class="form-control" placeholder="Username" required autofocus>
    </div>
    <div class="input-group" style="margin-top: 5px">
      <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
    </div>
    <div class="checkbox">
      <label class="col-md-5">
        <input type="checkbox" id="remember_tag"> Remember me
      </label>
      <a href="" class="pull-right invisible">Administration</a>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
  </form>
  <script type="text/javascript" color="66,139,202" opacity='0.7' src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>