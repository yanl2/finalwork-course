package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanRoom;
import javabean.BeanSoftware;



public class SoftwareDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public List<BeanSoftware> loadAll() {
		List<BeanSoftware> object = new ArrayList<BeanSoftware>();
        try {
        	String sql ="select * from software";
            RowMapper<BeanSoftware> rowMapper=new BeanPropertyRowMapper<BeanSoftware>(BeanSoftware.class);
            object=this.jdbcTemplate.query(sql,rowMapper);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return object;
		
	}
	public void createSoftware(BeanSoftware software) {
		String sql="insert into software(software) value(?)";
		this.jdbcTemplate.update(sql,software.getSoftware());
	}
	
	
	
}
