package com.ecommerce.dao; 
import com.ecommerce.model.Category; 
import java.sql.*; 
import java.util.ArrayList; 
import java.util.List; 
public class CategoryDAO { 
    private Connection conn; 
    public CategoryDAO(Connection conn) { 
        this.conn = conn; 
    } 
    public boolean addCategory(String name) { 
        try { 
            String sql = "INSERT INTO categories (name) VALUES (?)"; 
            PreparedStatement stmt = conn.prepareStatement(sql); 
            stmt.setString(1, name); 
            return stmt.executeUpdate() > 0; 
        } catch (SQLException e) { 
            e.printStackTrace(); 
            return false; 
        } 
    } 
    public List<Category> getAllCategories() { 
        List<Category> categories = new ArrayList<>(); 
        try { 
            String sql = "SELECT * FROM categories"; 
            PreparedStatement stmt = conn.prepareStatement(sql); 
            ResultSet rs = stmt.executeQuery(); 
            while (rs.next()) { 
                categories.add(new Category(rs.getInt("id"), rs.getString("name"))); 
            } 
        } catch (SQLException e) { 
            e.printStackTrace(); 
        } 
        return categories; 
    } 
}