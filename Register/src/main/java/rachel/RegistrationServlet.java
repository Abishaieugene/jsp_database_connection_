package rachel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register") // URL pattern for this servlet
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve form parameters
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rani", "root", "root");

            // Prepare the SQL statement
            String sql = "INSERT INTO rani (firstname, lastname, birthday, gender, email, phone, address, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, birthday);
            ps.setString(4, gender);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, address);
            ps.setString(8, password);

            // Execute the query
            int result = ps.executeUpdate();
            if (result > 0) {
                // Registration successful
                out.println("<html><body>");
                out.println("<h3>Registration Successful!</h3>");
                out.println("<a href='registration.jsp'>Go back to Registration Form</a>");
                out.println("</body></html>");
            } else {
                // Registration failed
                out.println("<html><body>");
                out.println("<h3>Registration Failed!</h3>");
                out.println("<a href='registration.jsp'>Please Try Again</a>");
                out.println("</body></html>");
            }

        } catch (ClassNotFoundException e) {
            out.println("Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            out.println("SQL Exception: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}
