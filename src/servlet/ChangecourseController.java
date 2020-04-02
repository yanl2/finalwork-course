package servlet;

import java.io.Console;
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
import dao.TestService;
import javabean.BeanCourse;
import javabean.BeanFirstdate;
import javabean.BeanRoom;
import javabean.BeanTest;

@Controller
public class ChangecourseController {
	private RoomService roomService;
	private FirstdateService firstdateService;
	private CourseService courseService;
	
	@RequestMapping("/gotochangecourse")
	
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
		request.getRequestDispatcher("/WEB-INF/jsp/changecourse.jsp").forward(request, response);
	}
    
//    @RequestMapping("/changeroom")
//    @ResponseBody
//    public JSONArray changeRoom(@RequestBody String room,HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
//		courseService=(CourseService) applicationContext.getBean("courseService");
//		List<BeanCourse> courses = new ArrayList<BeanCourse>();
//		if(room.length()>3) {
//			room = room.substring(0, 3);
//		}
//		courses = courseService.loadCourseList(room);
//		JSONArray jsonArray = new JSONArray();
//		for(BeanCourse c:courses) {
//			jsonArray.add(c.toJSON());
//		}
//		return jsonArray;
//	}
//    
    @RequestMapping(value="/updatecourse")
	@ResponseBody
	public String addRoom(@RequestBody List<BeanCourse> courses,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	courseService=(CourseService) applicationContext.getBean("courseService");
    	courseService.updataCourse(courses.get(0), courses.get(1));
		return "1";
	}
	
	
}
