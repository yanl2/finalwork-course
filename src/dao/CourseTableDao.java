package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanCourse;
import javabean.BeanCourseTable;
import javabean.BeanTest;



public class CourseTableDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public void createCourse(BeanCourseTable ct) {
		String sql="insert into courseTable(room,week,courseIds) value(?,?,?)";
		this.jdbcTemplate.update(sql,ct.getRoom(),ct.getWeek(),ct.getCourseIds());
	}
	
	
	
	
}
