<%-- 
    Document   : error_page404
    Created on : Nov 5, 2022, 12:56:40 PM
    Author     : Majid Paplu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong..!</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">    </head>
    </head>
    <body>
        <div class="container text-center mt-5" >
            <img class="img-fluid w-25 mb-2 " src="assets/img/error_page.png">
            <p class="display-3 mb-3">Sorry ! Something went wrong..!</p>
            <p class="mb-3"><%= exception %></p>
            <a href="index.jsp" class="btn btn-outline-primary mt-3">BACK TO HOME</a>
        </div>
    </body>
</html>
