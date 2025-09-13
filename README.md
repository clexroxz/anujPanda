# Authentication System with Tomcat 10.1

This is a fully working authentication system built with Java servlets, JSP, and deployed on Tomcat 10.1.

## Features

- **User Login** - Secure login with session management
- **User Signup** - User registration with validation
- **Dashboard** - Protected user dashboard after login
- **Logout** - Session invalidation
- **Responsive UI** - Modern Bootstrap-based interface with minimal CSS

## Technology Stack

- **Server**: Apache Tomcat 10.1
- **Backend**: Java Servlets (Jakarta EE)
- **Frontend**: JSP with Bootstrap 5.3.0
- **Build Tool**: Maven 3.9.4
- **Authentication**: Session-based authentication

## Project Structure

```
ecommerce/
├── src/main/java/com/example/auth/
│   ├── User.java                 # User model class
│   ├── UserStorage.java          # In-memory user storage
│   ├── LoginServlet.java         # Login handler
│   ├── SignupServlet.java        # Registration handler
│   └── LogoutServlet.java        # Logout handler
├── src/main/webapp/
│   ├── WEB-INF/web.xml          # Servlet configuration
│   ├── login.jsp                # Login page
│   ├── signup.jsp               # Signup page
│   └── dashboard.jsp            # User dashboard
├── pom.xml                      # Maven configuration
└── README.md                    # This file
```

## Demo User Accounts

The system comes with two pre-configured demo accounts:

- **Username**: `admin`, **Password**: `admin123`
- **Username**: `demo`, **Password**: `demo123`

## How to Use

### Starting the Application

1. **Tomcat is already running** - The system should be accessible at:
   ```
   http://localhost:8080/ecommerce/
   ```

2. **If Tomcat is not running**, start it manually:
   ```bash
   apache-tomcat-10.1.0\apache-tomcat-10.1.0\bin\startup.bat
   ```

### Using the System

1. **Access the Application**
   - Open your browser and go to `http://localhost:8080/ecommerce/`
   - You'll be redirected to the login page

2. **Login**
   - Use one of the demo accounts or create a new account
   - Enter username and password
   - Click "Sign In"

3. **Create New Account**
   - Click "Create Account" on the login page
   - Fill in username, email, password, and confirm password
   - Click "Create Account"
   - You'll be automatically logged in after successful registration

4. **Dashboard**
   - After login, you'll see the user dashboard
   - Shows user information and system statistics
   - Provides quick action buttons

5. **Logout**
   - Click "Logout" from the dashboard or navigation
   - You'll be redirected back to the login page

## Features in Detail

### Authentication Flow
1. **Login**: Validates credentials against in-memory storage
2. **Session Management**: Creates HTTP session on successful login
3. **Authorization**: Dashboard checks for valid session
4. **Logout**: Invalidates session and redirects to login

### Security Features
- Session-based authentication
- Password field masking
- Input validation on both client and server side
- Protection against empty/null inputs
- Automatic redirection for unauthorized access

### User Interface
- Modern Bootstrap 5.3.0 styling
- Responsive design works on mobile and desktop
- Password visibility toggle
- Form validation with error messages
- Clean, professional appearance

## Building from Source

If you need to rebuild the application:

```bash
# Clean and compile
apache-maven-3.9.4\bin\mvn.cmd clean compile

# Package as WAR file
apache-maven-3.9.4\bin\mvn.cmd clean package

# Deploy to Tomcat
copy target\ecommerce.war apache-tomcat-10.1.0\apache-tomcat-10.1.0\webapps\
```

## Configuration

### Web.xml Configuration
- Jakarta EE 6.0 compatible
- Servlet mappings for `/login`, `/signup`, `/logout`
- Session timeout: 30 minutes
- Welcome file: `login.jsp`

### Maven Dependencies
- Jakarta Servlet API 6.0.0 (Tomcat 10.1 compatible)
- Jakarta JSP API 3.1.0
- Jakarta JSTL 3.0.0

## Customization

### Adding New Users Programmatically
Edit `UserStorage.java` to add more default users in the static block:
```java
users.put("newuser", new User("newuser", "password123", "user@example.com"));
```

### Database Integration
To use a real database instead of in-memory storage:
1. Add database dependencies to `pom.xml`
2. Replace `UserStorage.java` with database DAO
3. Update servlets to use the new DAO

### UI Customization
- Modify JSP files for different styling
- Update Bootstrap version in JSP includes
- Add custom CSS in the `<style>` sections

## Troubleshooting

### Common Issues

1. **Port 8080 already in use**
   - Change port in `apache-tomcat-10.1.0\apache-tomcat-10.1.0\conf\server.xml`
   - Or stop other services using port 8080

2. **Application not loading**
   - Check Tomcat logs in `apache-tomcat-10.1.0\apache-tomcat-10.1.0\logs\`
   - Ensure WAR file is properly deployed

3. **Login not working**
   - Verify demo credentials: admin/admin123 or demo/demo123
   - Check browser console for JavaScript errors

4. **Build failures**
   - Ensure Java 11+ is installed
   - Check Maven is properly configured

## Next Steps

This basic authentication system can be extended with:
- Password hashing (BCrypt)
- Email verification
- Password reset functionality
- Role-based authorization
- Remember me functionality
- Two-factor authentication
- Database persistence
- RESTful API endpoints
- Integration with existing ecommerce features

## Contact

This authentication system is ready to use and can be easily integrated with any existing web application or expanded with additional features as needed.