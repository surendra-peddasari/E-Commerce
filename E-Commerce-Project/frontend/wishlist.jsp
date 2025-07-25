<%@ page import="java.util.*, com.ecommerce.model.Product" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Your Wishlist</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet"> 
</head> 
<body> 
<jsp:include page="navbar.jsp"/> 
<div class="container mt-5"> 
    <h2 class="text-center">Your Wishlist</h2> 
    <%-- Display Error Messages --%> 
    <% String error = request.getParameter("error"); %> 
    <% if (error != null) { %> 
        <div class="alert alert-danger"><%= error %></div> 
    <% } %> 
    <%-- Display Success Messages --%> 
    <% String message = request.getParameter("message"); %> 
    <% if (message != null) { %> 
        <div class="alert alert-success"><%= message %></div> 
    <% } %> 
    <table class="table table-bordered"> 
        <tr> 
            <th>Image</th> 
            <th>Name</th> 
            <th>Price</th> 
            <th>Category</th> 
            <th>Action</th> 
        </tr> 
        <% 
            HttpSession sessionWishlist = request.getSession(); 
            List<Product> wishlist = (List<Product>) sessionWishlist.getAttribute("wishlist"); 
 
            if (wishlist != null && !wishlist.isEmpty()) { 
                for (Product product : wishlist) { 
        %> 
        <tr> 
            <td><img src="images/<%= product.getImage() %>" width="50"></td> 
            <td><%= product.getName() %></td> 
            <td>$<%= product.getPrice() %></td> 
            <td><%= product.getCategory() %></td> 
            <td> 
                <form action="WishlistServlet" method="post"> 
                    <input type="hidden" name="action" value="remove"> 
                    <input type="hidden" name="id" value="<%= product.getId() %>"> 
                    <button type="submit" class="btn btn-danger">Remove</button> 
                </form> 
            </td> 
        </tr> 
        <%  
                } 
            } else { 
        %> 
        <tr><td colspan="5" class="text-center">Your wishlist is empty.</td></tr> 
        <% } %> 
    </table> 
    <div class="text-center"> 
        <a href="shop.jsp" class="btn btn-secondary">Continue Shopping</a> 
    </div> 
</div> 
</body> 
</html>