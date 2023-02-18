package dao;

import entities.Post;
import entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection myConn = null;

    public UserDao() {
    }

    public UserDao(Connection myConn) {
        this.myConn = myConn;
    }

    public boolean addUser(User user) {
        boolean recordStatus = false;
        try {
            Connection myConnection = myConn;
            try {
                String addQuery = "insert into users(name, email, password, gender,description, profile)VALUES(?,?,?,?,?,?);";
                PreparedStatement psstm = myConnection.prepareStatement(addQuery);

                psstm.setString(1, user.getUserName());
                psstm.setString(2, user.getEmail());
                psstm.setString(3, user.getPassword());
                psstm.setString(4, user.getGender());
                psstm.setString(5, user.getDesc());
                psstm.setString(6, user.getProfile());
                psstm.executeUpdate();

                recordStatus = true;
            } catch (Exception e) {
                System.out.println("Query Error: " + e.getMessage());
            }
        } catch (Exception e) {
            System.out.println("Connection Error: " + e.getMessage());
        }
        return recordStatus;
    }

    public User getUserByPasswordAndEmail(String userEmail, String password) {
        User user = null;

        try {
            Connection myConn = this.myConn;

            try {
                String getUser = "SELECT * FROM users WHERE email = ? AND password = ?";

                PreparedStatement pstm = myConn.prepareStatement(getUser);
                pstm.setString(1, userEmail);
                pstm.setString(2, password);

                ResultSet set = pstm.executeQuery();

                if (set.isBeforeFirst()) {
                    while (set.next()) {
                        user = new User(
                                set.getInt("UID"),
                                set.getString("name"),
                                set.getString("email"),
                                set.getString("password"),
                                set.getString("gender"),
                                set.getString("description"),
                                set.getString("profile")
                        );
                    }
                }

            } catch (Exception e) {
                System.out.println("Query Error: " + e.getMessage());
            }
        } catch (Exception e) {
            System.out.println("Connection Error: " + e.getMessage());
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean status = false;

        try {
            String updateQuery = "UPDATE users SET name = ?, email = ?, password = ?, description = ?, profile = ? where UID = ?";
            PreparedStatement pstm = myConn.prepareStatement(updateQuery);

            pstm.setString(1, user.getUserName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getDesc());
            pstm.setString(5, user.getProfile());
            pstm.setInt(6, user.getUserID());

            pstm.executeUpdate();
            status = true;
        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return status;
    }

    public User getUserByUserID(int userID) {
        User user = null;

        try {
            String query = "select * from users where UID = ?;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, userID);

            // ResultSet gives us Data into Table form..
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                // Post Object.. 
                user = new User(); 
                user.setUserID(resultSet.getInt("UID"));
                user.setUserName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                // Add Post Object into PostsList Array
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return user;
    }
}
