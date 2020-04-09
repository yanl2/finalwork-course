package servlet;

import java.io.Console;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.ast.Var;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.sun.org.apache.xpath.internal.operations.Bool;

import dao.CourseService;
import dao.FirstdateDao;
import dao.FirstdateService;
import dao.RoomService;
import dao.SoftwareService;
import javabean.BeanCourse;
import javabean.BeanFirstdate;
import javabean.BeanRoom;
import javabean.BeanSoftware;

@Controller
public class HomeController {
	private RoomService roomService;
	private FirstdateService firstdateService;
	private SoftwareService softwareService;
	@RequestMapping("/home")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		roomService=(RoomService)applicationContext.getBean("roomService");	
		firstdateService = (FirstdateService)applicationContext.getBean("firstdateService");
		softwareService = (SoftwareService)applicationContext.getBean("softwareService");
    	List<BeanRoom> list = roomService.loadRooms(getLocation());
    	request.setAttribute("list",list);
    	BeanFirstdate firstdate = new BeanFirstdate();
    	firstdate = firstdateService.finddateByXueqi("16-17(1)");
    	request.setAttribute("firstdate", firstdate);
    	List<BeanSoftware> softwares = new ArrayList<BeanSoftware>();
    	softwares = softwareService.loadAll();
    	request.setAttribute("softwares", softwares);
		request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
	}
	
	@RequestMapping("/homeshow")
	public void homeshow(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		roomService=(RoomService)applicationContext.getBean("roomService");	
		firstdateService = (FirstdateService)applicationContext.getBean("firstdateService");
		softwareService = (SoftwareService)applicationContext.getBean("softwareService");
    	List<BeanRoom> list = roomService.loadRooms(getLocation());
    	request.setAttribute("list",list);
    	BeanFirstdate firstdate = new BeanFirstdate();
    	firstdate = firstdateService.finddateByXueqi("16-17(1)");
    	request.setAttribute("firstdate", firstdate);
    	List<BeanSoftware> softwares = new ArrayList<BeanSoftware>();
    	softwares = softwareService.loadAll();
    	request.setAttribute("softwares", softwares);
		request.getRequestDispatcher("/WEB-INF/jsp/homeshow.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/addRoom")
	@ResponseBody
	public String addRoom(@RequestBody BeanRoom o,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	roomService=(RoomService) applicationContext.getBean("roomService");
		roomService.createRoom(o);
		return "1";
	}
	
	@RequestMapping(value="/deleteRoom")
	@ResponseBody
	public String deleteRoom(@RequestBody BeanRoom o,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	roomService=(RoomService) applicationContext.getBean("roomService");
    	String room = request.getParameter("room");
		String result = roomService.deleteRoom(room);
		return result;
	}
			
	@RequestMapping(value="/changeFirstdate")
	@ResponseBody
	public String addRoom(@RequestBody BeanFirstdate o,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
		firstdateService = (FirstdateService)applicationContext.getBean("firstdateService");
		firstdateService.changeFirstdate(o);
		return "1";
	}
	
	private String getLocation() {
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("HH:mm"); //创建时间转换对象：时 分
		boolean flag1 = false;
		boolean flag2 = false;
		boolean flag3 = false;
		boolean flag4 = false;
		boolean flag5 = false;
		String result = date.getDay()+",";
        try {  
            Date date1 = df.parse("08:00:00"); //转换为 date 类型 Debug：Thu Jan 01 11:11:11 CST 1970
            Date date2 = df.parse(date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()); // 		 Debug：Thu Jan 01 12:12:12 CST 1970 
            Date date3 = df.parse("09:35:00"); 
            Date date4 = df.parse("09:50:00");
            Date date5 = df.parse("12:15:00");
            Date date6 = df.parse("13:30:00");
            Date date7 = df.parse("15:05:00");
            Date date8 = df.parse("15:20:00");
            Date date9 = df.parse("16:55:00");
            Date date10 = df.parse("18:30:00");
            Date date11 = df.parse("20:55:00");
            flag1 = (date1.getTime() <= date2.getTime())&&(date2.getTime() <= date3.getTime());
            flag2 = (date4.getTime() <= date2.getTime())&&(date2.getTime() <= date5.getTime());
            flag3 = (date6.getTime() <= date2.getTime())&&(date2.getTime() <= date7.getTime());
            flag4 = (date8.getTime() <= date2.getTime())&&(date2.getTime() <= date9.getTime());
            flag5 = (date10.getTime() <= date2.getTime())&&(date2.getTime() <= date11.getTime());
            if(flag1 == true) {
            	result += "1";
            }else if(flag2 == true) {
            	result += "2";
            }else if(flag3 == true) {
            	result += "3";
            }else if(flag4 == true) {
            	result += "4";
            }else if(flag5 == true) {
            	result += "5";
            }else {
            	result = "";
            }
	   // System.out.println("flag = "+flag);  // flag = false
        } catch (ParseException e) {  
            // TODO Auto-generated catch block
            e.printStackTrace();  
        }
        return result;
	}
	
	@RequestMapping(value="/updateRoom")
	@ResponseBody
	public String updateRoom(@RequestBody BeanRoom room,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	roomService=(RoomService) applicationContext.getBean("roomService");
		roomService.updateRoom(room);
		return "1";
	}
}
