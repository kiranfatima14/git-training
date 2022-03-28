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
                        String sql = "select * from `books` where bookid='" + id + "'";
                        resultSet = statement.executeQuery(sql);
                        while (resultSet.next()) {

                            //bookid,title,author
%>
                <!DOCTYPE html>
                <html>
                    <body>
                    <center>
                        <h1>UPDATE BOOKS DATA</h1>
                        <form method="post" action="update-processBook.jsp">
                            <input type="hidden" name="id" value="<%=resultSet.getString("bookid")%>">
                            <input type="text" name="id" value="<%=resultSet.getString("bookid")%>">
                            <br>
                            Book Title:<br>
                            <input type="text" name="title" value="<%=resultSet.getString("title")%>">
                            <br>
                            Author Name :<br>
                            <input type="text" name="author" value="<%=resultSet.getString("author")%>">
                            <br><br>
                            <input type="submit" value="submit">
                        </form>
                    </center>
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