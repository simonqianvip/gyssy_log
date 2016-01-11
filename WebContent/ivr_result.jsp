<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
</head>
<script src="js/jquery-1.8.3.js"></script>  
<script type="text/javascript" src="js/comet4j.js"></script>
<script type="text/javascript">
    var obj;
    var id;
    $(document).ready(function() {
        getInfo();
    	 init();  
    });

    function getInfo() {
    	var caller = '<%=request.getParameter("caller")%>';
    	var findPath = '<%=request.getParameter("findPath")%>';
    	var ip = '<%=request.getParameter("ip")%>';
        $.post("/gyssy_log/client/IvrResultServlet?caller="+caller+"&findPath="+findPath+"&ip="+ip, function(data) {
           /*  obj = data;
            alert("obj==="+obj)
            var para=document.createElement("h2");
            var node=document.createTextNode(obj);
            para.appendChild(node);

            var element=document.getElementById("demo");
            element.appendChild(para); */
        });
    }
    function init(){
		 // 建立连接，conn 即web.xml中 CometServlet的<url-pattern>
		 JS.Engine.start('conn');
		 JS.Engine.on('start',function(cId, channelList, engine){  
			     alert('连接已建立，连接ID为：' + cId);  
			 }); 
		/* 
		 JS.Engine.on('stop',function(cause, cId, url, engine){  
			     alert('连接已断开，连接ID为：' + cId + ',断开原因：' + cause + ',断开的连接地址：'+ url);  
			 }); */


		 // 监听后台某个频道
		 JS.Engine.on(
				{ 
					// 对应服务端 “频道1” 的值 result1
					result : function(data){
						alert("aa");
						alert(data);
						// var para=document.createElement("h2");
			            //var node=document.createTextNode(data);
			            //para.appendChild(node);

			            //var element=document.getElementById("demo");
			            //element.appendChild(para); 
				 	}
			 }
			);
	}

    </script>

<body >
	<h1 align="center">
		<font style="color: blue;">IVR日志查询结果页面</font>
	</h1>
	<h3 align="center">
		<font style="color: red">${requestScope.ivr_msg }</font>
	</h3>
	<div id="demo"></div>

</body>
</html>
