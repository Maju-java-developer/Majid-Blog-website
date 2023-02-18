
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER PAGE..</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
        <link href="assets/css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        
        <style>
            body{
                background-image: url(assets/img/bg-15.jpg);
                background-size: cover;
                background-attachment:  fixed;
            }
        </style>

</head>
<body>
    
    <%@include  file="navebar_page.jsp" %>
    
    <!--<div class="container-fluid" style="background-image: url(assets/img/bg-4.jpg); background-size: cover; background-attachment:  fixed">-->
    <!--<div class="container-fluid" style="background-image: url(assets/img/bg-5.jpg); background-size: cover; background-attachment:  fixed">-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 m-auto mt-2">
                <div class="card mb-3">
                    <div class="card-header primary-background text-center text-light">
                        <h4 class="">
                            <i class="fa fa-user-plus" style="font-size: 40px;"></i>
                            <!--<i class="fa fa-sign-up" style="font-size: 40px;"></i>-->
                            <br>
                            Sign up
                        </h4>
                    </div>

                    <div class="card-body">
                        <form action="RegisterServlet" method="post">
                            <div class="mb-1">
                                <label class="form-label">User Name</label>
                                <input required="" name="user_name" type="text" class="form-control" placeholder="Type your username" >
                            </div>
                            <div class="mb-1">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input required="" name="user_email" type="email" class="form-control" placeholder="Type your email" >
                                <!--<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>-->
                            </div>
                            <div class="mb-1">
                                <label for="exampleInputPassword1" class="form-label">Password</label>
                                <input required="" name="user_pass" type="password" class="form-control" id="exampleInputPassword1">
                            </div>

                            <div class="mb-1"> 
                                <label for="exampleFormControlTextarea1" class="form-label">Gender</label>
                                <select required="" name="user_gender" class="form-select" aria-label="Default select example">
                                    <option selected="" disabled="">--- Choose Gender ---</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Rather_not_to_say">Rather Not to Say</option>
                                </select>
                            </div>

                            <div class="mb-1">
                                <label for="exampleFormControlTextarea1" class="form-label">Description</label>
                                <textarea required="" name="user_desc" class="form-control" placeholder="Tell something about your self" rows="3"></textarea>
                            </div>

                            <div class="mb-1 form-check">
                                <input name="term_condition" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">accept terms and conditions </label>
                            </div>                            

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="assets/js/myScript.js" type="text/javascript"></script>
    
</body>
</html>
