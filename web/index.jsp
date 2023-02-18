
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
        <link href="assets/css/myStyle.css" rel="stylesheet" type="text/css"/>
      
        <style>
            .cardHoverAction img{
                width: 35%;
                margin: auto;
                margin-top: 20px;
            }
            
            .cardHoverAction:hover{
                border-radius: 10px;
                background-color: rgba(0,0,0,70%);
                color: whitesmoke;
            }
            
            .cardHoverAction:hover img{
                border: 1px solid;
                border-radius: 100px;
                padding: 10px;        
            }
            
            .headerClipPath{
                /*clip-path: polygon(50% 0%, 100% 0, 100% 100%, 69% 92%, 48% 96%, 0 96%, 0 0);*/    
                /*clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 67% 98%, 14% 92%, 0 96%, 0 0);*/ 
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 95%, 66% 98%, 33% 90%, 0 96%, 0 0);
            }
        </style>
    <body>
        <!-- This is Navebar --> 
        <%@include file="navebar_page.jsp" %>
        
        <!--Header Section-->
        <div class="container-fluid p-2 text-light primary-background text-center headerClipPath">
            <div class="text-center">
                <i class="fa fa-connectdevelop fa-5x fa-spin mb-2 mt-1"></i>
                <h3 class="mb-3">WELCOME TO MAJE BLOG</h3>
                <p style="width: 55%; margin: auto;" class="mb-3">
                    A programming language is a system of notation for writing computer programs. Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.
                </p>
                <p style="width: 55%; margin: auto;" class="mb-3">
                    The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language.  
                </p>
            </div>
            <div class="mt-3 mb-5">
                <button class="btn btn-outline-light">
                    <i class="fa fa-user-plus"></i>
                    Start | It's free
                </button>
                
                <%
                    if (session.getAttribute("currentUser") == null){
                %>
                    <a href="login_page.jsp" class="btn btn-outline-light" style="width: 120px;">
                        <i class="fa fa-user fa-spin"></i>
                        Login
                    </a>
                <%
                    }
                %>

            </div>
        </div>
        <!--Header Section-->
        <br>
        
        <!-- Card Section -->
        
        <div>
            <h4 class="text-center mb-3">
                QUICK ACCESS
            </h4>
        </div>
        <div class="container mb-2">
            <div class="row" style="width: 80%; margin: auto;">
                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/java.png" alt="Java">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed...<a class="link-primary">Read More</a></p>
                        <a href="#" class="btn btn-primary">Learn with us</a>
                    </div>
                </div>                

                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/python.png" alt="Python">
                    <div class="card-body">
                        <h5 class="card-title">Python</h5>
                        <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code...<a class="link-primary">Read More</a> </p>
                        <a href="#" class="btn btn-primary">Learn with us</a>
                    </div>
                </div>                

                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/php.png" alt="PHP">
                    <div class="card-body">
                        <h5 class="card-title">PHP</h5>
                        <p class="card-text">PHP is a general-purpose scripting language geared toward web development. It was originally created... <a class="link-primary">Read More</a> </p>
                            <a href="#" class="btn btn-primary">Learn with us</a>
                    </div>
                </div>    
                
                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/html-5.png" alt="HTML-5">
                    <div class="card-body">
                        <h5 class="card-title">HTML</h5>
                        <p class="card-text">The HyperText Markup Language or HTML is the standard markup language for documents... <a class="link-primary">Read More</a></p>
                        <a href="#" class="btn btn-primary">Learn with us</a> 
                    </div>
                </div>    
                
                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/c-sharp.png" alt="C#">
                    <div class="card-body">
                        <h5 class="card-title">C-Sharp</h5>
                        <p class="card-text">C# is a general-purpose, high-level multi-paradigm programming language... <a class="link-primary">Read More</a></p>
                        <a href="#" class="btn btn-primary">Learn with us</a>
                    </div>
                </div>    
                
                <div class="card md-col-4 m-1 cardHoverAction" style="width: 18rem;">
                    <img src="assets/images/css-3.png" alt="CSS">
                    <div class="card-body">
                        <h5 class="card-title">CSS</h5>
                        <p class="card-text">Cascading Style Sheets is a style sheet language used for describing the presentation of a document.. <a class="link-primary">Read More</a></p>
                        <a href="#" class="btn btn-primary">Learn with us</a>
                    </div>
                </div>    
            </div>
        </div>
    </div>

    <!--Footer Section..-->
    <%@include file="footer.jsp" %>
    <!--Footer Section..-->
    
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="assets/js/myScript.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
//            alert("Action is working..");
        });

    </script>
</body>
</html>
