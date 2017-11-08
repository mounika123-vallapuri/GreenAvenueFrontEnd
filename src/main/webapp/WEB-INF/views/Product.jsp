<%@ page language="java" import="com.spring.model.Product" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  			<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product</title>

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
  color:#17202A;
}

h2 {
  font-size:1em; 
  font-weight: 300;
  text-align: center;
  display: block;
  line-height:1em;
  padding-bottom: 2em;
  color:#17202A;
}

h2 a {
  font-weight: 700;
  text-transform: uppercase;
  color:#17202A;
  text-decoration: none;
}

.blue { color: #185875; }
.yellow { color: #FFF842; }

.container th h1 {
	  font-weight: bold;
	  font-size: 1em;
  text-align: left;
  color:#17202A ;
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
	  background-color:#EAEDED;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	  background-color:#EAEDED;
}

.container th {
	  background-color:#A9DFBF ;
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


<body background="${pageContext.request.contextPath}/resources/images/Full-hd-Nature-Backgrounds-Free-Download.jpg">

<h3>
		<c:if test="${product.productId==0}">
	            </c:if>
			<c:if test="${!empty product.productId}">
		      <c:out value="${product.productId}" />
				 
			</c:if>
			</h3>
		
		<form:form action="saveProduct" modelAttribute="product" enctype="multipart/form-data" id="btn-add">
<h2><a href="#" target="_blank">Don't be greedy,it's time to be greeny.</a></h2>
		<table align="center" cellspacing="2" class="container">

				 <tr>
					<form:input path="productId" type="hidden"/>
				</tr>
		
			<tr align="center">
				<td colspan="2">Product Detail</td>
			</tr>	
		
	
		
			<tr align="center">
				<td>Product Name</td>
				<td><form:input path="productName"/></td>
			</tr>
	
			<tr align="center">				<td>Product Desc</td>
				<td><form:textarea path="productDesc"/></td>
			</tr>
	
	
		<tr align="center">
				<td>Product Stock</td>
				<td><form:input path="stock"/></td>
			</tr>
	
	
			<tr align="center">
				<td>Product Price</td>
				<td><form:input path="price"/></td>
			</tr>
	
	
			<tr align="center">
				<td>Category</td>
				<td>
					<form:select path="catId">
					<form:option value="0" label="---Select---"/>
					<form:options items="${categoriesList}" />
					</form:select>
				</td>
			</tr>



			<tr align="center">
				<td>Supplier</td>
				<td>
					<form:select path="supplierId">
					<form:option value="0" label="---Select---"/>
					<form:options items="${suppliersList}" />
				
					</form:select>
				</td>
			</tr>
	
	
			<tr align="center">
				<td>Product Image</td>
				<td align="center"><input type="file" name="file"/></td>
			</tr> 
	
	
			<tr align="center">
				<td colspan="2">
						<c:if test="${product.productId==0}">
		<input type="submit" value="Add Product" id="btn-add" class="btn btn-primary" >
		
		</c:if> <c:if test="${product.productId!=0}">
		
	   <input type="submit" value="updateProduct" id="btn-update" class="btn btn-primary" >
	  </c:if>
				</td>
			</tr>
	
		</table>
		</form:form>


		<table cellspacing="2" align="center" class="container">
				<thead>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Product Description</th>
					<th>Product Stock</th>
					<th>Product Price</th>
					<th>Category</th>
					<th>Supplier</th>
					<th>Product Image</th>
					<th>Operation</th>					
				</tr>
	</thead>
	<tbody>
		<c:forEach items="${productList}" var="product">
			<tr>
				<td>${product.productId}</td>
				<td>${product.productName}</td>
				<td>${product.productDesc}</td>
				<td>${product.stock}</td>
				<td>${product.price}</td>
				<td>${product.catId}</td>
				<td>${product.supplierId}</td>
				<td>${product.image}</td>
				<td>
			
						<a href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a>
						<a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>
				</td>
			</tr>
		</c:forEach>
</tbody>

</table>

	</body>
	
	
</html>

<jsp:include page="footer.jsp"></jsp:include>