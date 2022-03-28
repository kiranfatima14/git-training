<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book List</title>
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

                        <li class="nav-item">
                            <a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="logout.jsp">Logout</a>
                        </li>

                </div>

                <form class="d-flex">
                    <input class="form-control me-sm-2" type="text" placeholder="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>

    <center>
        <h1>Book List</h1>
    </center>
    <hr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
            Statement st = con.createStatement();
            String sql = "SELECT * FROM books";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                //bookid,title,author
                int bookid = rs.getInt("bookid");

                String title = rs.getString("title");
                String author = rs.getString("author");
                String filename = rs.getString("filename");
                String path = rs.getString("path");

    %>

    <div style="float: left; padding: 10px; margin-left: 20px;">
        <div>
            <h3>ID: <%=bookid%></h3>
            <h3>Title: <%=title%></h3>

            <h3>ID: <%=author%></h3>
            <h3><image src="<%=filename%>" width="150" height="200"/></h3>
            <a href="updateBook.jsp?id=<%=rs.getInt("bookid")%>"><h4>Update<h4></a>
                        <a href="deleteBook.jsp?id=<%=rs.getInt("bookid")%>"><h4>Delete<h4></a>

                                    </div>
                                    </div>




                                    <%
                                            }
                                        } catch (Exception e) {
                                            out.println(e);
                                        }
                                    %>
                                    </body>
                                    </html>