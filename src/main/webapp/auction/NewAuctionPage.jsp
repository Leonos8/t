<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	String userid=(String)session.getAttribute("LOGIN_USER");
	if(userid==null)
	{
    	response.sendRedirect("../login/LoginPage.jsp");
    	return; //the return is important; forces redirect to go now
	}
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>New Auction</title>
		
		<style>
			.hidden_div 
			{
    			display: none;
			}
		</style>
		
		<script type="text/javascript">
			function hideDiv()
			{
		    	document.getElementById('clothingType_div').style.display = "none";
				document.getElementById('computerType_div').style.display = "none";
		    	document.getElementById('vehicleType_div').style.display = "none";
		    	document.getElementById('other_div').style.display = "none";
				
				hideClothingDiv();
				
				hideComputerDiv();
				
				hideVehicleDiv();
			}
			
			function hideCategoryDiv()
			{
				document.getElementById('clothingType_div').style.display = "none";
				document.getElementById('computerType_div').style.display = "none";
				document.getElementById('vehicleType_div').style.display = "none";
			}
			
			
			function hideClothingDiv()
			{
				document.getElementById('bracelet_div').style.display = "none";
				document.getElementById('earrings_div').style.display = "none";
				document.getElementById('hats_div').style.display = "none";
				document.getElementById('necklace_div').style.display = "none";
				document.getElementById('pants_div').style.display = "none";
				document.getElementById('shirts_div').style.display = "none";
				document.getElementById('shoes_div').style.display = "none";
				document.getElementById('socks_div').style.display = "none";
				document.getElementById('undergarments_div').style.display = "none";
				document.getElementById('watch_div').style.display = "none";
			}
			
			function hideComputerDiv()
			{
				document.getElementById('aio_div').style.display = "none";
				document.getElementById('desktop_div').style.display = "none";
				document.getElementById('laptop_div').style.display = "none";

			}
			
			function hideOtherDiv()
			{
		    	document.getElementById('other_div').style.display = "none";
			}
			
			function hideVehicleDiv()
			{
				document.getElementById('airplane_div').style.display = "none";
		    	document.getElementById('boat_div').style.display = "none";
		    	document.getElementById('bus_div').style.display = "none";
		    	document.getElementById('car_div').style.display = "none";
		    	document.getElementById('motorcycle_div').style.display = "none";
		    	document.getElementById('offroad_div').style.display = "none";
		    	document.getElementById('truck_div').style.display = "none";
			}
			
			function showCategoryDiv(select)
			{
				hideCategoryDiv();
				hideClothingDiv();
				hideComputerDiv();
				hideOtherDiv();
				hideVehicleDiv();
				
				if(select.value=="clothing")
			   	{
			    	document.getElementById('clothingType_div').style.display = "block";
			   	} 
				else if(select.value=="computers")
				{
					document.getElementById('computerType_div').style.display = "block";
				}
				else if(select.value=="vehicles")
			   	{
			    	document.getElementById('vehicleType_div').style.display = "block";
			   	}
				else if(select.value=="other")
				{
			    	document.getElementById('other_div').style.display = "block";

				}
				else if(select.value="none")
			 	{
			   	 	hideDiv();
			   	}
			}
			
			function showClothingDiv(select)
			{
				hideClothingDiv();
				
				if(select.value=="bracelet")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('bracelet_div').style.display = "block";
				}
				else if(select.value=="earrings")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('earrings_div').style.display = "block";
				}
				else if(select.value=="hats")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('hats_div').style.display = "block";
				}
				else if(select.value=="necklace")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('necklace_div').style.display = "block";
				}
				else if(select.value=="pants")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('pants_div').style.display = "block";
				}
				else if(select.value=="shirts")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('shirts_div').style.display = "block";
				}
				else if(select.value=="shoes")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('shoes_div').style.display = "block";
				}
				else if(select.value=="socks")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('socks_div').style.display = "block";
				}
				else if(select.value=="undergarments")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('undergarments_div').style.display = "block";
				}
				else if(select.value=="watch")
				{
					document.getElementById('clothingType_div').style.display = "block";
			    	document.getElementById('watch_div').style.display = "block";
				}
				else if(select.value=="na")
			   	{
			    	hideClothingDiv();
			   	}
			}
			
			function showComputerDiv(select)
			{
				hideComputerDiv();
				
				if(select.value=="aio")
				{
					document.getElementById('computerType_div').style.display = "block";
					document.getElementById('aio_div').style.display = "block";
				}
				else if(select.value=="desktop")
				{
					document.getElementById('computerType_div').style.display = "block";
					document.getElementById('desktop_div').style.display = "block";
				}
				else if(select.value=="laptop")
				{
					document.getElementById('computerType_div').style.display = "block";
					document.getElementById('laptop_div').style.display = "block";
				}
				else if(select.value=="na")
			   	{
			    	hideComputerDiv();
			   	}
			}
			
			function showVehicleDiv(select)
			{
				hideVehicleDiv();
				
			   	if (select.value=="airplane")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('airplane_div').style.display = "block";
				}
			   	else if(select.value=="boat")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('boat_div').style.display = "block";
				}
			   	else if(select.value=="bus")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('bus_div').style.display = "block";
				}
			   	else if(select.value=="car")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('car_div').style.display = "block";
				}
			   	else if(select.value=="motorcycle")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('motorcycle_div').style.display = "block";
				}
			   	else if(select.value=="offroad")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('offroad_div').style.display = "block";
				}
			   	else if(select.value=="truck")
				{
			    	document.getElementById('vehicleType_div').style.display = "block";
			    	document.getElementById('truck_div').style.display = "block";
				}
			   	else if(select.value=="na")
			   	{
			    	hideVehicleDiv();
			   	}
			} 
		</script>
	</head>
	<body onload="hideDiv()">
		<form action="../Processing/NAProcessing.jsp" method="post">
  			<div class="container">
    			<label for="category">Choose a category:</label>
  				<select name="category" id="category" onchange="showCategoryDiv(this)">
   	 				<option value="none">NA</option>
   	 				<option value="clothing">Clothing</option>
   	 				<option value="computers">Computers</option>
   	 				<option value="vehicles">Vehicles</option>
    				<option value="other">Other</option>
  				</select>
  				
  				<!-- Clothing -->
  				
  				<div id="clothingType_div">
					<label for="clothing">Choose a clothing type:</label>
					<select name="clothing" id="clothing" onchange="showClothingDiv(this)">
   	 					<option value="na">NA</option>
   	 					<option value="bracelet">Bracelet</option>
   	 					<option value="earrings">Earrings</option>
   	 					<option value="hats">Hats</option>
   	 					<option value="necklace">Necklace</option>
   	 					<option value="pants">Pants</option>
   	 					<option value="shirts">Shirts</option>
    					<option value="shoes">Shoes</option>
    					<option value="socks">Socks</option>
    					<option value="undergarment">Undergarment</option>
    					<option value="watch">Watch</option>
  				</select>
				</div>
				
				<div id="bracelet_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="braceletCompany">
    				
    				<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter Size" name="braceletSize">
    				
    				<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter material" name="braceletMaterial">
				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="braceletCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="braceletCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="braceletReserve">
    				
    				<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="braceletInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="braceletMinInc">
				</div>
				
				<div id="earrings_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="earringsCompany">
    				
    				<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter material" name="earringsMaterial">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="earringsCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="earringsCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="earringsReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="earringsInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="earringsMinInc">
				</div>
				
				<div id="hats_div">
					<label for="style"><br><b>Style:</b></label>
    				<input type="text" placeholder="Enter style" name="hatsStyle">
    				
    				<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="hatsSize">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter color" name="hatsColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="hatsCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="hatsCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="hatsReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="hatsInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="hatsMinInc">
				</div>
				
				<div id="necklace_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="necklaceCompany">
    				
    				<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="necklaceSize">
    				
    				<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter material" name="necklaceMaterial">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="necklaceCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="necklaceCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="necklaceReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="necklaceInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="necklaceMinInc">
				</div>
				
				<div id="pants_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="pantsCompany">
				
					<label for="mf"><br><b>M/F:</b></label>
    				<input type="text" placeholder="M/F" name="pantsMf">
				
					<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="pantsSize">
				
					<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter Material" name="pantsMaterial">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter Color" name="pantsColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="pantsCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="pantsCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="pantsReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="pantsInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="pantsMinInc">
				</div>
				
				<div id="shirts_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="shirtsCompany">
				
					<label for="mf"><br><b>M/F:</b></label>
    				<input type="text" placeholder="M/F" name="shirtsMf">
				
					<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="shirtsSize">
				
					<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter Material" name="shirtsMaterial">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter Color" name="shirtsColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="shirtsCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="shirtsCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="shirtsReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="shirtsInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="shirtsMinInc">
				</div>
				
				<div id="shoes_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="shoesCompany">
				
					<label for="model"><br><b>Model:</b></label>
    				<input type="text" placeholder="Enter model" name="shoesModel">
				
					<label for="mf"><br><b>M/F:</b></label>
    				<input type="text" placeholder="M/F" name="shoesMf">
				
					<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="shoesSize">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter Color" name="shoesColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="shoesCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="shoesCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="shoesReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="shoesInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="shoesMinInc">
				</div>
				
				<div id="socks_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="socksCompany">
    				
    				<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="socksSize">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter color" name="socksColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="socksCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name=socksCt>
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="socksReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="socksInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="socksMinInc">
				</div>
				
				<div id="undergarments_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="ugCompany">
    				
					<label for="size"><br><b>Size:</b></label>
    				<input type="text" placeholder="Enter size" name="ugSize">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter color" name="ugColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="ugCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="ugCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="ugReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="ugInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="ugMinInc">
				</div>
				
				<div id="watch_div">
					<label for="company"><br><b>Company:</b></label>
    				<input type="text" placeholder="Enter company" name="watchCompany">
    				
					<label for="model"><br><b>Model:</b></label>
    				<input type="text" placeholder="Enter model" name="watchModel">
    				
    				<label for="material"><br><b>Material:</b></label>
    				<input type="text" placeholder="Enter material" name="watchMaterial">
    				
    				<label for="color"><br><b>Color:</b></label>
    				<input type="text" placeholder="Enter color" name="watchColor">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="watchCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="watchCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="watchReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="watchInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="watchMinInc">
				</div>
				
				<!-- Computers -->
				
				<div id="computerType_div">
					<label for="computer">Choose a computer type:</label>
					<select name="computer" id="computer" onchange="showComputerDiv(this)">
   	 					<option value="na">NA</option>
   	 					<option value="aio">All-In-One</option>
   	 					<option value="desktop">Desktop</option>
   	 					<option value="laptop">Laptop</option>
  				</select>
				</div>
				
				<div id="aio_div">
					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter year" name="aioYear">
				
					<label for="company"><br>Company:</label>
    				<input type="text" placeholder="Enter company" name="aioCompany">
    				
					<label for="model"><br>Model:</label>
    				<input type="text" placeholder="Enter model" name="aioModel">
    				
    				<label for="screensize"><br>Screensize(in):</label>
    				<input type="text" placeholder="Enter screensize" name="aioScreensize">
    				
    				<label for="color"><br>Color:</label>
    				<input type="text" placeholder="Enter color" name="aioColor">
    				
    				<label for="cpu"><br>CPU:</label>
    				<input type="text" placeholder="Enter CPU" name="aioCpu">
    				
    				<label for="gpu"><br>GPU:</label>
    				<input type="text" placeholder="Enter GPU" name="aioGpu">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="aioCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="aioCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="aioReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="aioInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="aioMinInc">
				</div>
				
				<div id="desktop_div">
					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter year" name="desktopYear">
				
					<label for="company"><br>Company:</label>
    				<input type="text" placeholder="Enter company" name="desktopCompany">
    				
					<label for="model"><br>Model:</label>
    				<input type="text" placeholder="Enter model" name="desktopModel">
    				
    				<label for="color"><br>Color:</label>
    				<input type="text" placeholder="Enter color" name="desktopColor">
    				
    				<label for="cpu"><br>CPU:</label>
    				<input type="text" placeholder="Enter CPU" name="desktopCpu">
    				
    				<label for="gpu"><br>GPU:</label>
    				<input type="text" placeholder="Enter GPU" name="desktopGpu">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="desktopCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="desktopCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="desktopReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="desktopInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="desktopMinInc">
				</div>
				
				<div id="laptop_div">
					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter year" name="laptopYear">
				
					<label for="company"><br>Company:</label>
    				<input type="text" placeholder="Enter company" name="laptopCompany">
    				
					<label for="model"><br>Model:</label>
    				<input type="text" placeholder="Enter model" name="laptopModel">
    				
    				<label for="screensize"><br>Screensize(in):</label>
    				<input type="text" placeholder="Enter screensize" name="laptopScreensize">
    				
    				<label for="color"><br>Color:</label>
    				<input type="text" placeholder="Enter color" name="laptopColor">
    				
    				<label for="cpu"><br>CPU:</label>
    				<input type="text" placeholder="Enter CPU" name="laptopCpu">
    				
    				<label for="gpu"><br>GPU:</label>
    				<input type="text" placeholder="Enter GPU" name="laptopGpu">
    				
					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="laptopCd">
    			
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="laptopCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="laptopReserve">
				
					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="laptopInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="laptopMinInc">
				</div>
				
  				<!-- Vehicles -->
  					
				<div id="vehicleType_div">
					<label for="vehicle">Choose a vehicle type:</label>
					<select name="vehicle" id="vehicle" onchange="showVehicleDiv(this)">
   	 					<option value="na">NA</option>
   	 					<option value="airplane">Airplane</option>
   	 					<option value="boat">Boat</option>
    					<option value="bus">Bus</option>
    					<option value="car">Car</option>
    					<option value="motorcycle">Motorcycle</option>
    					<option value="offroad">Off-Road Vehicle</option>
    					<option value="truck">Truck</option>
  				</select>
				</div>
				
				<div id="airplane_div">
					<label for="airplanebodytype">Body type:</label>
					<select name="airplanebodytype" id="airplanebodytype">
   	 					<option value="custom">Custom Aircraft</option>
   	 					<option value="largecabin">Large Cabin Jets</option>   				
    					<option value="lightjets">Light Jets</option>
   	 					<option value="midjets">Midsize Jets</option>
   	 					<option value="multipiston">Multi-Engine Piston Aircraft</option>
   	 					<option value="turbo">Turbocharged Aircraft</option>
   	 					<option value="singlepiston">Single-Engine piston Aircraft</option>
   	 					<option value="supermid">Super Midsize Jets</option>
    					<option value="vlcabin">Very Large Jets</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="apYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="apMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="apModel">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="apCondition">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="apCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="apCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="apReserve">
  				
  					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="apInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="apMinInc">
  				</div>
  				
  				<div id="boat_div">
					<label for="boatbodytype">Body type:</label>
					<select name="boatbodytype" id="boatbodytype">
   	 					<option value="canoe">Canoe</option>
   	 					<option value="jetski">Jetski</option>
    					<option value="kayak">Kayak</option>
    					<option value="sailboat">Sailboat</option>
    					<option value="yacht">Yacht</option>
   	 					<option value="other">Other</option>  				
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="boatYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="boatMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="boatModel">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="boatCondition">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="boatCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="boatCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="boatReserve">
  				
  					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="boatInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="boatMinInc">
  				</div>
        		
        		<div id="bus_div">
					<label for="busbodytype">Body type:</label>
					<select name="busbodytype" id="busbodytype">
   	 					<option value="midsize">Midsize bus</option>
   	 					<option value="reservei">Minibus</option>
   	 					<option value="motor">Motor Coach</option>
    					<option value="motorhome">Motorhome</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="busYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="busMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="busModel">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="busCondition">
    				
    				<label for="mileage"><br>mileage:</label>
    				<input type="text" placeholder="Enter mileage" name="busMileage">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="busCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="busCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="busReserve">
  			
  					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="busInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="busMinInc">
  				</div>
        		
        		<div id="car_div">
					<label for="carbodytype">Body type:</label>
					<select name="carbodytype" id="carbodytype">
						<option value="convertible">Convertible</option>
						<option value="coupe">Coupe</option>
						<option value="hatchback">Hatchback</option>
						<option value="reserveivan">Minivan</option>
						<option value="pickup">Pickup Truck</option>
   	 					<option value="sedan">Sedan</option>
   	 					<option value="sports">Sports Car</option>
    					<option value="station">Station Wagon</option>
   	 					<option value="suv">SUV</option>
						<option value="van">Van</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="carYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="carMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="carModel">
					
					<label for="color"><br>Color:</label>
    				<input type="text" placeholder="Enter color" name="carColor">
					
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="carCondition">
    				
    				<label for="mileage"><br>Mileage:</label>
    				<input type="text" placeholder="Enter mileage" name="carMileage">
    				
    				<label for="fueltype"><br>Gas, Electric, or Hybrid:</label>
    				<input type="text" placeholder="Gas, Electric, or Hybrid" name="carFueltype">
    				
    				<label for="transmission"><br>Transmission:</label>
    				<input type="text" placeholder="Automatic or Manual" name="carTransmission">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="carCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="carCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="carReserve">
    				
    				<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="carInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="carMinInc">
  				</div>
        		
        		<div id="motorcycle_div">
					<label for="motorcyclebodytype">Body type:</label>
					<select name="motorcyclebodytype" id="motorcyclebodytype">
   	 					<option value="dualsport">Dual-sport</option>
   	 					<option value="cruiser">Cruiser</option>
   	 					<option value="electric">Electric</option>
   	 					<option value="sportbike">Sportbike</option>
    					<option value="standard">Standard</option>
    					<option value="touring">Touring</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="mcYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="mcMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="mcModel">
				
					<label for="color"><br>Color:</label>
    				<input type="text" placeholder="Enter color" name="mcColor">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="mcCondition">
    				
    				<label for="mileage"><br>Mileage:</label>
    				<input type="text" placeholder="Enter mileage" name="mcMileage">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="mcCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="mcCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="mcReserve">
  				
  					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="mcInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="mcMinInc">
  				</div>
        		
        		<div id="offroad_div">
					<label for="offroadbodytype">Body type:</label>
					<select name="offroadbodytype" id="offroadbodytype">
   	 					<option value="atv">ATV</option>
   	 					<option value="dunebuggy">Dune Buggy</option>
   	 					<option value="motocrossbike">Motocross Bike</option>
    					<option value="utv">UTV</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="offroadYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="offroadMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="offroadModel">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="offroadCondition">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="offroadCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="offroadCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="offroadReserve">
    				
    				<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="offroadInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="offroadMinInc">
  				</div>     		
    			
    			<div id="truck_div">    			
					<label for="truckbodytype">Body type:</label>
					<select name="truckbodytype" id="truckbodytype">
						<option value="dump">Dump Truck</option>
   	 					<option value="flatbed">Flatbed Truck</option>
   	 					<option value="refrigerated">Refrigerated Truck</option>
    					<option value="tow">Tow Truck</option>
    					<option value="utility">Utility Truck</option>
    					<option value="other">Other</option>
  					</select>
  				
  					<label for="year"><br>Year:</label>
    				<input type="text" placeholder="Enter Year" name="truckYear">
				
					<label for="make"><br>Make:</label>
    				<input type="text" placeholder="Enter Make" name="truckMake">
    			
    				<label for="model"><br>model:</label>
    				<input type="text" placeholder="Enter model" name="truckModel">
				
					<label for="condition"><br>Used or new:</label>
    				<input type="text" placeholder="Used or new" name="truckCondition">
    				
    				<label for="mileage"><br>Mileage:</label>
    				<input type="text" placeholder="Enter mileage" name="truckMileage">
    				
    				<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="truckCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="truckCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="truckReserve">
  				
  					<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="truckInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="truckMinInc">
  				</div>
  				
  				<!-- Other -->
  				
  				<div id="other_div">
  				
  					<label for="name"><br>Name of item:</label>
    				<input type="text" placeholder="Enter the name of the item" name="otherName">
  				
  					<label for="description"><br>Description of item(no more than 500 words) :</label>
    				<textarea placeholder="Enter description" name="otherDescription" rows=5 cols=100></textarea>
  					
  					<label for="cd"><br><b>Closing Date(YYYY-MM-DD):</b></label>
    				<input type="text" placeholder="Enter Closing Date" name="otherCd">
    				
    				<label for="ct"><br><b>Closing Time(HH:MM in 24 hour time):</b></label>
    				<input type="text" placeholder="Enter Closing Time" name="otherCt">
  				
  					<label for="reserve"><br><b>Hidden Minimum Price:</b></label>
    				<input type="text" placeholder="Enter Minimum Price" name="otherReserve">
    				
    				<label for="initial"><br><b>Initial Amount:</b></label>
    				<input type="text" placeholder="Enter Initial Amount" name="otherInitial">
  				
  					<label for="minInc"><br><b>Minimum increment:</b></label>
    				<input type="text" placeholder="Enter Minimum Increment" name="otherMinInc">
  				</div>
  				
  				<p>
        			<button class="submit" type="submit">Create Auction</button>
  				</p>
  			</div>
		</form>
	</body>
</html>