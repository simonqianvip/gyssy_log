<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<title>数据支撑部报表系统</title>
<link rel='stylesheet' type='text/css' href='/static/css/style.css'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="/css/bootstrap-datetimepicker.css" rel="stylesheet"
	media="screen">
<script src="jquery.datetimepicker.js"></script>

</head>
<div class=page>
	<div class=metanav>
		<table width="700" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top" width="700"><br>
					<form method="POST"
						action="${pageContext.request.contextPath }/client/LoginServlet">
						<table border="0" width="109%" cellpadding="0" cellspacing="2">

							<tr valign="top">
								<td width="18%" height="28" align="RIGHT" valign="middle"
									bgcolor="#F0F0F0">流程ID:</td>
								<td width="25%" align="RIGHT" valign="middle" bgcolor="#FFFFFF">
									<input type="text" name="session_id" size="20" id="sessionid">
								</td>
								<td width="5%" align="left" valign="top" bgcolor="#FFFFFF"></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">session id</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="30"><LABEL
									for="textfield20">全程唯一ID:</LABEL></td>
								<td align="RIGHT" valign="middle" bgcolor="#FFFFFF"><input
									type="text" name="unique_id" size="20" id="uniqueid"></td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">全程唯一ID</td>
							</tr>
							<tr valign="top">
								<td align="RIGHT" valign="top" align="RIGHT" bgcolor="#F0F0F0"
									height="31"><LABEL for="textfield16">主叫号码: <BR>
								</LABEL></td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
									type="text" name="calling_Number" size="20" id="callingNumber">
								</td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">*
									主叫号码,支持输入多个主叫号码,请使用逗号分割;为必填项,请至少输入一个主叫号码</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31"><LABEL
									for="textfield21">SPID: </LABEL></td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
									type="text" name="sp_id" size="20" id="spid"></td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">spid</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31"><LABEL
									for="textfield22">业务ID: </LABEL></td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
									type="text" name="service_id" size="20" id="serviceid">
								</td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">service id</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="31"><LABEL
									for="textfield22">被叫号码: </LABEL></td>
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
										<label for="allRadio"> <input type="radio" checked
											name="m_radios" id="m_radios" value="0" /> <span>精确匹配</span>
										</label><br /> <label for="regularRadio"> <input type="radio"
											name="m_radios" id="m_radios" value="1" /> <span>模糊匹配</span>
										</label>
									</fieldset>
								</td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF"></td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">查询开始时间(&gt;=):</td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
									<div class="controls input-append date form_datetime"
										data-date="" data-date-format="yyyy-mm-dd hh:ii:ss"
										data-link-field="start_time">
										<input size="16" type="text" value=""> <span
											class="add-on"><i class="icon-remove"></i></span> <span
											class="add-on"><i class="icon-th"></i></span>
									</div> <input type="hidden" id="start_time" value="" />
									<h5>例子:[2012-01-01 01:01:01]</h5>
								</td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">*
									呼叫开始时间,作为查询条件的开始时间</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">查询结束时间(&lt;=):</td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
									<div class="controls input-append date form_datetime"
										data-date="" data-date-format="yyyy-mm-dd hh:ii:ss"
										data-link-field="end_time">
										<input size="16" type="text" value=""> <span
											class="add-on"><i class="icon-remove"></i></span> <span
											class="add-on"><i class="icon-th"></i></span>
									</div> <input type="hidden" id="end_time" value="" />
									<h5>例子:[2012-01-01 01:01:01]</h5>
								</td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">*
									呼叫开始时间,作为查询条件的结束时间(尽量填写,有助于提高查询速度)</td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">
									按键:</td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
									type="text" name="press_key" size="20"></td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF"><h5>支持操作符:in,nin,all,in
										:包含任意一项;nin:不包含任意一项;all:包含全部项
										举例:in['1','2'],包含['1'，'2']的任意一个按键</h5></td>
							</tr>
							<tr valign="top">
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">
									按键数:</td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF"><input
									type="text" name="press_keynum" size="20"></td>
								<td></td>
								<td align="left" valign="top" bgcolor="#FFFFFF">支持操作符:&gt;,&lt;,&gt;=,&lt;=
									,"0" : without key pressed</td>
							</tr>
							<tr>
								<td valign="top" align="RIGHT" bgcolor="#F0F0F0" height="20">
									呼叫状态:</td>
								<td align="RIGHT" valign="top" bgcolor="#FFFFFF">
									<fieldset>
										<label for="allRadio"> <input type="radio" checked
											name="radios" id="radios" value="3" /> <span>全部</span>
										</label><br /> <label for="regularRadio"> <input type="radio"
											name="radios" id="radios" value="0" /> <span>呼叫成功</span>
										</label><br /> <label for="secondRegularRadio"> <input
											type="radio" name="radios" id="radios" value="1" /> <span>用户挂机</span>
										</label><br /> <label for="threeRegularRadio"> <input
											type="radio" name="radios" id="radios" value="2" /> <span>平台挂机</span>
										</label>
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

						<script type="text/javascript"
							src="/static/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
						<script type="text/javascript"
							src="/static/bootstrap/js/bootstrap.min.js"></script>
						<script type="text/javascript"
							src="/static/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
						<script type="text/javascript"
							src="/static/js/locales/bootstrap-datetimepicker.fr.js"
							charset="UTF-8"></script>
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
    var sessionid = document.memberform.session_id.value;
    var uniqueid = document.memberform.unique_id.value;
    var callingNumber = document.memberform.calling_Number.value;
    var spid = document.memberform.sp_id.value;
    var serviceid =  document.memberform.service_id.value ;
    var bj =  document.memberform.bj.value ;
    var presskey = document.memberform.press_key.value
    var presskeynumber = document.memberform.press_keynum.value
    var radios = document.getElementsByName("radios")
    var hjzt = ''
    var matchflag = ''
    
    if (callingNumber == ''){
	alert("\请输入待查询的主叫手机号码!!");
	return;
    }
    if (bj == ''){
	matchflag = ''
    }
    else if (m_radios[0].checked){
		matchflag = 0
    }
    else if (m_radios[1].checked){
		 matchflag = 1;
    }
    
    if (radios[0].checked){
		hjzt = ''
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
    memberform.action="/QueryFunc?sid=" + sessionid + "&_id=" + uniqueid + "&zj=" + callingNumber + "&btime="+starttime+"&etime="+endtime+"&spid="+spid+"&seid="+serviceid + "&press.press="+presskey + "&hjzt="+hjzt+"&bj="+bj + "&keynum="+presskeynumber + "&matchflag="+matchflag;
    if (starttime.length > 0){
	 memberform.submit();}
     else{
	 alert("\请选择正确的时间信息!!");
     }	     
}
//----------------------------------------
// End of validation script -->
</script>
						</body>
						</html>