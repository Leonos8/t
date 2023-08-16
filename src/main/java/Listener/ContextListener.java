package Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener
{
	public void contextInitialized(ServletContextEvent e) 
	{
		final Runnable myRunnable = new Runnable() {
	        public void run() { System.out.println("hello world"); }
	    };

	    // Brett's code here
	    //....

	}

	public void contextDestroyed(ServletContextEvent e) 
	{

	}
}
