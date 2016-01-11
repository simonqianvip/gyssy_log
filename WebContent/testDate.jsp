<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet"
	media="screen">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="input-append date form_datetime">
		<input size="16" type="text" value="" readonly> <span
			class="add-on"><i class="icon-th"></i></span>
	</div>
	<script type="text/javascript">
	    $(".form_datetime").datetimepicker({
	        format: "dd MM yyyy - hh:ii"
	    });
	</script>


</body>
</html>