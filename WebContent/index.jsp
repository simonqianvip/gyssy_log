<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta charset="UTF-8">
<title>日志管理系统</title>
</head>
<!-- 
<body>
	<div align="center"  style="background-color:gray;width:100%;height:100px;top:0;left:0;"><h1>数据支撑部报表系统<h1></div>
	<div style="left:0;">
		<div align="left" style="float:left;margin-left:300;background:silver;height:400px;">
			<h3>高阳圣思园信息技术有限公司</h3><br/>
			<h4>日志管理系统</h4>
			<a href="queryPage.jsp">日志查询</a><br/>
			<a href="batchQuery.jsp">批量日志查询(首次按键)</a><br/><br/><br/><br/>
			<h3>[运营支撑中心--数据支撑部]</h3><br/>
		</div>
		<div align="right" style="float:left;margin-left:300;">nihao</div>
	</div>
	<div style="width:100%; position:fixed; left:0; bottom:0;text-align:center;background-color: gray;">
	<h5>数据支撑部报表系统<h5>
	</div>
</body>
 -->
<c:if test="${sessionScope.username == null}">
	<h1>欢迎光临游客！</h1>
	<a href="${pageContext.request.contextPath }/login.jsp">登录</a>
</c:if>
<c:if test="${sessionScope.username != null}">
	<frameset rows="12%,88%" scrolling="no" border="0">
		<frame src="head.jsp" target="_top">
		</frame>
		<frameset cols="25%,75%" scrolling="no" border="0">
			<frame src="left.jsp" />
			<frame src="batchQuery.jsp" name="show_page" />
		</frameset>
	</frameset>
</c:if>


</html>