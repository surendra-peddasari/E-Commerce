<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*, com.ecommerce.model.CartItem" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Shopping Cart</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet"> 
</head> 
<body> 
<jsp:include page="navbar.jsp"/> 
<div class="container mt-5"> 
    <h2 class="text-center">Your Shopping Cart</h2> 
    <table class="table table-bordered"> 
        <tr> 
            <th>Name</th> 
            <th>Price</th> 
            <th>Quantity</th> 
            <th>Actions</th> 
            <th>Total</th> 
        </tr> 
        <% 
            HttpSession sessionCart = request.getSession(); 
            List<CartItem> cart = (List<CartItem>) sessionCart.getAttribute("cart"); 
            double totalPrice = 0; 
 
 
            if (cart != null && !cart.isEmpty()) { 
                for (CartItem item : cart) { 
                    double itemTotal = item.getPrice() * item.getQuantity(); 
                    totalPrice += itemTotal; 
        %> 
        <tr> 
            <td><%= item.getName() %></td> 
            <td>$<%= item.getPrice() %></td> 
            <td><%= item.getQuantity() %></td> 
            <td> 
                <a href="CartServlet?action=increase&id=<%= item.getId() %>" class="btn btn
success">+</a> 
                <a href="CartServlet?action=decrease&id=<%= item.getId() %>" class="btn btn
warning">-</a> 
            </td> 
            <td>$<%= itemTotal %></td> 
        </tr> 
        <%  
                } 
            } else { 
        %> 
        <tr><td colspan="5" class="text-center">Your cart is empty!</td></tr> 
        <% } %> 
    </table> 
 
    <h4 class="text-end">Total: $<%= totalPrice %></h4> 
 
    <div class="text-center"> 
        <a href="shop.jsp" class="btn btn-secondary">Continue Shopping</a> 
        <% if (cart != null && !cart.isEmpty()) { %> 
            <a href="checkout.jsp" class="btn btn-primary">Proceed to Checkout</a> 
        <% } %> 
    </div> 
</div> 
</body> 
</html>