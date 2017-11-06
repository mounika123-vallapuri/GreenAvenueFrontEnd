<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  			<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Products</title>
<link rel="stylesheet" href="resources/css/Pretty-Footer.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style type="text/css">
		        .product_view .modal-dialog{max-width: 800px; width: 100%;}
        .pre-cost{text-decoration: line-through; color: #a5a5a5;}
        .space-ten{padding: 10px 0;}

.bs-example{
    	margin: 0px;
    }
</style>



</head>



<nav id ="navbar-red" class="navbar-inverse"role="navigation">
			
			<div class="container-fluid">
				<ul="nav navbar-nav">
					<button type="button"class="navbar-toggle collapsed datatoggle="collapse"data target="bs-example-nav">
						<span class="sr-only">toggle navigation</span>
						<span class="icon_bar"></span>
		
						<span class="icon_bar"></span>
					</button>
				</ul>
				
			</div>
		
			<div class="collapse navbar-collapse"id=bs-example-nav>
			<a class="navbar-brand" href="home">Green-Avenue</a>
			
				<ul class="nav navbar-nav navbar-right">
					
					<!--  <li><a href="home">Home</a></li>-->
					
			        <sec:authorize access="isAuthenticated()">
                 <li><a href="<c:url value="j_spring_security_logout"/>">Logout</a></li>
              
                  </sec:authorize>
	
						
				</ul>
	  		</div>
	  	</nav>

<body>
 <!--  	======================== -->
	
	  	  	
	<c:forEach items="${pList}" var="product">
   <div class="container">
    <div class="row">
        <div class="col-md-4">
              <div class="thumbnail">
       <img src="/GreenAvenueFrontEnd/myImage/imageDisplay?id=${product.productId}" alt="" width="300" height="200"  alt="" class="img-responsive">
                <div class="caption">
                  <h4 class="pull-right">${product.price}</h4>
                  <h4><a href="#">${product.productName}</a></h4>
                  <p>${product.productDesc}</p>
                </div>
                <div class="ratings">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                     (15 reviews)
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                   <form:form action="addToCart/${product.productId}" method="POST">
                <button class="btn btn-default" type="submit">Add to cart</button>
                </form:form>
        <!--             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i class="fa fa-search"></i> Quick View</button>--->
            </div>
              </div>
            </div>
 
    
    </c:forEach>  
	  
	<jsp:include page="footer.jsp"></jsp:include>  

        </body>
</html>