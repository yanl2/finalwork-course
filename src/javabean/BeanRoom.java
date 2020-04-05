package javabean;

import com.alibaba.fastjson.JSONObject;

public class BeanRoom {
	private String room;
	private String software;
	private BeanCourse course;
	
	public BeanRoom() {
		this.room = null;
		this.software = null;
		this.course = new BeanCourse();
	}
	public BeanRoom (String room, String software, BeanCourse course) {
		// TODO Auto-generated constructor stub
		this.room = room;
		this.software = software;
		this.course = course;
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
    	jObject.put("room", this.room);
    	jObject.put("software", this.software);
		return jObject;
		
	}
	

}
