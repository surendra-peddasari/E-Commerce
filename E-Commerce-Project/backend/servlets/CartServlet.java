package com.ecommerce.servlet; 
import com.ecommerce.model.CartItem; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 
import java.io.IOException; 
import java.util.ArrayList; 
import java.util.List; 
@WebServlet("/CartServlet") 
public class CartServlet extends HttpServlet { 
    // ✅ Handle adding, increasing, decreasing quantity via POST requests 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
        String action = request.getParameter("action"); 
        HttpSession session = request.getSession(); 
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart"); 
        if (cart == null) { 
            cart = new ArrayList<>(); 
        } 
        if ("add".equals(action)) { 
            int id = Integer.parseInt(request.getParameter("id")); 
            String name = request.getParameter("name"); 
            double price = Double.parseDouble(request.getParameter("price")); 
 
            int quantity = Integer.parseInt(request.getParameter("quantity")); 
            String image = request.getParameter("image"); 
            // Check if item already exists 
            boolean exists = false; 
            for (CartItem item : cart) { 
                if (item.getId() == id) { 
                    item.setQuantity(item.getQuantity() + quantity); 
                    exists = true; 
                    break; 
                } 
            } 
            // Add new item if not found 
            if (!exists) { 
                cart.add(new CartItem(id, name, price, quantity, image)); 
            } 
            session.setAttribute("cart", cart); 
            response.sendRedirect("cart.jsp"); 
        } 
    } 
    // ✅ Handle updating quantity (+/-) and removing items 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws 
ServletException, IOException { 
        String action = request.getParameter("action"); 
        HttpSession session = request.getSession(); 
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart"); 
        if (cart == null) { 
            cart = new ArrayList<>(); 
        } 
        if ("increase".equals(action) || "decrease".equals(action)) { 
            int id = Integer.parseInt(request.getParameter("id")); 
 
            for (CartItem item : cart) { 
                if (item.getId() == id) { 
                    if ("increase".equals(action)) { 

                        item.setQuantity(item.getQuantity() + 1); 
                    } else if ("decrease".equals(action) && item.getQuantity() > 1) { 
                        item.setQuantity(item.getQuantity() - 1); 
                    } else { 
                        cart.remove(item); // Remove item if quantity is 0 
                    } 
                    break; 
                } 
            } 
            session.setAttribute("cart", cart); 
        } 
        response.sendRedirect("cart.jsp"); // Refresh cart page 
    } 
}