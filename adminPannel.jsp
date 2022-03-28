<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
    <title>Digital Library Management System|Admin Pannel</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />

    <style>

        h2   {color: white;}
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
<div style="background-color:Orange; width:40%; height:200px;float:left; padding:10px; margine:10px; margin-left:50px; margin-top: 10px;">

    <%
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = con.createStatement();
   
        ResultSet rs = st.executeQuery("select count(*) from users WHERE usertype='librarian'");
    String CountLib="";
    while(rs.next()){
    CountLib = rs.getString(1);
    out.println("<h2> Total Registered Librarians :" +CountLib+"</h2>");
    }
    }
    catch (Exception e){
    e.printStackTrace();
    }
    %>


</div>

<div style="background-color:SlateBlue; width:40%; height:200px;float:left; padding:10px; margine:10px; margin-left:50px; margin-top:10px;">

    <%
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = con.createStatement();
   
        ResultSet rs = st.executeQuery("select count(*) from users WHERE usertype='student'");
    String CountLib="";
    while(rs.next()){
    CountLib = rs.getString(1);
    out.println("<h2>Total Registered Students :" +CountLib+"</h2>");
    }
    }
    catch (Exception e){
    e.printStackTrace();
    }
    %>


</div>


<div style="background-color:Green; float:left; width:40%; height:200px; padding: 10px; margine:10px; margin-left:50px; margin-top:10px;">

    <%
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st2 = con1.createStatement();
   
        ResultSet rs2 = st2.executeQuery("select count(*) from books");
    String Countbooks="";
    while(rs2.next()){
    Countbooks = rs2.getString(1);
    out.println("<h2>Total Books :" +Countbooks+"</h2>");
    }
    }
    catch (Exception e){
    e.printStackTrace();
    }
    %>


</div>

<div style="background-color:Tomato; float:left; width:40%; height:200px; padding: 10px; margine:10px; margin-left:50px; margin-top:10px; ">

    <%
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st2 = con1.createStatement();
   
        ResultSet rs2 = st2.executeQuery("select Sum(Amount) from studentaccount");
    String Countbooks="";
    while(rs2.next()){
    Countbooks = rs2.getString(1);
    out.println("<h2>Total fine Collected :" +Countbooks+"</h2>");
    }
    }
    catch (Exception e){
    e.printStackTrace();
    }
    %>


</div>







</div>

</body>
</html>