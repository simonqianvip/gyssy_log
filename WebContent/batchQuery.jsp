<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<title>数据支撑部报表系统</title>
<link rel='stylesheet' type='text/css' href='/static/css/style.css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet"
	media="screen">
<link href="css/bootstrap-datetimepicker.less" rel="stylesheet"
	media="screen">
</head>
<body>

	<div class=page>
		<div class=metanav>
			<table width="700" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td valign="top" width="700"><br>
						<form method="POST" name="memberform" target="_blank"
							action="${pageContext.request.contextPath }/client/batchQueryServlet"
							enctype="multipart/form-data">
							<table border="0" width="109%" cellpadding="0" cellspacing="2">
								<tr valign="top">
									<td align="RIGHT" valign="top" align="RIGHT" bgcolor="#F0F0F0"
										height="31" width="20%">主叫号码:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="calling_Number" size="20" id="callingNumber">
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">*请输入一个主叫号码</td>
								</tr>
								<br>
								<!-- 批量录入数据 -->
								<tr valign="top">
									<td align="RIGHT" valign="top" align="RIGHT" bgcolor="#F0F0F0"
										height="31" width="20%">主叫号码:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="file" name="calling_Number_txt" id="calling_Number_txt"
										style="width: 205;"></td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF" width="40%"><span
										style="color: red;">*主叫号码,批量录入,请使用换行符分割;TXT文件最大不能超过1M;建议最多一个文本不要超过1000个号码</span></td>
								</tr>
								<br>
								<!-- 批量录入数据 -->
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">SPID:
									</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="sp_id" size="20" id="spid"></td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">spid</td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">业务ID:
									</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="service_id" size="20" id="serviceid">
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">service id</td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">被叫号码:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="bj" size="20" id="bj"></td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">用户呼入号码</td>
								</tr>
								<tr>
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">
										匹配模式:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
										<fieldset>
											<input type="radio" checked name="m_radios" id="m_radios"
												value="0" /> <span>精确匹配</span> <br /> <input type="radio"
												name="m_radios" id="m_radios" value="1" /> <span>模糊匹配</span>
										</fieldset>
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF"></td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">查询开始时间(&gt;=):</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
										<div class="controls input-append date form_datetime"
											data-date="" data-date-format="yyyy-mm-dd hh:ii:ss"
											data-link-field="start_time">
											<input size="16" type="text" value="" style="width: 150;">
											<span class="add-on"><i class="icon-remove"></i></span> <span
												class="add-on"><i class="icon-th"></i></span>
										</div> <input type="hidden" id="start_time" value="" />
										<h5>例如：[2012-01-01 01:01:01]</h5>
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">*
										呼叫开始时间,作为查询条件的开始时间</td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">查询结束时间(&lt;=):</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
										<div class="controls input-append date form_datetime"
											data-date="" data-date-format="yyyy-mm-dd hh:ii:ss"
											data-link-field="end_time">
											<input size="16" type="text" value="" style="width: 150;">
											<span class="add-on"><i class="icon-remove"></i></span> <span
												class="add-on"><i class="icon-th"></i></span>
										</div> <input type="hidden" id="end_time" value="" />
										<h5>例如：[2012-01-01 01:01:01]</h5>
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">*
										呼叫开始时间,作为查询条件的结束时间(尽量填写,有助于提高查询速度)</td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">
										按键:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="press_key" size="20"></td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF"><h5>支持操作符:in,nin,all,in
											:包含任意一项;nin:不包含任意一项;all:包含全部项
											举例:in['1','2'],包含['1'，'2']的任意一个按键</h5></td>
								</tr>
								<tr valign="top">
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">
										按键数:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
										type="text" name="press_keynum" size="20"></td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF">支持操作符:&gt;,&lt;,&gt;=,&lt;=
										,"0" : without key pressed</td>
								</tr>
								<tr>
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">
										呼叫状态:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
										<fieldset>
											<input type="radio" name="radios" id="radios" value="3" /> <span>全部</span>
											<br /> <input type="radio" checked name="radios" id="radios"
												value="0" /> <span>呼叫成功</span> <br /> <input type="radio"
												name="radios" id="radios" value="1" /> <span>用户挂机</span> <br />
											<input type="radio" name="radios" id="radios" value="2" /> <span>平台挂机</span>
										</fieldset>
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF"></td>
								</tr>
								<tr>
									<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31">
										按键显示:</td>
									<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
										<fieldset>
											<input type="radio" checked name="n_radios" id="n_radios"
												value="1" /> <span>首次按键</span> <br /> <input type="radio"
												name="n_radios" id="n_radios" value="0" /> <span>全部按键</span>
											<br /> <input type="radio" name="n_radios" id="n_radios"
												value="2" /> <span>按键数</span>

										</fieldset>
									</td>
									<td></td>
									<td align="left" valign="top" bgcolor="#FFFFFF"></td>
								</tr>
								<table width="100%" border="0" align="CENTER" valign="TOP">
									<tr align="CENTER" valign="TOP" bgcolor="#336699">
										<td>
											<center>
												<input type="button" name="Write" value="提     交"
													onClick="send_action(this)"> &nbsp;&nbsp; <input
													type="RESET" name="Reset" value="重新再填">
											</center>
										</td>
									</tr>
								</table>
								</form>
								</td>
								</tr>
							</table>
							</h4>

							</div>
							</div>

							<script type="text/javascript" src="js/jquery-1.8.3.min.js"
								charset="UTF-8"></script>
							<script type="text/javascript" src="js/bootstrap.min.js"></script>
							<script type="text/javascript"
								src="js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
							<script type="text/javascript"
								src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
							<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        language:  'zh',
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		forceParse: 0,
        showMeridian: 1
    });

