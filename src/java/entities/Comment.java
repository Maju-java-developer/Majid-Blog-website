package entities;

import java.sql.Timestamp;

public class Comment {

    private int cId;
    private String comment;
    private int postId;
    private int userId;
    private Timestamp date;

    public Comment(int cId, String comment, int postId, int userId, Timestamp date) {
        this.cId = cId;
        this.comment = comment;
        this.postId = postId;
        this.userId = userId;
        this.date = date;
    }

    public Comment(String comment, int postId, int userId) {
        this.comment = comment;
        this.postId = postId;
        this.userId = userId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

}
