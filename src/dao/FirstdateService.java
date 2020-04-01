package dao;

import javabean.BeanFirstdate;

public interface FirstdateService {
	public BeanFirstdate finddateByXueqi(String xueqi);
	public void changeFirstdate(BeanFirstdate firstdate);
}
