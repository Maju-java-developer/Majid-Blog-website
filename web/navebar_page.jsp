<%@page import="dao.PostDao"%>
<%@page import="entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--CSS LINK FOR STYLEING-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
    <link href="assets/css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        

</head>
<body>
    <div class="container-fluid m-0 p-0">
        <nav class="navbar navbar-expand-lg primary-background">
            <div class="container-fluid ">
                <a class="navbar-brand text-light" href="profile_page.jsp">
                    <i class="fa fa-connectdevelop" style="font-size: 25px;"></i>
                    <!--<img style="width: 30px; height: 30px; " src="assets/images/letter-m.png">-->
                    Maje Blog
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <img src="assets/images/menu.png" width="25px" height="25px;">
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active text-light" aria-current="page" href="index.jsp">
                                <i class="fa fa-home" style="font-size: 20px;"></i>
                                Home
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class=" text-light nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-yelp" style="font-size: 20px;"></i>
                                Programming Languages
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Java</a></li>
                                <li><a class="dropdown-item" href="#">Python</a></li>
                                <li><a class="dropdown-item" href="#">C</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">C++</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="contacts_page.jsp">
                                <i class="fa fa-address-book-o"></i>
                                Contacts
                            </a>
                        </li>
                        <!-- Script let Tag.. -->

                        <!--WRITE JAVA CODE INSIDE THIS TAG-->
                        <%
                            if (session.getAttribute("currentUser") == null) {
                        // WRITE HTML CODE INSIDE THIS TAG
                        %>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="login_page.jsp">
                                <i class="fa fa-user"></i>
                                Login
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="register_page.jsp">
                                <i class="fa fa-user-plus"></i>
                                Sign up
                            </a>
                        </li>
                        <%
                        } else {
                        %>
                        <li class="nav-item">
                            <a class="nav-link text-light" data-bs-toggle="modal" data-bs-target="#add-post-modal" href="#">
                                <i class="fa fa-certificate"></i>
                                Do Post
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>

                    <!--WRITE JAVA CODE-->
                    <%
                        if (session.getAttribute("currentUser") == null) {
                    %>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                    <%
                    } else {
                        User tempUser = (User) session.getAttribute("currentUser");
                    %>
                    <div class="d-flex">
                        <a data-bs-toggle="modal" data-bs-target="#profile-modal" class="text-light" style="text-decoration-line: none; margin-right: 10px; cursor: pointer;">
                            <i class="fa fa-user"></i>
                            <%= tempUser.getUserName()%>
                        </a>

                        <a class="text-light" style="text-decoration-line: none;" href="logout.jsp">
                            <i class="fa fa-sign-out"></i>
                            logout
                        </a>
                    </div>
                    <%                        }
                    %>

                </div>  
            </div>
        </nav>
    </div>
    <!--NaveBar Close-->

    <!-- Post Modal -->
    <div class="modal fade" id="add-post-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-light">
                    <h1 class="modal-title fs-5 " id="staticBackdropLabel">Provides your blog details..</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="add-post-form" enctype="multipart/form-data" action="AddPostServlet" method="post">
                        <div class="form-group mb-2">
                            <select class="form-control" name="cid">
                                <option selected disabled="">---Select your category---</option>
                                <%
                                    // Create Post Dao Object..
                                    PostDao postDao = new PostDao(helper.MySQlConnection.mySQLConnection());
                                    ArrayList<Category> catList = postDao.getAllCategories();

                                    for (int i = 0; i < catList.size(); i++) {
                                %>
                                <option value="<%= catList.get(i).getCid()%>"><%= catList.get(i).getCatname()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group mb-2">
                            <input id="title" name="title" type="text" class="form-control" placeholder="Type your blog title.">
                        </div>

                        <div class="form-group mb-2">
                            <textarea id="content" name="content" class="form-control" rows="4" placeholder="Type your blog content"></textarea>
                        </div>

                        <div class="form-group mb-2">
                            <textarea id="code" name="code" class="form-control" rows="4" placeholder="Type your blog code"></textarea>
                        </div>

                        <div class="form-group mb-2">
                            <label class="form-label">Provide your Blog Pic</label>
                            <br>
                            <input id="blog-img" name="blog-img" type="file" class="form-control" placeholder="Type your blog title.">
                        </div>

                        <div class="form-group mb-2" id="add-blog-preview-div" style="display: none;">
                            <img id="add-blog-img-preview" src="assets/images/java-script.png" style="width: 120px; height: 120px;">
                        </div>

                        <div class="group-btn mt-3 text-center">
                            <button type="submit" class="btn btn-outline-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Post Modal Close -->

    <!--WRITE JAVA CODE INSIDE THE TAG-->
    <%        if (session.getAttribute("currentUser") != null) {
            User userDetails = (User) session.getAttribute("currentUser");
            //    <!--WRITE JAVA CODE UPSIDE-->
%>
    <!--WRITE HTML CODE-->

    <!-- Profile Modal.. -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-light">
                    <h1 class="modal-title fs-5" id="exampleModalLabel text-center"> Maje Blog</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="assets/images/<%= userDetails.getProfile()%>" style="width: 30%; height: 50%; margin: auto; border-radius: 200px; padding: 10px;" alt="default.png">
                        <h3 style="margin-bottom: 5px;"> <%= userDetails.getUserName()%> </h3>
                        <!--User Details Table-->
                        <table class="table" id="user_details_table" style="margin-top: 20px;">
                            <tbody>
                                <tr>
                                    <th scope="row">ID:</th>
                                    <td><%= userDetails.getUserID()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email:</th>
                                    <td><%= userDetails.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender:</th>
                                    <td><%= userDetails.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">About:</th>
                                    <td><%= userDetails.getDesc()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Edit Table -->
                    <div style="display: none;" class="container text-center" id="edit_details_table">
                        <h5>Edit your information carefully!</h5>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table" style="margin-top: 20px;">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= userDetails.getUserID()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">User Name</th>
                                        <td><input name="user_name" type="text" class="form-control" value="<%= userDetails.getUserName()%>"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><input name="user_email" type="email" class="form-control" value="<%= userDetails.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password</th>
                                        <td><input name="user_pass" type="password" class="form-control" value="<%= userDetails.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" >Gender</th>
                                        <td><%= userDetails.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td>
                                            <textarea name="user_desc" rows="3" class="form-control" value=""><%= userDetails.getDesc()%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" >New Profile</th>
                                        <td><input id="profile-img" type="file" name="user_image" class="form-control" </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div style="display: none;" id="preview-div">
                                <p>Image Preview</p>
                                <img src="assets/images/menu.png" id="preview-img" style="width: 20%; height: 100px; padding: 5px; margin: 5px; border-radius: 200px; border: 2px solid; background-color: rgb(222, 222, 222); ">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" id="edit-profile-btn" class="btn btn-primary">EDIT</button>
                </div>
            </div>
        </div>
    </div>
    <!--Profile Modal Close-->
    <%
        }
    %>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <!--<script src="assets/js/myScript.js" type="text/javascript"></script>-->

    <!-- Jquery Section-->
    <script>
        $(document).ready(function () {
            var editStatus = false;
            $("#edit-profile-btn").click(function () {
                if (editStatus == false) {
                    $("#user_details_table").hide();
                    $("#edit_details_table").show();

                    $(this).text("Back");
                    editStatus = true;
                } else {
                    $("#edit_details_table").hide();
                    $("#user_details_table").show();
                    $(this).text("Edit");
                    editStatus = false;
                }
            });

            // Profile-Image Preview action..
            $("#profile-img").change(function () {
                $("#preview-div").show();
                var output = document.getElementById('preview-img');
                output.src = URL.createObjectURL(event.target.files[0]);
            });
        });
//    <!-- Jquery Section-->
    </script>

    <!--Add-Post-Jquery-->
    <script>
        $(document).ready(function () {
            // add-blog-img-preview-logic
            $("#blog-img").change(function () {
                $("#add-blog-preview-div").show();
                var output = document.getElementById('add-blog-img-preview');
                output.src = URL.createObjectURL(event.target.files[0]);
            });

            // Add-blog-Jquery logic on submit
            $("#add-post-form").on('submit', function (event) {
                event.preventDefault();

                let form = new FormData(this);
//                
                $.ajax({
                    url: 'AddPostServlet',
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        if (data.trim() === 'done') {
                            // Clearing all Atributes after success 
                            $('#title').val('');
                            $('#content').val('');
                            $('#code').val('');
                            $("#blog-img").attr('src', '');
                            $("#add-blog-preview-div").hide();
                            swal({
                                title: "Good job!",
                                text: "Your Post Added Successfully..!",
                                icon: "success",
                                button: "Well!",
                            });
                        } else {
                            swal({
                                title: "Error!",
                                text: "Something went wrong try again.!",
                                icon: "error",
                                button: "sorry!",
                            });
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal({
                            title: "Error!",
                            text: "Something went wrong try again.!",
                            icon: "error",
                            button: "sorry!",
                        });
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>

</body>
</html>
