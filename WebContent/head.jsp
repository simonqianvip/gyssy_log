<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>日志管理系统</title>
</head>
<body>
	<div align="center"
		style="background: gray; margin: 0; padding: 0; width: 100%; height: 100%; position: fixed; top: 0px; left: 0px;">
		<h1>
			数据支撑部报表系统
			<h1>
				<c:if test="${sessionScope.username != null}">
					<h5>
						欢迎回来！${username}&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath }/client/LogOutServlet"
							target="_top">注销</a>
					</h5>
				</c:if>
	</div>
</body>
</html>