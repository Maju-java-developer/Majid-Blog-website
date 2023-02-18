package servlets;

import dao.PostDao;
import entities.Post;
import entities.User;
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
public class AddPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        // Fetching Img Path through part interface..
        Part part = req.getPart("blog-img");

        // Fetch all data from requst Server..
        int cid = Integer.parseInt(req.getParameter("cid"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String code = req.getParameter("code");
        String imgPath = part.getSubmittedFileName();

        // Fetch the HttpSession Which we have created already for logged user..
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("currentUser");

        // This is userID that will post the blog.
        int userID = user.getUserID();

        // Post Object.
        Post newPost = new Post(title, content, code, imgPath, cid, userID);

        // Img Path for storing the images into the server..
        String path = req.getRealPath("/") + "assets/images"+File.separator + part.getSubmittedFileName();
        // MySQLConnection
        try {
            Connection myConn = helper.MySQlConnection.mySQLConnection();

            // PostDao Object..
            PostDao postDao = new PostDao(myConn);
            if (postDao.addPost(newPost)) {
                helper.Helper.uploadFile(req.getInputStream(), path);
                out.print("done");
            } else {
                out.print("error");
            }

        } catch (Exception ex) {
            System.out.println("Connection Error: " + ex.getMessage());
        }
        
    }
}
