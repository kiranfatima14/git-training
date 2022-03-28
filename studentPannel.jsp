<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <title>Digital Library Management System|Student Pannel</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />

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
                        <li class="nav-item">
                            <a class="nav-link active"  href="StudentIssuedBooks.jsp">MY BOOKS</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"  href="logout.jsp">Logout</a>
                        </li>
                </div>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <div >
        <center>
            <h1>Digital Library Management System </h1>
        </center>
    </div>

    <%

        String userid = (String) session.getAttribute("userid");
        out.println("Welcome -" + userid);

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = con.createStatement();

        ResultSet rs = null;

        ResultSet rs1 = null;

        if (request.getParameter("search") != null) {
            String t = request.getParameter("title");
            String sql = "SELECT * FROM books where title='" + t + "'";
            rs = st.executeQuery(sql);
            //out.println("Search");

        } else {
            String sql = "SELECT * FROM books";
            rs = st.executeQuery(sql);
            //out.println("Not Search"); 

        }


    %>


    <br>
    <form name="myForm" method="post" action="studentPannel.jsp">
        Enter book Title : <input type="text" name="title">
        <input type="submit" value="search now" name="search"><input type="submit" value="showall" name="showall"><br>

        <%     try {

                if (rs != null) {
                    while (rs.next()) {
                        int bookid = rs.getInt("bookid");

                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String filename = rs.getString("filename");
                        String path = rs.getString("path");

        %>

        <div style="float: left; padding: 10px;">
            <div>
                <h3>ID: <%=bookid%></h3>
                <h3>Title: <%=title%></h3>

                <h3>Author: <%=author%></h3>
                <h3><image src="<%=filename%>" width="150" height="200"/></h3>


            </div>
        </div>




        <%
                    }

                } else {
                    out.println("Book of this title does not exist");

                }

            } catch (Exception e) {
                out.println(e);
            }
        %>

    </form>
</body>
</html>