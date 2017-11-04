<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
	<head>
			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  			<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
  			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 			<title>Registration Page</title>
 <style type="text/css">
	.bs-example{
    	margin: 0px;
    }
</style>

	</head>
	<body background="${pageContext.request.contextPath}/resources/images/Maldives-Summer-Wallpaper-HD.jpg">
			
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="bs-example">
    <nav id="myNavbar" class="navbar navbar-inverse" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Green-Avenue</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
           </nav>
</div>
    <center>
        <h3>Welcome, Enter The User Details</h3>
        <form:form method="POST" action="saveUser" modelAttribute="user">
             <table>
                <tr>
                    <td><form:label path="username">UserName</form:label></td>
                    <td><form:input path="username"/></td>
                </tr>
                <tr>
                    <td><form:label path="email">Email</form:label></td>
                    <td><form:input path="email"/></td>
                </tr>
                
                      <tr>
                    <td><form:label path="password">Password</form:label></td>
                    <td><form:input path="password"/></td>
                </tr>
                
              
                
                <tr>
                    <td><form:label path="contact">Contact Number</form:label></td>
                    <td><form:input path="contact"/></td>
                </tr>
                
                
                 <tr>
                    <td><form:label path="address">Address</form:label></td>
                    <td><form:input path="address"/></td>
                </tr>
                
                
                
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>
<center>
    </body>
    <jsp:include page="footer.jsp"></jsp:include>
</html>
