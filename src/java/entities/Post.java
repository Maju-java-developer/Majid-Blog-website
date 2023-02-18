package entities;

import java.sql.Timestamp;

public class Post {

    private int pid;
    private String title;
    private String content;
    private String code;
    private String pic;
    private Timestamp timestamp;
    private int cid;
    private int userID;

    public Post() {
    }

    public Post(int pid, String title, String content, String code, String pic, Timestamp timestamp, int cid, int userID) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.timestamp = timestamp;
        this.cid = cid;
        this.userID = userID;
    }

    public Post(String title, String content, String code, String pic, int cid, int userID) {
        this.pid = pid;
        this.title = title;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.cid = cid;
        this.userID = userID;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

}
