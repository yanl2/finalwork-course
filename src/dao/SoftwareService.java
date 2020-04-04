package dao;

import java.util.List;

import javabean.BeanSoftware;

public interface SoftwareService {
	public List<BeanSoftware> loadAll();
	public void addSoftware(BeanSoftware software);
}
