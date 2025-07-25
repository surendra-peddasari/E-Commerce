import java.io.*; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.MultipartConfig; 
import javax.servlet.http.*; 
import com.ecommerce.dao.DBConnection; 
import java.sql.*;  
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB                  
maxFileSize = 1024 * 1024 * 10,      // 10MB                  
maxRequestSize = 1024 * 1024 * 50)   // 50MB public class 
UploadProductServlet extends HttpServlet {  
protected void doPost(HttpServletRequest request, HttpServletResponse response)             
throws ServletException, IOException {         String name = 
request.getParameter("name");  
double price = Double.parseDouble(request.getParameter("price"));  
String category = request.getParameter("category");  
Part filePart = request.getPart("image");  
String fileName = filePart.getSubmittedFileName();  
// Save image to "images/" folder  
29  
String uploadPath = getServletContext().getRealPath("") + "images";         
File uploadDir = new File(uploadPath);         
uploadDir.mkdir();  
if (!uploadDir.exists()) 
filePart.write(uploadPath + File.separator + fileName);  
// Save product details to database
 conn = DBConnection.getConnection()) {  
         try 
(Connection 
String query = "INSERT INTO products (name, price, image, category) VALUES (?, ?, ?, ?)";             
PreparedStatement stmt = conn.prepareStatement(query);             stmt.setString(1, name);             
stmt.setDouble(2, price);             
stmt.executeUpdate();     
e.printStackTrace();  
}  
stmt.setString(3, fileName);             stmt.setString(4, category);             
    } catch (SQLException e) {  
response.sendRedirect("manageProducts.jsp");  
}  
}