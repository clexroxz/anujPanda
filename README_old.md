# E-Commerce Web Application

A full-featured e-commerce web application built using JSP, Java Servlets, JDBC, and MySQL with a focus on security, scalability, and user experience.

## Technology Stack

- **Backend**: Java 11, JSP, Servlets, JDBC
- **Database**: MySQL 8.0+
- **Connection Pool**: HikariCP
- **Security**: BCrypt password hashing, XSS/CSRF protection
- **Frontend**: Bootstrap 5.3, Font Awesome, Custom CSS
- **Build Tool**: Maven
- **Server**: Apache Tomcat 9.0+

## Features Implemented

### ✅ Completed Features

#### 1. Project Structure & Configuration
- Maven-based project structure
- Comprehensive web.xml configuration
- Database connection properties
- Logging configuration with Logback
- Security filters and authentication

#### 2. Database Schema & DAO Layer
- Complete MySQL database schema with 15+ tables
- Comprehensive relationships and constraints
- Database connection pooling with HikariCP
- DAO pattern implementation with proper resource management
- User DAO with full CRUD operations

#### 3. Authentication & Security System
- User registration with validation
- Secure login system with BCrypt password hashing
- Session management with configurable timeouts
- Security filters for XSS/CSRF protection
- Authentication filters for protected resources
- Admin authentication system
- Password strength validation
- Remember me functionality

#### 4. User Interface
- Responsive design with Bootstrap 5
- Modern, clean interface
- Login and registration pages
- Home page with navigation
- Mobile-friendly design
- Custom CSS with animations and effects

### 🚧 Features In Progress

#### 5. Product Catalog & Search
- Product listing with categories
- Search and filtering functionality
- Product detail pages
- Pagination support
- Category management

#### 6. Shopping Cart
- Add/update/remove cart items
- Session-based cart persistence
- Quantity management
- Cart total calculations

#### 7. Checkout & Order Processing
- Multi-step checkout process
- Address management
- Order placement
- Payment integration (mock)
- Order tracking

#### 8. Admin Panel
- Admin dashboard with KPIs
- Product management
- Category management
- Order management
- User management
- Reports and analytics

## Database Schema

The application uses a comprehensive MySQL database schema with the following key tables:

- **users** - Customer accounts
- **admins** - Administrator accounts
- **categories** - Product categories (hierarchical)
- **products** - Product catalog
- **product_images** - Product image management
- **carts** / **cart_items** - Shopping cart functionality
- **orders** / **order_items** - Order processing
- **payments** - Payment tracking
- **addresses** - User address management
- **coupons** - Discount system
- **reviews** - Product reviews
- **audit_logs** - System audit trail

## Setup Instructions

### Prerequisites

1. **Java Development Kit (JDK) 11+**
2. **Apache Maven 3.6+**
3. **MySQL Server 8.0+**
4. **Apache Tomcat 9.0+**

### Database Setup

1. **Create Database**:
   ```sql
   mysql -u root -p < database/schema.sql
   ```

2. **Insert Sample Data** (Optional):
   ```sql
   mysql -u root -p < database/sample_data.sql
   ```

3. **Configure Database Connection**:
   Edit `src/main/resources/db.properties`:
   ```properties
   db.url=jdbc:mysql://localhost:3306/ecommerce_db
   db.username=your_username
   db.password=your_password
   ```

### Application Deployment

1. **Build the Project**:
   ```bash
   mvn clean compile
   mvn package
   ```

2. **Deploy to Tomcat**:
   - Copy `target/ecommerce.war` to Tomcat's `webapps` directory
   - Or use Maven Tomcat plugin: `mvn tomcat7:deploy`

3. **Access Application**:
   - Open browser: `http://localhost:8080/ecommerce`

## Default Accounts

### Admin Account
- **Email**: admin@ecommerce.com
- **Password**: admin123

### Test User Accounts
- **Email**: john.doe@email.com
- **Password**: password123

## Security Features

### Implemented Security Measures

1. **Password Security**:
   - BCrypt hashing with configurable work factor
   - Strong password requirements
   - Password strength validation

2. **Session Security**:
   - HTTP-only cookies
   - Session timeout management
   - Secure session invalidation

3. **Input Validation**:
   - XSS protection with input sanitization
   - SQL injection prevention using prepared statements
   - CSRF protection headers

4. **Security Headers**:
   - X-Frame-Options: DENY
   - X-Content-Type-Options: nosniff
   - X-XSS-Protection: 1; mode=block
   - Content-Security-Policy
   - Referrer-Policy

## Project Structure

```
src/
├── main/
│   ├── java/com/ecommerce/
│   │   ├── dao/          # Data Access Objects
│   │   ├── filter/       # Security & Authentication Filters
│   │   ├── model/        # Entity Models
│   │   ├── service/      # Business Logic Services
│   │   ├── servlet/      # HTTP Servlets
│   │   │   └── admin/    # Admin Panel Servlets
│   │   └── util/         # Utility Classes
│   ├── resources/        # Configuration Files
│   └── webapp/
│       ├── css/          # Stylesheets
│       ├── js/           # JavaScript Files
│       ├── images/       # Static Images
│       ├── admin/        # Admin Panel Pages
│       ├── WEB-INF/      # Web Configuration
│       └── *.jsp         # JSP Pages
database/
├── schema.sql           # Database Schema
└── sample_data.sql      # Sample Data
```

## API Endpoints

### Public Endpoints
- `GET /` - Home page
- `GET /login` - Login page
- `POST /login` - User authentication
- `GET /register` - Registration page
- `POST /register` - User registration
- `GET /logout` - User logout
- `GET /products` - Product listing
- `GET /product?id={id}` - Product details

### Protected User Endpoints
- `GET /user/dashboard` - User dashboard
- `GET /user/orders` - Order history
- `GET /user/profile` - User profile
- `GET /cart` - Shopping cart
- `POST /cart/add` - Add to cart
- `POST /cart/update` - Update cart
- `GET /checkout` - Checkout page
- `POST /order/place` - Place order

### Admin Endpoints
- `GET /admin` - Admin dashboard
- `GET /admin/login` - Admin login
- `GET /admin/products` - Product management
- `GET /admin/orders` - Order management

## Configuration

### Database Configuration (`db.properties`)
```properties
# Database Connection
db.url=jdbc:mysql://localhost:3306/ecommerce_db
db.username=root
db.password=password
db.driver=com.mysql.cj.jdbc.Driver

# Connection Pool Settings
db.pool.maximumPoolSize=20
db.pool.minimumIdle=5
db.pool.connectionTimeout=30000
```

### Logging Configuration (`logback.xml`)
- Console and file logging
- Separate error log file
- Configurable log levels
- Rolling file policies

## Testing

### Manual Testing
1. Start the application
2. Register a new user account
3. Login with created credentials
4. Navigate through the application
5. Test logout functionality

### Database Testing
1. Verify database connection
2. Test user registration/login
3. Check audit logging functionality

## Contributing

1. Follow Java coding standards
2. Write comprehensive JavaDoc comments
3. Include proper error handling
4. Add logging for important operations
5. Test thoroughly before committing

## Future Enhancements

- Real payment gateway integration
- Email verification system
- Product recommendation engine
- Advanced search with Elasticsearch
- Mobile app API
- Social media integration
- Multi-language support
- Performance optimization
- Automated testing suite

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support or questions, please contact the development team or create an issue in the project repository.

---

**Note**: This is a educational/demonstration project. For production use, additional security hardening, testing, and optimization would be required.
