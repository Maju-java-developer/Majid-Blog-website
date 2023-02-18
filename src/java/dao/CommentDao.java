package dao;

import entities.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDao {

    private Connection myConn = null;

    public CommentDao(Connection myConn) {
        this.myConn = myConn;
    }

    public CommentDao() {
    }

    public boolean addComment(Comment comment) {
        boolean commentStatus = false;

        try {
            String addQuery = "insert into comments(comment, postId, userId)VALUES(?,?,?);";
            PreparedStatement psstm = myConn.prepareStatement(addQuery);

            psstm.setString(1, comment.getComment());
            psstm.setInt(2, comment.getPostId());
            psstm.setInt(3, comment.getUserId());
            psstm.executeUpdate();

            commentStatus = true;
        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return commentStatus;
    }

    public int getCommentsByPostId(int pid) {
        int count = 0;
        try {
            String query = "select count(cid) from comments where postId = ?;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, pid);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt("count(cid)");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }
}
