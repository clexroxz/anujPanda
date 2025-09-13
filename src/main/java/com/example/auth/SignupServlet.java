package com.example.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to signup page
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        
        // Validate input
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty() ||
            email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }
        
        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }
        
        // Check if username already exists
        if (UserStorage.userExists(username)) {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }
        
        // Create new user
        User newUser = new User(username, password, email);
        if (UserStorage.addUser(newUser)) {
            // Auto-login after successful signup
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("user", newUser);
            
            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Failed to create user");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}