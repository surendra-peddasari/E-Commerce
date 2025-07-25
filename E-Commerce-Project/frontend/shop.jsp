<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>   
<%@ page import="java.util.*, com.ecommerce.model.Product" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
<meta charset="UTF-8">  
<meta name="viewport" content="width=device-width, initial-scale=1.0">  
<title>Shop - E-Commerce</title>  
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet">  
</head>  
<body>  
<jsp:include page="navbar.jsp"/>  
<div class="container mt-5">  
<h2 class="text-center">Shop</h2>  
<!-- Category Filter -->  
<div class="text-center mb-4">  
<a href="ShopServlet" class="btn btn-secondary">All</a>  
<a href="ShopServlet?category=Electronics" class="btn btn-primary">Electronics</a>  
<a href="ShopServlet?category=Clothing" class="btn btn-primary">Clothing</a>  
<a href="ShopServlet?category=Books" class="btn btn-primary">Books</a>     
</div>  
<!-- Display Products -->  
<div class="row">  
<%  
List<Product> productList = (List<Product>) request.getAttribute("productList");             
if (productList != null && !productList.isEmpty()) {    
productList) {  
%>  
<div class="col-md-4 mb-4">  
<div class="card">  
<!-- Product Image -->  
             for (Product product :  
<img src="images/<%= product.getImage() %>" alt="<%= product.getName() %>" width="150" 
height="150">  
<div class="card-body">  
<h5 class="card-title"><%= product.getName() %></h5>  
<p class="card-text">$<%= product.getPrice() %></p>                      
<!-- Add to Cart Form -->  
<form action="CartServlet" method="post">  
<input type="hidden" name="action" value="add">  
<input type="hidden" name="id" value="<%= product.getId() %>">  
<input type="hidden" name="name" value="<%= product.getName() %>">  
<input type="hidden" name="price" value="<%= product.getPrice() %>">  
<input type="hidden" name="quantity" value="1">  
<input type="hidden" name="image" value="<%= product.getImage() %>">  
<button type="submit" class="btn btn-primary">Add to Cart</button>                     
</form>  
<!-- Add to Wishlist Form -->  
<form action="WishlistServlet" method="POST" class="mt-2">  
<input type="hidden" name="action" value="add">  
<input type="hidden" name="id" value="<%= product.getId() %>">  
<input type="hidden" name="name" value="<%= product.getName() %>">  
<input type="hidden" name="price" value="<%= product.getPrice() %>">  
<input type="hidden" name="category" value="<%= product.getCategory() %>">  
<input type="hidden" name="image" value="<%= product.getImage() %>">  
<button type="submit" class="btn btn-warning">Add to Wishlist</button>  
</form>  
</div>  
</div>  
</div>  
<%   
}    
} else {  
%>  
<p class="text-center">No products available!</p>  
<% } %>  
</div>  
<!-- View Cart & Wishlist Buttons -->  
<div class="text-center mt-4">  
<a href="cart.jsp" class="btn btn-warning">View Cart</a>  
<a href="wishlist.jsp" class="btn btn-info">View Wishlist</a>  
</div>  
</div>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>  
</body>  
</html>