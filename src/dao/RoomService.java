package dao;

import java.util.List;
import javabean.BeanCourse;
import javabean.BeanRoom;

public interface RoomService {
	public void createRoom(BeanRoom room);
	public List<BeanRoom> loadRooms();
	public List<BeanRoom> loadRooms(String location);
	public String deleteRoom(String room);
	public void updateRoom(BeanRoom room);
}
