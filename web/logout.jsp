
<%@page import="entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGOUT</title>
    </head>
    <body>
        
        <%
            if(session.getAttribute("currentUser") == null){
                Message msg = new Message("You are already logout", "Already Logout","alert-info");
                session.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            }else {
                session.removeAttribute("currentUser");
                
                Message msg = new Message("You are logout Successfully", "Logout","alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            }
        %>
        
    </body>
</html>
