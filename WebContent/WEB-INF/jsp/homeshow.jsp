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
				min-width:187px;
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
				top: 0;
				bottom:0;
				left: 0;
				right: 0;
				margin: auto;
				font-size: 30px;
				z-index: 10;
			}
			
			.item:hover .itemxiang {
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
				background:white;
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
				width: 35%;
				height: 30%;
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
			.d-main-item{
				width: 100%;
				height: 40px;
				line-height: 40px;
				display: flex;
				justify-content: space-between;
				align-items: center;
				padding: 10px 0;
			}
</style>
</head>
<body>
		<div class="toolbar">
			<div style="line-height: 40px;padding-left: 10px;">计算分院课表显示系统</div>
			<div style="display: flex;line-height: 40px;">
				<div class="btn btn3" onclick="gotohoutai()">进入后台</div>
				<div id="date"></div>
				<div id="currentweek" style="margin-right: 15px;"></div>
			</div>
		</div>
		<div class="mainbody">
			<% 
				List<BeanRoom> list = (List<BeanRoom>)request.getAttribute("list"); 
				for(BeanRoom r:list){
			%>
			<div class="item" onclick="gotodetail(<%=r.getRoom() %>)">
				<div class="itemxiang">详</div>
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
		</div>
		<div class="dialog">
			<div class="d-body">
				<div class="d-head">请先登录</div>
				<div class="d-main">
					<form action="checklogin" method="post" >
						<div class="d-main-item">
							<div style="width:100px">用户名</div>
							<input style="width: 600px;height: 30px;outline: none;border: 1px solid #A1A1A1;border-radius: 5px;text-indent: 10px;" id="name" name="name" placeholder="请输入用户名">
						</div>
						<div class="d-main-item">
							<div style="width:100px">密码</div>
							<input style="width: 600px;height: 30px;outline: none;border: 1px solid #A1A1A1;border-radius: 5px;text-indent: 10px;" id="pwd" name="pwd" placeholder="请输入密码">
						</div>
					</form>
				</div>
				<div class="d-foot">
					<div class="btn btn1" onclick="checklogin()">确认</div>
					<div class="btn btn2" onclick="funcancel()">取消</div>
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
	document.getElementById("currentweek").innerText = week[dijizhou];
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

function gotodetail(id){
	var room = id;
	window.location.href="coursedetailshow?room="+encodeURI(room)+"&dijizhou="+dijizhou;
}
function gotohoutai(){
	document.getElementsByClassName("dialog")[0].style.display = "block";
}
function checklogin(){
	var name=document.getElementById("name")
	var pwd=document.getElementById("pwd");
	if(""===name.value){
		alert("用户名为空");
		event.preventDefault();
	}else if(""===pwd.value){
		alert("密码为空");
		event.preventDefault();
	}else{
		document.forms[0].submit();
	}
}
function funcancel(){
	document.getElementsByClassName("dialog")[0].style.display = "none";
}

</script>
</body>
</html>