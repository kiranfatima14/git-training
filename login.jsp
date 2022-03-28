<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .myspan{
                padding:5px;
                margin:10px;
                font-size: 20px;
                width: 20px;
                color: orange;
            }
            
            </style>
    <title>Digital Library Management System</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">DLMS</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">

                            <a class="nav-link active" href="index.jsp">Home
                                <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                </div>
        </nav>

    </body>
</html>
<%
    String userid = request.getParameter("userid");
    //session.putValue("email", email);
    String password = request.getParameter("pw");
    String usertype = request.getParameter("usertype");

    try {

        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("select * from users where userid='" + userid + "' and password='" + password + "' and usertype='" + usertype + "' ");

        if (rs.next()) {
            if (usertype.equals("Admin")) {
                out.println("Admin is login successfully");
                session.setAttribute("userid", userid);
                response.sendRedirect("adminPannel.jsp");
            } else if (usertype.equals("Librarian")) {
                out.println("Librarian is login successfully");
                session.setAttribute("userid", userid);
                response.sendRedirect("librarianPannel.jsp");

            } else if (usertype.equals("Student")) {
                out.println("Student is login sucessfully");
                session.setAttribute("userid", userid);
                response.sendRedirect("studentPannel.jsp");

            }

        } else {
            out.println("<span class=\"myspan\">Please enter correct userid and password</span>");

        }

    } catch (Exception e) {
        out.println(e);
        e.printStackTrace();
    }

%>
