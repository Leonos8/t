package startup;

import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import userHandler.UserHandler;

public class ServerStartup extends HttpServlet
{
	UserHandler uh=new UserHandler();
	
	public void init() throws ServletException
    {
		System.out.println("----------");
		System.out.println("---------- Server Startup ----------");
		System.out.println("----------");
        
        Thread auctionRuntimeThread=new Thread() //Checks for any expiring auctions
    	{
        	  public void run()
        	  {
        		  while(true)
        		  {
        			  Calendar calendar=Calendar.getInstance();
        			  
        			  int minute=calendar.get(Calendar.MINUTE);

        			  if(calendar.get(Calendar.MINUTE)!=minute)
        			  {
        				  uh.closePastAuctions();
        				  
        				  minute=calendar.get(Calendar.MINUTE);
        			  }
        			  
        			  try 
        			  {
        				  this.sleep(1000);
        			  } catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
        		  }
        	  }
        };
        
        auctionRuntimeThread.start();
    }
}
