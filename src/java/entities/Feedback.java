package entities;

public class Feedback {

    private int fid;
    private String name;
    private String email;
    private String feedback;
    
    public Feedback(int fid, String name, String email, String feedback) {
        this.fid = fid;
        this.name = name;
        this.email = email;
        this.feedback = feedback;
    }

    public Feedback(String name, String email, String feedback) {
        this.name = name;
        this.email = email;
        this.feedback = feedback;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

}
