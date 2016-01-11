<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>数据支撑部报表系统</title>
</head>
<body bgcolor="#FFFFFF" topmargin=0 leftmargin=0>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CallUniqueMark</title>
</head>
<style type="text/css">
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	border: 16px solid #808000;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

</style>
<body>

	<!-- 
<p class="STYLE11">查询条件:<font color="#000080">zj=13502185471&btime=2015-03-10 11:35:29&etime=2015-04-28 11:30:29&spid=&seid=&press.press=&hjzt=0&bj=&keynum=&matchflag=&keymatchflag=0</font></p>
 -->
	<div align="left">
		<p class="STYLE11">查询结果:</p>
		<table border="2" cellspacing="0" id="tableExcel">
			<tr>
				<td width="50" bgcolor="#808000">SP名称</td>
				<td width="80" bgcolor="#808000">业务代码</td>
				<td width="100" bgcolor="#808000">主叫</td>
				<td width="110" bgcolor="#808000">被叫</td>
				<td width="100" bgcolor="#808000">通话时长(单位:分钟)</td>
				<td width="100" bgcolor="#808000">计费费用(单位:人民币元)</td>
				<td width="150" bgcolor="#808000">通话开始时间</td>
				<td width="150" bgcolor="#808000">通话结束时间</td>
				<td width="210" bgcolor="#808000">首次按键/按键时间</td>
				<!-- <td width="180" bgcolor="#808000">按键时间</td> -->
				<td width="80" bgcolor="#808000">企业代码</td>
				<td width="140" bgcolor="#808000">业务名称</td>
				<td width="140" bgcolor="#808000">公司名称</td>
				<td width="100" bgcolor="#808000">客服热线</td>
				<td width="120" bgcolor="#808000">计费类型</td>
				<td width="260" bgcolor="#808000">按键详情</td>
			</tr>
				<%
					int count =0;
				%>
			<c:forEach items="${requestScope.logList}" var="b" varStatus="vb">
				
				<c:if test="${b.row_number == '1'}" var="row_number">
				<%
					count++; 
					request.setAttribute("count", count);
				%>
					<c:if test="${count <=100 }">
					
					<tr>
						<td bgcolor="#FFFFFF">${b.SP_ID}</td>
						<td>${b.SERVICE_ID}</td>
						<td>${b.CALLING_NBR}</td>
						<td>${b.CALLED_NBR}</td>
						<td>${b.TICKET_DURATION}</td>
						<td>${b.BILLING_CHARGE}</td>
						<td>${b.START_DATETIME}</td>
						<td>${b.END_DATETIME}</td>
						<td>
									<c:if test="${b.DIGITS != null}" var="digits">
						    			${b.DIGITS} / [${b.TIME}]
						    		</c:if> 
						    		<c:if test="${b.DIGITS == null}" var="digits1">
						    			<c:if test="${b.TIME == 'X'}">
											信息未收录完整
										</c:if>
										<c:if test="${b.TIME != 'X'}">
											无按键信息
										</c:if>
						    		</c:if>
						</td>
						<td>${b.enterprise_code}</td>
						<td>${b.service_name}</td>
						<td>${b.cn_simple_name}</td>
						<td>${b.LINKMAN_TEL}</td>
						<td>${b.class_name}</td>
						<td>
							<c:if test="${b.DIGITS != null}" var="digits">
								<%-- <a href="javascript:void(0)" onclick="showDiv(${b.SERVICE_ID})">detail</a> --%>
								
								<table>
								<c:forEach items="${requestScope.logInfo}" var="loginfo">
									<c:forEach items="${loginfo.value}" var="lg" varStatus="log">
										<c:if test="${b.uuid == lg.uuid}">
									
											<c:if test="${log.count<=30 }">
												<tr>
												     <td>按键${lg.DIGITS} [ ${lg.TIME } ]</td>
												</tr>
											</c:if>
											<c:if test="${log.count==31 }">
											<tr>
												<td>
													<font color="red" style="font-weight:bold;">该用户按键数量过多，超过阀值，没有完全展示</font>
												</td>
											</tr>
											</c:if>
										</c:if>
									</c:forEach>
								</c:forEach>
								</table>
							</c:if> 
							<c:if test="${b.DIGITS == null}" var="digits1">
								<c:if test="${b.TIME == 'X'}">
									信息未收录完整
								</c:if>
								<c:if test="${b.TIME != 'X'}">
									无按键信息
								</c:if>
						    </c:if>
						</td>
					</tr>
					</c:if>
				</c:if>
			</c:forEach>
		

		</table>
		<h1 align="center"><font style="color: red">${requestScope.error_msg }</font></h1>
		<!--  <input type="button" onclick="javascript:method2('tableExcel');" value="导入到EXCEL">   -->
		<h3>
		<!-- 
			<a onclick="goback()" style="float: left;"
				href="javascript:history.go(-1)">返回</a>
				 -->
				<a
				href="/gyssy_log/client/BatchQueryServlet?operation=exportexcle&UUID=${requestScope.uuid}"
				style="float: right;">导出到EXCEL</a>
		</h3>
		<script type="text/javascript">

		<%-- function goback(){
		 	var path = "<%=request.getContextPath()%>/index.jsp"; 
			window.location.href=path; 
		} --%>
		
 		function method2(tableid) //读取表格中每个单元到EXCEL中 
        {
            var curTbl = document.getElementById(tableid);
            var oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel
            var oWB = oXL.Workbooks.Add(); //获取workbook对象
            var oSheet = oWB.ActiveSheet; //激活当前sheet
            oSheet.Columns("A:Z").Select
            oSheet.Cells.NumberFormatLocal = "@";
            oXL.Selection.ColumnWidth = 25
            var Lenr = curTbl.rows.length; //取得表格行数
            for (i = 0; i < Lenr; i++) {
                var Lenc = curTbl.rows(i).cells.length; //取得每行的列数
                for (j = 0; j < Lenc; j++) {
                    oSheet.Cells(i + 1, j + 1).value = curTbl.rows(i).cells(j).innerText; //赋值
                }
            }
            oXL.Visible = true; //设置excel可见属性
        }
 		
 		function showDiv(sid)
 		{
 			var sID= sid;
 			document.getElementById('light').style.display='block';
 			document.getElementById('fade').style.display='block';
 			createTable(sID);
 		}
 		
		var array = new Array(); 
		var logInfo = new Object();
 		
 		<c:forEach items="${logList}" var="a"> 
 		logInfo.DIGITS = "${a.DIGITS}";
 		logInfo.TIME = "${a.TIME}";
 		logInfo.SERVICE_ID = "${a.SERVICE_ID}";
 		var json = JSON.stringify(logInfo);
 	   	array.push(json); //生成如 array.push(123)的字符串 这样前台拿到后就是js 
 		</c:forEach> 
 		
 		function createTable(sid){ 
 		     var div = document.getElementById("dd"); 
 		     var table = document.createElement("table");//创建table
 		     table.id ="table1";
 		     table.border="2";
 		     table.align="center";
 		     
 		    var t1=document.getElementById("table1");
 		    //删除旧的table元素
 		    if(t1 != null){
 		    	document.getElementById('dd').innerHTML="";
	 		    var rowNum=t1.rows.length;
	 		    if(rowNum>0)
	 		    {
	 		        for(i=0;i<rowNum;i++)
	 		        {
	 		          t1.deleteRow(i);
	 		          rowNum=rowNum-1;
	 		          i=i-1;
	 		        }    
	 		    }
 		    }
 	        
 		      
 		     var row = table.insertRow();//创建一行 
 		     var cell;
 		    cell = row.insertCell();//创建一个单元 
	 		     cell.width = "150";//更改cell的各种属性 
	 		     cell.style.backgroundColor = "#999999"; 
	 		     cell.innerHTML="按键"; 
	 		     cell = row.insertCell();//创建一个单元 
	 		     cell.width = "250";//更改cell的各种属性 
	 		     cell.style.backgroundColor = "#999999"; 
	 		     cell.innerHTML="按键时间";
			
			for(var i=0;i<array.length;i++){
				var str = eval("("+array[i]+")");
				if(sid == str.SERVICE_ID){
					if(str.DIGITS !=""){
					row = table.insertRow();
					cell = row.insertCell();//创建一个单元 
			 		cell.style.backgroundColor = "#999999"; 
			 		cell.innerHTML=str.DIGITS; 
			 		cell = row.insertCell();//创建一个单元 
			 		cell.style.backgroundColor = "#999999"; 
			 		cell.innerHTML=str.TIME; 
			 		div.appendChild(table); 
					}
				}
			}
 		 } 
 		
 
 </script>
	</div>
	<div id="light" class="white_content">

		<div style="position: fixed; top: 27%; left: 26%;">
			<h3>
				<a href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
					Close</a>
			</h3>
		</div>
		<h2 align="center">按键详情</h2>
		<div id="dd"></div>
	</div>
	<div id="fade" class="black_overlay"></div>
</body>
</html>
