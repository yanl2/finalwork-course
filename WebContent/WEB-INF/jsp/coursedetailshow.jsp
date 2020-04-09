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
				line-height: 27.5px;
				text-align: center;
			}
			html,
			body {
				padding: 5px;
				margin: 0;
				background: #E1E1E1;
				height: calc(100% - 10px);
				width: calc(100% - 10px);
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
		</style>
    </head>
    <body>
    	<div class="toolbar">
    		<div style="display:flex;">
    			<% List<BeanRoom> rooms = (List<BeanRoom>)request.getAttribute("rooms"); %>
				<select onchange="funchangeroom()">
					<% for(BeanRoom r:rooms){ %>
					<option><%=r.getRoom() %></option>
					<%} %>
				</select>																					
				<div class="btn btn3" onclick="funBack()">返回主页</div>
    		</div>
    		<div id="currentweek" style="margin-right: 15px;line-height:40px;"></div> 	
    	</div>
        <div style="background: white;margin-top:10px;">
			<div id="roomid" style="width: 100%;height: 50px;line-height: 50px;text-align: center;font-size: 30px;">理4-201</div>
			<table border="1" style="border-collapse: collapse;width: 100%;">
				<thead style="width: 100%;">
					<tr style="height: 40px;">
						<th style="width: 50px;">节次</th>
						<th>星期一</th>
						<th>星期二</th>
						<th>星期三</th>
						<th>星期四</th>
						<th>星期五</th>
						<th>星期六</th>
						<th>星期日</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>第<br />一<br />二<br />节</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>第<br />三<br />四<br />五<br />节</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>第<br />六<br />七<br />节</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>第<br />八<br />九<br />节</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>第<br />十<br />11<br />12<br />节</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
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
            	var td = document.getElementsByTagName('td');
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
    				var innerhtml = jsonlist[i].courseName + "<br>" + jsonlist[i].teacher + "<br>" + jsonlist[i].student + "<br>" + min + '-' + max + ext + '(' + jsonlist[i].sectionName + ')';
    				var loc = jsonlist[i].location.split(',');
    				td2[loc[0] - 1][loc[1] - 1].innerHTML = innerhtml;
    				if(weeks[dijizhou] == 0) {
    					td2[loc[0] - 1][loc[1] - 1].style.color = '#919191'
    				}
    			}
            }
            
            function funBack(){
            	window.location.href="homeshow";
            }
            
            function funclear(){
            	var td = $('td');
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
                    	settabledata(JSON.parse(data));
                    },
                    fail:function(data){
                    	console.log(data)
                    }
                }); 
            }
        </script>
    </body>
</html> 