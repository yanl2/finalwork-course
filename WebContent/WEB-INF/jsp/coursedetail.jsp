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
			td:hover{
				background:rgba(101, 194, 58, 0.4);
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
				background: rgb(245, 108, 108, 1)/* #F56C6C */
			}
			.btn4:hover{
				background: rgb(245, 108, 108, 0.6)/* #F56C6C */
			}
			.btn4:active{
				background: rgb(245, 108, 108, 1)/* #F56C6C */
			}
			.red{
				background:red;
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
			.content{
			cursor:pointer;
			}
			.content:hover{
				background:rgba(101, 194, 58, 0.4);
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
    	<div class="toolbar">
    		<div style="display:flex;">
				<div class="btn" onclick="gotoaddcourse()">添加课程</div>
	    		<div class="btn" onclick="funImport()">导入课程</div>
				<input id="import" style="height:40px;display:none;" type="file"onchange="importf(this)" />  
	    		<div class="btn btn1" onclick="gotochangecourse()">调换课程</div>
				<div class="btn btn4" onclick="funallclear()">清空课表</div>
				<div class="btn btn4" onclick="funclear()">删除课程</div>
				<div class="btn btn3" onclick="funBack()">返回主页</div>
    		</div>
    		<div id="currentweek" style="margin-right: 15px;line-height:40px;"></div> 	
    	</div>
        <div style="background: white;margin-top:10px;">
			<div id="roomid" style="width: 100%;height: 50px;line-height: 50px;text-align: center;font-size: 30px;">理4-201</div>
			<!-- <table border="1" style="border-collapse: collapse;width: 100%;">
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
			</table> -->
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
            /*
            FileReader共有4种读取方法：
            1.readAsArrayBuffer(file)：将文件读取为ArrayBuffer。
            2.readAsBinaryString(file)：将文件读取为二进制字符串
            3.readAsDataURL(file)：将文件读取为Data URL
            4.readAsText(file, [encoding])：将文件读取为文本，encoding缺省值为'UTF-8'
                         */
            var week=['第零周','第一周','第二周','第三周','第四周','第五周','第六周','第七周','第八周','第九周','第十周','第十一周','第十二周','第十三周','第十四周','第十五周','第十六周','第十七周','第十八周','第十九周','第二十周']
            var wb;//读取完成的数据
            var rABS = false; //是否将文件读取为二进制字符串
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
			
			$(function(){
				$(".content").click(function(e){
					if(e.target.innerHTML != ""){
						$(this).css('background-color','rgba(101, 194, 58)');
						$('.content').not(this).css('background-color','');
						var loc = e.currentTarget.dataset.loc;
						for(var i=0;i<jsonlist.length;i++){
							if(jsonlist[i].location === loc){
								courseforc = jsonlist[i];
								break;
							}
						}
					}
				})
			})
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
            
            function funallclear(){
            	$.ajax({
                    url: '/course/deleteAllCourses',
                    type: "post",
                    data: room,
                    dataType: "text",
                    success:function(data){
                    	location.reload();
                    },
                    error:function(data){
                    	location.reload();
                    }
                    
                }); 
            }
            function funclear(){
            	if("courseName" in courseforc){
            		$.ajax({
                        url: '/course/deleteCourse',
                        type: "post",
                        data: JSON.stringify(courseforc),
                        dataType: "json",
                        headers:{'Content-Type':'application/json;charset=utf8'},
                        success:function(data){
                        	location.reload();
                        },
                        error:function(data){
                        	location.reload();
                        }
                        
                    });
            	}else{
            		alert("您还没选择要删除的课程哦!");
            	} 
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
    					innerhtml = '<div class="content half" data-loc="'+ loc[0]+','+loc[1] +'"><div class="font">' +jsonlist[i].courseName+ '</div>'+
    					jsonlist[i].teacher +'<br />'+
						'<div class="font">'+jsonlist[i].student+'</div>'
						+ min + '-' + max + ext + '(' + jsonlist[i].sectionName + ')'+"</div>"
    					loc[1]=loc[1].substr(0,loc[1].indexOf('-'))
    						//"<div style='font-size:8px;'>"+ + "<br>" +  + "<br><div style='width:100%;overflow-x:hidden;height: 27px;'>" +  + "</div>" + min + '-' + max + ext + '(' + jsonlist[i].sectionName + ')'+"</div>";
    				}else{
    					innerhtml = '<div class="content all" data-loc="'+ loc[0]+','+loc[1] +'"><div class="font">' +jsonlist[i].courseName+ '</div>'+
    					jsonlist[i].teacher +'<br />'+
						'<div class="font">'+jsonlist[i].student+'</div>'
						+ min + '-' + max + ext + '(' + jsonlist[i].sectionName + ')'+"</div>"
    				}
    				td2[loc[0] - 1][loc[1] - 1].innerHTML += innerhtml;
    				/* if(weeks[dijizhou] == 0) {
    					td2[loc[0] - 1][loc[1] - 1].style.color = '#919191'
    				} */
    			}
            }
            
            function importf(obj) {//导入
                if(!obj.files) {
                    return;
                }
                var f = obj.files[0];
                var reader = new FileReader();
                reader.onload = function(e) {
                    var data = e.target.result;
                    if(rABS) {
                        wb = XLSX.read(btoa(fixdata(data)), {//手动转化
                            type: 'base64'
                        });
                    } else {
                        wb = XLSX.read(data, {
                            type: 'binary'
                        });
                    }
                    //wb.SheetNames[0]是获取Sheets中第一个Sheet的名字
                    //wb.Sheets[Sheet名]获取第一个Sheet的数据
                    //document.getElementById("demo").innerHTML= JSON.stringify( XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]) );
                    //console.log(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]) )
                    var result = analysis(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]]))
                    //console.log(result)
                     $.ajax({
			            url: '/course/coursetable',
			            type: "post",
			            data: JSON.stringify(result),
			            dataType: "json",
			            headers:{'Content-Type':'application/json;charset=utf8'},
			            success:function(data){
			            	console.log(data)
			            	//settabledata(data);
			            	location.reload();
			            },
			            fail:function(data){
			            	console.log(data)
			            }
			            
			        }); 
                    //window.location.href="coursetable?table="+encodeURI(JSON.stringify(XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]])));
                };
                if(rABS) {
                    reader.readAsArrayBuffer(f);
                } else {
                    reader.readAsBinaryString(f);
                }
            }

            function fixdata(data) { //文件流转BinaryString
                var o = "",
                    l = 0,
                    w = 10240;
                for(; l < data.byteLength / w; ++l) o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w, l * w + w)));
                o += String.fromCharCode.apply(null, new Uint8Array(data.slice(l * w)));
                return o;
            }
            
            function analysis(list){
            	console.log(list)
            	var courselist = [];
            	var course = {};
            	for(var i=2;i<list.length;i++){
            		if('__EMPTY_1' in list[i]){
            			course = chooseData(list[i].__EMPTY_1,[i-1,1]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_2' in list[i]){
            			course = chooseData(list[i].__EMPTY_2,[i-1,2]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_3' in list[i]){
            			course = chooseData(list[i].__EMPTY_3,[i-1,3]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_4' in list[i]){
            			course = chooseData(list[i].__EMPTY_4,[i-1,4]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_5' in list[i]){
            			course = chooseData(list[i].__EMPTY_5,[i-1,5]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_6' in list[i]){
            			course = chooseData(list[i].__EMPTY_6,[i-1,6]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            		if('__EMPTY_7' in list[i]){
            			course = chooseData(list[i].__EMPTY_7,[i-1,7]);
            			if(course === '') continue;
            			courselist.push(course)
            		}
            	}
            	return courselist;
            }
            
            function chooseData(str,loc){
            	if(str.indexOf('◇') == -1){
            		return '';
            	}
            	str = str.replace(/\s+/g,"");
            	var course = {};
            	var result = str.split('◇');
            	/* console.log(result[0].match(/\((.+?)\)/g)) */
            	var xuefen = result[0].match(/\((.+?)\)/g);
            	result[0] = xuefen != null ? result[0].replace(xuefen[0],''):result[0];
            	course.courseName = result[0];
            	course.teacher = result[3];
            	course.student = result[2];
            	course.sectionName = result[1].match(/\((.+?)\)/g)[0].slice(1,-1);
            	var weeks = result[1].match(/.{0,}\(/)[0].slice(0,-1);
            	var weeklist = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            	if(weeks.slice(-1) === '单' || weeks.slice(-1) === '双'){
            		weeks = weeks.slice(0,-1);
            		var weekl = weeks.split('-');
            		for(var i = parseInt(weekl[0]);i<=parseInt(weekl[1]);i=i+2){
	            		weeklist[i]=1;
	            	}
            	}else{
            		for(var i = parseInt(weeks.split('-')[0]);i<=parseInt(weeks.split('-')[1]);i++){
            			weeklist[i]=1;
            		}
            	}
            	course.weeks = weeklist.join(',');
            	course.location = loc.join(",");
            	course.room = room;
            	return course;
            }
            function funImport(){
            	document.getElementById("import").style.display = "block"
            }
            function funBack(){
            	window.location.href="/course/home";
            }
            function gotochangecourse(){
            	if("courseName" in courseforc){
            		window.location.href="/course/gotochangecourse?course="+encodeURI(JSON.stringify(courseforc))+"&dijizhou="+dijizhou+"&room="+room;
            	}else{
            		alert("您还没选择要调换的课程哦!");
            	}
            }

            function gotoaddcourse(){
            	window.location.href="addcourse?dijizhou="+dijizhou+"&room="+room;
            }
        </script>
    </body>
</html> 