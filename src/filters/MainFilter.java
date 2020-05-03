package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.UserService;
import javabean.BeanUser;



/**
 * Servlet Filter implementation class MainFilter
 */
public class MainFilter implements Filter {
	private UserService userService;
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
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		String url = req.getRequestURI();
		if(req.getRequestURI().endsWith("checklogon")){
			String name=req.getParameter("name");
			String pwd=req.getParameter("pwd1");
			BeanUser user = new BeanUser();
			user.setPwd(pwd);
			user.setName(name);
			try {
				userService.addUser(user);
				resp.sendRedirect(req.getContextPath()+"/");
				return;
			} catch (Exception e) {
				// TODO: handle exception
				response.setContentType("text/html;charset=utf-8");
		        request.setCharacterEncoding("gb2312");
		    	PrintWriter out = response.getWriter();
		        out.flush();
		        out.println("<html style='width:100%;height:100%;padding:0;margin:0;'><body style='background-image: url(/course/img/background.jpg);background-repeat: repeat-y;background-size: 100% auto;width:100%;height:100%;padding:0;margin:0;'></body></html>");
    			out.println("<script>");
    		    out.println("setTimeout(function(){alert('此用户名已存在，请重新输入！');},100)");
    		    out.println("setTimeout(function(){history.back();},1000)");
    		    out.println("</script>");
    		    out.close();
    		    return;
			}
		}
		if(req.getRequestURI().endsWith("checklogin")){
			String name=req.getParameter("name");
			String pwd=req.getParameter("pwd");
			BeanUser user = new BeanUser();
			user.setPwd(pwd);
			user.setName(name);
			String info = userService.checkPwd(user);
			response.setContentType("text/html;charset=utf-8");
	        request.setCharacterEncoding("gb2312");
	    	PrintWriter out = response.getWriter();
	        if("null".equals(info)) {
		        out.flush();
	        	out.println("<html style='width:100%;height:100%;padding:0;margin:0;'><body style='background-image: url(/course/img/background.jpg);background-repeat: repeat-y;background-size: 100% auto;width:100%;height:100%;padding:0;margin:0;'></body></html>");
				out.println("<script>");
			    out.println("setTimeout(function(){alert('此用户名不存在，请重新输入！');},100)");
			    out.println("setTimeout(function(){history.back();},1000)");
			    out.println("</script>");
			    out.close();
			    return;
	        }else if("fail".equals(info)) {
		        out.flush();
	        	out.println("<html style='width:100%;height:100%;padding:0;margin:0;'><body style='background-image: url(/course/img/background.jpg);background-repeat: repeat-y;background-size: 100% auto;width:100%;height:100%;padding:0;margin:0;'></body></html>");
				out.println("<script>");
			    out.println("setTimeout(function(){alert('密码错误！');},100)");
			    out.println("setTimeout(function(){history.back();},1000)");
			    out.println("</script>");
			    out.close();
			    return;
	        }else {
				req.getSession().setAttribute("userName", name);
	        	resp.sendRedirect(req.getContextPath()+"/home");
	        	return;
	        }
		}
		if(req.getRequestURI().endsWith("homeshow")){
			req.getSession().invalidate();
		}
		String userName=(String)req.getSession().getAttribute("userName");
		if(!url.equals("/course/img/background.jpg")&&!url.equals("/course/img/add.png")&&!url.equals("/course/checklogon")&&!url.equals("/course/checklogin")&&!url.equals("/course/coursedetailshow")&&!url.equals("/course/logon")&&!url.equals("/course/login")&&!url.equals("/course/homeshow")&&!url.equals("/course/")&&userName==null) {
			req.getSession().invalidate();
			req.getRequestDispatcher("login.html").forward(request, response);
			return;
		}
		
		chain.doFilter(request, response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("application.xml");
		userService = (UserService)applicationContext.getBean("userService");
	}

}
