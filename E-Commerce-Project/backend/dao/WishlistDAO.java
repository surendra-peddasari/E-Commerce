package com.ecommerce.dao; 
import com.ecommerce.model.Product; 
import java.sql.*; 
import java.util.ArrayList; 
import java.util.List; 
public class WishlistDAO { 
    private Connection conn; 
    public WishlistDAO() { 
        conn = DBConnection.getConnection(); 
    } 
    public void addToWishlist(int productId) { 
        String sql = "INSERT INTO wishlist (product_id) VALUES (?)"; 
        try (PreparedStatement stmt = conn.prepareStatement(sql)) { 
            stmt.setInt(1, productId); 
            stmt.executeUpdate(); 
        } catch (SQLException e) { 
            e.printStackTrace(); 
        } 
    } 
    public List<Product> getWishlist() { 
        List<Product> wishlist = new ArrayList<>(); 
        String sql = "SELECT p.id, p.name, p.price, p.image FROM products p JOIN wishlist w ON p.id 
= w.product_id"; 
        try (PreparedStatement stmt = conn.prepareStatement(sql); 
             ResultSet rs = stmt.executeQuery()) { 
            while (rs.next()) { 
                wishlist.add(new Product( 
                    rs.getInt("id"), 
                    rs.getString("name"), 
                    rs.getDouble("price"), 
                    null,  // No category needed 
                    rs.getString("image") 
                )); 
            } 
        } catch (SQLException e) { 
            e.printStackTrace(); 
        } 
        return wishlist; 
    } 
    public void removeFromWishlist(int productId) { 
        String sql = "DELETE FROM wishlist WHERE product_id=?"; 
        try (PreparedStatement stmt = conn.prepareStatement(sql)) { 
            stmt.setInt(1, productId); 
            stmt.executeUpdate(); 
        } catch (SQLException e) { 
            e.printStackTrace(); 
        } 
    } 
}