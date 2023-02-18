package servlets;

import com.sun.faces.util.RequestStateManager;
import dao.UserDao;
import entities.Message;
import entities.User;
import helper.MySQlConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String userEmail = req.getParameter("email");
        String userPassword = req.getParameter("password");
            
        try {
            // Create MySQL Connection..!
            Connection myConnection = MySQlConnection.mySQLConnection();
            
            // Create UserDao Object..
            UserDao userDao = new UserDao(myConnection);

            // Create a user Object with Authentication..
            User user =  userDao.getUserByPasswordAndEmail(userEmail, userPassword);
            
            // Checking the user is null or returning user Object... 
            if (user != null) {
                HttpSession userSession = req.getSession();
                userSession.setAttribute("currentUser", user);
                
                resp.sendRedirect("profile_page.jsp");
//                resp.sendRedirect("index.jsp");
            }else {
                Message msg = new Message("Invalid Information! Try Again", "Login Error", "alert-danger");
                
                HttpSession session = req.getSession();
                session.setAttribute("msg", msg);
                
                resp.sendRedirect("login_page.jsp");
            }
        } catch (Exception ex) {
            out.println("Connection Error: " + ex.getMessage());
        }
    }
}
