<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "dlms";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

%>

<html>
    <title>Digital Library Management System</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />
    <head>
        <style>
            table tr td{
                border: solid yellow;
                padding:10px;
                marging:20px;
            }

        </style>
    </head>

    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand active" href="#">DLMS</a>
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
                        <a class="nav-link active"  href="adminPannel.jsp">Admin Pannel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"  href="admin_Add_Librarian.jsp">Add Librarian</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active"  href="admin_Manage_Librarian.jsp">Manage Librarian</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="logout.jsp">Logout</a>
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
        <h1>Digital Library Management System | Admin Pannel </h1>
    </center>
</div>

<br>
<center>
    <h1>Manage Librarians </h1>
    <table>
        <tr>
            <td>Userid</td>
            <td>Name</td>
            <td>address</td>
            <td>Email</td>
            <td>Update</td>
            <td>Delete</td>
        </tr>
</center>
<%    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from users where usertype='Librarian'";
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            //name,generation,price,author,cp,publisher,page,isbn
            //author,copyright,publisher,pages,ISBN
%>
<tr>
    <td><%=resultSet.getString("userid")%></td>
    <td><%=resultSet.getString("name")%></td>
    <td><%=resultSet.getString("address")%></td>
    <td><%=resultSet.getString("Email")%></td>
    <td><a href="updateLibrarian.jsp?id=<%=resultSet.getString("userid")%>">Update</a></td>
    <td><a href="deleteLibrarian.jsp?id=<%=resultSet.getString("userid")%>">Delete</a></td>
</tr>
<%
        }
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>
<br>
<br>
<br>
<br>
</section>
</div>

</body>
</html>