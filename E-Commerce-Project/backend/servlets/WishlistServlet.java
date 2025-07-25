package com.ecommerce.servlet; 
import com.ecommerce.model.Product; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 
import java.io.IOException; 
import java.util.ArrayList; 
import java.util.List; 
@WebServlet("/WishlistServlet") 
public class WishlistServlet extends HttpServlet { 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
        HttpSession session = request.getSession(); 
        List<Product> wishlist = (List<Product>) session.getAttribute("wishlist"); 
        if (wishlist == null) { 
            wishlist = new ArrayList<>(); 
            session.setAttribute("wishlist", wishlist); 
        } 
        String action = request.getParameter("action"); 
 
        if (action == null || action.isEmpty()) { 
            response.sendRedirect("wishlist.jsp?error=No%20action%20provided"); 
            return; 
        } 
        if ("add".equals(action)) { 
            try { 
                int id = Integer.parseInt(request.getParameter("id")); 
                String name = request.getParameter("name"); 
                double price = Double.parseDouble(request.getParameter("price")); 
                String category = request.getParameter("category"); 
                String image = request.getParameter("image"); 
                boolean exists = wishlist.stream().anyMatch(product -> product.getId() == id); 
                if (!exists) { 
                    wishlist.add(new Product(id, name, price, category, image)); 
                    session.setAttribute("wishlist", wishlist); 
                } 
                response.sendRedirect("wishlist.jsp?message=Product%20added%20successfully"); 
            } catch (Exception e) { 
                response.sendRedirect("wishlist.jsp?error=Invalid%20product%20data"); 
            } 
        } else if ("remove".equals(action)) { 
            try { 
                int id = Integer.parseInt(request.getParameter("id")); 
                wishlist.removeIf(product -> product.getId() == id); 
                session.setAttribute("wishlist", wishlist); 
                response.sendRedirect("wishlist.jsp?message=Product%20removed%20successfully"); 
            } catch (Exception e) { 
                response.sendRedirect("wishlist.jsp?error=Invalid%20product%20ID"); 
            } 
        } else { 
            response.sendRedirect("wishlist.jsp?error=Invalid%20action"); 
        } 
    } 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
        response.sendRedirect("wishlist.jsp"); 
    } 
}