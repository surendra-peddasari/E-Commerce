<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
<title>Forgot Password - E-Commerce</title>  
<link  
rel="stylesheet"  
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> </head>  
<body class="bg-light">  
<div class="container mt-5">  
<div class="card mx-auto shadow" style="max-width: 400px;">  
<div class="card-body">  
<h3 class="text-center text-danger">Forgot Password</h3>  
<p class="text-center text-muted">Enter your email to reset your password</p>  
<form action="ForgotPasswordServlet" method="post">  
<div class="mb-3">  
<label class="form-label">Email</label>  
<input type="email" name="email" class="form-control" required>  
</div>    
<button type="submit" class="btn btn-danger w-100">Reset Password</button>  
<p class="mt-3 text-center">  
<a href="login.jsp" class="text-primary">← Back to Login</a>  
</p>  
</form>  
</div>  
</div>  
</div>  
</body>  
</html>