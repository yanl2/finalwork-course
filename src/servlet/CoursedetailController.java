package servlet;

import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import dao.CourseService;
import javabean.BeanCourse;
import javabean.BeanCourseTable;


@Controller
public class CoursedetailController {
	private CourseService courseService;
	@RequestMapping("/coursedetail")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
		courseService=(CourseService) applicationContext.getBean("courseService");
		String room = request.getParameter("room");
		request.setAttribute("dijizhou", request.getParameter("dijizhou"));
		List<BeanCourse> courses = new ArrayList<BeanCourse>();
		courses = courseService.loadCourseList(room);
		request.setAttribute("courses", courses);
		request.getRequestDispatcher("/WEB-INF/jsp/coursedetail.jsp").forward(request, response);
    }
	
	@RequestMapping(value="/coursetable")
	@ResponseBody
	public String showtable(@RequestBody List<BeanCourse> o,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	courseService=(CourseService) applicationContext.getBean("courseService");
		for(BeanCourse course:o) {
			courseService.addCourse(course);	
		}
//		String room = request.getParameter("room");
//		request.setAttribute("dijizhou", request.getParameter("dijizhou"));
//		List<BeanCourse> courses = new ArrayList<BeanCourse>();
//		courses = courseService.loadCourseList(room);
//		JSONArray jArray=new JSONArray();
//		for(BeanCourse course:courses) {
//			jArray.add(course.toJSON());
//		}
		return "1";
	}
	
	@RequestMapping("/deleteAllCourses")
    @ResponseBody
    public String changeRoom(@RequestBody String room,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		courseService=(CourseService) applicationContext.getBean("courseService");
		if(room.length()>3) {
			room = room.substring(0, 3);
		}
		courseService.deleteAllCourses(room);
		return "success";
	}
}
