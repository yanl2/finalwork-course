package dao;

import java.util.ArrayList;
import java.util.List;

import javabean.BeanCourse;
import javabean.BeanTest;

public class CourseServiceImpl implements CourseService {
	private CourseDao courseDao;

	public CourseDao getCourseDao() {
		return courseDao;
	}
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}


	@Override
	public void addCourse(BeanCourse course) {
		courseDao.createCourse(course);
	}
	@Override
	public List<BeanCourse> loadCourseList(String room) {
		// TODO Auto-generated method stub
		List<BeanCourse> courses = new ArrayList<BeanCourse>();
		courses = (List<BeanCourse>) courseDao.findCourseByRoom(room);
		return courses;
	}
	
	@Override
	public void deleteAllCourses(String room) {
		courseDao.deleteCourse(room);
	}
	
	@Override
	public void updataCourse(BeanCourse newcourse,BeanCourse oldcourse) {
		courseDao.changeCourse(newcourse, oldcourse);
	}

}
