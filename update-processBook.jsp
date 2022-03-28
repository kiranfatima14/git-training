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
                            <a class="nav-link active"  href="librarianPannel.jsp"> Librarian Pannel</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"   href="logout.jsp">Logout</a>
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


<hr>





<br>
<div class="container">
    <section id="main">


        <%
            //bookid,title,author
            String bookid = request.getParameter("id");
            String title = request.getParameter("title");
            String author = request.getParameter("author");

            if (bookid != null) {
                Connection con = null;
                PreparedStatement ps = null;
                //int personID = Integer.parseInt(id);
                try {
                    Class.forName(driverName);
                    con = DriverManager.getConnection(url, user, psw);

                    String sql = "Update `books` set bookid=?,title=?,author=? where bookid='" + bookid + "'";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, bookid);
                    ps.setString(2, title);
                    ps.setString(3, author);

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