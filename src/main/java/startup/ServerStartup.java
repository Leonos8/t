package startup;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class ServerStartup extends HttpServlet
{
	public void init() throws ServletException
    {
		System.out.println("----------");
		System.out.println("---------- Server Startup ----------");
		System.out.println("----------");
          
		Thread automaticBiddingThread=new Thread() //Checks for any new bids
    	{
        	  public void run()
        	  {
        		  while(true)
        		  {
        			  System.out.println("HI");
        		  }
        	  }
        };
        
        Thread expiredAuctionThread=new Thread() //Checks for any expiring auctions
    	{
        	  public void run()
        	  {
        		  while(true)
        		  {
        			  System.out.println("bye");
        		  }
        	  }
        };
        
        automaticBiddingThread.start();
        expiredAuctionThread.start();
    }
}
