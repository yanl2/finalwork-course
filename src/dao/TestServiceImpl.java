package dao;

import java.util.List;

import javabean.BeanTest;

public class TestServiceImpl implements TestService {
	private TestDao testDao;

	public TestDao getTestDao() {
		return testDao;
	}
	public void setTestDao(TestDao testDao) {
		this.testDao = testDao;
	}


	@Override
	public List<BeanTest> findNew() {
		// TODO Auto-generated method stub
		return testDao.findNew();
	}

}
