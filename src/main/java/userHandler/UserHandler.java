package userHandler;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import databaseDriver.DBSQL;

public class UserHandler
{
	String adminTable="administrator";
	String auctionTable="Auction";
	String bidTabl="Bid";
	String crTable="custRep";
	String euTable="endUsers";
	String itemTable="Item";
	
	
	public String convertToDateTime(String date, String time)
	{
		String datetime=date+" "+time;
		
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
	
	public int createAuction(String category, String subcategory, 
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
				+aid+", \'"+createdDate+"\', \'"+endDate+"\', "+
				true+", "+initial+", "+increment+", "+reserve+", "
				+null+", "+null+", "+null+");";
		
		sql.updateTable(createAuctionQuery);
		
		//TODO: Create Item next
		
		status=1;
		
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
	
	public boolean hasDatePassed(String date, String time)
	{
		boolean hasPassed=false;
		
		String inputDate=convertToDateTime(date, time);
		String todayDate=getTime();
		
		
		//hasPassed=
		
		return hasPassed;
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
	
	public void searchItems(String[] keywords)
	{
		DBSQL sql=new DBSQL("Items");
		
		String query="SELECT * FROM Items "
				+"WHERE ";
		
		
		//query+="xyz like \"%"+keywords[i]+"%\" ";
		boolean isFirst=true;
		for(int i=0; i<keywords.length; i++)
		{
			if(keywords[i].length()>0)
			{
				if(isFirst)
				{
					isFirst=false;
				}
				else
				{
					query+="OR "; //Can later check for quotes to use AND
				}
				
				query+="UPPER(name) LIKE \"%"+keywords[i].toUpperCase()
						+"%\" ";
			}
		}
		
		System.out.println(query);
		
		ArrayList<Object[]> data=sql.select(query);
		
		//return data;
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
}