<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.auth.User" %>
<%
    // Check if user is logged in
    String username = (String) session.getAttribute("username");
    User user = (User) session.getAttribute("user");
    
    if (username == null || user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Auth System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
        }
        .dashboard-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 1.5rem;
        }
        .btn-logout {
            background: #dc3545;
            border: none;
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            transition: all 0.3s;
        }
        .btn-logout:hover {
            background: #c82333;
            transform: translateY(-2px);
            color: white;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-user-shield me-2"></i>Auth System
            </a>
            
            <div class="navbar-nav ms-auto">
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user me-2"></i><%= username %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user-edit me-2"></i>Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Dashboard Header -->
    <div class="dashboard-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-4">Welcome, <%= user.getUsername() %>!</h1>
                    <p class="lead">You have successfully logged into the system.</p>
                </div>
                <div class="col-md-4 text-end">
                    <a href="logout" class="btn btn-logout btn-lg">
                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="container my-5">
        <div class="row">
            <!-- User Information Card -->
            <div class="col-md-6 mb-4">
                <div class="card dashboard-card h-100">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-user me-2"></i>User Information
                        </h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr>
                                <td><strong>Username:</strong></td>
                                <td><%= user.getUsername() %></td>
                            </tr>
                            <tr>
                                <td><strong>Email:</strong></td>
                                <td><%= user.getEmail() %></td>
                            </tr>
                            <tr>
                                <td><strong>Login Time:</strong></td>
                                <td><%= new java.util.Date() %></td>
                            </tr>
                        </table>
                        
                        <div class="mt-3">
                            <button class="btn btn-outline-primary" onclick="alert('Profile editing coming soon!')">
                                <i class="fas fa-edit me-2"></i>Edit Profile
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- System Stats Card -->
            <div class="col-md-6 mb-4">
                <div class="card dashboard-card h-100">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-chart-bar me-2"></i>System Stats
                        </h5>
                    </div>
                    <div class="card-body">
                        <%@ page import="com.example.auth.UserStorage" %>
                        <div class="stat-card mb-3">
                            <div class="row align-items-center">
                                <div class="col-8">
                                    <h6 class="mb-1">Total Users</h6>
                                    <h4 class="mb-0"><%= UserStorage.getTotalUsers() %></h4>
                                </div>
                                <div class="col-4 text-end">
                                    <i class="fas fa-users fa-2x"></i>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-6">
                                <div class="text-center p-3 border rounded">
                                    <i class="fas fa-shield-alt fa-2x text-success mb-2"></i>
                                    <h6>Secure Login</h6>
                                    <small class="text-muted">SSL Protected</small>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="text-center p-3 border rounded">
                                    <i class="fas fa-clock fa-2x text-info mb-2"></i>
                                    <h6>Session Active</h6>
                                    <small class="text-muted">30 min timeout</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row">
            <div class="col-12">
                <div class="card dashboard-card">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-bolt me-2"></i>Quick Actions
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <button class="btn btn-outline-primary w-100" onclick="alert('Feature coming soon!')">
                                    <i class="fas fa-user-edit d-block mb-2"></i>
                                    Update Profile
                                </button>
                            </div>
                            <div class="col-md-3 mb-3">
                                <button class="btn btn-outline-success w-100" onclick="alert('Feature coming soon!')">
                                    <i class="fas fa-key d-block mb-2"></i>
                                    Change Password
                                </button>
                            </div>
                            <div class="col-md-3 mb-3">
                                <button class="btn btn-outline-info w-100" onclick="alert('Feature coming soon!')">
                                    <i class="fas fa-download d-block mb-2"></i>
                                    Download Data
                                </button>
                            </div>
                            <div class="col-md-3 mb-3">
                                <a href="logout" class="btn btn-outline-danger w-100">
                                    <i class="fas fa-sign-out-alt d-block mb-2"></i>
                                    Logout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>