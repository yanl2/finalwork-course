package dao;

import java.util.List;

import javabean.BeanCourseTable;

public class CourseTableServiceImpl implements CourseTableService{
	private CourseTableDao courseTableDao;

	public CourseTableDao getCourseTableDao() {
		return courseTableDao;
	}
	public void setCourseTableDao(CourseTableDao courseTableDao) {
		this.courseTableDao = courseTableDao;
	}


	@Override
	public void addCourseTable(BeanCourseTable courseTable) {
		// TODO Auto-generated method stub
		courseTableDao.createCourse(courseTable);
	}

}
