package servlets;

import dao.UserDao;
import entities.Message;
import entities.User;
import helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // Fetch all data...
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPass = request.getParameter("user_pass");
            String userDesc = request.getParameter("user_desc");

            // Getting Image Path through this part interface.
            Part part = request.getPart("user_image");
            String imagePath = part.getSubmittedFileName();

            // Fetch Session..
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            // Fetching oldFile Path..
            String oldFile = user.getProfile();

            user.setUserName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPass);
            user.setDesc(userDesc);
            user.setProfile(imagePath);

            Connection myConn = null;
            try {
                //Create MySQL Connection Object
                myConn = helper.MySQlConnection.mySQLConnection();
            } catch (Exception ex) {
                out.println("Connection Error: " + ex.getMessage());
            }
            String msgInfo = null;

            // Create UserDao Object..
            UserDao userDao = new UserDao(myConn);
            if (userDao.updateUser(user)) {
                msgInfo = "Record updated..";

                String path = request.getRealPath("/") + "assets/images" + File.separator + user.getProfile();
                String oldFilePath = request.getRealPath("/") + "assets/images" + File.separator + oldFile;

                if (!oldFile.equals("user_1.png")) {
                    Helper.deleteFile(oldFilePath);
                }

                if (Helper.uploadFile(part.getInputStream(), path)) {
                    msgInfo += " & Profile Updated..";
                } else {
                    msgInfo += " But Profile not updated..";
                }

                Message msg = new Message(msgInfo, "Success", "alert-success");
                session.setAttribute("msg", msg);

                response.sendRedirect("profile_page.jsp");
            } else {
                Message msg = new Message("Record not updated", "Error", "alert-danger");
                session.setAttribute("msg", msg);
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
