package databaseDriver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBSQL 
{
	public Connection connection;
	
	public String host=null;
	public Integer port=3306;
	public String database;
	public String sqlUID="root";
	public String sqlPID="root";
	
	/*public static void main(String[] args)
	{
		DBSQL sql=new DBSQL();
		
		String query="SELECT * FROM endUsers";
		
		ArrayList<Object[]> data=sql.select(query);
		
		for(int i=0; i<data.size(); i++)
		{
			for(int j=0; j<data.get(i).length; j++)
			{
				System.out.println(data.get(i)[j]);
			}
		}
	}*/
	
	public DBSQL(String database)
	{	
		this.database=database;
		connection=getConnection();
	}
	
	public void close()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Wont delete an entry, but will make an entry invalid
	public void delete(String uname)
	{
		String table="endUsers";
		
		String query="UPDATE "+table+" SET isActive=false "
				+ "WHERE username=\'"+uname+"\';";
		
		updateTable(query);
	}
	
	public Connection getConnection()
	{
		Connection dbConnection=null;
		
		String connectionString="jdbc:mysql:";
		
		if(host==null)
		{
			connectionString+="//localhost";
		}
		else
		{
			connectionString+="//"+host;
		}
		
		if(port!=null)
		{
			connectionString+=":"+String.valueOf(port);
		}
		
		if(database!=null)
		{
			connectionString+="/"+database;
		}
		
		//In case connection uses unicode. Unlikely, but no harm
		connectionString+="?autoReconnect=true&useUnicode=true&"
				+ "characterEncoding=UTF8";
		
		//Load the driver
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		}catch(ClassNotFoundException ex)
        {
        	ex.printStackTrace();
        } catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			dbConnection=DriverManager.getConnection
					(connectionString, sqlUID, sqlPID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dbConnection;
	}
	
	public int getRowCount(String table)
	{
		int count=0;
		
		//System.out.println("test");
		
		try
		{
			Statement statement;
			statement=connection.createStatement();
			
			String query="select count(*) from "+table;
			
			ResultSet rs = statement.executeQuery(query);
			rs.next();
			count = rs.getInt(1);
		}catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return count;
	}
	
	//This is used for insert, and update
	public void updateTable(String query)
	{
		try
		{
			Statement statement;
		
			statement=connection.createStatement();
			
			boolean status=false;
			
			try
			{
				status=statement.execute(query);
			}catch(SQLSyntaxErrorException ex)
			{
				System.out.println("SQL Syntax Error");
				ex.printStackTrace();
			}catch(Exception ex)
			{
				if(ex.getClass().toString().equals("com.mysql."
						+ "jdbc.exceptions.jdbc4."
						+ "CommunicationsException"))
				{
					connection=getConnection();
					if(!connection.isValid(10))
					{
						throw new Exception("Connection is not valid");
					}
					
					status=statement.execute(query);
				}
				else
				{
					System.err.println("Exception catch NOT "
							+ "IMPLEMENTED YET for "+ex.getClass());
					ex.printStackTrace();
				}
			}finally
			{
				try
				{
					statement.close();
	     		}catch(Exception ignore) {}

	     		if(status)
	     		{
	     		// true if the first result is a ResultSet object
	     		// false if it is an update count or there are no results
	     		// Use the methods getResultSet or getUpdateCount
	     		// to retrieve the result, 
	     		//and getMoreResults to move to any
	     		// subsequent result(s).
	      		}
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	public ArrayList<Object[]> select(String query)
	{
		Statement statement;
		
		int colCount;
		
		ArrayList<Object[]> data=new ArrayList<Object[]>();
		Object[] row;
		
		try
		{
			statement=connection.createStatement();
			
			ResultSet rs=statement.executeQuery(query);
			
			try
			{
				colCount=rs.getMetaData().getColumnCount();
				
				while(rs.next())
				{
					if(rs.getMetaData().getColumnCount()!=colCount)
					{
						throw new Exception("Wrong # of Columns: "
					+colCount+" v.s. RS="
								+rs.getMetaData().getColumnCount());
					}
					
					row=new Object[colCount];
					
					for(int i=0; i<colCount; i++)
					{
						row[i]=rs.getObject(i+1);
					}
					
					data.add(row);
				}
			}finally
			{
				try
				{
					rs.close();
				}catch(Exception ignore) {}
			}
			
			statement.close();
		}catch(SQLSyntaxErrorException ex)
		{
			System.out.println("SQL Syntax Error");
			ex.printStackTrace();
		}catch(SQLException ex)
		{
			System.out.println("SQL Exception error");
			ex.printStackTrace();
		}catch(Exception ex)
		{
			System.out.println("Uncaught Exception: "+ex.getClass());
			ex.printStackTrace();
		}
		
		return data;
	}
}
