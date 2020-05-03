package dao;

import java.util.ArrayList;
import java.util.List;

import javabean.BeanRoom;
import javabean.BeanSoftware;
import javabean.BeanUser;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public String checkPwd(BeanUser user) {
		BeanUser user2 = new BeanUser();
		user2 = userDao.checkName(user.getName());
		if(user2.getPwd() == null) {
			return "null";
		}else if(user.getPwd().equals(user2.getPwd())){
			return "success";
		}else {
			return "fail";
		}
	};
	
	
	@Override
	public void addUser(BeanUser user) {
		userDao.createUser(user);
	};

}
