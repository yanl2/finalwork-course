package javabean;

import com.alibaba.fastjson.JSONObject;

public class BeanRoom {
	private int id;
	private String room;
	private String software;
	private BeanCourse course;
	
	public BeanRoom() {
		this.id = 0;
		this.room = null;
		this.software = null;
		this.course = new BeanCourse();
	}
	public BeanRoom (Integer id, String room, String software, BeanCourse course) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.room = room;
		this.software = software;
		this.course = course;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getSoftware() {
		return software;
	}
	public void setSoftware(String software) {
		this.software = software;
	}
	public BeanCourse getCourse() {
		return course;
	}
	public void setCourse(BeanCourse course) {
		this.course = course;
	}
	
	public JSONObject toJSON() {
		JSONObject jObject=new JSONObject();
    	jObject.put("id", this.id);
    	jObject.put("room", this.room);
    	jObject.put("software", this.software);
		return jObject;
		
	}
	

}
