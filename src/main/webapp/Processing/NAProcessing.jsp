<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	//Clothing, Computer, Vehicle, Other
	String itemType=request.getParameter("category");

	System.out.println("IT="+itemType);
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	String cd=request.getParameter("cd"); //Closing date
	String ct=request.getParameter("time"); //Closing time
	String reserve=request.getParameter("reserve");
	String initialAmount=request.getParameter("initial");
	String minIncrement=request.getParameter("minInc");
	
	if(itemType==null)
	{
		
	}
	else if(itemType.equals("clothing"))
	{
		System.out.println("HI");
		String clothingType=request.getParameter("clothing");
		
		if(clothingType==null)
		{
			
		}
		else if(clothingType.equals("bracelet"))
		{
			String company=request.getParameter("company");
			String size=request.getParameter("size");
			String material=request.getParameter("material");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, size, material}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("earrings"))
		{
			String company=request.getParameter("company");
			String material=request.getParameter("material");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, material}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("hats"))
		{
			String style=request.getParameter("style");
			String size=request.getParameter("size");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{style, size, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("necklace"))
		{
			String company=request.getParameter("company");
			String size=request.getParameter("size");
			String material=request.getParameter("material");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, size, material}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("pants"))
		{
			String company=request.getParameter("company");
			String mf=request.getParameter("mf");
			String size=request.getParameter("size");
			String material=request.getParameter("material");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, mf, size, material, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("shirts"))
		{
			String company=request.getParameter("company");
			String mf=request.getParameter("mf");
			String size=request.getParameter("size");
			String material=request.getParameter("material");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, mf, size, material, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("shoes"))
		{
			String company=request.getParameter("company");
			String model=request.getParameter("model");
			String mf=request.getParameter("mf");
			String size=request.getParameter("size");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, model, mf, size, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("socks"))
		{
			String company=request.getParameter("company");
			String size=request.getParameter("size");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, size, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("undergarments"))
		{
			String company=request.getParameter("company");
			String size=request.getParameter("size");
			String color=request.getParameter("color");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, size, color}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(clothingType.equals("watch"))
		{
			String company=request.getParameter("company");
			String model=request.getParameter("model");
			String color=request.getParameter("color");
			String material=request.getParameter("material");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, clothingType, 
						new String[]{company, model, color, material}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
	}
	else if(itemType.equals("computers"))
	{
		System.out.println("HI");
		String computerType=request.getParameter("computer");
		
		if(computerType==null)
		{
			
		}
		else if(computerType.equals("aio"))
		{
			String year=request.getParameter("year");
			String company=request.getParameter("company");
			String model=request.getParameter("model");
			String screensize=request.getParameter("screensize");
			String color=request.getParameter("color");
			String cpu=request.getParameter("cpu");
			String gpu=request.getParameter("gpu");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, computerType, 
						new String[]{year, company, model, screensize,
								color, cpu, gpu}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(computerType.equals("desktop"))
		{
			String year=request.getParameter("year");
			String company=request.getParameter("company");
			String model=request.getParameter("model");
			String color=request.getParameter("color");
			String cpu=request.getParameter("cpu");
			String gpu=request.getParameter("gpu");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, computerType, 
						new String[]{year, company, model,
								color, cpu, gpu}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(computerType.equals("laptop"))
		{
			String year=request.getParameter("year");
			String company=request.getParameter("company");
			String model=request.getParameter("model");
			String screensize=request.getParameter("screensize");
			String color=request.getParameter("color");
			String cpu=request.getParameter("cpu");
			String gpu=request.getParameter("gpu");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, computerType, 
						new String[]{year, company, model, screensize,
								color, cpu, gpu}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
	}
	else if(itemType.equals("vehicles"))
	{
		System.out.println("HI");
		String vehicleType=request.getParameter("vehicle");
		
		if(vehicleType==null)
		{
			
		}
		else if(vehicleType.equals("airplane"))
		{
			String bodytype=request.getParameter("airplanebodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String condition=request.getParameter("condition");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model, condition}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("boat"))
		{
			String bodytype=request.getParameter("boatbodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String condition=request.getParameter("condition");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model, condition}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("bus"))
		{
			String bodytype=request.getParameter("busbodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String condition=request.getParameter("condition");
			String mileage=request.getParameter("mileage");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model,
								condition, mileage}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("car"))
		{
			String bodytype=request.getParameter("carbodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String color=request.getParameter("color");
			String condition=request.getParameter("condition");
			String mileage=request.getParameter("mileage");
			String fueltype=request.getParameter("fueltype");
			String transmission=request.getParameter("transmission");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model, color,
								condition, mileage, fueltype, transmission}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("motorcycle"))
		{
			String bodytype=request.getParameter("motorcyclebodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String color=request.getParameter("color");
			String condition=request.getParameter("condition");
			String mileage=request.getParameter("mileage");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model, color,
								condition, mileage}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("offroad"))
		{
			String bodytype=request.getParameter("offroadbodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String condition=request.getParameter("condition");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model,
								condition}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
		else if(vehicleType.equals("truck"))
		{
			String bodytype=request.getParameter("truckbodytype");
			String year=request.getParameter("year");
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			String condition=request.getParameter("condition");
			String mileage=request.getParameter("mileage");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction(itemType, vehicleType, 
						new String[]{bodytype, year, make, model,
								condition, mileage}, datetime, 
						reserve, initialAmount, minIncrement);
				
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
				</html>
				
				<%
			}
			else
			{
				%>

				<html>
					<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
				</html>
				
				<%
			}
		}
	}
	else if(itemType.equals("other"))
	{
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		
		if(cd != null && !cd.trim().isEmpty()
				&& ct != null && !ct.trim().isEmpty()
				&& reserve != null && !reserve.trim().isEmpty()
				&& initialAmount != null && !initialAmount.trim().isEmpty()
				&& minIncrement != null && !minIncrement.trim().isEmpty()
				&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
				&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
		{
			String datetime=uh.convertToDateTime(cd, ct);
			
			uh.createAuction(itemType, "", 
					new String[]{name, description}, datetime, 
					reserve, initialAmount, minIncrement);
			
			%>

			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
			</html>
			
			<%
		}
		else
		{
			%>

			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/NewAuctionPage.jsp'" />
			</html>
			
			<%
		}
	}
%>