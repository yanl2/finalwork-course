package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanCourse;
import javabean.BeanRoom;
import javabean.BeanSoftware;



public class RoomDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void createRoom(BeanRoom room) {
		String sql="insert into room(room,software) value(?,?)";
		this.jdbcTemplate.update(sql,room.getRoom(),room.getSoftware());
	}
	
	public List<BeanRoom> loadRooms(){
		List<BeanRoom> room = new ArrayList<BeanRoom>();
        try {
        	String sql = "select * from room";
        	RowMapper<BeanRoom> rowMapper=new BeanPropertyRowMapper<BeanRoom>(BeanRoom.class);
            room = this.jdbcTemplate.query(sql,rowMapper);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return room;	
	}
	
	public void delete(String room) {
		String sql="delete from room where room=?";
		this.jdbcTemplate.update(sql,room);
	}
	
	public void updateRoom(BeanRoom room) {
		String sql = "update room set software = ? where room = ?";
		this.jdbcTemplate.update(sql,room.getSoftware(),room.getRoom());
	}
	
	
}
