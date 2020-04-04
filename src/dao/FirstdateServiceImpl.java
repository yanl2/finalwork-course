package dao;

import java.util.List;

import org.springframework.context.annotation.Bean;

import javabean.BeanCourseTable;
import javabean.BeanFirstdate;

public class FirstdateServiceImpl implements FirstdateService{
	private FirstdateDao firstdateDao;

	public FirstdateDao getFirstdateDao() {
		return firstdateDao;
	}

	public void setFirstdateDao(FirstdateDao firstdateDao) {
		this.firstdateDao = firstdateDao;
	}

	@Override
	public BeanFirstdate finddateByXueqi(String xueqi){
		// TODO Auto-generated method stub
		BeanFirstdate firstdate = new BeanFirstdate();
		firstdate = firstdateDao.finddateByXueqi(xueqi);
		return firstdate;
	}
	
	@Override
	public void changeFirstdate(BeanFirstdate firstdate) {
		firstdateDao.changeFirstdate(firstdate);
	}

}
