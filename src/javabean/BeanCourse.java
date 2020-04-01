package javabean;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public class BeanCourse {
	private String courseName;
	private String teacher;
	private String student;
	private String sectionName;
	private String weeks;
	private String location;
	private String room;
	
	public BeanCourse() {
		this.courseName = null;
		this.teacher = null;
		this.student = null;
		this.sectionName = null;
		this.weeks = null;
		this.location = null;
		this.room = null;
	}
	public BeanCourse (String courseName, String teacher, String student, 
			String sectionName, String weeks,String location,String room) {
		// TODO Auto-generated constructor stub
		this.courseName = courseName;
		this.teacher = teacher;
		this.student = student;
		this.sectionName = sectionName;
		this.weeks = weeks;
		this.location=location;
		this.room=room;
	}
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getStudent() {
		return student;
	}
	public void setStudent(String student) {
		this.student = student;
	}
	public String getSectionName() {
		return sectionName;
	}
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	public String getWeeks() {
		return weeks;
	}
	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public JSONObject toJSON() {
		JSONObject jObject=new JSONObject();
    	jObject.put("courseName", this.courseName);
    	jObject.put("teacher", this.teacher);
    	jObject.put("student", this.student);
    	jObject.put("sectionName", this.sectionName);
    	jObject.put("weeks", this.weeks);
    	jObject.put("location", this.location);
    	jObject.put("room", this.room);
		return jObject;
		
	}
}
