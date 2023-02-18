package servlets;

import dao.LikeDao;
import entities.Like;
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

public class AddLikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            // Get Session of CurrentUser Object..
            HttpSession session = request.getSession();

            // LikeDao Object for fetching the insertLikeMethod..
            LikeDao likeDao = new LikeDao(helper.MySQlConnection.mySQLConnection());

            // User Object..
            User user = (User) session.getAttribute("currentUser");

            int pid = Integer.parseInt(request.getParameter("postID"));
            String operation = request.getParameter("operation");

            // Like Object...
            Like like = new Like(pid, user.getUserID());

            if (operation.equalsIgnoreCase("Like")) {
                if (!likeDao.isPostLikeByUser(pid, user.getUserID())) {
                    if (likeDao.insertLike(like)) {
                        out.println("done");
                    } else {
                        out.println("error");
                    }
                }else {
                    out.println("Already..");
                }
            } else {
                if (operation.equalsIgnoreCase("disLike")) {
                    if (likeDao.postDisLike(pid, user.getUserID())) {
                        out.println("done");
                    } else {
                        out.println("error");
                    }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddLikeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddLikeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
