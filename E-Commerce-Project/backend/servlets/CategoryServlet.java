package com.ecommerce.servlet; 
import java.io.IOException; 
import java.sql.Connection; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import com.ecommerce.dao.CategoryDAO; 
@WebServlet("/CategoryServlet") 
public class CategoryServlet extends HttpServlet { 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
String name = request.getParameter("name"); 
Connection conn = com.ecommerce.dao.DBConnection.getConnection(); 
CategoryDAO categoryDAO = new CategoryDAO(conn); 
boolean success = categoryDAO.addCategory(name); 
if (success) { 
response.sendRedirect("manage-products.jsp?message=Category%20added%20successfully"); 
} else { 
 response.sendRedirect("manage-products.jsp?error=Category%20already%20exists"); 
} 
       } 
}