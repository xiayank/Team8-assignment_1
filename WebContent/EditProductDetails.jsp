<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Detail</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

     .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }
      footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
     @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
.star-icon {
    color: #ddd;
    font-size: 2em;
    position: relative;
}
.star-icon.full:before {
    text-shadow: 0 0 2px rgba(0,0,0,0.7);
    color: #FDE16D;
    content: '\2605'; /* Full star in UTF-8 */
    position: absolute;
    left: 0;
}
.star-icon.half:before {
    text-shadow: 0 0 2px rgba(0,0,0,0.7);
    color: #FDE16D;
    content: '\2605'; /* Full star in UTF-8 */
    position: absolute;
    left: 0;
    width: 50%;
    overflow: hidden;
}
@-moz-document url-prefix() { /* Firefox Hack :( */
  .star-icon {
    font-size: 50px;
    line-height: 34px;
  }
}
  </style>   

   
</head>
<body>
<!-- navbar-->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home.jsp">SHOPPING YOU WANT!</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">New Arrive</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">MEN<span class="caret"></span></a>
        
        <ul class="dropdown-menu">
          <li><a href="#">SHOES</a></li>
          <li><a href="#">TOP</a></li>
          <li><a href="#">BOTTOM</a></li>
          <li><a href="#">ACCESSORIES</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">WOMEN<span class="caret"></span></a>
        
        <ul class="dropdown-menu">
          <li><a href="#">SHOES</a></li>
          <li><a href="#">TOP</a></li>
          <li><a href="#">BOTTOM</a></li>
          <li><a href="#">ACCESSORIES</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">KIDS<span class="caret"></span></a>
        
        <ul class="dropdown-menu">
          <li><a href="#">SHOES</a></li>
          <li><a href="#">TOP</a></li>
          <li><a href="#">BOTTOM</a></li>
          <li><a href="#">ACCESSORIES</a></li>
        </ul>
      </li>    
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a><span class="glyphicon glyphicon-user"></span> Hi ${userBean.userName}</a></li>
       <li><a href="ViewCurrentOrders.jsp"><span class="glyphicon glyphicon-user"></span> View My Order</a></li>
      <li><a href="ManageProducts"><span class="glyphicon glyphicon-shopping-cart"></span>Manage Product</a></li>
      <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
    </ul>
  </div>

</nav>

<!--detail-->
<!-- Wrapper for slides -->
<!--buttons-->
<div class="container">

<a href="Home.jsp" type="button" class="btn btn-link">Home</a><br>

    

<a href="SearchResult.jsp" type="button" class="btn btn-link">Back to Search</a><br><br>

<div class="row">
  <div class="col-sm-8">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src=${selectedProduct.productThumbnail}  alt="Image">
          <div class="carousel-caption">
            <h3>${selectedProduct.productName }</h3>

          </div>      
        </div>

        <div class="item">
          <img src=${selectedProduct.productThumbnail} alt="Image">
          <div class="carousel-caption">
            

          </div>      
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  <div class="col-sm-4">
  <form action = "EditProductDetail" method = "post">
  
    <h2>Product Name: ${selectedProduct.productName}</h2><input name = "name" type="text"><br>
    <h4>Category Index:<code> ${selectedProduct.productCategoryIndex}</code><select name="category">
    					<option value="1">1</option>
 						 <option value="2">2</option>
						</select></h4>
    <h4>Category:<code> ${selectedProduct.productCategory }</code></h4>
    <h4>Price:<code> ${selectedProduct.price }</code><input name = "price" type="number" class=" text-center"></h4>
    <h4>Available quantity: <code>${selectedProduct.availableQuantity }</code><input name = "quantity" type="number" class=" text-center"></h4>
   <h4>Image address:<code>${selectedProduct.productThumbnail}</code><input name = "imageaddress" type="text" class=" text-center"></h4>
   <h4>question:<code>${QA.question}</code><input name = "question" type="text" class=" text-center"></h4>
   <h4>answer:<code>${QA.answer}</code><input name = "answer" type="text" class=" text-center"></h4>
							
    <div class="well well-sm"><h4>Description: </h4>${selectedProduct.productDescription }
      <br><input name = "Description" type="text"><br>
    </div>
     
        <input type="hidden" name="ID" value="${selectedProduct.ID}" >
       <button  class="btn btn-primary" type="submit" class="btn btn-success"> Save</button>
       
 </form>
      

 </div>
</div>
<hr>
</div>


  <hr>
    
    
 
<hr>

    </body>

</html>
