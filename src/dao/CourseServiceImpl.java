package dao;

import java.util.ArrayList;
import java.util.List;

import javabean.BeanCourse;

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
		BeanCourse course2 = new BeanCourse();
		course2 = courseDao.findCourseByLocation(course.getLocation(), course.getRoom());
		if(!(course2== null)) {
			String newloc = course2.getLocation()+"-1";
			System.out.print(newloc);
			courseDao.changeloc(course2.getLocation(), course2.getRoom(), newloc);
			course.setLocation(course.getLocation()+"-2");
		}
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
		System.out.println(newcourse.toJSON());
		BeanCourse course2 = new BeanCourse();
		course2 = courseDao.findCourseByLocation(newcourse.getLocation(), newcourse.getRoom());
		String location = newcourse.getLocation();
		if(!(course2 == null)) {
			newcourse.setLocation(location+"-1");
			courseDao.changeloc(course2.getLocation(), course2.getRoom(), newcourse.getLocation());
		}
		courseDao.changeCourse(newcourse, oldcourse);
		if(!(course2 == null)) {
			courseDao.changeloc(location, course2.getRoom(), location+"-2");
		}
		if(course2 == null&&oldcourse.getLocation().indexOf("-") != -1) {
			String newloc = oldcourse.getLocation().substring(0,oldcourse.getLocation().indexOf("-"));
			if(oldcourse.getLocation().indexOf("-1") != -1) {
				course2 = courseDao.findCourseByLocation(newloc+"-2", oldcourse.getRoom());
				courseDao.changeloc(course2.getLocation(), course2.getRoom(), newloc);
			}
			if(oldcourse.getLocation().indexOf("-2") != -1) {
				course2 = courseDao.findCourseByLocation(newloc+"-1", oldcourse.getRoom());
				courseDao.changeloc(course2.getLocation(), course2.getRoom(), newloc);
			}
		}
	}
	
	@Override
	public void deleteCourse(BeanCourse course) {
		courseDao.deleteCourseById(course.getRoom(), course.getLocation());
		if(course.getLocation().indexOf("-") != -1) {
			String newloc = course.getLocation().substring(0,course.getLocation().indexOf("-"));
			if(course.getLocation().indexOf("-1") != -1) {
				BeanCourse course2 = new BeanCourse();
				course2 = courseDao.findCourseByLocation(newloc+"-2", course.getRoom());
				courseDao.changeloc(course2.getLocation(), course2.getRoom(), newloc);
			}
			if(course.getLocation().indexOf("-2") != -1) {
				BeanCourse course2 = new BeanCourse();
				course2 = courseDao.findCourseByLocation(newloc+"-1", course.getRoom());
				courseDao.changeloc(course2.getLocation(), course2.getRoom(), newloc);
			}
		}
		
	}

}
