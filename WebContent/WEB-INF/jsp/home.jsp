<%@page import="javabean.BeanSoftware"%>
<%@page import="javabean.BeanCourse"%>
<%@page import="javabean.BeanFirstdate"%>
<%@page import="javabean.BeanRoom"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
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
				justify-content: space-between;
				background: white;
			}
			
			#date {
				line-height: 40px;
				padding-right: 20px;
			}
			
			.mainbody {
				height: calc(100% - 70px);
				width: calc(100% - 10px);
				padding: 5px;
				margin-top: 10px;
				background: white;
				display: flex;
				flex-wrap: wrap;
				align-content: flex-start;
			}
			
			.item {
				width: calc(12.35% - 20px);
				height: 220px;
				border: 1px solid #a1a1a1;
				border-style: dashed;
				margin: 10px;
				position: relative;
			}
			.item1 {
				width: calc(12.35% - 20px);
				height: 220px;
				border: 1px solid #a1a1a1;
				border-style: dashed;
				margin: 10px;
				position: relative;
				cursor:pointer;
			}
			
			.item:hover {
				color: #A1A1A1;
				background: #A1A1A1;
			}
			
			.itemxiang {
				cursor: pointer;
				display: none;
				width: 50px;
				height: 50px;
				line-height: 50px;
				border: 1px solid #A1A1A1;
				border-radius: 25px;
				background: white;
				text-align: center;
				position: absolute;
				top: 15px;
				left: 0;
				right: 0;
				margin: auto;
				font-size: 30px;
				z-index: 10;
			}
			
			.itemxiu{
				cursor: pointer;
				display: none;
				width: 50px;
				height: 50px;
				line-height: 50px;
				border: 1px solid #A1A1A1;
				border-radius: 25px;
				background: white;
				text-align: center;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				margin: auto;
				font-size: 30px;
				z-index: 10;
			}
			
			.itemshan {
				cursor: pointer;
				display: none;
				width: 50px;
				height: 50px;
				line-height: 50px;
				border: 1px solid #A1A1A1;
				border-radius: 25px;
				background: white;
				text-align: center;
				position: absolute;
				bottom: 15px;
				left: 0;
				right: 0;
				margin: auto;
				font-size: 30px;
				z-index: 10;
				color: red;
			}
			
			.item:hover .itemxiang {
				display: block;
			}
			
			.item:hover .itemxiu {
				display: block;
			}
			
			.item:hover .itemshan {
				display: block;
			}
			
			.item-body {
				width: 100%;
				height: 75%;
				border-bottom: 1px solid #A1A1A1;
				border-bottom-style: dashed;
				position: relative;
			}
			
			.item-body-class {
				border: 1px solid #A1A1A1;
				width: 50px;
				height: 50px;
				border-radius: 25px;
				line-height: 50px;
				text-align: center;
				position: absolute;
				top: 10px;
				right: 10px;
			}
			
			.item-body-content {
				position: absolute;
				bottom: 10px;
				left: 20px;
			}
			
			.item-foot {
				width: calc(100% - 20px);
				height: 25%;
				padding: 0 10px;
				white-space:normal; word-break:break-all;overflow:hidden;
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
			
			select{
				width: 200px;
				border: 1px solid #A1A1A1 !important;
				border-radius: 5px;
				outline: none !important;
				text-indent: 10px;
				margin: 0 10px;
			}
			
			.dialog{
				width: 100%;
				height: 100%;
				background: rgba(113,113,113,0.5);
				position: absolute;
				top: 0;
				left: 0;
				display: none;
				z-index:11;
			}
			.dialog .d-body{
				width: 45%;
				height: 60%;
				background: white;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				margin: auto;
				border-radius: 5px;
			}
			.dialog .d-head{
				height: 30px;
				line-height: 30px;
				width: calc(100% - 30px);
				padding: 15px;
				font-size: 25px;
			}
			.dialog .d-main{
				height: calc(100% - 130px);
				width: calc(100% - 80px);
				padding: 0 40px;
			}
			.dialog .d-foot{
				height: 40px;
				width: calc(100% - 30px);
				padding: 15px;
				display: flex;
				justify-content: flex-end;
			}
			.btn1{
				background: rgb(101, 194, 58);
			}
			.btn1:hover{
				background: rgb(101, 194, 58, 0.7);
			}
			.btn1:active{
				background: rgb(101, 194, 58);
			}
			.btn2{
				background: rgb(230, 162, 60);/*#e6a23c*/
			}
			.btn2:hover{
				background: rgba(230, 162, 60, 0.6);
			}
			.btn2:active{
				background: rgb(230, 162, 60);
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
			.d-main-item{
				width: 100%;
				height: 40px;
				line-height: 40px;
				display: flex;
				justify-content: space-between;
				align-items: center;
				padding: 20px 0;
			}
			.checkbox-group{
				width: 600px;
				display: flex;
				flex-wrap: wrap;
			}
			.checkbox-group div{
				width: 145px;
			}
			.img{
				width:50px;
				height:50px;
				background-image: url(./img/add.png);
				background-repeat: no-repeat;
				background-size: 100% 100%;
				position:absolute;
				top:0;
				bottom:0;
				left:0;
				right:0;
				margin:auto;
			}
</style>
</head>
<body>
		<div class="toolbar">
			<div style="display:flex">
				<div class="btn btn1" onclick="funChangeWeek()">修改当前周</div>
				<div class="btn btn1" onclick="gotosoftmanager()">软件管理</div>
				<div class="btn btn3" onclick="location.reload()">刷新</div>
				<select id="select" onchange="changefun()" style="display:none">
					<option value="0">第零周</option>
					<option value="1">第一周</option>
					<option value="2">第二周</option>
					<option value="3">第三周</option>
					<option value="4">第四周</option>
					<option value="5">第五周</option>
					<option value="6">第六周</option>
					<option value="7">第七周</option>
					<option value="8">第八周</option>
					<option value="9">第九周</option>
					<option value="10">第十周</option>
					<option value="11">第十一周</option>
					<option value="12">第十二周</option>
					<option value="13">第十三周</option>
					<option value="14">第十四周</option>
					<option value="15">第十五周</option>
					<option value="16">第十六周</option>
					<option value="17">第十七周</option>
					<option value="18">第十八周</option>
					<option value="19">第十九周</option>
					<option value="20">第二十周</option>
				</select>
			</div>
			<div style="display: flex;line-height: 40px;">
				<div class="btn btn3" onclick="window.location.href='homeshow'">进入前台</div>	
				<div id="date"></div>
				<div id="currentweek" style="margin-right: 15px;"></div>
			</div>
		</div>
		<div class="mainbody">
			<% 
				List<BeanRoom> list = (List<BeanRoom>)request.getAttribute("list"); 
				for(BeanRoom r:list){
			%>
			<div class="item">
				<div class="itemxiang" onclick="gotodetail(<%=r.getRoom() %>)">详</div>
				<div class="itemxiu" onclick='funchangesoft(<%=r.toJSON() %>)'>修</div>
				<div class="itemshan" onclick="fundelete(<%=r.getRoom() %>)">删</div>
				<div class="item-body">
					<div class="item-body-class"><%=r.getRoom() %></div>
					<div class="item-body-content">
					<% BeanCourse course = r.getCourse();if(course == null){ course = new BeanCourse("当前没有课程","","","","","",""); }%>
						<div><%=course.getCourseName() %></div>
						<div><%=course.getTeacher() %></div>
						<div style="height:22px;width:100%;overflow:hidden;"><%=course.getStudent() %></div>
					</div>
				</div>
				<div class="item-foot">
					<%=r.getSoftware() %>
				</div>
			</div>
			<%} %>
			<div class="item1" onclick="funAdd()">
				<div class="img"></div>
			</div>
		</div>
		<div class="dialog">
			<div class="d-body">
				<div class="d-head">新增机房</div>
				<div class="d-main">
					<div class="d-main-item">
						<div style="width: 100px;">机房名称</div>
						<input id="name" style="width: 600px;height: 30px;outline: none;border: 1px solid #A1A1A1;border-radius: 5px;text-indent: 10px;" placeholder="请输入机房名称" />
					</div>
					<div class="d-main-item">
						<div style="width: 100px;">机房软件</div>
						<div class="checkbox-group">
							<% List<BeanSoftware> softwares = (List<BeanSoftware>) request.getAttribute("softwares"); 
								for(BeanSoftware s:softwares){%>
							<div><input type="checkbox" /><%=s.getSoftware() %></div> 
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-foot">
					<div class="btn btn1" onclick="funcheck()">确认</div>
					<div class="btn btn2" onclick="funcancel()">取消</div>
				</div>
			</div>
		</div>
		<div class="dialog">
			<div class="d-body" style="width: 18%;height: 15%;">
				<div class="d-main" style="width: calc(100% - 30px);height:calc(100% - 90px);padding: 15px;margin: 0;">
					您现在的操作将会删除该机房，是否继续?
				</div>
				<div class="d-foot">
					<div class="btn btn1" style="width: 80px;height: 30px;line-height: 30px;" onclick="funcheck1()">确认</div>
					<div class="btn btn2" style="width: 80px;height: 30px;line-height: 30px;" onclick="funcancel1()">取消</div>
				</div>
			</div>
		</div>
		<div class="dialog">
			<div class="d-body">
				<div class="d-head">修改机房</div>
				<div class="d-main">
					<div class="d-main-item">
						<div style="width: 100px;">机房名称</div>
						<input id="name1" style="width: 600px;height: 30px;outline: none;border: 1px solid #A1A1A1;border-radius: 5px;text-indent: 10px;" placeholder="请输入机房名称" value="" readonly />
					</div>
					<div class="d-main-item">
						<div style="width: 100px;">机房软件</div>
						<div class="checkbox-group">
							<% for(BeanSoftware s:softwares){%>
							<div><input type="checkbox" /><%=s.getSoftware() %></div> 
							<%} %>
						</div>
					</div>
				</div>
				<div class="d-foot">
					<div class="btn btn1" onclick="funcheck2()">确认</div>
					<div class="btn btn2" onclick="funcancel2()">取消</div>
				</div>
			</div>
		</div>
<script>
setInterval(function(){
	location.reload()
},1000*60*10)
var week=['第零周','第一周','第二周','第三周','第四周','第五周','第六周','第七周','第八周','第九周','第十周','第十一周','第十二周','第十三周','第十四周','第十五周','第十六周','第十七周','第十八周','第十九周','第二十周']
var currrentRoom = "";
<%BeanFirstdate firstdate=(BeanFirstdate)request.getAttribute("firstdate"); %>
var firstdate = <%=firstdate.getFirstdate()%>
var dijizhou = getDijizhou();
initPage();
function initPage(){
	var select = document.getElementById("select");
	var i = 0;
	for(i ; i < select.options.length; i++) {
		if(select.options[i].value == dijizhou) {
			select.options[i].selected = true;
			document.getElementById("currentweek").innerText = week[dijizhou];
		}
	}
	if(i>select.options.length){
		select.options[0].selected = true;
		document.getElementById("currentweek").innerText = "第零周";
	}
	document.getElementById("select").style.display = "none";
	document.getElementById("date").innerText = getTime();
}
function getDijizhou(){
	var today = new Date().getTime();
	var result = parseInt((today-new Date(firstdate).getTime())/1000/3600/24/7)+1;
	return result;
}
function getTime() {
	var date = new Date();
	var week = date.getDay();
	week = week === 0 ? '星期日' : (week === 1 ? '星期一' : (week === 2 ? '星期二' : (week === 3 ? '星期三' : (week === 4 ? '星期四' : (week === 5 ? '星期五' : (week === 6 ? '星期六' : ''))))));
	return date.getFullYear() + "-" + add0(date.getMonth() + 1) + "-" + add0(date.getDate()) + "  " + week;
}

function add0(num) {
	return num < 10 ? ('0' + num) : num;
}

function changefun() {
	var date = new Date(firstdate).getTime()-(document.getElementById("select").value-dijizhou)*1000*3600*24*7;
	var result = {"xueqi":'',"firstdate":date.toString()}
	$.ajax({
        url: '/course/changeFirstdate',
        type: "post",
        data: JSON.stringify(result),
        dataType: "json",
        headers:{'Content-Type':'application/json;charset=utf8'},
        success:function(data){
        	location.reload();
        },
        fail:function(data){
        	console.log(data)
        }
    }); 
}
function funcheck(){
	var name = document.getElementById('name').value;
	var resultlist = [];
	var checkboxgroup = document.getElementsByClassName("checkbox-group")[0].children;
	for(var i=0;i<checkboxgroup.length;i++){
		if(checkboxgroup[i].children[0].checked === true){
			resultlist.push(checkboxgroup[i].innerText)
		}
	}
	var result = {"room":name,"software":resultlist.join(',')};
	if(result.room == ''){
		return alert("您还没输入机房名称哦！")
	}else if(result.software == ''){
		return alert("您还没选机房软件哦！")
	}
	$.ajax({
        url: '/course/addRoom',
        type: "post",
        data: JSON.stringify(result),
        dataType: "json",
        headers:{'Content-Type':'application/json;charset=utf8'},
        success:function(data){
        	location.reload();
        },
        fail:function(data){
        	console.log(data)
        }
        
    }); 
}
function funAdd(){
	document.getElementsByClassName("dialog")[0].style.display = 'block';
}
function funcancel(){
	document.getElementsByClassName("dialog")[0].style.display = 'none';
}
function fundelete(room){
	currentRoom = room;
	document.getElementsByClassName('dialog')[1].style.display = 'block';
}
function funcheck1(){
	var result = {"room":currentRoom,"software":""};
	$.ajax({
        url: '/course/deleteRoom?room='+currentRoom,
        type: "post",
        data: JSON.stringify(result),
        dataType: "json",
        headers:{'Content-Type':'application/json;charset=utf8'},
        success:function(data){
        	if(data === 'success'){
        		location.reload();
        	}else{
        		console.log('fail')
        	}
        	
        },
        error:function(data){
        	if(data.responseText === 'success'){
        		location.reload();
        	}else{
        		document.getElementsByClassName("dialog")[1].style.display = 'none';
        		alert('机房被占用了不能删除哦！')
        	}
        }
        
    }); 
}
function funcancel1(){
	document.getElementsByClassName("dialog")[1].style.display = 'none';
}
function gotodetail(id){
	var room = id;
	window.location.href="coursedetail?room="+encodeURI(room)+"&dijizhou="+dijizhou;
}
function funChangeWeek(){
	document.getElementById("select").style.display = "block";
}

function funchangesoft(r){
	document.getElementById("name1").value = r.room;
	var resultlist = r.software.split(',');
	var checkboxgroup = document.getElementsByClassName("checkbox-group")[1].children;
	for(var i=0;i<checkboxgroup.length;i++){
		checkboxgroup[i].children[0].checked = false;
	}
	for(var j=0;j<resultlist.length;j++){
		for(var i=0;i<checkboxgroup.length;i++){
			if(resultlist[j] === checkboxgroup[i].innerText){
				checkboxgroup[i].children[0].checked = true;
			}
		}
	}
	currentRoom = r;
	document.getElementsByClassName("dialog")[2].style.display = 'block';
}
function funcheck2(){
	var result = currentRoom;
	var resultlist = [];
	var checkboxgroup = document.getElementsByClassName("checkbox-group")[1].children;
	for(var i=0;i<checkboxgroup.length;i++){
		if(checkboxgroup[i].children[0].checked === true){
			resultlist.push(checkboxgroup[i].innerText)
		}
	}
	result.software = resultlist.join(',');
	if(result.software == ''){
		return alert("机房软件不能为空哦！")
	}
	$.ajax({
        url: '/course/updateRoom',
        type: "post",
        data: JSON.stringify(result),
        dataType: "json",
        headers:{'Content-Type':'application/json;charset=utf8'},
        success:function(data){
        	location.reload();
        },
        fail:function(data){
        	console.log(data)
        }
        
    }); 
}
function funcancel2(){
	document.getElementsByClassName("dialog")[2].style.display = 'none';
	
}
function gotosoftmanager(){
	window.location.href="softManager";
}
</script>
</body>
</html>