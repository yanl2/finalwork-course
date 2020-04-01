package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.mysql.fabric.xmlrpc.base.Array;

import javabean.BeanCourse;
import javabean.BeanRoom;

public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomDao roomDao;
	private CourseDao courseDao;

	public CourseDao getCourseDao() {
		return courseDao;
	}
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	public RoomDao getRoomDao() {
		return roomDao;
	}
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	@Override
	public void createRoom(BeanRoom room) {
		roomDao.createRoom(room);
	}
	@Override
	public List<BeanRoom> loadRooms(String location){
		// TODO Auto-generated method stub
		List<BeanRoom> rooms = new ArrayList<BeanRoom>();
		rooms = (List<BeanRoom>) roomDao.loadRooms();
		BeanCourse course = new BeanCourse();
		for(BeanRoom r:rooms) {
			course = courseDao.findCourseByLocation(location,r.getRoom());
			r.setCourse(course);
		}
		return rooms;
	}
	
	@Override
	public String deleteRoom(String room) {
		List<BeanCourse> courses = new ArrayList<BeanCourse>();
		System.out.print(courseDao);
		courses = courseDao.findCourseByRoom(room);
		if(courses.size() != 0) {
			return "fail";
		}
		roomDao.delete(room);
		return "success";
	}
	
	@Override
	public List<BeanRoom> loadRooms(){
		List<BeanRoom> rooms = new ArrayList<BeanRoom>();
		rooms = (List<BeanRoom>) roomDao.loadRooms();
		return rooms;
	}

}
