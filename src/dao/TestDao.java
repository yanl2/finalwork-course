package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanTest;



public class TestDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public List<BeanTest> findNew() {
		List<BeanTest> object = new ArrayList<>();
        try {
        	String sql ="select * from test";
            RowMapper<BeanTest> rowMapper=new BeanPropertyRowMapper<BeanTest>(BeanTest.class);
            object=this.jdbcTemplate.query(sql,rowMapper);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return object;
		
	}
	
	
	
	
}
