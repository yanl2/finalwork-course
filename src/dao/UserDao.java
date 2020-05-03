package dao;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanUser;



public class UserDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public BeanUser checkName(String name) {
		BeanUser user = new BeanUser();
		try {
			String sql ="select * from user where name = ?";
            RowMapper<BeanUser > rowMapper=new BeanPropertyRowMapper<BeanUser>(BeanUser.class);
            user = this.jdbcTemplate.queryForObject(sql, rowMapper, name);
		} catch (EmptyResultDataAccessException e) {
			// TODO: handle exception
			return user;
		}
		return user;
	}
	public void createUser(BeanUser user) {
		String sql="insert into user(name,pwd) value(?,?)";
		this.jdbcTemplate.update(sql,user.getName(),user.getPwd());
	}
	
	
	
}
