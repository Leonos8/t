package userHandler;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

import databaseDriver.DBSQL;

public class UserHandler
{
	String adminTable="Administrator";
	String answerTable="Answers";
	String auctionTable="Auction";
	String bidTable="Bid";
	String crTable="custRep";
	String euTable="endUsers";
	String itemTable="Item";
	String qTable="Questions";
	
	public static void main(String[] args)
	{
		UserHandler uh=new UserHandler();
		
		uh.closePastAuctions();
	}
	
	public ArrayList<Object[]> closePastAuctions()
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String query="SELECT * FROM "+auctionTable+" WHERE isActive=true";
		
		ArrayList<Object[]> auctions=sql.select(query);
		ArrayList<Object[]> expiredAuctions=new ArrayList<>();
		
		for(int i=0; i<auctions.size(); i++)
		{
			String date=String.valueOf(auctions.get(i)[3]).split("T")[0];
			String time=String.valueOf(auctions.get(i)[3]).split("T")[1];

			if(hasDatePassed(date, time))
			{
				expiredAuctions.add(auctions.get(i));
			}
		}
		System.out.println("1");
		ArrayList<Object[]> auctionWinners=new ArrayList<Object[]>();
		for(int i=0; i<expiredAuctions.size(); i++)
		{
			Object[] highest=getHighestBid((int)expiredAuctions.get(i)[0]);
			if((double)highest[2]>=(double)expiredAuctions.get(i)[7])
			{
				auctionWinners.add(getHighestBid((int)expiredAuctions.get(i)[0]));
				System.out.println(getHighestBid((int)expiredAuctions.get(i)[0]));
			}
		}
		
		System.out.println("2");

		for(int i=0; i<auctionWinners.size(); i++)
		{
			String winningQuery="";
			
			if(auctionWinners.get(i)==null)
			{
				winningQuery="UPDATE "+auctionTable+" SET isActive=false "
						+ "WHERE auctID="+expiredAuctions.get(i)[0];
			}
			else
			{
				winningQuery="UPDATE "+auctionTable+" SET isActive=false, winningUser='"
						+auctionWinners.get(i)[4]+"', winningBidID="
						+auctionWinners.get(i)[1]+", winningBid="
						+auctionWinners.get(i)[2]+" WHERE auctID="+auctionWinners.get(i)[0];
				System.out.println(winningQuery);
			}
			
			sql.updateTable(winningQuery);
		}
		
		//ALERT
		if(auctionWinners.size()>0)
		{
			for(int i=0; i<auctionWinners.size(); i++)
			{
				String winningUser=(String)auctionWinners.get(i)[4];
				String message="Congratulations on winning Auction "+auctionWinners.get(i)[0];
				
				notifyUser(winningUser, message);
			}
		}
		
