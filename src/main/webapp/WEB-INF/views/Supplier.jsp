<%@ page language="java" contentType="text/html" import="com.spring.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>supplier</title>

<style type="text/css">



/*	
	Side Navigation Menu V2, RWD
	===================
	License:
	https://goo.gl/EaUPrt
	===================
	Author: @PableraShow

 */

@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
  font-family: 'Open Sans', sans-serif;
  font-weight: 300;
  line-height: 1.42em;
  color:pink;
  background-color:#1F2739;
}

h1 {
  font-size:3em; 
  font-weight: 300;
  line-height:1em;
  text-align: center;
  color:#17202A  ;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color:#17202A  ;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color:#17202A  ;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color:#17202A   ;
}

.container td {
	  font-weight: normal;
	  font-size: 1em;
  -webkit-box-shadow: 0 2px 2px -2px #0E1119;
	   -moz-box-shadow: 0 2px 2px -2px #0E1119;
	        box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	  text-align: left;
	  overflow: hidden;
	  width: 80%;
	  margin: 0 auto;
  display: table;
  padding: 0 0 8em 0;
}

.container td, .container th {
	  padding-bottom: 2%;
	  padding-top: 2%;
  padding-left:2%;  
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	  background-color:#EAEDED  ;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color:#EAEDED  ;
} 	

.container th {
	  background-color:#A9DFBF  ;
}

.container td:first-child { color:black; }

.container tr:hover {
   background-color:#AED6F1;
-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	   -moz-box-shadow: 0 6px 6px -6px #0E1119;
	        box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
  background-color: #AED6F1;
  color: #403E10;
  font-weight: bold;
  
  box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
  transform: translate3d(6px, -6px, 0);
  
  transition-delay: 0s;
	  transition-duration: 0.4s;
	  transition-property: all;
  transition-timing-function: line;
}

@media (max-width: 800px) {
.container td:nth-child(4),
.container th:nth-child(4) { display: none; }
}


</style>
</head>

<jsp:include page="header.jsp"></jsp:include>

	<body background="${pageContext.request.contextPath}/resources/images/Autumn-nature-backgrounds-wallpaper.jpg">

	   	<!-- <form action="AddSupplier" method="post">-->

			<form:form action="AddSupplier" modelAttribute="supplier">
	<h2><a href="#" target="_blank">Don't be greedy,it's time to be greeny.</a></h2>
			<table align="center" cellspacing="2" class="container">


<tr>	
		<form:input type="hidden" name="supId" path="supId" class="form-control" />
		
		
	</tr>

			<tr align="center">
				<td colspan="2">Supplier Module</td>
			</tr>
			
		
	
			<tr>
				<td>Supplier Name</td>
				<!-- <td><input type="text" name="supName"/></td> -->
				<td><form:input path="supName"/></td>
			</tr>
			
			<tr>
				<td>Supplier Desc</td>
				<!-- <td><input type="text" name="SupDescription"/></td> -->
				<td><form:input path="supDesc"/></td>
			</tr>
				
			<tr>
				<td>Supplier Address</td>
				<!-- <td><input type="text" name="SupAddress"/></td> -->
				<td><form:input path="supAddress"/></td>
			</tr>
	
		<tr>
			<td colspan="2">
				<center><input type="submit" value="Insert"/></center>
			</td>
		</tr>

	</table>
	</form:form>

<table cellspacing="2" align="center" class="container">
	<thead>
	<tr >
		<th>Supplier ID</th>
		<th>Supplier Name</th>
		<th>Supplier Description</th>
		<th>Supplier Address</th>
		<th>Operation</th>
	</tr>
	</thead>
<tbody>
	<c:forEach items="${supplierList}" var="supplier">
		<tr>
			<td>${supplier.supId}</td>
			<td>${supplier.supName}</td>
			<td>${supplier.supDesc}</td>
			<td>${supplier.supAddress}</td>
			<td>
			
				<a href="<c:url value="deleteSupplier/${supplier.supId}"/>">DELETE</a>
				<a href="<c:url value="updateSupplier/${supplier.supId}"/>">UPDATE</a>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
		</body>
		
</html>


<jsp:include page="footer.jsp"></jsp:include>