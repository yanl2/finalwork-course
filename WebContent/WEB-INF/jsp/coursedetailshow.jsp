<%@page import="java.util.List" import="javabean.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>课表详情</title>
        <script src="https://cdn.bootcss.com/xlsx/0.15.5/xlsx.full.min.js"></script>
        <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
        <style>
			tr {
				height: 130px;
			}
			
			td {
				width: 233px;
				line-height: 27px;
				text-align: center;
			}
			html{
				width:100%;
				height:100%;
				margin:0;
				padding:0;
			}
			body {
				padding: 5px;
				margin: 0;
				background: #E1E1E1;
				height: calc(100% - 10px);
				width: calc(100% - 10px);
				min-width:1696px;
			}
			
			.toolbar {
				height: 40px;
				width: calc(100% - 10px);
				display: flex;
				padding: 5px;
				background: white;
				justify-content: space-between;
			}
			.btn {
				height: 40px;
				line-height: 40px;
				margin: 0 10px;
				width: 100px;
				text-align: center;
				border-radius: 5px;
				background: #409EFF;
				color: white;
				cursor: pointer;
			}
			
			.btn:hover {
				background: #66b1ff;
			}
			
			.btn:active {
				background: #409EFF;
			}
			
			.btn3{
				background: white;
				color: black;
				border: 1px solid black;
			}
			.btn3:hover{
				background: white;
			}
			.btn3:active{
				background: white;
			}
			select{
				height:40px;
				width:200px;
				outline:none;
				border:1px solid #a1a1a1;
				border-radius:5px;
				text-indent:10px;
			}
			.mytr{
				display: flex;
				align-items: center;
				justify-content: flex-start;
			}
			.mythead .myth{
				width: 235px;
				height: 40px;
				line-height: 50px;
				text-align: center;
				font-weight: bolder;
			}
			.mythead .myth:first-of-type{
				width: 50px;
				text-align: center;
				border-left: 1px solid black;
			}
			.myth{
				width: 50px;
				height: 130px;
				border-right: 1px solid black;
				border-top: 1px solid black;
				border-bottom: 1px solid black;
				text-align: center;
				font-weight: bolder;
			}
			.mytbody .myth{
				border-top: 0px;
				border-left: 1px solid black;
				display: flex;
				justify-content: center;
				align-items: center;
			}
			.mytbody{
				line-height: 27px;
				text-align: center;
				font-size:16px;
			}
			.mytd{
				width: 235px;
				height: 130px;
				border-right: 1px solid black;
				border-bottom: 1px solid black;
				display: flex;
				align-items: center;
				justify-content: center;
			}
			.half{
				width: 50%;
				height: 100%;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				border-right: 1px solid black;
			}
			.all{
				width: 100%;
				height: 100%;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
			}
			.mytd .half:last-of-type{
				border-right: 0px;
			}
			.font{
				width: 100%;line-height:18px;height: 36px;white-space:normal; word-break:break-all;overflow:hidden;
			}
		</style>
    </head>
    <body>
    	<%-- <div class="toolbar">
    		<div style="display:flex;">
    			<% List<BeanRoom> rooms = (List<BeanRoom>)request.getAttribute("rooms"); %>
				<select id="select" onchange="funchangeroom()">
					<% for(BeanRoom r:rooms){ %>
					<option><%=r.getRoom() %></option>
					<%} %>
				</select>																					
				
    		</div>
    		
    	</div> --%>
        <div style="background: white;position:relative;">
        	<div class="btn btn3" onclick="funBack()" style="position:absolute;right:0;top:10px;">返回主页</div>
        	<div id="currentweek" style="margin-right: 15px;line-height:40px;position:absolute;top:10px;right:140px;"></div> 	
			<div id="roomid" style="width: 100%;height: 100px;line-height: 100px;text-align: center;font-size: 30px;">理4-201</div>
			<div class="mytable">
				<div class="mythead">
					<div class="mytr">
						<div class="myth">节次</div>
						<div class="myth">星期一</div>
						<div class="myth">星期二</div>
						<div class="myth">星期三</div>
						<div class="myth">星期四</div>
						<div class="myth">星期五</div>
						<div class="myth">星期六</div>
						<div class="myth">星期日</div>
					</div>
				</div>
				<div class="mytbody">
					<div class="mytr">
						<div class="myth">第<br />一<br />二<br />节</div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
					</div>
					<div class="mytr">
						<div class="myth">第<br />三<br />四<br />五<br />节</div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
					</div>
					<div class="mytr">
						<div class="myth">第<br />六<br />七<br />节</div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
					</div>
					<div class="mytr">
						<div class="myth">第<br />八<br />九<br />节</div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
					</div>
					<div class="mytr">
						<div class="myth">第<br />十<br />11<br />12<br />节</div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
						<div class="mytd"></div>
					</div>
				</div>		
			</div>
		</div>
        <script>
            var week=['第零周','第一周','第二周','第三周','第四周','第五周','第六周','第七周','第八周','第九周','第十周','第十一周','第十二周','第十三周','第十四周','第十五周','第十六周','第十七周','第十八周','第十九周','第二十周']
			var room = decodeURI(getQueryVariable('room'));
            var courseforc = {};
            document.getElementById("roomid").innerText = "理4-"+room;
            var jsonlist = [];
            <% 
				List<BeanCourse> courselist =(List<BeanCourse>) request.getAttribute("courses"); 
				for(BeanCourse course:courselist) { 
			%>
			var course = <%=course.toJSON()%>;
			jsonlist.push(course);
			<%} %>
			var dijizhou = <%=request.getAttribute("dijizhou") %>;
			document.getElementById("currentweek").innerText = week[dijizhou];
			settabledata(jsonlist);
			/* var select = document.getElementById("select");
			for(var i=0 ; i < select.options.length; i++) {
				if(select.options[i].value == room) {
					select.options[i].selected = true;
				}
			}  */
			
            function getQueryVariable(variable)
            {
                   var query = window.location.search.substring(1);
                   var vars = query.split("&");
                   for (var i=0;i<vars.length;i++) {
                           var pair = vars[i].split("=");
                           if(pair[0] == variable){return pair[1];}
                   }
                   return(false);
            }
            
            function settabledata(jsonlist){
            	var td = document.getElementsByClassName('mytd');
    			var td2 = []
    			for(var i = 0; i < 5; i++) {
    				var t = []
    				for(var j = 0; j < 7; j++) {
    					t.push(td[i * 7 + j]);
    				}
    				td2.push(t);
    			}
    			for(var i = 0; i < jsonlist.length; i++) {
    				var weeks = jsonlist[i].weeks.split(",");
    				var j = 1;
    				var min = weeks.length-1;
    				var max = 1;
    				var ext = "";
    				for(j; j < weeks.length; j++) {
    					if(weeks[j] == 1 && j > max) {
    						max = j;
    					}
    					if(weeks[j] == 1 && j < min) {
    						min = j;
    					}
    				}
    				for(j = min; j <= max; j++) {
    					if(weeks[j] != 1) {
    						ext = j % 2 === 0 ? '单' : '双';
    						break;
    					}
    				}
    				var loc = jsonlist[i].location.split(',');
    				var innerhtml = '';
    				if(loc[1].indexOf('-') != -1){
    					loc[1]=loc[1].substr(0,loc[1].indexOf('-'))
    				}
   					innerhtml = '<div class="content all" data-loc="'+ loc[0]+','+loc[1] +'"><div class="font">' +jsonlist[i].courseName+ '</div>'+
   					jsonlist[i].teacher +'<br />'+
					'<div class="font">'+jsonlist[i].student+'</div>'
					+ min + '-' + max + ext + '(' + jsonlist[i].sectionName + ')'+"</div>"
						
    				if(weeks[dijizhou] != 0) {
        				td2[loc[0] - 1][loc[1] - 1].innerHTML = innerhtml;
    				}
    			}
            }
            
            function funBack(){
            	window.location.href="homeshow";
            }
            
            function funclear(){
            	var td = $('.mytd');
            	for(var i=0;i<td.length;i++){
            		td[i].innerHTML = "";
            	}
            }
            
            function funchangeroom(){
            	var room = document.getElementsByTagName("select")[0].selectedOptions[0].innerText
            	$.ajax({
                    url: '/course/changeroom',
                    type: "post",
                    data: room,
                    dataType: "text",
                    success:function(data){
                    	document.getElementById("roomid").innerText = "理4-"+room;
                    	funclear();
                    	console.log(data)
                    	settabledata(JSON.parse(data));
                    },
                    fail:function(data){
                    	console.log(123)
                    	console.log(data)
                    }
                }); 
            }
        </script>
    </body>
</html> 