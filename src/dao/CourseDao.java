package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanCourse;



public class CourseDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public BeanCourse findCourseByLocation(String location,String room) {
		BeanCourse course = new BeanCourse();
        try {
        	String sql = "select * from course where (location = ? and room = ?)";
        	RowMapper<BeanCourse> rowMapper=new BeanPropertyRowMapper<BeanCourse>(BeanCourse.class);
            course = this.jdbcTemplate.queryForObject(sql,rowMapper,location,room);
            System.out.println(11);
            System.out.println(course);
        } catch (EmptyResultDataAccessException e) {
        	System.out.println(33);
            return null;
        }
        return course;	
	}
	
	public List<BeanCourse> findCourseByRoom(String room) {
		List<BeanCourse> object = new ArrayList<BeanCourse>();
        try {
        	String sql = "select * from course where room = ?";
        	RowMapper<BeanCourse> rowMapper=new BeanPropertyRowMapper<BeanCourse>(BeanCourse.class);
            object = this.jdbcTemplate.query(sql,rowMapper,room);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return object;	
	}
	
	public void createCourse(BeanCourse course) {
		String sql="insert into course(courseName,teacher,student,sectionName,weeks,location,room) value(?,?,?,?,?,?,?)";
		this.jdbcTemplate.update(sql,course.getCourseName(),course.getTeacher(),course.getStudent(),course.getSectionName(),course.getWeeks(),course.getLocation(),course.getRoom());
	}
	
	public void deleteCourse(String room) {
		String sql="delete from course where room = ?";
		this.jdbcTemplate.update(sql,room);
	}
	public void deleteCourseById(String room,String location) {
		String sql="delete from course where (room = ? and location = ?)";
		this.jdbcTemplate.update(sql,room,location);
	}
	
	public void changeCourse(BeanCourse course,BeanCourse oldcourse) {
		String sql="update course set room=?,sectionname=?,location=? where (room=? and location=?)";
		this.jdbcTemplate.update(sql,course.getRoom(),course.getSectionName(),course.getLocation(),oldcourse.getRoom(),oldcourse.getLocation());
	}
	
	public void changeloc(String oldloc,String room,String newloc) {
		String sql="update course set location=? where (room=? and location=?)";
		this.jdbcTemplate.update(sql,newloc,room,oldloc);
	}
	
	
	
	
}
