package dao;

import entities.Like;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

    private Connection myConn = null;

    public LikeDao() {
    }

    public LikeDao(Connection myConn) {
        this.myConn = myConn;
    }

    public boolean insertLike(Like like) {
        boolean status = false;
        try {
            String query = "insert into liked (pid, userID)VALUES(?,?);";
            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, like.getPid());
            pstm.setInt(2, like.getUserId());

            pstm.executeUpdate();
            status = true;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return status;
    }

    public int getCountLike(int pid) {
        int count = 0;
        try {
            String query = "select count(pid) from liked where pid = ?;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, pid);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt("count(pid)");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    public boolean isPostLikeByUser(int pid, int userID) {
        boolean status = false;
        try {
            String query = "select * from liked where pid = ? AND userID = ?;";
            PreparedStatement pstm = myConn.prepareStatement(query);

            pstm.setInt(1, pid);
            pstm.setInt(2, userID);
            ResultSet resultSet = pstm.executeQuery();
            while (resultSet.next()) {
                status = true;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return status;
    }

    public boolean postDisLike(int pid, int userID) {
        boolean status = false;
        try {
            String query = "delete from liked where pid = ? AND userID = ?;";
            PreparedStatement pstm = myConn.prepareStatement(query);

            pstm.setInt(1, pid);
            pstm.setInt(2, userID);
            pstm.executeUpdate();
            status = true;
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return status;
    }

}