		return expiredAuctions;
	}
	
	public String convertToDateTime(String date, String time)
	{
		String datetime=date+" "+time;
		
		if(!time.contains(":"))
		{
			datetime+=":00:00";
		}
		if(time.split(":").length==2)
		{
			datetime+=":00";
		}
		
		return datetime;
	}
	
	public int createAccount(String uname, String pword, 
			String email, String phone)
	{
		System.out.println("UNAME="+uname);
		System.out.println("PWORD="+pword);
		System.out.println("e="+email);
		System.out.println("ph="+phone);
		
		int valid=-1;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username='"+uname+"';";
				
		System.out.println("Q="+query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		String tmpQuery="SELECT * FROM endUsers "
				+"WHERE username='"+email+"';";
		ArrayList<Object[]> tmpData=sql.select(query);
		
		if(data.size()!=0)
		{
			System.out.println(0);
			System.out.println("Username taken!");
			
			valid=0; //Username taken error
		}
		else if(tmpData.size()!=0)
		{
			System.out.println(1);
			System.out.println("Email taken!");
			
			valid=1; //Email taken error
		}
		else if(uname.contains("\"")//username
				|| uname.contains("\'")
				|| uname.contains(" ")
				|| uname.length()>32
				|| uname.length()<4)
		{
			System.out.println(2);
			System.out.println("Username doesnt meet criteria");
				
			valid=2; //Username doesnt meet criteria
		}
		else if(pword.contains("\"")//Password
				|| pword.contains("\'")
				|| pword.contains(" ")
				|| pword.length()>32
				|| pword.length()<4)
		{
			System.out.println(3);
			System.out.println("Password doesnt meet criteria");
				
			valid=3; //Password doesnt meet criteria
		}
		else if(email.contains("\"")//email
				|| email.contains("\'")
				|| email.contains(" ")
				|| email.length()>64
				|| email.length()<4)
		{
			System.out.println(4);
			System.out.println("Email doesnt meet criteria");
				
			valid=4; //Email doesnt meet criteria
		}
		else if(phone.contains("\"")//Phone
				|| phone.contains("\'")
				|| phone.contains(" ")
				|| phone.length()>32
				|| phone.length()<4)
		{
			System.out.println(5);
			System.out.println("Phone number doesnt meet criteria");
				
			valid=5; //Phone number doesnt meet criteria
		}
		else
		{
			//Insert into endUsers VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', true, '2001-01-01 00:00:00', true);
			
			int uid=getNewAccountID();
			
			String CAQuery="INSERT INTO "+euTable+" VALUES ("
					+uid+", \'"+uname+"\', \'"+pword+"\', \'"
					+email+"\', \'"+phone+"\', \'"
					+getTime()+"\', "+true+");";
			
			System.out.println(CAQuery);
			
			sql.updateTable(CAQuery);
			
			System.out.println(6);
			System.out.println("Account Created");
					
			//System.out.println(sql.getRowCount("endUsers"));
			
			valid=6; //Account created
		}
		
		return valid;
	}
	
	public boolean createAnswer(String user, int qid, String answer)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("forum");
		
		int ansID=sql.getRowCount(answerTable)+1;
		
		String query="INSERT INTO "+answerTable+" VALUES("+ansID+", "+qid
				+", \'"+answer+"\', \'"+user+"\', \'"+getTime()+"\');";
		
		sql.updateTable(query);
		
		return status;
	}
	
	public int createAuction(String seller, String category, String subcategory, 
			String[] itemInfo, String closingDT, String reserveAmount, 
			String initialAmount, String minIncrement)
	{
		int status=-1;
		
		DBSQL sql=new DBSQL("Auctions");
		
		int aid=sql.getRowCount("Auction")+1;
		String createdDate=getTime();
		String endDate=closingDT;
		boolean isActive=true;
		DecimalFormat moneyFormat = new DecimalFormat("0.00");
		double initial=Double.parseDouble(moneyFormat.format
				(Double.parseDouble(initialAmount)));
		double increment=Double.parseDouble(moneyFormat.format
				(Double.parseDouble(minIncrement)));
		double reserve=Double.parseDouble(moneyFormat.format
				(Double.parseDouble(reserveAmount)));
		
		if(initial<0)
			initial=0;
		if(increment<0)
			increment=0;
		if(reserve<0)
			reserve=0;
		
		//String query="SELECT * FROM endUsers "
				//+"WHERE username='"+uname+"';";
		
		String createAuctionQuery="INSERT INTO "+auctionTable+" VALUES ("
				+aid+", \'"+seller+"\', \'"+createdDate+"\', \'"+endDate+"\', "+
				true+", "+initial+", "+increment+", "+reserve+", "
				+null+", "+null+", "+null+");";
		
		System.out.println("CAQ"+createAuctionQuery);
		
		sql.updateTable(createAuctionQuery);
		
		//TODO: Create Item next
		String itemTable="Item";
		int itemID=sql.getRowCount("Item")+1;
		
		String createItemQuery="INSERT INTO "+itemTable+" VALUES("
				+aid+", "+itemID+", \'"+category+"\', \'"+subcategory+"\');";
		
		System.out.println("CIQ"+createItemQuery);
		
		sql.updateTable(createItemQuery);
		
		String createCategoryQuery="INSERT INTO "+category+" VALUES("
				+itemID+", \'"+subcategory+"\');";
		
		System.out.println("CCQ"+createCategoryQuery);
		
		sql.updateTable(createCategoryQuery);
		
		String createSubQuery="INSERT INTO "+subcategory+" VALUES("
				+itemID+", ";
		
		for(int i=0; i<itemInfo.length-1; i++)
		{
			createSubQuery+="\'"+itemInfo[i]+"\', ";
		}
		createSubQuery+="\'"+itemInfo[itemInfo.length-1]+"\');";
		
		System.out.println("CSQ"+createSubQuery);
		
		sql.updateTable(createSubQuery);
		
		status=1;
		
		return status;
	}
	
	/*public boolean createBid(String user, int auctionID, double amount, double max)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("Auctions");
		
		String query="select auctID, bidID, amt, maxBid, createdBy, dt, isActive"
				+ " FROM "+bidTable+" WHERE auctID="+auctionID+" order by bid desc limit 1";
		
		
		Object[] auctionInfo=getAuctionInfo(auctionID);
		
		int bidID=sql.getRowCount(bidTable)+1;
		
		Object[] highestBid=getHighestBid(auctionID);
		
		if(highestBid==null)
		{
			String bidQuery="INSERT INTO "+bidTable+" VALUES("
					+auctionID+", "+bidID+", "+amount+", "+max+", "
					+"\'"+user+"\', \'"+getTime()+"\', "+true+");";
			
			sql.updateTable(bidQuery);
		}
		else if(amount>Double.parseDouble(String.valueOf(highestBid[2]))
				&& amount-Double.parseDouble(String.valueOf(highestBid[2]))>=Double.parseDouble(String.valueOf(auctionInfo[6]))
				)
		{
			String bidQuery="INSERT INTO "+bidTable+" VALUES("
					+auctionID+", "+bidID+", "+amount+", "+max+", "
					+"\'"+getTime()+"\');";
			
			sql.updateTable(bidQuery);
		}
		else
		{
			status=false;
		}
	}*/
	
	public boolean createBid(String user, int auctionID, double amount, double max)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("Auctions");
		
		String query="select auctID, bidID, amt, maxBid, createdBy, dt, isActive"
				+ " FROM "+bidTable+" WHERE auctID="+auctionID+" order by amt desc limit 1";
		
		int bidID=sql.getRowCount(bidTable)+1;
		
		System.out.println(query);
		
		ArrayList<Object[]> rs=sql.select(query);
		
		String auctionQuery="SELECT * FROM "+auctionTable+" WHERE auctID="+auctionID+";";
		
		ArrayList<Object[]> auction=sql.select(auctionQuery);
		
		BigDecimal amt=BigDecimal.valueOf(amount);
		BigDecimal maxAmt=BigDecimal.valueOf(max);
		
		if(rs==null || rs.size()==0)
		{
			query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
					+amt.toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
		
			sql.updateTable(query);
			
			//ALERT: Top Bid
		}
		else
		{
			BigDecimal INCREMENT=BigDecimal.valueOf(Double.valueOf(String.valueOf(auction.get(0)[0])));
			
			String old_user=(String)rs.get(0)[4];
		    BigDecimal old_bid=(BigDecimal)rs.get(0)[2];
		    BigDecimal old_max_bid=(BigDecimal)rs.get(0)[3];
		    
		    if(amt.floatValue()<old_bid.add(INCREMENT).floatValue())
		    {
		    	if(maxAmt==null || maxAmt.compareTo(old_bid.add(INCREMENT))<=0)
		    	{
//		            ALERT new_user_id: Bid is too low because it is smaller than the Last Bid
		    	}
		    	else if(old_max_bid!=null && maxAmt.compareTo(old_max_bid.add(INCREMENT))<=0)
			    {
		    		//ALERT new_user: New Max Bid is too low
//		            // Register Loosing Bid from new user
					query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+maxAmt.toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		            //query="INSERT into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+new_max_bid.toString()+", "+new_max_bid.toString())+")";
//		            //ALERT old_user: New Bid increased Bid Price
//		            // Register new bid price for old user that is greater than max bid by new user
		           // query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+old_user_id+"', now(), "+new_max_bid.add(INCREMENT).toString()+", "+old_max_bid.toString())+")";
					query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+maxAmt.add(INCREMENT).toString()+", "+old_max_bid.toString()+", \'"+old_user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
			    }
		    	else if(old_max_bid==null)
		    	{
		    		//New Bid is Winning
		            //ALERT old_user: Old Bid is Loosing
		            //ALERT new_user: New Bid is Winning
		    		//query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+old_bid.add(INCREMENT).toString()+", "+new_max_bid.toString())+")";
		    		query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+old_bid.add(INCREMENT).toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		    	}
		    	else
		    	{
		    		// New Bid is Winning against Old Max Bid
		            //ALERT old_user: Old Bid is Loosing
		            //ALERT new_user: New Bid is Winning
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+old_max_bid.add(INCREMENT).toString()+", "+new_max_bid.toString())+")";
		    		query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+old_max_bid.add(INCREMENT).toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		    	}
		    }
		    else
		    {
		    	 // New Bid is greater then Old Bid
		        if(old_max_bid==null || old_max_bid.add(INCREMENT).compareTo(amt)<=0)
		        {
		            // New Bid is Winning
		        	//ALERT old_user: Old Bid is Loosing
		            //ALERT new_user: New Bid is Winning
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+new_bid.toString()+", "+(new_max_bid==null ? "null" : new_max_bid.toString()))+")";
		        	query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+amt.add(INCREMENT).toString()+", "+(maxAmt==null ? "null" : maxAmt.toString())+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        }
		        else if(maxAmt==null)
		        {
		            // Old Bid is still Winning
		            //ALERT new_user: New Bid is Loosing
		            // Register New Bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+new_bid.toString()+", null)";
		        	query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+amt.toString()+", "+null+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        	
		        	//ALERT old_user: Old Bid is increased the Bid price because of New Bid
		            // Register Updated Old Bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+old_user_id+"', now(), "+new_bid.add(INCREMENT).toString()+", "+old_max_bid+")";
					query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+amt.add(INCREMENT).toString()+", "+old_max_bid+", \'"+old_user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        }
		        else if(maxAmt.add(INCREMENT).compareTo(old_max_bid)<=0)
		        {
		        	// Old Bid is still Winning
		            //ALERT new_user: New Bid is Loosing
		            // Register New Bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+new_bid.toString()+", "+new_max_bid.toString()+")";
		        	query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+amt.toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        	
		        	//ALERT old_user: Old Bid is increased the Bid price because of New Bid
		            // Register Updated Old Bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+old_user_id+"', now(), "+new_max_bid.add(INCREMENT).toString()+", "+old_max_bid+")";
					query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+maxAmt.add(INCREMENT).toString()+", "+old_max_bid+", \'"+old_user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        }
		        else
		      	{
		        	// New Bid is Winning
		            //ALERT old_user: Old Bid is Loosing
		            //ALERT new_user: New Bid is Winning
		            // Original new bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+new_bid.toString()+", "+new_max_bid.toString())+")";
		        	query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+amt.toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		        	
		        	// Update new bid
		            //query="insert into bid (item_id, user_id, timestamp, bid, max_bid) values ("+item_id+", '"+new_user_id+"', now(), "+old_max_bid.add(INCREMENT).toString()+", "+new_max_bid.toString()+")";
					query="INSERT INTO "+bidTable+" VALUES("+auctionID+", "+bidID+", "
							+old_max_bid.add(INCREMENT).toString()+", "+maxAmt.toString()+", \'"+user+"\', \'"+getTime()+"\', true);";
					
					sql.updateTable(query);
		      	}
			}
		}
		
		return status;
	}
	
	public int createCustomerRep(String uname, String pword, 
			String email, String phone)
	{
		System.out.println("UNAME="+uname);
		System.out.println("PWORD="+pword);
		System.out.println("e="+email);
		System.out.println("ph="+phone);
		
		
		int valid=-1;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username='"+uname+"';";
				
		System.out.println("Q="+query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		String tmpQuery="SELECT * FROM endUsers "
				+"WHERE username='"+email+"';";
		ArrayList<Object[]> tmpData=sql.select(query);
		
		if(data.size()!=0)
		{
			System.out.println(0);
			System.out.println("Username taken!");
			
			valid=0; //Username taken error
		}
		else if(tmpData.size()!=0)
		{
			System.out.println(1);
			System.out.println("Email taken!");
			
			valid=1; //Email taken error
		}
		else if(uname.contains("\"")//username
				|| uname.contains("\'")
				|| uname.contains(" ")
				|| uname.length()>32
				|| uname.length()<4)
		{
			System.out.println(2);
			System.out.println("Username doesnt meet criteria");
				
			valid=2; //Username doesnt meet criteria
		}
		else if(pword.contains("\"")//Password
				|| pword.contains("\'")
				|| pword.contains(" ")
				|| pword.length()>32
				|| pword.length()<4)
		{
			System.out.println(3);
			System.out.println("Password doesnt meet criteria");
				
			valid=3; //Password doesnt meet criteria
		}
		else if(email.contains("\"")//email
				|| email.contains("\'")
				|| email.contains(" ")
				|| email.length()>64
				|| email.length()<4)
		{
			System.out.println(4);
			System.out.println("Email doesnt meet criteria");
				
			valid=4; //Email doesnt meet criteria
		}
		else if(phone.contains("\"")//Phone
				|| phone.contains("\'")
				|| phone.contains(" ")
				|| phone.length()>32
				|| phone.length()<4)
		{
			System.out.println(5);
			System.out.println("Phone number doesnt meet criteria");
				
			valid=5; //Phone number doesnt meet criteria
		}
		else
		{
			//Insert into endUsers VALUES (1, 'Admin', 'root', 'Admin@gmail.com', '6090001111', true, '2001-01-01 00:00:00', true);
			int uid=getNewAccountID();
			
			String euQuery="INSERT INTO "+euTable+" VALUES ("
					+uid+", \'"+uname+"\', \'"+pword+"\', \'"
					+email+"\', \'"+phone+"\', \'"
					+getTime()+"\', "+true+");";
			
			String crQuery="INSERT INTO "+crTable+" VALUES ("
					+uid+", \'"+uname+"\', \'"+pword+"\', \'"
					+email+"\', \'"+phone+"\', \'"
					+getTime()+"\', "+true+");";
			
			System.out.println(euQuery);
			
			sql.updateTable(euQuery);
			sql.updateTable(crQuery);
			
			System.out.println(6);
			System.out.println("Account Created");
					
			//System.out.println(sql.getRowCount("endUsers"));
			
			valid=6; //Account created
		}
		
		return valid;
	}
	
	public boolean createQuestion(String user, String title, String question)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("Forum");
		
		int questionID=sql.getRowCount(qTable)+1;
		
		String query="INSERT INTO "+qTable+" VALUES ("
				+questionID+", \'"+title+"\', \'"+question+"\', \'"
				+user+"\', \'"+getTime()+"\');";
		
		sql.updateTable(query);
		
		return status;
	}
	
	public boolean deleteAccount(String uname, String pword)
	{
		boolean isDeleted=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM endUsers "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isDeleted=false;
		}
		else if(!data.get(0)[2].equals(pword))
		{
			System.out.println(2);
			System.out.println("Incorrect information");
			
			isDeleted=false;
		}
		else if(uname.contains("\"")
				|| uname.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
				
			isDeleted=false;
		}
		else if(pword.contains("\"")
			|| pword.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
					
			isDeleted=false;
		}
			else
			{
				sql.delete(uname);
				
				isDeleted=true;
			}
		
		return isDeleted;
	}
	
	public boolean deleteAuction(int auctID)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("Auctions");
		
		String query="UPDATE "+auctionTable+" SET isActive=false "
				+ "WHERE auctID="+auctID+";";
		
		sql.updateTable(query);
		
		return status;
	}
	
	public boolean deleteBid(int bidID)
	{
		boolean status=true;
		
		DBSQL sql=new DBSQL("Auctions");
		
		String query="UPDATE "+bidTable+" SET isActive=false "
				+ "WHERE bidID="+bidID+";";
		
		sql.updateTable(query);
		
		return status;
	}
	
	public ArrayList<Object[]> getAnswers(int qid)
	{
		DBSQL sql=new DBSQL("Forum");
		
		String query="SELECT * FROM "+answerTable+" WHERE questionID="+qid+";";
		
		ArrayList<Object[]> answers=sql.select(query);
		
		return answers;
	}
	
	public Object[] getAuctionInfo(int auctionID)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String auctionQuery="SELECT * FROM "+auctionTable+" WHERE auctID="+auctionID+";";
		
		Object[] auctionInfo=sql.select(auctionQuery).get(0);
		
		return auctionInfo;
	}
	
	public ArrayList<Object[]> getBids(int auctionID)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String query="SELECT * FROM "+bidTable+" WHERE auctID="+auctionID+";";
	
		ArrayList<Object[]> bids=sql.select(query);
		
		return bids;
	}
	
	public Object[] getHighestBid(int auctionID)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String query="select auctID, bidID, amt, maxBid, createdBy, dt, isActive FROM "+bidTable+" "
				+ "WHERE auctID="+auctionID+" order by amt desc limit 1";
		
		System.out.println(query);
		
		ArrayList<Object[]> bids=sql.select(query);
		
		if(bids.size()>0)
		{
			return bids.get(0);
		}
		else
		{
			return null;
		}
	}
	
	public Object[] getItem(int auctionID)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String auctionQuery="SELECT * FROM "+itemTable+" WHERE auctID="+auctionID+";";
	
		ArrayList<Object[]> tmp=sql.select(auctionQuery);
		
		String itemQuery="SELECT * FROM "+tmp.get(0)[3]+" WHERE itemID="+tmp.get(0)[1]+";";
	
		ArrayList<Object[]> item=sql.select(itemQuery);
		
		return item.get(0);
	}
	
	public ArrayList<Object[]> getAuctions(String itemType, String[] keywords)
	{		
		ArrayList<Object[]> searchItems=searchItems(itemType, keywords);
		
		System.out.println(searchItems.size());
		
		DBSQL sql=new DBSQL("Auctions");
		
		ArrayList<ArrayList<Object[]>> itemTmp=new ArrayList<ArrayList<Object[]>>();
 		
		for(int i=0; i<searchItems.size(); i++)
		{
			String query="SELECT * FROM "+itemTable+" WHERE itemID="
					+searchItems.get(i)[0];
			
			System.out.println(query);
			
			itemTmp.add(sql.select(query));
		}
		
		ArrayList<ArrayList<Object[]>> auctionTmp=new ArrayList<ArrayList<Object[]>>();
		
		for(int i=0; i<itemTmp.size(); i++)
		{
			String query="SELECT * FROM "+auctionTable+" WHERE auctID="
					+itemTmp.get(i).get(0)[0];
			
			System.out.println(query);
			
			auctionTmp.add(sql.select(query));
		}
		
		ArrayList<Object[]> auctions=new ArrayList<Object[]>();
		
		for(int i=0; i<auctionTmp.size(); i++)
		{
			if((boolean)auctionTmp.get(i).get(0)[4])
			{
				auctions.add(auctionTmp.get(i).get(0));
			}
		}
		
		return auctions;
	}
	
	public Object[] getItemInfo(Object[] item, int itemID)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String query="SELECT * FROM "+item[3]+" WHERE itemID="+itemID+";";
		
		ArrayList<Object[]> data=sql.select(query);
		
		System.out.println(data.size());
		return data.get(0);
	}
	
	public ArrayList<Object[]> getItems(String itemType, String[] keywords)
	{
		ArrayList<Object[]> searchItems=searchItems(itemType, keywords);

		DBSQL sql=new DBSQL("Auctions");
		
		ArrayList<ArrayList<Object[]>> itemTmp=new ArrayList<ArrayList<Object[]>>();
 		
		for(int i=0; i<searchItems.size(); i++)
		{
			String query="SELECT * FROM "+itemTable+" WHERE itemID="
					+searchItems.get(i)[0];
			
			System.out.println(query);
			
			itemTmp.add(sql.select(query));
		}
		
		ArrayList<Object[]> items=new ArrayList<Object[]>();
		
		for(int i=0; i<itemTmp.size(); i++)
		{
			items.add(itemTmp.get(i).get(0));
		}
		
		String query="SELECT * FROM Item WHERE auctID=(SELECT auctID FROM Auction WHERE isActive=true);";
		
		ArrayList<Object[]> active=sql.select(query);
		
		boolean isActive=false;
		
		for(int i=0; i<items.size(); i++)
		{
			for(int j=0; j<active.size(); j++)
			{
				if(items.get(i)[0]==active.get(j)[1])
				{
					isActive=true;
				}
				
				if(!isActive)
				{
					items.remove(i);
				}
			}
		}
		
		return items;
	}
	
	public Object[] getQuestion(int qid)
	{
		DBSQL sql=new DBSQL("forum");
		
		String query="SELECT * FROM "+qTable+" WHERE qid="+qid+";";
		
		ArrayList<Object[]> question=sql.select(query);
		
		return question.get(0);
	}
	
	public ArrayList<Object[]> getQuestions()
	{
		DBSQL sql=new DBSQL("Forum");
		
		String query="SELECT * FROM Questions";
		
		ArrayList<Object[]> questions=sql.select(query);
		
		return questions;
	}
	
	public String getTotalEarnings()
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String query="SELECT WinningBid FROM "+auctionTable;
		
		ArrayList<Object[]> winningBids=sql.select(query);
		
		double total=0.0;
		for(int i=0; i<winningBids.size(); i++)
		{
			if(winningBids.get(i)[0]!=null 
					|| String.valueOf(winningBids.get(i)[0]).isBlank())
			{
				total+=Double.parseDouble(String.valueOf(winningBids.get(i)[0]));
			}
		}
		
		NumberFormat formatter = NumberFormat.getCurrencyInstance();
		String totalEarnings=formatter.format(total);
		
		if(totalEarnings==null || totalEarnings.isBlank())
		{
			totalEarnings="$0.00";
		}
		System.out.println(totalEarnings);
		totalEarnings=totalEarnings.substring(1);
		return totalEarnings;
	}
	
	public boolean hasDatePassed(String date, String time)
	{
		boolean hasPassed=false;
		
		String inputDate=convertToDateTime(date, time);
		
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try 
		{
			Date d = formatter.parse(inputDate);
			
			hasPassed=d.before(new Date());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return hasPassed;
	}
	
	public String getTime()
	{
		String lastAccessed="2001-01-01 00:00:00";
		
		LocalDateTime datetime = LocalDateTime.now();
		DateTimeFormatter formatter 
			= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		lastAccessed=datetime.format(formatter);
		
		return lastAccessed;
	}
	
	public int getNewAccountID()
	{
		DBSQL sql=new DBSQL("Accounts");
		
		return sql.getRowCount("endUsers")+1;
	}
	
	public boolean isAdmin(String uname)
	{
		boolean isCR=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM administrator "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isCR=false;
		}
		else
		{
			isCR=true;
		}
		
		return isCR;
	}
	
	public boolean isCustomerRep(String uname)
	{
		boolean isCR=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM custRep "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			isCR=false;
		}
		else
		{
			isCR=true;
		}
		
		return isCR;
	}
	
	public boolean isNumber(String str)
	{
		if (str.isBlank()) 
		{
            return false;
        }
        final char[] chars = str.toCharArray();
        int sz = chars.length;
        boolean hasExp = false;
        boolean hasDecPoint = false;
        boolean allowSigns = false;
        boolean foundDigit = false;
        // deal with any possible sign up front
        final int start = chars[0] == '-' || chars[0] == '+' ? 1 : 0;
        if (sz > start + 1 && chars[start] == '0' && !str.contains(".")) 
        { // leading 0, skip if is a decimal number
            if (chars[start + 1] == 'x' || chars[start + 1] == 'X') 
            { // leading 0x/0X
                int i = start + 2;
                if (i == sz) 
                {
                    return false; // str == "0x"
                }
                // checking hex (it can't be anything else)
                for (; i < chars.length; i++) 
                {
                    if ((chars[i] < '0' || chars[i] > '9')
                        && (chars[i] < 'a' || chars[i] > 'f')
                        && (chars[i] < 'A' || chars[i] > 'F')) 
                    {
                        return false;
                    }
                }
                return true;
           }
            if (Character.isDigit(chars[start + 1])) 
            {
                   // leading 0, but not hex, must be octal
                   int i = start + 1;
                   for (; i < chars.length; i++) {
                       if (chars[i] < '0' || chars[i] > '7') 
                       {
                           return false;
                       }
                   }
                   return true;
               }
        }
        sz--; // don't want to loop to the last char, check it afterwards
              // for type qualifiers
        int i = start;
        // loop to the next to last char or to the last char if we need another digit to
        // make a valid number (e.g. chars[0..5] = "1234E")
        while (i < sz || i < sz + 1 && allowSigns && !foundDigit) 
        {
            if (chars[i] >= '0' && chars[i] <= '9') 
            {
                foundDigit = true;
                allowSigns = false;

            } else if (chars[i] == '.') 
            {
                if (hasDecPoint || hasExp) 
                {
                    // two decimal points or dec in exponent
                    return false;
                }
                hasDecPoint = true;
            } else if (chars[i] == 'e' || chars[i] == 'E') 
            {
                // we've already taken care of hex.
                if (hasExp) 
                {
                    // two E's
                    return false;
                }
                if (!foundDigit) 
                {
                    return false;
                }
                hasExp = true;
                allowSigns = true;
            } else if (chars[i] == '+' || chars[i] == '-') 
            {
                if (!allowSigns) 
                {
                    return false;
                }
                allowSigns = false;
                foundDigit = false; // we need a digit after the E
            } else 
            {
                return false;
            }
            i++;
        }
        if (i < chars.length) 
        {
            if (chars[i] >= '0' && chars[i] <= '9') 
            {
                // no type qualifier, OK
                return true;
            }
            if (chars[i] == 'e' || chars[i] == 'E') 
            {
                // can't have an E at the last byte
                return false;
            }
            if (chars[i] == '.') 
            {
                if (hasDecPoint || hasExp) 
                {
                    // two decimal points or dec in exponent
                    return false;
                }
                // single trailing decimal point after non-exponent is ok
                return foundDigit;
            }
            if (!allowSigns
                && (chars[i] == 'd'
                    || chars[i] == 'D'
                    || chars[i] == 'f'
                    || chars[i] == 'F')) 
            {
                return foundDigit;
            }
            if (chars[i] == 'l'
                || chars[i] == 'L') 
            {
                // not allowing L with an exponent or decimal point
                return foundDigit && !hasExp && !hasDecPoint;
            }
            // last character is illegal
            return false;
        }
        // allowSigns is true iff the val ends in 'E'
        // found digit it to make sure weird stuff like '.' and '1E-' doesn't pass
        return !allowSigns && foundDigit;
	}
	
	public boolean loginAccount(String uname, String pword)
	{
		//System.out.println(uname);
		//System.out.println(pword);
		
		boolean valid=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM  "+euTable+" "
				+"WHERE username=\'"+uname+"\' AND isActive=true;";
				
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		if(data.size()!=1)
		{
			System.out.println(1);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(!data.get(0)[2].equals(pword))
		{
			System.out.println(2);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(uname.contains("\"")
			|| uname.length()>32)
		{
			System.out.println(3);
			System.out.println("Incorrect information");
			
			valid=false;
		}
		else if(pword.contains("\"")
				|| pword.length()>32)
			{
				System.out.println(3);
				System.out.println("Incorrect information");
				
				valid=false;
			}
		else
		{
			System.out.println(4);
			System.out.println("LOGIN");
			
			String updateEUQuery="UPDATE "+euTable+" SET lastAccessed=\'"
					+getTime()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			String updateCRQuery="UPDATE "+crTable+" SET lastAccessed=\'"
					+getTime()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			String updateAQuery="UPDATE "+adminTable+" SET lastAccessed=\'"
					+getTime()+"\' WHERE username=\'"+uname
					+"\' AND isActive=true;";
			
			sql.updateTable(updateEUQuery);
			sql.updateTable(updateCRQuery);
			sql.updateTable(updateAQuery);
			
			valid=true;
		}
		
		return valid;
	}
	
	public void notifyUser()
	{
		
	}
	
	public int resetPassword(String currentUser, String uname, String pword, String cpword)
	{
		int status=-1;
		
		DBSQL sql=new DBSQL("Accounts");
		
		if(currentUser.equals(uname))
		{
			String getInfoQuery="SELECT * FROM "+euTable+" "
					+"WHERE uname=\'"+currentUser+"\' and isActive=true;";
			
			ArrayList<Object[]> data=sql.select(getInfoQuery);
			
			if(pword.equals(cpword))
			{
				if(!pword.equals(data.get(0)[2])
						&& !pword.contains("\"")
						&& !pword.contains("\'")
						&& !pword.contains(" ")
						&& !(pword.length()>32)
						&& !(pword.length()<4))
				{	
					String updateEUQuery="UPDATE "+euTable+" SET password=\'"
							+pword+"\' WHERE username=\'"+uname
							+"\' AND isActive=true;";
					
					String updateCRQuery="UPDATE "+crTable+" SET password=\'"
							+pword+"\' WHERE username=\'"+uname
							+"\' AND isActive=true;";
					
					String updateAQuery="UPDATE "+adminTable+" SET password=\'"
							+pword+"\' WHERE username=\'"+uname
							+"\' AND isActive=true;";
					
					sql.updateTable(updateEUQuery);
					sql.updateTable(updateCRQuery);
					sql.updateTable(updateAQuery);
					
					status=1;
				}
			}
		}
		
		return status;
	}
	
	public ArrayList<ArrayList<Object[]>> searchItems(String[] keywords)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		//String query="SELECT * FROM Item "
				//+"WHERE ";
		
		String searchQuery = "";
		
		String[] tables=new String[] {"Item", "Clothing", "Bracelet", 
				"Earrings", "Hats", "Necklace", "Pants", "Shirts", "Shoes", 
				"Socks", "Undergarments", "Watch", "Computers", "AIO", 
				"Desktop", "Laptop", "Vehicles", "Airplane", "Boat", "Bus", 
				"Car", "Motorcycle", "Offroad", "Truck", "Other"};
		
		String[][] columns=new String[][] 
				{{"Category", "Subcategory"}, {"Subcategory"}, 
				 {"Company", "Size", "Material"}, {"Company", "Material"}, 
				 {"Style", "Size", "Color"}, {"Company", "Size", "Material"}, 
				 {"Company", "Mf", "Size", "Material", "Color"}, 
				 {"Company", "Mf", "Size", "Material", "Color"}, 
				 {"Company", "Model", "Mf", "Size", "Color"}, 
				 {"Company", "Size", "Color"}, {"Company", "Size", "Color"}, 
				 {"Company", "Model", "Color", "Material"}, {"Subcategory"}, 
				 {"YearMade", "Company", "Model", "Screensize", "Color", "Processor", "Gpu"}, 
				 {"YearMade", "Company", "Model", "Color", "Processor", "Gpu"}, 
				 {"YearMade", "Company", "Model", "Screensize", "Color", "Processor", "Gpu"}, 
				 {"Subcategory"}, 
				 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
				 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
				 {"BodyType", "YearMade", "Make", "Model", "ItemCondition", "Mileage"}, 
				 {"BodyType", "YearMade", "Make", "Model", "Color", "ItemCondition", "Mileage", "FuelType", "Transmission"}, 
				 {"BodyType", "YearMade", "Make", "Model", "Color", "ItemCondition", "Mileage"}, 
				 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
				 {"BodyType", "YearMade", "Make", "Model", "ItemCondition", "Mileage"}, 
				 {"ItemName", "ItemDescription"}};
				 
		ArrayList<ArrayList<Object[]>> results=new ArrayList<ArrayList<Object[]>>();
				 
		for(int k=0; k<keywords.length; k++)
		{
			for(int i=0; i<tables.length; i++)
			{
				searchQuery+="SELECT * FROM "+tables[i]+" WHERE ";
						 
				for(int j=0; j<columns[i].length; j++)
				{
					searchQuery+=columns[i][j]+" LIKE ";	 
							 
					searchQuery+="\'%"+keywords[k]+"%\'";
							 
					if(j<columns[i].length-1)
					{
						searchQuery+=" OR ";
					}
				}
						
				System.out.println(searchQuery);
				results.add(sql.select(searchQuery));
				searchQuery="";
			}
		}
		
		return results;
	}
	
	public ArrayList<Object[]> searchItems(String itemType, String[] keywords)
	{
		DBSQL sql=new DBSQL("Auctions");
		
		String[] clothingTables=new String[] {"Bracelet", 
				"Earrings", "Hats", "Necklace", "Pants", "Shirts", "Shoes", 
				"Socks", "Undergarments", "Watch"};
		
		String[] computersTables=new String[] {"AIO", 
				"Desktop", "Laptop"};
		
		String[] vehiclesTables=new String[] {"Airplane", "Boat", "Bus", 
				"Car", "Motorcycle", "Offroad", "Truck"};
		
		/////////////////////////////////////////////////////////
		String[][] clothingColumns=new String[][] { 
			 {"Company", "Size", "Material"}, {"Company", "Material"}, 
			 {"Style", "Size", "Color"}, {"Company", "Size", "Material"}, 
			 {"Company", "Mf", "Size", "Material", "Color"}, 
			 {"Company", "Mf", "Size", "Material", "Color"}, 
			 {"Company", "Model", "Mf", "Size", "Color"}, 
			 {"Company", "Size", "Color"}, {"Company", "Size", "Color"}, 
			 {"Company", "Model", "Color", "Material"}, {"Subcategory"}};
		
		String[][] computersColumns=new String[][] {
				 {"YearMade", "Company", "Model", "Screensize", "Color", "Processor", "Gpu"}, 
				 {"YearMade", "Company", "Model", "Color", "Processor", "Gpu"}, 
				 {"YearMade", "Company", "Model", "Screensize", "Color", "Processor", "Gpu"}};
		
		String[][] vehiclesColumns=new String[][] {
			 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
			 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
			 {"BodyType", "YearMade", "Make", "Model", "ItemCondition", "Mileage"}, 
			 {"BodyType", "YearMade", "Make", "Model", "Color", "ItemCondition", "Mileage", "FuelType", "Transmission"}, 
			 {"BodyType", "YearMade", "Make", "Model", "Color", "ItemCondition", "Mileage"}, 
			 {"BodyType", "YearMade", "Make", "Model", "ItemCondition"}, 
			 {"BodyType", "YearMade", "Make", "Model", "ItemCondition", "Mileage"}};
		
		String[][] otherColumns=new String[][] {{"ItemName", "ItemDescription"}};
		
		////////////////////////////////////////////////////////////////
		
		String query="";
		ArrayList<ArrayList<Object[]>> tmp=new ArrayList<ArrayList<Object[]>>();
		
		if(itemType.equals("clothing"))
		{
			for(int k=0; k<keywords.length; k++)
			{
				for(int i=0; i<clothingTables.length; i++)
				{
					query+="SELECT * FROM "+clothingTables[i];
				
					for(int j=0; j<clothingColumns[i].length; j++)
					{
						if(j==0)
						{
							query+=" WHERE "+clothingColumns[i][j];
						}
						else
						{
							query+=" OR "+clothingColumns[i][j];
						}
					
						query+=" LIKE \'%"+keywords[k]+"%\'";
					}
					query+=";";
					System.out.println(query);
					tmp.add(sql.select(query));
					query="";
				}
			}
		}
		else if(itemType.equals("computers"))
		{
			for(int k=0; k<keywords.length; k++)
			{
				for(int i=0; i<computersTables.length; i++)
				{
					query+="SELECT * FROM "+computersTables[i];
				
					for(int j=0; j<computersColumns[i].length; j++)
					{
						if(j==0)
						{
							query+=" WHERE "+computersColumns[i][j];
						}
						else
						{
							query+=" OR "+computersColumns[i][j];
						}
					
						query+=" LIKE \'%"+keywords[k]+"%\'";
					}
					query+=";";
					System.out.println(query);
					tmp.add(sql.select(query));
					query="";
				}
			}
		}
		else if(itemType.equals("vehicles"))
		{
			for(int k=0; k<keywords.length; k++)
			{
				for(int i=0; i<vehiclesTables.length; i++)
				{
					query+="SELECT * FROM "+vehiclesTables[i];
				
					for(int j=0; j<vehiclesColumns[i].length; j++)
					{
						if(j==0)
						{
							query+=" WHERE "+vehiclesColumns[i][j];
						}
						else
						{
							query+=" OR "+vehiclesColumns[i][j];
						}
					
						query+=" LIKE \'%"+keywords[k]+"%\'";
					}
					query+=";";
					System.out.println(query);
					tmp.add(sql.select(query));
					query="";
				}
			}
		}
		else if(itemType.equals("other"))
		{
			for(int k=0; k<keywords.length; k++)
			{
				for(int i=0; i<1; i++)
				{
					query+="SELECT * FROM other";
				
					for(int j=0; j<otherColumns[i].length; j++)
					{
						if(j==0)
						{
							query+=" WHERE "+otherColumns[i][j];
						}
						else
						{
							query+=" OR "+otherColumns[i][j];
						}
					
						query+=" LIKE \'%"+keywords[k]+"%\'";
					}
					query+=";";
					System.out.println(query);
					tmp.add(sql.select(query));
					query="";
				}
			}
		}
		
		ArrayList<Object[]> results=new ArrayList<Object[]>();
		
		for(int i=0; i<tmp.size(); i++)
		{
			for(int j=0; j<tmp.get(i).size(); j++)
			{
				results.add(tmp.get(i).get(j));
			}
		}
		
		return results;
	}
	
	public ArrayList<String> searchProfile(String[] keywords)
	{
		DBSQL sql=new DBSQL("Accounts");
		
		ArrayList<String> users=new ArrayList<String>();
		
		for(int i=0; i<keywords.length; i++)
		{
			String query="SELECT * FROM endUsers "
					+"WHERE username=\'"+keywords[i]+"\';";
					
			System.out.println(query);
			
			ArrayList<Object[]> data=sql.select(query);
			
			if(data.size()!=1)
			{
				System.out.println(1);
				System.out.println("Incorrect information");
			}
			else
			{
				users.add(String.valueOf(data.get(0)[1]));
			}
		}
		
		return users;
	}
	
	public ArrayList<Object[]> searchQuestions(String[] keywords)
	{
		DBSQL sql=new DBSQL("forum");
		
		ArrayList<Object[]> searchList=new ArrayList<Object[]>();
		
		String questionsQuery="SELECT * FROM "+qTable+";";
		
		ArrayList<Object[]> questions=sql.select(questionsQuery);
		HashSet<Integer> duplicate=new HashSet<>();
		
		for(int i=0; i<questions.size(); i++)
		{
			for(int j=0; j<keywords.length; j++)
			{
				if(String.valueOf(questions.get(i)[1]).contains(keywords[j])
						|| String.valueOf(questions.get(i)[2]).contains(keywords[j])
						|| String.valueOf(questions.get(i)[3]).contains(keywords[j]))
				{
					duplicate.add((int)questions.get(i)[0]);
					searchList.add(questions.get(i));
				}
			}
		}
		
		String answersQuery="SELECT * FROM "+answerTable+";";
		
		ArrayList<Object[]> answers=sql.select(answersQuery);
		
		for(int i=0; i<answers.size(); i++)
		{
			for(int j=0; j<keywords.length; j++)
			{
				if(String.valueOf(answers.get(i)[2]).contains(keywords[j])
						|| String.valueOf(answers.get(i)[3]).contains(keywords[j]))
				{
					if(!duplicate.contains(answers.get(i)[1]))
					{
						Object[] ansQuestion=getQuestion((int)answers.get(i)[1]);
						searchList.add(ansQuestion);
					}
				}
			}
		}
		
		for(int i=0; i<searchList.size(); i++)
		{
			System.out.println(searchList.get(i)[1]);
		}
		
		return searchList;
	}
	
	public boolean verifyUser(String uname, String pword)
	{
		boolean verified=false;
		
		DBSQL sql=new DBSQL("Accounts");
		
		String query="SELECT * FROM "+euTable+" WHERE username=\'"+uname+"\';";
		
		System.out.println(query);
		
		ArrayList<Object[]> results=sql.select(query);
		
		if(results.size()!=1)
		{
			return verified;
		}
		else if(!(String.valueOf(results.get(0)[2]).equals(pword)))
		{
			return verified;
		}
		else
		{
			verified=true;
			return verified;
		}
	}
}