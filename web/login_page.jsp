
<%@page import="entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
        
        <style>
            body{
                background-image: url(assets/img/bg-15.jpg);
            }
        </style>
        <!-- CSS LINK -->
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
        <link href="assets/css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        

</head>
<body>

    <!--Including Navebar File-->
    <%@include  file="navebar_page.jsp" %>

    <!-- This is section of LOGIN PAGE...-->
    <!--<div class="container-fluid" style="background-image: url(assets/img/bg-5.jpg); background-size: cover; background-attachment: fixed;">-->
    <div class="container-fluid" style="background-size: cover; background-attachment: fixed;">
        <div class="row">
            <div class="col-md-4 offset-md-4" style="margin-top: 5%;">
                <div class="card" style="margin-bottom: 44%;">
                    <div class="card-header primary-background">
                        <h4 class="header-title text-light text-center">
                            <i class="fa fa-user" style="font-size: 35px;"></i>
                            <br>
                            LOGIN FORM
                        </h4>
                    </div>

                    <!-- Scriptlet Tag -->
                    <%
                        Message msg = (Message) session.getAttribute("msg");
                        if (msg != null) {
                    %>
                        <div class=" text-center alert <%= msg.getCssStyle() %>" role="alert">
                            <%= msg.getContent() %>
                        </div>
                    <%
                            session.removeAttribute("msg");
                        } 
                    %>
                    <div class="card-body">
                        <form action="loginServlet" method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input required="" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input required="" name="password" type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- This is section of LOGIN PAGE...-->

    <!--Footer Section....-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="assets/js/myScript.js" type="text/javascript"></script>

</body>
</html>
