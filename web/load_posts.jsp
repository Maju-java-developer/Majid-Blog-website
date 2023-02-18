
<%@page import="dao.CommentDao"%>
<%@page import="dao.LikeDao"%>
<%@page import="entities.User"%>
<%@page import="entities.Post"%>
<%@page import="dao.PostDao"%>
<%@page import="entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%
    // Sleeping the request for One Second..
    Thread.sleep(500);

    // Fetching catID using Ajax..
    int cid = Integer.parseInt(request.getParameter("cid"));

    // Posts Object...
    ArrayList<Post> getPosts = null;

    // PostDao Object...
    PostDao postDao = new PostDao(helper.MySQlConnection.mySQLConnection());
    if (cid == 0) {
        getPosts = postDao.getAllPosts();
    } else if (cid > 0) {
        getPosts = postDao.getPostsByCatID(cid);
    }
    
    if (getPosts.size() == 0) {
        out.println("<h3 class='display-3'>There is no post in this category<h3>");
        return;
    }

    // CurrentUser Object...
    User currentUser = (User) session.getAttribute("currentUser");

    // CommentDao Object..
    CommentDao commentDao = new CommentDao(helper.MySQlConnection.mySQLConnection());
    
    // LikeDao Object...
    LikeDao likeDao = new LikeDao(helper.MySQlConnection.mySQLConnection());

    for (Post post : getPosts) {
    
        int postLikes = likeDao.getCountLike(post.getPid());
        int totalCommentsByPost = commentDao.getCommentsByPostId(post.getPid());
%>
<!--cards Section--> 
<div class="card shadow-lg" style="width: 17.5rem; margin: 10px 10px 10px 10px; padding: 5px; border-radius: 10px;">
    <img src="assets/images/blog.jpg" style='border-radius: 10px;' class="card-img-top" alt="Default.jpg">
    <div class="card-body">
        <b class="card-title"><%=  post.getTitle()%></b>
        <p class="card-text"><%=  post.getContent()%></p>
    </div>

    <div class="btn-group m-2">

        <%
            if (likeDao.isPostLikeByUser(post.getPid(), currentUser.getUserID())) {
                // Set Instruction If User Liked Post
%>
        <button id="likeBtn" onclick="disLike(<%= post.getPid()%>);" class="btn btn-lg btn-outline-primary fa fa-thumbs-o-up" style="margin-right: 3px; border-radius: 5px;"><span class="mr-1 counter-link"><%= postLikes%></span></button>
            <%
            } else {
                // Set Instruction If User Not Liked Post-->
%>
        <button id="disLikeBtn" onclick="addLike(<%= post.getPid()%>);" class="btn btn-lg btn-primary fa fa-thumbs-o-up" style="margin-right: 3px; border-radius: 5px;"><span class="mr-1 counter-link"><%= postLikes%></span></button>
            <%
                }
            %>
        <button onclick="window.location = 'show_single_post.jsp?post_id=<%= post.getPid()%>'" style="margin-right: 3px; border-radius: 5px;" class="btn btn-primary">Read More</button>
        <button class="btn btn-primary" style="border-radius: 5px;"><i class="fa fa-commenting-o"><span class="mr-1"><%= totalCommentsByPost %></span></i></button>
    </div>
</div>
<!--Card Section Close..-->

<%
    }
%>

<script>

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