package com.ecommerce.dao; 
import com.ecommerce.model.Product; 
import java.sql.*; 
import java.util.ArrayList; 
import java.util.List; 
public class ProductDAO { 
    // Fetch all products 
    public List<Product> getAllProducts() { 
        List<Product> productList = new ArrayList<>(); 
        String sql = "SELECT * FROM products"; 
 
        try (Connection conn = DBConnection.getConnection(); 
             Statement stmt = conn.createStatement(); 
             ResultSet rs = stmt.executeQuery(sql)) { 
            while (rs.next()) { 
                productList.add(mapResultSetToProduct(rs)); 
            } 
        } catch (SQLException e) { 
            System.err.println("Error fetching all products: " + e.getMessage()); 
        } 
        return productList; 
    } 
    // Fetch products by category 
    public List<Product> getProductsByCategory(String category) { 
        List<Product> productList = new ArrayList<>(); 
        String sql = "SELECT * FROM products WHERE category = ?"; 
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) { 
            stmt.setString(1, category); 
            try (ResultSet rs = stmt.executeQuery()) { 
                while (rs.next()) { 
                    productList.add(mapResultSetToProduct(rs)); 
                } 
            } 
        } catch (SQLException e) { 
            System.err.println("Error fetching products by category '" + category + "': " + e.getMessage()); 
        } 
        return productList; 
    } 
    // Add a new product 
    public boolean addProduct(Product product) { 
        String sql = "INSERT INTO products (name, price, category, image) VALUES (?, ?, ?, ?)"; 
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) { 
            stmt.setString(1, product.getName()); 
            stmt.setDouble(2, product.getPrice()); 
            stmt.setString(3, product.getCategory()); 
            stmt.setString(4, product.getImage()); 
 
            int rowsInserted = stmt.executeUpdate(); 
            return rowsInserted > 0; // Returns true if insert was successful 
        } catch (SQLException e) { 
            System.err.println("Error adding product: " + e.getMessage()); 
            return false; 
        } 
    } 
    // Delete a product by ID 
    public boolean deleteProduct(int productId) { 
        String sql = "DELETE FROM products WHERE id = ?"; 
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) { 
            stmt.setInt(1, productId); 
            int rowsDeleted = stmt.executeUpdate(); 
            return rowsDeleted > 0; // Returns true if delete was successful 
        } catch (SQLException e) { 
            System.err.println("Error deleting product with ID " + productId + ": " + e.getMessage()); 
            return false; 
        } 
    } 
    // Utility method to map a ResultSet row to a Product object 
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException { 
        return new Product( 
                rs.getInt("id"), 
                rs.getString("name"), 
                rs.getDouble("price"), 
                rs.getString("category"), 
                rs.getString("image") 
        ); 
    } 
} 