<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body style="text-align: center;">
	<!-- <hr>
		<h1>
			用户登录
		</h1>
		<hr> -->
	<form action="${pageContext.request.contextPath }/client/LoginServlet"
		method="POST">
		<table height="100%" width="100%" border="0">
			<tbody>
				<tr>
					<td align="center" valign="middle">
						<table width="500" align="center" cellpadding="0" cellspacing="0"
							bgcolor="#336699" border="0">
							<tr>
								<td height="80"></td>
							</tr>
							<tr>
								<td colspan="2">
									<div align="center">
										<h1>数据支撑部报表系统</h1>
									</div>
								</td>
							</tr>
							<tr>
								<td height="80"></td>
							</tr>
							<tr>
								<td height="80"></td>
							</tr>

							<tr align="center">
								<td align="right" width="200">用户名：</td>
								<td align="left"><input type="text" name="username"
									value="${param.username}" size="20" /></td>
							</tr>
							<tr align="center">
								<td align="right"><font face="宋体">密&nbsp;&nbsp;码：</font></td>
								<td align="left"><input type="password" name="password"
									size="21" /></td>
							</tr>
							<tr align="center">
								<td colspan="2"><input type="submit" value="登录"
									align="left" size="20" /> <input type="reset" value="重置"
									align="right" size="20" /></td>
							</tr>
							<tr>
								<td height="80"></td>
							</tr>
							<tr align="center">
								<td align="center" valign="middle" colspan="2">版权所有 ©
									北京高阳圣思园信息技术有限公司</td>
							</tr>
							<tr>
								<td height="80"></td>
							</tr>
						</table> <font color="red" size="5">${msg }</font>
					</td>
				</tr>
			</tbody>
		</table>

	</form>
</body>
</html>
