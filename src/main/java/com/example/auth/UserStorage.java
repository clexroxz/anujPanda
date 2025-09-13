package com.example.auth;

import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class UserStorage {
    private static final String DB_URL = "jdbc:h2:mem:ecommerce_db;DB_CLOSE_DELAY=-1";
    private static final String DB_USER = "sa";
    private static final String DB_PASS = "";
    private static final String DRIVER = "org.h2.Driver";

    private static Map<String, User> userCache = new HashMap<>();

    static {
        try {
            Class.forName(DRIVER);
            loadUsersFromDB();
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Failed to initialize UserStorage: " + e.getMessage());
        }
    }

    private static void loadUsersFromDB() throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement("SELECT id, name, username, email, password_hash FROM users WHERE is_active = TRUE");
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                long id = rs.getLong("id");
                String name = rs.getString("name");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String passwordHash = rs.getString("password_hash");
                User user = new User(name, username, email, passwordHash, id);
                userCache.put(username, user);
            }
        }
    }

    public static boolean addUser(User user) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "INSERT INTO users (name, username, email, password_hash) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getUsername());
                stmt.setString(3, user.getEmail());
                stmt.setString(4, user.getPasswordHash());
                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    ResultSet generatedKeys = stmt.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        user.setId(generatedKeys.getLong(1));
                    }
                    userCache.put(user.getUsername(), user);
                    return true;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error adding user: " + e.getMessage());
        }
        return false;
    }

    public static User getUser(String username) {
        return userCache.get(username);
    }

    public static boolean validateUser(String username, String password) {
        User user = getUser(username);
        if (user != null) {
            return BCrypt.checkpw(password, user.getPasswordHash());
        }
        return false;
    }

    public static boolean userExists(String username) {
        return getUser(username) != null;
    }

    public static int getTotalUsers() {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE is_active = TRUE");
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println("Error getting total users: " + e.getMessage());
        }
        return 0;
    }
}