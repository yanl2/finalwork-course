package dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javabean.BeanCourse;
import javabean.BeanRoom;



public class RoomDao {
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void createRoom(BeanRoom room) {
		BeanRoom room2=new BeanRoom();
    	String sql = "select max(id) from room";
    	RowMapper<BeanRoom> rowMapper=new BeanPropertyRowMapper<BeanRoom>(BeanRoom.class);
        room2 = this.jdbcTemplate.queryForObject(sql,rowMapper);
		sql="insert into room(id,room,software) value(?,?,?)";
		this.jdbcTemplate.update(sql,room2.getId(),room.getRoom(),room.getSoftware());
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
	
	
	
	
}
