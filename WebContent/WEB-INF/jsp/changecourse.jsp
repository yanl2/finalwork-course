<%@page import="javabean.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>调换课程</title>
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
.line-item{
	width:30%;
	display:flex;
}
input{
	border-radius:5px;
	border:1px solid #a1a1a1;
	text-indent:10px;
	width:calc(100% - 100px);
	outline:none;
}
.line-item-label{
	width:100px;
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
.zhoushu{
height:40px;
width:calc(80% - 10px);
padding:5px;
display:flex;
justify-content:space-between;
position:absolute;
top:200px;
left:180px;
border:1px solid black;
border-style:dashed;
display:none;
}
.zsitem{
width:40px;
height:40px;
line-height:40px;
text-align:center;
border:1px solid #a1a1a1;
cursor:pointer;
}
.zsitem:hover{
background:#409EFF;
color:white;
border:1px solid #409EFF;
}
.zsitem1{
width:40px;
height:40px;
line-height:40px;
text-align:center;
cursor:pointer;
background:black;
color:white;
border:1px solid black;
}
.zsitem1:hover{
background:white;
color:black;
}
.zstitle{
position:absolute;
top:170px;
left:180px;
display:none;
}
.jieci{
width:calc(80% - 10px);
padding:5px;
position:absolute;
top:200px;
left:180px;
border:1px solid black;
border-style:dashed;
display:none;
}
.jieciitem{
height:40px;
line-height:40px;
}
.jieciitem:hover{
background:#409EFF;
color:white;
}
.jifang{
width:calc(80% - 10px);
padding:5px;
position:absolute;
top:200px;
left:180px;
border:1px solid black;
border-style:dashed;
display:none;
}
select{
height:40px;
width:200px;
outline:none;
border:1px solid #a1a1a1;
border-radius:5px;
text-indent:10px;
}
tr {
	height: 100px;
}

td {
	width: 233px;
	line-height: 20px;
	text-align: center;
}
.btnqr{
position:absolute;
top:150px;
right:180px;
display:block;
}
</style>
</head>
<body>
<div class="btn btn3" style="position:absolute;top:10px;" onclick="funBack()">返 回</div>
<div class="line" style="margin-top:10px;">
	<div class="line-item">
		<div class="line-item-label">课程名称</div>
		<input id="resultcoursename" placeholder="请输入课程名称" readonly value=""\>
	</div>
	<div class="line-item">
		<div class="line-item-label">授课教师</div>
		<input id="resultteacher" placeholder="请输入授课教师" readonly value=""\>
	</div>
	<div class="line-item">
		<div class="line-item-label">上课学生</div>
		<input id="resultstudent" placeholder="请输入上课学生" readonly value="" \>
	</div>
</div>
<div class="line" style="margin-top:60px;">
	<div class="line-item">
		<div class="line-item-label">机房</div>
		<input id="resultjfold" placeholder="请选择机房" readonly value=""\>
	</div>
	<div class="line-item">
		<div class="line-item-label">节次</div>
		<input id="resultjcold" placeholder="请选择节次" readonly value=""\>
	</div>
	<div class="line-item">
		<div class="line-item-label">周数</div>
		<input id="resultzs" placeholder="请选择周数" readonly value=""\>
	</div>
</div>
<div class="line" style="margin-top:110px;">
	<div class="line-item">
		<div class="line-item-label">新机房</div>
		<input id="resultjf" style="cursor:pointer;" placeholder="请选择机房" readonly value="" onclick="funshowjf()"\>
	</div>
	<div class="line-item">
		<div class="line-item-label">新节次</div>
		<input id="resultjc" style="cursor:pointer;" placeholder="请选择节次" readonly value="" onclick="funshowjc()"\>
	</div>
	<div class="line-item"></div>
</div>
<div class="btn btn1 btnqr" onclick="funchangecourse()">确认调换</div>
<div class="zstitle"></div>
<div class="jieci">
	<div class="jieciitem" data-num="1" onclick="jcclick(event,1)">1,2节</div><div class="jieciitem" data-num="2" onclick="jcclick(event,2)">3节</div>
	<div class="jieciitem" data-num="2" onclick="jcclick(event,2)">3,4节</div><div class="jieciitem" data-num="2" onclick="jcclick(event,2)">3,4,5节</div>
	<div class="jieciitem" data-num="3" onclick="jcclick(event,3)">6,7节</div><div class="jieciitem" data-num="4" onclick="jcclick(event,4)">8节</div>
	<div class="jieciitem" data-num="4" onclick="jcclick(event,4)">8,9节</div><div class="jieciitem" data-num="5" onclick="jcclick(event,5)">10,11节</div>
	<div class="jieciitem" data-num="5" onclick="jcclick(event,5)">10,11,12节</div>
</div>
<div class="jifang">
	<% List<BeanRoom> rooms = (List<BeanRoom>)request.getAttribute("rooms"); %>
	<select onchange="funchangeroom()">
		<% for(BeanRoom r:rooms){ %>
		<option><%=r.getRoom() %></option>
		<%} %>
	</select>
 <table border="1" style="border-collapse: collapse;width: 100%;margin-top:5px;">
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

<script type="text/javascript">
var flag = 0,beginzs = 0,endzs = 0,num = 0,loc = "";
var jsonlist = [];
<% 
	List<BeanCourse> courselist =(List<BeanCourse>) request.getAttribute("courses"); 
	for(BeanCourse course:courselist) { 
%>
var course = <%=course.toJSON()%>;
jsonlist.push(course);
<%} %>
var dijizhou = getQueryVariable("dijizhou");
var room = getQueryVariable("room");
var courseforc =  getQueryVariable("course");
console.log(courseforc)
courseforc = JSON.parse(decodeURI(courseforc));
initPage();

function initPage(){
	$("#resultcoursename")[0].value = courseforc.courseName;
	$("#resultteacher")[0].value = courseforc.teacher;
	$("#resultstudent")[0].value = courseforc.student;
	var weeks = courseforc.weeks.split(",");
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
	$("#resultzs")[0].value = min + '-' + max + ext;
	$("#resultjfold")[0].value = courseforc.room;
	$("#resultjcold")[0].value = courseforc.sectionName;
	
}

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
function funshowjc(){
	document.getElementsByClassName("zstitle")[0].innerText = "节次选择";
	document.getElementsByClassName("zstitle")[0].style.display = "block";
	document.getElementsByClassName("jieci")[0].style.display = "block";
	var jcitem = $(".jieciitem");
	for(var i=0;i<jcitem.length;i++){
		if(jcitem[i].dataset['num'] == loc[0]){
			jcitem[i].style.display="block";
		}else{
			jcitem[i].style.display="none";
		}
	}
}
function jcclick(e,i){
	num = i;
	e.target.style.background = "#409EFF";
	e.target.style.color = "white";
	setTimeout(function(){
		document.getElementsByClassName("zstitle")[0].style.display = "none";
		document.getElementsByClassName("jieci")[0].style.display = "none";
		document.getElementById("resultjc").value = e.target.innerText;
		e.target.style.background = "white";
		e.target.style.color = "black";
	},500)
	
}
function funshowjf(){
	document.getElementsByClassName("zstitle")[0].innerText = "机房选择";
	document.getElementsByClassName("zstitle")[0].style.display = "block";
	document.getElementsByClassName("jifang")[0].style.display = "block";
	$(function(){
		$("td").hover(function(e){
			if(e.target.innerHTML === ""){
				e.target.style.background = "rgba(64, 158, 255, 0.4)";
			}
		},function(e){
			e.target.style.background = "white";
			
		})
		$("td").click(function(e){
			if(e.target.innerHTML === ""){
				loc = e.target.parentElement.rowIndex + ',' + e.target.cellIndex;
				if(loc[0] == 1){
					$("#resultjc").get(0).value = '1,2节';
				}else if(loc[0] == 3){
					$("#resultjc").get(0).value = '6,7节';
				}else{
					$("#resultjc").get(0).value = '';
				}
				e.target.style.background = "rgba(64, 158, 255, 1)";
				$("#resultjf").get(0).value = $("select")[0].value;
				setTimeout(function(){
					$(".zstitle")[0].style.display = "none";
					$(".jifang")[0].style.display = "none";			
				},500)
			}
		})
	})
	settabledata(jsonlist)
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
	}
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
        	funclear();
        	settabledata(JSON.parse(data));
        },
        fail:function(data){
        	console.log(data)
        }
    }); 
}
function funBack(){
	window.location.href="/course/coursedetail?room="+room+"&dijizhou="+dijizhou;
}
function funchangecourse(){
	var newcourse = {
			"courseName":"",
			"teacher":"",
			"student":"",
			"weeks":"",
			"sectionName":$("#resultjc")[0].value,
			"location":loc,
			"room":$("#resultjf")[0].value
		}
	var courselist=[];
	courselist.push(newcourse);
	courselist.push(courseforc);
	$.ajax({
        url: '/course/updatecourse',
        type: "post",
        data: JSON.stringify(courselist),
        dataType: "json",
        headers:{'Content-Type':'application/json;charset=utf8'},
        success:function(data){
        	window.location.href="coursedetail?room="+encodeURI($("#resultjf")[0].value)+"&dijizhou="+dijizhou;
        },
        fail:function(data){
        	console.log(data)
        }
    }); 
}
</script>
</body>
</html>