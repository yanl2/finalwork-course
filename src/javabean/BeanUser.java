package javabean;

public class BeanUser {
	private String name;
	private String pwd;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public BeanUser() {
		// TODO Auto-generated constructor stub
		this.name=null;
		this.pwd=null;
	}
	public BeanUser (String name,String pwd) {
		// TODO Auto-generated constructor stub
		this.name = name;
		this.pwd = pwd;
	}
	
	
}
