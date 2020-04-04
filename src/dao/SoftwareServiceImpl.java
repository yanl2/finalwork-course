package dao;

import java.util.ArrayList;
import java.util.List;

import javabean.BeanRoom;
import javabean.BeanSoftware;

public class SoftwareServiceImpl implements SoftwareService {
	private SoftwareDao softwareDao;
	private RoomDao roomDao;

	public SoftwareDao getSoftwareDao() {
		return softwareDao;
	}
	public void setSoftwareDao(SoftwareDao softwareDao) {
		this.softwareDao = softwareDao;
	}
	public RoomDao getRoomDao() {
		return roomDao;
	}
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}
	@Override
	public List<BeanSoftware> loadAll() {
		// TODO Auto-generated method stub
		List<BeanSoftware> softwares = new ArrayList<BeanSoftware>();
		softwares = softwareDao.loadAll();
		return softwares;
	}
	
	@Override
	public void addSoftware(BeanSoftware software) {
		softwareDao.createSoftware(software);
	}

}
