package dao;

import java.util.List;
import javabean.BeanCourse;
import javabean.BeanTest;

public interface CourseService {
	public void addCourse(BeanCourse courses);
	public List<BeanCourse> loadCourseList(String room);
	public void deleteAllCourses(String room);
}
