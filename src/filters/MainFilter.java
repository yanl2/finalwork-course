package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;



/**
 * Servlet Filter implementation class MainFilter
 */
public class MainFilter implements Filter {
//	private UserService userService;
//	private RecordService recordService;
//	private AdServiceImpl adService;
    /**
     * Default constructor. 
     */
    public MainFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest req=(HttpServletRequest)request;
//		HttpServletResponse resp=(HttpServletResponse)response;
//		if(req.getRequestURI().endsWith("checklogin1")){
//			String phoneNum=req.getParameter("phoneNum");
//			String pwd=req.getParameter("pwd");
//			try {
//				String username=this.userService.check(phoneNum, pwd);
//				//System.out.println(username);
//				if(username==null) {
//					throw new Exception("电话号码或者密码错误");
//				}
//				req.getSession().setAttribute("userName", username);
//				resp.sendRedirect(req.getContextPath()+"/usermain");
//				return;
//			} catch (Exception e) {
//				req.getSession().setAttribute("errmsg", e.getMessage());
//				req.getRequestDispatcher("WEB-INF/jsp/userlogin.jsp").forward(request, response);
//				return;
//			}
//		}
//		String userName=(String)req.getSession().getAttribute("userName");
//		if(req.getRequestURI().endsWith("checkchangepwd")){
//			String pwd=req.getParameter("pwd");
//			String pwd1=req.getParameter("pwd1");
//			try {
//				if(!pwd.equals(pwd1)) {
//					throw new Exception("两次密码不同哦，请重新输入！");
//				}else {
//					this.userService.changePwd(userName, pwd);
//				}
//				
//				resp.sendRedirect(req.getContextPath()+"/user.html");
//				return;
//			} catch (Exception e) {
//				req.getSession().setAttribute("errmsg", e.getMessage());
//				req.getRequestDispatcher("WEB-INF/jsp/forget.jsp").forward(request, response);
//				return;
//			}
//		}
//		if(req.getRequestURI().endsWith("checklogout")){
//			req.getSession().invalidate();
//			resp.sendRedirect(req.getContextPath()+"/choose");
//			return;
//		}
//		if(req.getRequestURI().endsWith("checklogin")) {			
//			String adminId = req.getParameter("adminId");
//			String pwd = req.getParameter("pwd");
//			try {
//				
//				adService.checkAd(adminId, pwd);
//				req.getSession().setAttribute("adminId",adminId);
//				resp.sendRedirect(req.getContextPath()+"/enter");
//				return;
//			} catch (Exception e) {
//				req.getSession().setAttribute("errmsg", e.getMessage());
//				req.getRequestDispatcher("/WEB-INF/jsp/ad_login.jsp").forward(request, response);
//				return;
//			}
//		}
//		
//		String adminId = (String) req.getSession().getAttribute("adminId");
//		
//		if(req.getRequestURI().endsWith("/checklogout1")) {
//			req.getSession().invalidate();
//			resp.sendRedirect(req.getContextPath()+"/choose");
//			return;
//		}
		
		chain.doFilter(request, response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
//		userService=(UserService) applicationContext.getBean("userService");
//		recordService=(RecordService) applicationContext.getBean("recordService");
//		adService  = (AdServiceImpl) applicationContext.getBean("AdServiceImpl");
		//orderService=(OrderService) applicationContext.getBean("orderService");
	}

}
