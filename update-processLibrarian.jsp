<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/dlms";%>
<%!String user = "root";%>
<%!String psw = "";%>

<html>
    <title>Digital Library Management System</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />
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
                            <a class="nav-link active"  href="adminpannel.jsp">Admin Pannel</a>
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
<center>
    <div class="container">
        <h1>Digital Library Management System  
        </h1>
    </div>
</center>

<br>
<div class="container">
    <section id="main">


        <%
        //name,generation,price,author,copyright,publisher,pages,ISBN
            String userid = request.getParameter("id");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String Email = request.getParameter("Email");
            String password = request.getParameter("password");

            if (userid != null) {
                Connection con = null;
                PreparedStatement ps = null;
        //int personID = Integer.parseInt(id);
                try {
                    Class.forName(driverName);
                    con = DriverManager.getConnection(url, user, psw);
        ////name,generation,price,author,copyright,publisher,pages,ISBN
                    String sql = "Update `users` set userid=?,name=?,address=?,Email=?, password=? where userid='" + userid + "'";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, userid);
                    ps.setString(2, name);
                    ps.setString(3, address);
                    ps.setString(4, Email);
                    ps.setString(5, password);
                    int i = ps.executeUpdate();
                    if (i > 0) {
                        out.print("Record Updated Successfully");
                    } else {
                        out.print("There is a problem in updating Record.");
                    }
                } catch (SQLException sql) {
                    request.setAttribute("error", sql);
                    out.println(sql);
                }
            }
        %>


    </section>
</div>

</body>
</html>