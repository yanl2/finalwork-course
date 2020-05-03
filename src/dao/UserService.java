package dao;

import javabean.BeanUser;

public interface UserService {
	public String checkPwd(BeanUser user);
	public void addUser(BeanUser user);
}
