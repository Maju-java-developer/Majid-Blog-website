package entities;

public class User {

    private int userID;
    private String userName;
    private String email;
    private String password;
    private String gender;
    private String desc;
    private String profile;

    public User(int userID, String userName, String email, String password, String gender, String desc, String profile) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.desc = desc;
        this.profile = profile;
    }

    public User(String userName, String email, String password, String gender, String desc, String profile) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.desc = desc;
        this.profile = profile;
    }

    public User() {
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

}
