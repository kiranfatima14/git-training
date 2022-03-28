<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
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

 
<br>
<hr>
<div class="container">
      <section id="main">
	  
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM `users` WHERE userid='"+id+"'");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</section>
</div>

</body>
</html>