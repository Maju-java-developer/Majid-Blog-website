package dao;

import entities.Category;
import entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDao {

    private Connection myConn;

    public PostDao(Connection myConn) {
        this.myConn = myConn;
    }

    public PostDao() {
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> catList = new ArrayList<Category>();

        try {
            String query = "select * from categories;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                Category category = new Category(
                        resultSet.getInt("cid"),
                        resultSet.getString("Name"),
                        resultSet.getString("Description"),
                        resultSet.getString("pic")
                );

                catList.add(category);
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return catList;
    }

    public Category getCategoryByCatID(int cid) {
        Category cat = null;

        try {
            String query = "select * from categories where CID = ? ;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, cid);
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                cat = new Category(
                        resultSet.getInt("cid"),
                        resultSet.getString("Name"),
                        resultSet.getString("Description"),
                        resultSet.getString("pic")
                );
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return cat;
    }

    public boolean addPost(Post post) {
        boolean recordStatus = false;
        try {
            String addQuery = "insert into posts(title, content, code, pic, CID, userID)VALUES(?,?,?,?,?,?);";
            PreparedStatement pstm = myConn.prepareStatement(addQuery);

            pstm.setString(1, post.getTitle());
            pstm.setString(2, post.getContent());
            pstm.setString(3, post.getCode());
            pstm.setString(4, post.getPic());
            pstm.setInt(5, post.getCid());
            pstm.setInt(6, post.getUserID());
            pstm.executeUpdate();

            recordStatus = true;
        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return recordStatus;
    }

    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> postsList = new ArrayList<Post>();

        try {
            String query = "select * from posts order by PID desc;";

            PreparedStatement pstm = myConn.prepareStatement(query);
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                // Post Object.. 
                Post addPost = new Post(resultSet.getInt("pid"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("code"),
                        resultSet.getString("pic"),
                        resultSet.getTimestamp("Date"),
                        resultSet.getInt("cid"),
                        resultSet.getInt("userID")
                );
                // Add Post Object into PostsList Array
                postsList.add(addPost);
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return postsList;
    }

    public ArrayList<Post> getPostsByCatID(int catID) {
        ArrayList<Post> postsList = new ArrayList<Post>();

        try {
            String query = "select * from posts where cid = ?;";
            
            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, catID);

            // ResultSet gives us Data into Table form..
            ResultSet resultSet = pstm.executeQuery();
            
            while (resultSet.next()) {
                // Post Object.. 
                Post addPost = new Post(resultSet.getInt("pid"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("code"),
                        resultSet.getString("pic"),
                        resultSet.getTimestamp("Date"),
                        resultSet.getInt("cid"),
                        resultSet.getInt("userID")
                );
                // Add Post Object into PostsList Array
                postsList.add(addPost);
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return postsList;
    }

    public Post getPostByPostID(int postID) {
        Post post = null;

        try {
            String query = "select * from posts where PID = ?;";
            
            PreparedStatement pstm = myConn.prepareStatement(query);
            pstm.setInt(1, postID);

            // ResultSet gives us Data into Table form..
            ResultSet resultSet = pstm.executeQuery();
            
            while (resultSet.next()) {
                // Post Object.. 
                post = new Post(resultSet.getInt("pid"),
                        resultSet.getString("title"),
                        resultSet.getString("content"),
                        resultSet.getString("code"),
                        resultSet.getString("pic"),
                        resultSet.getTimestamp("Date"),
                        resultSet.getInt("cid"),
                        resultSet.getInt("userID")
                );
                // Add Post Object into PostsList Array
            }

        } catch (Exception e) {
            System.out.println("Query Error: " + e.getMessage());
        }
        return post;
    }

}
