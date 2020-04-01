package listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import util.Counter;



public class ContextListener implements ServletContextListener {
	 private ServletContext context = null;

	    public void contextInitialized(ServletContextEvent event) {
	    	  context = event.getServletContext();
	    	  ApplicationContext ctx=new ClassPathXmlApplicationContext("application.xml");
	    	  context.setAttribute("ctx", ctx);
	    	  Counter counter = new Counter();
	          context.setAttribute("hitCounter", counter);
	    }

	    public void contextDestroyed(ServletContextEvent event) {
	    	context = event.getServletContext();
	    	ApplicationContext ctx=new ClassPathXmlApplicationContext("application.xml");
	  	  	context.removeAttribute("ctx");
	  	  	context.removeAttribute("hitCounter");
	    }
}
