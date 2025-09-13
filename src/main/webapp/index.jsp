<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Store</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .navbar-custom {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .card-hover {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
                <i class="fas fa-shopping-cart me-2 text-primary"></i>
                E-Commerce Store
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/products">Products</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="categoriesDropdown" role="button" data-bs-toggle="dropdown">
                            Categories
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Electronics</a></li>
                            <li><a class="dropdown-item" href="#">Clothing</a></li>
                            <li><a class="dropdown-item" href="#">Books</a></li>
                            <li><a class="dropdown-item" href="#">Home & Garden</a></li>
                        </ul>
                    </li>
                </ul>
                
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                            <i class="fas fa-shopping-cart"></i>
                            <span class="badge bg-primary ms-1">0</span>
                        </a>
                    </li>
                    
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <!-- User is logged in -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                    <i class="fas fa-user"></i> ${sessionScope.userName}
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/dashboard">Dashboard</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/orders">My Orders</a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile">Profile</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                                </ul>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <!-- User is not logged in -->
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/register">Register</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h1 class="display-4 fw-bold mb-4">Welcome to Our Store</h1>
                    <p class="lead mb-4">Discover amazing products at unbeatable prices</p>
                    
                    <c:if test="${not empty sessionScope.success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <i class="fas fa-check-circle me-2"></i>
                            ${sessionScope.success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                        <c:remove var="success" scope="session" />
                    </c:if>
                    
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <h3 class="mb-4">Hello, ${sessionScope.userName}!</h3>
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-light btn-lg me-3">
                                <i class="fas fa-shopping-bag me-2"></i>Shop Now
                            </a>
                            <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-outline-light btn-lg">
                                <i class="fas fa-tachometer-alt me-2"></i>My Dashboard
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div class="mb-4">
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-light btn-lg me-3">
                                    <i class="fas fa-user-plus me-2"></i>Get Started
                                </a>
                                <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-light btn-lg">
                                    <i class="fas fa-shopping-bag me-2"></i>Browse Products
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 card-hover h-100">
                        <div class="card-body p-4">
                            <div class="text-primary mb-3">
                                <i class="fas fa-shipping-fast fa-3x"></i>
                            </div>
                            <h5 class="card-title">Fast Shipping</h5>
                            <p class="card-text">Free shipping on orders over $50. Get your products delivered quickly and safely.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 card-hover h-100">
                        <div class="card-body p-4">
                            <div class="text-primary mb-3">
                                <i class="fas fa-shield-alt fa-3x"></i>
                            </div>
                            <h5 class="card-title">Secure Shopping</h5>
                            <p class="card-text">Shop with confidence. Your data is protected with industry-standard security.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 mb-4">
                    <div class="card border-0 card-hover h-100">
                        <div class="card-body p-4">
                            <div class="text-primary mb-3">
                                <i class="fas fa-headset fa-3x"></i>
                            </div>
                            <h5 class="card-title">24/7 Support</h5>
                            <p class="card-text">Our customer support team is here to help you anytime, anywhere.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h2 class="display-6 fw-bold">Featured Products</h2>
                    <p class="lead">Check out our most popular items</p>
                </div>
            </div>
            
            <div class="row">
                <!-- Sample product cards will be dynamically loaded here -->
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="card card-hover">
                        <img src="${pageContext.request.contextPath}/images/sample-product.jpg" class="card-img-top" alt="Sample Product">
                        <div class="card-body">
                            <h5 class="card-title">Sample Product</h5>
                            <p class="card-text">$99.99</p>
                            <button class="btn btn-primary btn-sm">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                <!-- More product cards would be added here dynamically -->
                <div class="col-12 text-center mt-4">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-primary btn-lg">
                        View All Products
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-light py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h5>E-Commerce Store</h5>
                    <p>Your one-stop shop for all your needs. Quality products at affordable prices.</p>
                </div>
                <div class="col-lg-2 mb-4">
                    <h6>Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">About Us</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Contact</a></li>
                        <li><a href="#" class="text-light text-decoration-none">FAQ</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 mb-4">
                    <h6>Support</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">Shipping Info</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Returns</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Size Guide</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 mb-4">
                    <h6>Stay Connected</h6>
                    <div class="d-flex">
                        <a href="#" class="text-light me-3"><i class="fab fa-facebook fa-2x"></i></a>
                        <a href="#" class="text-light me-3"><i class="fab fa-twitter fa-2x"></i></a>
                        <a href="#" class="text-light me-3"><i class="fab fa-instagram fa-2x"></i></a>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row">
                <div class="col-12 text-center">
                    <p class="mb-0">&copy; 2024 E-Commerce Store. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
