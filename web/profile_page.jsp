
<%@page import="entities.Message"%>
<%@page import="entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PROFILE</title>

        <style>
            body{
                background-image: url(assets/img/bg-15.jpg);
            }
            .categoryListVal:hover {
                background-color: rgb(245, 245, 245); 
            }
        </style>
    </head>

    <body>
        <%@include  file="navebar_page.jsp" %>
    </body>

    <!-- Scriptlet Tag -->
    <%        Message msg = (Message) session.getAttribute("msg");
        if (msg != null) {
    %>
    <div class=" text-center alert <%= msg.getCssStyle()%>" role="alert">
        <%= msg.getContent()%>
    </div>
    <%
            session.removeAttribute("msg");
        }
    %>

    <!-- Fetching All Post ... -->

    <div class="container mt-2">
        <div class="row">
            <!--Categories Column-->
            <div class="col-md-3" >
                <!--get All Categories Here..-->
                <ul class="list-group" style=' border-radius: 20px;'>
                    <li style="cursor: pointer" class="c-link list-group-item active categoryListVal" onclick="showPosts(0, this);" aria-current="true">All Posts</li>

                    <%
                        // PostDao Object..
                        ArrayList<Category> categoriesList = postDao.getAllCategories();
                        for (Category category : categoriesList) {
                    %>
                    <li style="cursor: pointer" onclick="showPosts(<%= category.getCid()%>, this);" class="c-link list-group-item categoryListVal"><%= category.getCatname()%></li>
                        <%
                            }
                        %>
                </ul>
            </div>

            <div class="col-md-8">
                <!--get All Posts Here....-->
                <div id="loader-contanir" class="text-center">
                    <i class="fa fa-refresh fa-4x fa-spin mb-1"></i>
                    <br>
                    <b>Loading...</b>
                </div>

                <div id="posts-contanir" class="row" style="width: 85%; margin: auto;">

                </div>
            </div>

        </div>
    </div>

    <!--Footer Section..-->
    <%@include file='footer.jsp' %>
    <!--Footer Section..-->

    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="assets/js/myScript.js" type="text/javascript"></script>

<script>
    function showPosts(catID, ob) {
        $("#loader-contanir").show();
        $('.c-link').removeClass('active');
        $.ajax({
            url: "load_posts.jsp",
            data: {cid: catID},
            success: function (data, textStatus, jqXHR) {
                console.log(data);

                $("#loader-contanir").hide();
                $("#posts-contanir").html(data);
                $(ob).addClass('active');
            }
        });
    }

    $(document).ready(function () {
        showPosts(0, '');
    });
</script>

</html>
