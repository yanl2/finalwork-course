package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import dao.CourseService;
import dao.FirstdateDao;
import dao.FirstdateService;
import dao.RoomService;
import javabean.BeanCourse;
import javabean.BeanFirstdate;
import javabean.BeanRoom;

@Controller
public class AddcourseController {
	private RoomService roomService;
	private FirstdateService firstdateService;
	private CourseService courseService;
	@RequestMapping("/addcourse")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		courseService=(CourseService) applicationContext.getBean("courseService");
		roomService=(RoomService) applicationContext.getBean("roomService");
		List<BeanRoom> rooms = new ArrayList<BeanRoom>();
		rooms = roomService.loadRooms();
		request.setAttribute("rooms", rooms);
		List<BeanCourse> courses = new ArrayList<BeanCourse>();
		for(BeanRoom r:rooms) {
			courses = courseService.loadCourseList(r.getRoom());
			break;
		}
		request.setAttribute("courses", courses);
		request.getRequestDispatcher("/WEB-INF/jsp/addcourse.jsp").forward(request, response);
	}
    
    @RequestMapping("/changeroom")
    @ResponseBody
    public JSONArray changeRoom(@RequestBody String room,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		courseService=(CourseService) applicationContext.getBean("courseService");
		List<BeanCourse> courses = new ArrayList<BeanCourse>();
		System.out.println(123);
		if(room.length()>3) {
			room = room.substring(0, 3);
		}
		System.out.print(room);
		courses = courseService.loadCourseList(room);
		JSONArray jsonArray = new JSONArray();
		for(BeanCourse c:courses) {
			jsonArray.add(c.toJSON());
		}
		System.out.print(jsonArray);
		return jsonArray;
	}
    
    @RequestMapping(value="/addonecourse")
	@ResponseBody
	public String addRoom(@RequestBody BeanCourse course,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	courseService=(CourseService) applicationContext.getBean("courseService");
    	courseService.addCourse(course);
		return "1";
	}
	
	
}
