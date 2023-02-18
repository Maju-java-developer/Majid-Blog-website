package servlets;

import dao.UserDao;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String termsCon = req.getParameter("term_condition");
//        out.println(termCon);
        if (termsCon != null) {
            try {
                Connection myConn = helper.MySQlConnection.mySQLConnection();
//               
                try {
                    String name = req.getParameter("user_name");
                    String email = req.getParameter("user_email");
                    String password = req.getParameter("user_pass");
                    String gender = req.getParameter("user_gender");
                    String desc = req.getParameter("user_desc");
                    String profile = "user_1.png";

                    // Create User Object...
                    User user = new User(name, email, password, gender, desc, profile);

                    // Create Object For user DaoClass..
                    UserDao userDao = new UserDao(myConn);
                    
                    // Checking userDao Method Add User is adding Record or not!
                    if (userDao.addUser(user)) {
                        resp.sendRedirect("login_page.jsp");
                    } else {
                        out.println("Query Error:");
                    }

                } catch (Exception e) {
                    out.println("Query Error: " + e.getMessage());
                }

            } catch (Exception ex) {
                out.println("Connection Error: " + ex.getMessage());
            }

        } else {
            out.println("You don't accept our term and condition..!");
        }

    }
}
