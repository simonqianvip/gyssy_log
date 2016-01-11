<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
  <title></title>  
  </head>
    <script src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" >
    var obj;
    var id;
    $(document).ready(function() {
        var playerdiv = $("#player").css("border","1px solid black").width("100px").css("position","absolute").css("z-index",100);
        playerdiv.hide();
        var as = $("a");
        as.mouseover(function(event) {
            var aNode = $(this);
            var parentNode = aNode.parent();

            id = parentNode.attr("id");
            var myEvent = event || window.event;
            playerdiv.css("left",myEvent.clientX + 10 + "px").css("top",myEvent.clientY + 10 + "px");
            updata();

            playerdiv.show();

        });
        as.mouseout(function() {
            playerdiv.hide();
        });
        
        getInfo();
        setInterval(getInfo, 1000);     
    });

    function getInfo() {
        $.get("/gyssy_log/client/GetPlayerInfo", function(data) {
            obj = eval(data); 
            //obj = data;
            var player1 = obj["0001"];
            var player2 = obj["0002"];

            var span1 = $("#0001").children("span");

            span1.html(player1.now);

            var span2 = $("#0002").children("span");
            span2.html(player2.now);
            updata();
            
            var para=document.createElement("h2");
            var node=document.createTextNode(player2.now);
            para.appendChild(node);

            var element=document.getElementById("demo");
            element.appendChild(para);
            
        });

    }

    function updata() {
        var player = obj[id];
        for (var property in player) {
            if (property != "name") {
                $("#"+property).children("span").html(player[property]);
            }
        }
    }

    </script>  
    
<body>  
   <div id="0001"><a href="#">xufei:</a><span></span></div>  
   <div id="0002"><a href="#">suiyangzi:</a><span></span></div>
   <div id="demo">
   <p>aaa</p>
   </div>  
  
   <div id="player">  
       <div id="yesterday">zuotian:<span></span></div>  
       <div id="now">jintian:<span></span></div>  
   </div> 
    
  	
</body>  
</html>  