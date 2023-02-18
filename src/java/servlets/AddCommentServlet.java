/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.CommentDao;
import entities.Comment;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Majid Paplu
 */
public class AddCommentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            //Fetching Session of currentUser
            HttpSession session = request.getSession();

            User user = (User) session.getAttribute("currentUser");

            // Fetching All Parameter from server...
            String comment = request.getParameter("comment");
            int pid = Integer.parseInt(request.getParameter("pid"));
            String operation = request.getParameter("operation");
            int userID = user.getUserID();

            if (operation.equalsIgnoreCase("AddComment")) {
                if (!comment.equals("")) {
                    try {
                        // Comment Dao Object...
                        CommentDao commentDao = new CommentDao(helper.MySQlConnection.mySQLConnection());

                        // Comment Object..
                        Comment cmnt = new Comment(
                                comment,
                                pid,
                                userID
                        );

                        if (commentDao.addComment(cmnt)) {
                            out.println("done");
                        }else {
                            out.println("error");
                        }
                        
                    } catch (Exception ex) {
                        out.println("Conneciton Error: " + ex.getMessage());
                    }
                } else {
                    out.println("emtpy");
                }
            }
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
