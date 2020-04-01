package dao;

import java.util.List;
import javabean.BeanCourse;
import javabean.BeanRoom;
import javabean.BeanTest;

public interface RoomService {
	public void createRoom(BeanRoom room);
	public List<BeanRoom> loadRooms();
	public List<BeanRoom> loadRooms(String location);
	public String deleteRoom(String room);
}
