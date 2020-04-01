package javabean;

public class BeanCourseTable {
	private String room;
	private String week;
	private String courseIds;
	
	public BeanCourseTable() {
		this.room = null;
		this.week = null;
		this.courseIds = null;
	}
	public BeanCourseTable (String room, String week, String courseIds) {
		// TODO Auto-generated constructor stub
		this.room = room;
		this.week = week;
		this.courseIds = courseIds;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getCourseIds() {
		return courseIds;
	}
	public void setCourseIds(String courseIds) {
		this.courseIds = courseIds;
	}
	
	

}
