<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	
	//Clothing, Computer, Vehicle, Other
	String itemType=request.getParameter("category");

	System.out.println("IT="+itemType);
	
	userHandler.UserHandler uh=new userHandler.UserHandler();
	
	/*System.out.println(cd);
	System.out.println(ct);
	System.out.println(reserve);
	System.out.println(initialAmount);
	System.out.println(minIncrement);*/
	
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
			String company=request.getParameter("braceletCompany");
			String size=request.getParameter("braceletSize");
			String material=request.getParameter("braceletMaterial");
			String cd=request.getParameter("braceletCd"); //Closing date
			String ct=request.getParameter("braceletCt"); //Closing time
			String reserve=request.getParameter("braceletReserve");
			String initialAmount=request.getParameter("braceletInitial");
			String minIncrement=request.getParameter("braceletMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("earringsCompany");
			String material=request.getParameter("earringsMaterial");
			String cd=request.getParameter("earringsCd"); //Closing date
			String ct=request.getParameter("earringsCt"); //Closing time
			String reserve=request.getParameter("earringsReserve");
			String initialAmount=request.getParameter("earringsInitial");
			String minIncrement=request.getParameter("earringsMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String style=request.getParameter("hatsStyle");
			String size=request.getParameter("hatsSize");
			String color=request.getParameter("hatsColor");
			String cd=request.getParameter("hatsCd"); //Closing date
			String ct=request.getParameter("hatsCt"); //Closing time
			String reserve=request.getParameter("hatsReserve");
			String initialAmount=request.getParameter("hatsInitial");
			String minIncrement=request.getParameter("hatsMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("necklaceCompany");
			String size=request.getParameter("necklaceSize");
			String material=request.getParameter("necklaceMaterial");
			String cd=request.getParameter("necklaceCd"); //Closing date
			String ct=request.getParameter("necklaceCt"); //Closing time
			String reserve=request.getParameter("necklaceReserve");
			String initialAmount=request.getParameter("necklaceInitial");
			String minIncrement=request.getParameter("necklaceMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("pantsCompany");
			String mf=request.getParameter("pantsMf");
			String size=request.getParameter("pantsSize");
			String material=request.getParameter("pantsMaterial");
			String color=request.getParameter("pantsColor");
			String cd=request.getParameter("pantsCd"); //Closing date
			String ct=request.getParameter("pantsCt"); //Closing time
			String reserve=request.getParameter("pantsReserve");
			String initialAmount=request.getParameter("pantsInitial");
			String minIncrement=request.getParameter("pantsMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("shirtsCompany");
			String mf=request.getParameter("shirtsMf");
			String size=request.getParameter("shirtsSize");
			String material=request.getParameter("shirtsMaterial");
			String color=request.getParameter("shirtsColor");
			String cd=request.getParameter("shirtsCd"); //Closing date
			String ct=request.getParameter("shirtsCt"); //Closing time
			String reserve=request.getParameter("shirtsReserve");
			String initialAmount=request.getParameter("shirtsInitial");
			String minIncrement=request.getParameter("shirtsMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("shoesCompany");
			String model=request.getParameter("shoesModel");
			String mf=request.getParameter("shoesMf");
			String size=request.getParameter("shoesSize");
			String color=request.getParameter("shoesColor");
			String cd=request.getParameter("shoesCd"); //Closing date
			String ct=request.getParameter("shoesCt"); //Closing time
			String reserve=request.getParameter("shoesReserve");
			String initialAmount=request.getParameter("shoesInitial");
			String minIncrement=request.getParameter("shoesMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("socksCompany");
			String size=request.getParameter("socksSize");
			String color=request.getParameter("socksColor");
			String cd=request.getParameter("socksCd"); //Closing date
			String ct=request.getParameter("socksCt"); //Closing time
			String reserve=request.getParameter("socksReserve");
			String initialAmount=request.getParameter("socksInitial");
			String minIncrement=request.getParameter("socksMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("ugCompany");
			String size=request.getParameter("ugSize");
			String color=request.getParameter("ugColor");
			String cd=request.getParameter("ugCd"); //Closing date
			String ct=request.getParameter("ugCt"); //Closing time
			String reserve=request.getParameter("ugReserve");
			String initialAmount=request.getParameter("ugInitial");
			String minIncrement=request.getParameter("ugMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String company=request.getParameter("watchCompany");
			String model=request.getParameter("watchModel");
			String color=request.getParameter("watchColor");
			String material=request.getParameter("watchMaterial");
			String cd=request.getParameter("watchCd"); //Closing date
			String ct=request.getParameter("watchCt"); //Closing time
			String reserve=request.getParameter("watchReserve");
			String initialAmount=request.getParameter("watchInitial");
			String minIncrement=request.getParameter("watchMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, clothingType, 
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
			String year=request.getParameter("aioYear");
			String company=request.getParameter("aioCompany");
			String model=request.getParameter("aioModel");
			String screensize=request.getParameter("aioScreensize");
			String color=request.getParameter("aioColor");
			String cpu=request.getParameter("aioCpu");
			String gpu=request.getParameter("aioGpu");
			String cd=request.getParameter("aioCd"); //Closing date
			String ct=request.getParameter("aioCt"); //Closing time
			String reserve=request.getParameter("aioReserve");
			String initialAmount=request.getParameter("aioInitial");
			String minIncrement=request.getParameter("aioMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, computerType, 
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
			String year=request.getParameter("desktopYear");
			String company=request.getParameter("desktopCompany");
			String model=request.getParameter("desktopModel");
			String color=request.getParameter("desktopColor");
			String cpu=request.getParameter("desktopCpu");
			String gpu=request.getParameter("desktopGpu");
			String cd=request.getParameter("desktopCd"); //Closing date
			String ct=request.getParameter("desktopCt"); //Closing time
			String reserve=request.getParameter("desktopReserve");
			String initialAmount=request.getParameter("desktopInitial");
			String minIncrement=request.getParameter("desktopMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, computerType, 
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
			String year=request.getParameter("laptopYear");
			String company=request.getParameter("laptopCompany");
			String model=request.getParameter("laptopModel");
			String screensize=request.getParameter("laptopScreensize");
			String color=request.getParameter("laptopColor");
			String cpu=request.getParameter("laptopCpu");
			String gpu=request.getParameter("laptopGpu");
			String cd=request.getParameter("laptopCd"); //Closing date
			String ct=request.getParameter("laptopCt"); //Closing time
			String reserve=request.getParameter("laptopReserve");
			String initialAmount=request.getParameter("laptopInitial");
			String minIncrement=request.getParameter("laptopMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, computerType, 
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
			String year=request.getParameter("apYear");
			String make=request.getParameter("apMake");
			String model=request.getParameter("apModel");
			String condition=request.getParameter("apCondition");
			String cd=request.getParameter("apCd"); //Closing date
			String ct=request.getParameter("apCt"); //Closing time
			String reserve=request.getParameter("apReserve");
			String initialAmount=request.getParameter("apInitial");
			String minIncrement=request.getParameter("apMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
			String year=request.getParameter("boatYear");
			String make=request.getParameter("boatMake");
			String model=request.getParameter("boatModel");
			String condition=request.getParameter("boatCondition");
			String cd=request.getParameter("boatCd"); //Closing date
			String ct=request.getParameter("boatCt"); //Closing time
			String reserve=request.getParameter("boatReserve");
			String initialAmount=request.getParameter("boatInitial");
			String minIncrement=request.getParameter("boatMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
			String year=request.getParameter("busYear");
			String make=request.getParameter("busMake");
			String model=request.getParameter("busModel");
			String condition=request.getParameter("busCondition");
			String mileage=request.getParameter("busMileage");
			String cd=request.getParameter("busCd"); //Closing date
			String ct=request.getParameter("busCt"); //Closing time
			String reserve=request.getParameter("busReserve");
			String initialAmount=request.getParameter("busInitial");
			String minIncrement=request.getParameter("busMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
			String year=request.getParameter("carYear");
			String make=request.getParameter("carMake");
			String model=request.getParameter("carModel");
			String color=request.getParameter("carColor");
			String condition=request.getParameter("carCondition");
			String mileage=request.getParameter("carMileage");
			String fueltype=request.getParameter("carFueltype");
			String transmission=request.getParameter("carTransmission");
			String cd=request.getParameter("carCd"); //Closing date
			String ct=request.getParameter("carCt"); //Closing time
			String reserve=request.getParameter("carReserve");
			String initialAmount=request.getParameter("carInitial");
			String minIncrement=request.getParameter("carMinInc");
			
			System.out.println(cd);
			System.out.println(ct);
			System.out.println(reserve);
			System.out.println(initialAmount);
			System.out.println(minIncrement);
			
			if(cd != null
					&& ct != null
					&& reserve != null
					&& initialAmount != null
					&& minIncrement != null)
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
				/*System.out.println(cd != null);
				System.out.println(ct != null);
				System.out.println(reserve != null);
				System.out.println(initialAmount != null);
				System.out.println(minIncrement != null);
				System.out.println(uh.isNumber(initialAmount));
				System.out.println(uh.isNumber(minIncrement));
				System.out.println(uh.isNumber(reserve));
				System.out.println(!uh.hasDatePassed(cd, ct));*/

				
				
				
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
			String year=request.getParameter("mcYear");
			String make=request.getParameter("mcMake");
			String model=request.getParameter("mcModel");
			String color=request.getParameter("mcColor");
			String condition=request.getParameter("mcCondition");
			String mileage=request.getParameter("mcMileage");
			String cd=request.getParameter("mcCd"); //Closing date
			String ct=request.getParameter("mcCt"); //Closing time
			String reserve=request.getParameter("mcReserve");
			String initialAmount=request.getParameter("mcInitial");
			String minIncrement=request.getParameter("mcMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
			String year=request.getParameter("offroadYear");
			String make=request.getParameter("offroadMake");
			String model=request.getParameter("offroadModel");
			String condition=request.getParameter("offroadCondition");
			String cd=request.getParameter("offroadCd"); //Closing date
			String ct=request.getParameter("offroadCt"); //Closing time
			String reserve=request.getParameter("offroadReserve");
			String initialAmount=request.getParameter("offroadInitial");
			String minIncrement=request.getParameter("offroadMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
			String year=request.getParameter("truckYear");
			String make=request.getParameter("truckMake");
			String model=request.getParameter("truckModel");
			String condition=request.getParameter("truckCondition");
			String mileage=request.getParameter("truckMileage");
			String cd=request.getParameter("truckCd"); //Closing date
			String ct=request.getParameter("truckCt"); //Closing time
			String reserve=request.getParameter("truckReserve");
			String initialAmount=request.getParameter("truckInitial");
			String minIncrement=request.getParameter("truckMinInc");
			
			if(cd != null && !cd.trim().isEmpty()
					&& ct != null && !ct.trim().isEmpty()
					&& reserve != null && !reserve.trim().isEmpty()
					&& initialAmount != null && !initialAmount.trim().isEmpty()
					&& minIncrement != null && !minIncrement.trim().isEmpty()
					&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
					&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
			{
				String datetime=uh.convertToDateTime(cd, ct);
				
				uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, vehicleType, 
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
		String cd=request.getParameter("Cd"); //Closing date
		String ct=request.getParameter("Ct"); //Closing time
		String reserve=request.getParameter("otherReserve");
		String initialAmount=request.getParameter("otherInitial");
		String minIncrement=request.getParameter("otherMinInc");
		
		if(cd != null && !cd.trim().isEmpty()
				&& ct != null && !ct.trim().isEmpty()
				&& reserve != null && !reserve.trim().isEmpty()
				&& initialAmount != null && !initialAmount.trim().isEmpty()
				&& minIncrement != null && !minIncrement.trim().isEmpty()
				&& uh.isNumber(initialAmount) && uh.isNumber(minIncrement)
				&& uh.isNumber(reserve) && !uh.hasDatePassed(cd, ct))
		{
			String datetime=uh.convertToDateTime(cd, ct);
			
			uh.createAuction((String)session.getAttribute("LOGIN_USER"), itemType, "", 
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