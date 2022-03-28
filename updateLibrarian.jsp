<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <div>

        <br>
        <div class="container">
            <section id="main">



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
                <%    try {
                        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                        statement = connection.createStatement();
                        String sql = "select * from `users` where userid='" + id + "'";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {

                            //name,generation,price,author,copyright,publisher,pages,ISBN
%>
                <!DOCTYPE html>
                <html>
                    <body>
                    <center>
                        <h1>Update data from database in jsp</h1>
                        <form method="post" action="update-processLibrarian.jsp">
                            User id
                            <br>
                            <input type="hidden" name="id" value="<%=resultSet.getString("userid")%>">
                            <input type="text" name="id" value="<%=resultSet.getString("userid")%>">
                            <br>
                            Name:<br>
                            <input type="text" name="name" value="<%=resultSet.getString("name")%>">
                            <br>
                            Address:<br>
                            <input type="text" name="address" value="<%=resultSet.getString("address")%>">
                            <br>
                            Email:<br>
                            <input type="text" name="Email" value="<%=resultSet.getString("Email")%>">
                            <br>
                            Password:<br>
                            <input <input type="password" name="password" value="<%=resultSet.getString("password")%>">
                            <br>



                            <br><br>
                            <input type="submit" value="submit">
                            </center>
                        </form>
                        <%
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>


            </section>
        </div>

</body>
</html>