package servlet;

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

import com.alibaba.fastjson.JSONArray;
import com.mysql.fabric.xmlrpc.base.Array;

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
public class SoftwareManagerController {
	private SoftwareService softwareService;
	@RequestMapping("/softManager")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		softwareService = (SoftwareService)applicationContext.getBean("softwareService");
    	List<BeanSoftware> softwares = new ArrayList<BeanSoftware>();
    	softwares = softwareService.loadAll();
    	request.setAttribute("softwares", softwares);
		request.getRequestDispatcher("/WEB-INF/jsp/softwaremanager.jsp").forward(request, response);
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
    @RequestMapping(value="/addSoft")
	@ResponseBody
	public String addRoom(@RequestBody BeanSoftware software,HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		response.setContentType("application/json");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("application.xml");
    	softwareService=(SoftwareService) applicationContext.getBean("softwareService");
    	softwareService.addSoftware(software);
		return "1";
	}
	
	
}
