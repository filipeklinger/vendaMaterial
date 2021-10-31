<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String msg = (String) session.getAttribute("msg");
            if (!(msg == null)) {
                if (msg.contains("sucesso")) {
                    out.print("<div class='alert alert-success alert-dismissible' role='alert'>");
                    out.print("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                    out.print("<strong> " + msg + " </strong>");
                    out.print("</div>");
                } else {
                    out.print("<div class='alert alert-danger alert-dismissible' role='alert'>");
                    out.print("<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>");
                    out.print("<strong> " + msg + " </strong>");
                    out.print("</div>");
                }
                session.setAttribute("msg", null);
            }
        %>
        <h1>Login Handler</h1>
    </body>
</html>