</script>
							<script type="text/javascript">
function send_action() {
    var starttime = document.memberform.start_time.value;
    var endtime = document.memberform.end_time.value;
    var callingNumber = document.memberform.calling_Number.value;
    var callingNumber_txt = document.memberform.calling_Number_txt.value;
    var spid = document.memberform.sp_id.value;
    var serviceid =  document.memberform.service_id.value ;
    var bj =  document.memberform.bj.value ;
    var presskey = document.memberform.press_key.value;
    var presskeynumber = document.memberform.press_keynum.value;
    var radios = document.getElementsByName("radios");
    var m_radios = document.getElementsByName("m_radios");
    var n_radios = document.getElementsByName("n_radios");
    var hjzt = '';
    var matchflag = '';
    var keymatchflag = 0;
    
    if (callingNumber == '' && callingNumber_txt==''){
		alert("\请输入待查询的主叫手机号码!!");
		return;
    }
    if (n_radios[1].checked){
		keymatchflag = 1;
    }
    else if (n_radios[0].checked){
		keymatchflag = 0;
    }
    else if (n_radios[2].checked){
		keymatchflag = 2;
    }
    if (bj == ''){
		matchflag = '';
    }
    else if (m_radios[0].checked){
		matchflag = 0;
    }
    else if (m_radios[1].checked){
		 matchflag = 1;
    }
    
    if (radios[0].checked){
		hjzt = '';
    }
    else if (radios[1].checked){
		 hjzt = 0;
    }
    else if (radios[2].checked){
		 hjzt = 1;
    }
    else if (radios[3].checked){
		 hjzt = 2;
    }
    memberform.action="/gyssy_log/client/BatchQueryServlet?operation=QueryBatchFunc&zj=" + callingNumber + "&zj_txt="+callingNumber_txt+"&btime="+starttime+"&etime="+endtime+"&spid="+spid+"&seid="+serviceid + "&press.press="+presskey + "&hjzt="+hjzt+"&bj="+bj + "&keynum="+presskeynumber + "&matchflag="+matchflag + "&keymatchflag="+keymatchflag+"&pagenum=1";
    if (starttime.length > 0){
	 memberform.submit();}
     else{
	 alert("\请选择正确的时间信息!!");
     }	     
}
// End of validation script -->
</script>
</body>
</html>

