<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>









<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Barber Shop</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Online Barber Shop</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li><a href="<spring:url value='/user/login'/>">Log Out</a></li>

    </ul>
  </div>
</nav>
  
<div class="container">
 <sf:form>
	<div >
	
	<h2>Appointment Status : ${sessionScope.bookstatus}</h2>
	<h2>Shop Name: ${sessionScope.shop.shopName}: ${sessionScope.shop_location}</h2>
		<h3>Selected Services </h3>
		
		<table border="1" class="table table-striped table-bordered">	
			<tr>
				
				<th>Service Name</th><th>ServiceDescription</th><th>Service Price</th><th>Service Duration</th>
				
				
			</tr>
				<c:forEach var="s" items="${sessionScope.serv}">
					<tr>
		
						<td> ${s.serviceName}</td>
						<td>${s.serviceDescription}</td>
						<td>${s.servicePrice}</td>
						<td>${s.serviceDuration}</td>
				
					</tr>
				</c:forEach>
		
			</table>
		<h3>Selected Slots </h3>
		<table border="1" class="table table-striped table-bordered">
			<tr>
				<th>Slot Id</th><th>Shot Name</th><th>Slot Time</th><th>Available Seats</th><th>Slot Sequence </th>
			</tr>
		<c:forEach var="s" items="${sessionScope.selectedslots}">
		
			<tr>
				<td> ${s.slotId}</td>
				<td>${s.slotName}</td>
				<td>${s.slotTime}</td>
				<td>${s.chaireAvilable}</td>
				<td>${s.slotSequence}</td>

			</tr>
		</c:forEach>
	</table>
	
	</div>
</sf:form>
</div>

</body>
</html>
