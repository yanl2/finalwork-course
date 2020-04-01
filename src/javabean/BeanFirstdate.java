package javabean;

public class BeanFirstdate {
	private String xueqi;
	private String firstdate;
	
	public String getXueqi() {
		return xueqi;
	}
	public void setXueqi(String xueqi) {
		this.xueqi = xueqi;
	}
	public String getFirstdate() {
		return firstdate;
	}
	public void setFirstdate(String firstdate) {
		this.firstdate = firstdate;
	}
	public BeanFirstdate() {
		this.firstdate = null;
		this.xueqi = null;
	}
	public BeanFirstdate (String xueqi,String firstdate) {
		// TODO Auto-generated constructor stub
		this.firstdate = firstdate;
		this.xueqi = xueqi;
	}
	
	
}
