
<%@page import="dao.CommentDao"%>
<%@page import="dao.LikeDao"%>
<%@page import="dao.UserDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>

<%
    // Fetching PostID
    int postID = Integer.parseInt(request.getParameter("post_id"));

    // PostDao Object..
    PostDao postObject = new PostDao(helper.MySQlConnection.mySQLConnection());
    Post post = postObject.getPostByPostID(postID);

    int userID = post.getUserID();

    //UserDao Object for fetching User Information..
    UserDao userDaoOb = new UserDao(helper.MySQlConnection.mySQLConnection());
    User user = userDaoOb.getUserByUserID(userID);

    // Category Object..
    int cid = post.getCid();
    Category category = postObject.getCategoryByCatID(cid);

    // LikeDao Object...
    LikeDao likeDao = new LikeDao(helper.MySQlConnection.mySQLConnection());
    int postLikes = likeDao.getCountLike(post.getPid());

    // CurrentUser Object...
    User currentUser = (User) session.getAttribute("currentUser");

    // CommentDao Object..
    CommentDao commentDao = new CommentDao(helper.MySQlConnection.mySQLConnection());

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Single Post..</title>

        <style>
            body{
                background-image: url(assets/img/bg-15.jpg);
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
</head>
<body>
    <!--fa-thumbs-down-->

    <%@include  file="navebar_page.jsp" %>

    <div class="container mt-3 mb-1 p-0">
        <div class="row">
            <div class="card col-md-6 offset-md-3" style=' border-radius: 10px;'>
                <img style='border-radius: 10px; padding: 5px; margin-top: 3px;' class="card-img-top" src="userImg/blog.jpg">

                <!--Card Header Section..-->
                <div class="text-center mt-2">
                    <b>Category: <%= category.getCatname()%></b>
                    <h2>Q: <%= post.getTitle()%></h2>
                </div>

                <!--Card Body Section..-->
                <div class="card-body">
                    <p class="card-text"><%= post.getContent()%></p>
                    <pre><%= post.getCode()%></pre>
                </div>

                <!--Card Footer Section..-->
                <div class="mt-2">
                    <%
                        if (likeDao.isPostLikeByUser(postID, currentUser.getUserID())) {
                            // Set Instruction If User Liked Post
                    %>
                    <button id="disLikeBtn" onclick="disLike(<%= post.getPid()%>);" class="btn btn-lg btn-outline-primary fa fa-thumbs-o-up" style="margin-right: 3px; border-radius: 5px;"><span class="mr-1 counter-link"><%= postLikes%></span></button>
                        <%
                        } else {
                            // Set Instruction If User Not Liked Post-->
                        %>
                    <button id="likeBtn" onclick="addLike(<%= post.getPid()%>);" class="btn btn-lg btn-primary fa fa-thumbs-o-up" style="margin-right: 3px; border-radius: 5px;"><span class="mr-1 counter-link"><%= postLikes%></span></button>
                        <%
                            }
                        %>
                    <button data-bs-toggle="modal" data-bs-target="#add-comment-modal" class="btn btn-primary" style="border-radius: 5px;"><i class="fa fa-commenting-o"><span class="mr-1"><%= commentDao.getCommentsByPostId(post.getPid())%></span></i></button>
                    <p style="float: right;" class="mt-2"> <a class="link-primary"><%= user.getUserName()%></a> has posted:  <b style="float: right; margin-left: 20px; margin-right: 10px;"><%= post.getTimestamp().toLocaleString()%></b></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Comment Modal -->
    <div class="modal fade" id="add-comment-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add Comment</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div>

                        <div class="form-control mb-2 text-center" style="display: none;" id="alert-msg">
                        </div>
                        
                        <div class="form-group">
                            <textarea id='comment' rows="5" type="text" class="form-control" placeholder="Share your thoughts about this post..!"></textarea>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button onclick="addComment(<%= post.getPid() %>);" class="btn btn-primary">Add Comment</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Add Comment Modal Close!-->

    <!--Footer Section..-->
    <%@include file='footer.jsp' %>
    <!--Footer Section..-->

    <!--Linking All Script here..-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>

<script>
    
    function addComment(pid){
        // Create Object for sendind to servelt..
        var ob = {
            pid: pid,
            comment: $('#comment').val(),
            operation: "AddComment"
        };
        
        // Using Ajax for Sending data to servlet...
        $.ajax({
            url: "AddCommentServlet",
            data: ob,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                
                if (data.trim() == "emtpy"){
                    $('#alert-msg').html('You cannot sent the empty message.');
                    $('#alert-msg').addClass('alert-info');
                    $('#alert-msg').show();
                    return;
                }else {
                    $('#alert-msg').removeClass('alert-info');
                    $('#alert-msg').hide();
                
                    if (data.trim() == "done"){
                        $('#alert-msg').html('Thanks for your feedback.');
                        $('#alert-msg').addClass('alert-success');
                        $('#alert-msg').show();
                        $('#comment').val('');
                    }else if (data.trim() == "error"){
                        $('#alert-msg').html('Something went wrong..');
                        $('#alert-msg').addClass('alert-danger');
                        $('#alert-msg').show();
                    }else {
                        $('#alert-msg').hide();
                    }
                }
                
            },error: function (jqXHR, textStatus, errorThrown) {
                console.log("error");
            }
        });
    }

//    $(document).ready(function(){
//       $('#add-comment-servlet-form').on('submit', function(event){
//          event.preventDefault();
//          
//          let form = $(this).serialize();
//          
//        });
//    });

    var likeToggle = false;
    var disLikeToggle = false;

    function addLike(pid) {
        if (likeToggle === false) {
            var ob = {
                postID: pid,
                operation: 'Like'
            };

            $.ajax({
                url: "AddLikeServlet",
                data: ob,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);

                    var counterLink = $('.counter-link').html();
                    counterLink++;
                    $('.counter-link').html(counterLink);

                    $('#likeBtn').removeClass('btn-primary');
                    $('#likeBtn').addClass('btn-outline-primary');
                    likeToggle = true;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error:");
                }
            });
        } else if (likeToggle === true) {
            disLike(pid);
            $('#likeBtn').removeClass('btn-outline-primary');
            $('#likeBtn').addClass('btn-primary');
            likeToggle = false;
        }
    }

    function disLike(pid) {
        if (disLikeToggle === false) {

            var ob = {
                postID: pid,
                operation: 'disLike'
            };

            $.ajax({
                url: "AddLikeServlet",
                data: ob,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);

                    var counterLink = $('.counter-link').html();
                    counterLink--;
                    $('.counter-link').html(counterLink);

                    $('#disLikeBtn').removeClass('btn-outline-primary');
                    $('#disLikeBtn').addClass('btn-primary');
                    disLikeToggle = true;
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error:");
                }
            });
        } else {
            addLike(pid);
            $('#disLikeBtn').removeClass('btn-primary');
            $('#disLikeBtn').addClass('btn-outline-primary');
            disLikeToggle = false;
        }
    }

</script>

</html>
