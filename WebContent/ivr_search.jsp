<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>IVR日志--号码查询</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
	<meta http-equiv="x-ua-compatible" content="ie=7" />
</head>
<body>
	<div class="top"></div>
	<!-- <div class="logo">手机定位手机归属查询</div> -->
	<div class="search">
		<form method="post" action="" name="memberform" target="_blank">
			<h1>请输入手机号</h1>
			<input type="text" name="m" id="m" maxlength="100"> <span
				class="btn_wr"> <input type="submit" value="监  控"
					id="btnQuery" class="btn" onmousedown="this.className='btn btn_h'"
					onmouseout="this.className='btn'" onClick="send_action(this)"></span>
		</form>
		<script type="text/javascript">
			document.getElementById("m").focus();
			//定位焦点。
		</script>
		<script type="text/javascript">
			function send_action() {
				var caller = document.memberform.m.value;
				if (caller == '') {
					alert("\请输入待查询的主叫手机号码!!");
					return;
				}
				memberform.action = "/gyssy_log/client/IvrSearchServlet?caller="
						+ caller;
			}
		</script>
	</div>
	<div class="banner"></div>
	<div class="foot">
		<font color="red" size="10">${msg }</font>
	</div>
</body>
</html>
