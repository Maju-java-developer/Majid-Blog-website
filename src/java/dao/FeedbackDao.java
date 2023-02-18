package dao;

import entities.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class FeedbackDao {

    private Connection myConn = null;

    public FeedbackDao() {
    }

    public FeedbackDao(Connection myConn) {
        this.myConn = myConn;
    }

    public boolean addFeedback(Feedback feedback) {
        boolean recordStatus = false;
        try {
            String addQuery = "insert into feedbacks(name, email, feedback)VALUES(?,?,?);";
            PreparedStatement psstm = myConn.prepareStatement(addQuery);

            psstm.setString(1, feedback.getName());
            psstm.setString(2, feedback.getEmail());
            psstm.setString(3, feedback.getFeedback());
            psstm.executeUpdate();

            recordStatus = true;
        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }

        return recordStatus;
    }

}
