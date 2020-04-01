package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanCourse;
import javabean.BeanFirstdate;



public class FirstdateDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public BeanFirstdate finddateByXueqi(String xueqi) {
		BeanFirstdate firstdate = new BeanFirstdate();
        try {
        	String sql = "select * from firstdate where xueqi = ?";
        	RowMapper<BeanFirstdate> rowMapper=new BeanPropertyRowMapper<BeanFirstdate>(BeanFirstdate.class);
            firstdate = this.jdbcTemplate.queryForObject(sql,rowMapper,xueqi);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return firstdate;	
	}
	
	public void changeFirstdate(BeanFirstdate firstdate) {
		String sql="UPDATE firstdate SET firstdate = ?";
		this.jdbcTemplate.update(sql,firstdate.getFirstdate());
	}
	
	
	
	
	
	
}
