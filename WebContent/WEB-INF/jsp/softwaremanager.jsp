<%@page import="javabean.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>软件管理</title>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
html,body{
width:100%;
margin:0;
padding:0;
}
.line{
	position:absolute;
	left:0;
	right:0;
	margin:auto;
	width:calc(80% - 40px);
	height:40px;
	line-height:40px;
	padding:10px 20px;
	display:flex;
	justify-content:space-between;
}
#name{
	border-radius:5px;
	border:1px solid #a1a1a1;
	text-indent:10px;
	width:400px;
	height:40px;
	line-height:40px;
	outline:none;
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
	background: white;
}
.btn4{
background:rgba(245, 108, 108, 1);
}
.btn4:hover{
background:rgba(245, 108, 108, 0.6);
}
.btn4:active{
background:rgba(245, 108, 108, 1);
}
.checkbox-group{
	width: 1220px;
	display: flex;
	flex-wrap: wrap;
}
.ch{
	width: 145px;
	height: 40px;
	border:1px solid #a1a1a1;
	border-style: dashed;
	border-radius: 5px;
	margin:2.5px;
	text-align:center;
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
	padding: 20px 0;
}
</style>
</head>
<body>
<div class="btn btn3" style="position:absolute;top:10px;left:120px;" onclick="funBack()">返 回</div>
<div class="btn" style="position:absolute;top:10px;left:0px;" onclick="funaddsoft()">新增软件</div>
<div class="line" style="margin-top:100px;">
	<div style="width: 100px;">已存在软件</div>
	<div class="checkbox-group">
	<% List<BeanSoftware> softwares = (List<BeanSoftware>) request.getAttribute("softwares"); 
		for(BeanSoftware s:softwares){%>
		<div class="ch"><%=s.getSoftware() %></div> 
		<%} %>
	</div>
</div>
<div class="dialog">
	<div class="d-body">
		<div class="d-head">新增软件</div>
		<div class="d-main">
			<div class="d-main-item">
				<div style="width: 100px;">软件名称</div>
				<input id="name"  placeholder="请输入软件名称" value="" />
			</div>
		</div>
		<div class="d-foot">
			<div class="btn btn1" onclick="funcheck()">确认</div>
			<div class="btn btn2" onclick="funcancel()">取消</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var dijizhou = getQueryVariable("dijizhou");
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
function funaddsoft(){
	$('.dialog')[0].style.display = "block";
}
function funBack(){
	window.location.href="/course/home";
}
function funcheck(){
	var result = {software:$('#name')[0].value};
	if(result.software == ''){
		return alert("您还没输入机房软件名称哦！")
	}
	$.ajax({
        url: '/course/addSoft',
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
function funcancel(){
	$('.dialog')[0].style.display = "none";
}
</script>
</body>
</html>