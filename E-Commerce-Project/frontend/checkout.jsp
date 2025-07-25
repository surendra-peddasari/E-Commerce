<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*, com.ecommerce.model.CartItem" %> 
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <title>Checkout</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
rel="stylesheet"> 
</head> 
<body> 
<jsp:include page="navbar.jsp"/> 
<div class="container mt-5"> 
    <h2 class="text-center">Checkout</h2> 
    <form action="CheckoutServlet" method="post"> 
        <div class="mb-3"> 
            <label class="form-label">Full Name</label> 
            <input type="text" name="name" class="form-control" required> 
        </div> 
        <div class="mb-3"> 
            <label class="form-label">Address</label> 
            <textarea name="address" class="form-control" required></textarea> 
        </div> 
        <div class="mb-3"> 
            <label class="form-label">Phone Number</label> 
            <input type="text" name="phone" class="form-control" required> 
        </div> 
        <div class="mb-3"> 
            <label class="form-label">Payment Method</label> 
            <select name="paymentMethod" class="form-select"> 
                <option value="UPI">UPI</option> 
                <option value="Credit Card">Credit Card</option> 
                <option value="Cash on Delivery">Cash on Delivery</option> 
            </select> 
        </div> 
        <button type="submit" class="btn btn-primary">Complete Order</button> 
    </form> 
</div> 
</body> 
</html>