<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
    <title>Digital Library Management System|Librarian Pannel</title>
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
        <div>
            <center>


                <div >
                    <h1>Digital Library Management System |BOOK RECIEVED
                    </h1>
                </div>
            </center>
 <br>
            <center>
                <div >
                    <form name="myForm" method="post" action="BookReceived.jsp">
                        <table>
                            <tr>
                                <td>Student ID </td>
                                <td> <input type="text" name="studentID"></td>
                            </tr>
                            <tr>
                                <td>Book Title </td>
                                <td> <input type="text" name="title"></td>
                            </tr>

                            <tr>
                                <td></td>
                                <td> <input type="submit" value="Receive" name="Receive"></td>
                            </tr>

                        </table>
                    </form>

                </div>
        </div>
    </center>

</body>
</html>


<%

    if (request.getParameter("Receive") != null) {

        LocalDate currentdDate1 = LocalDate.now();

        out.println("current Date : " + currentdDate1);

        String studentID = request.getParameter("studentID");
        String title = request.getParameter("title");

        String remarks = "paid";
        String status = "returned";

        Class.forName("com.mysql.jdbc.Driver");
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");

        Statement st1 = con1.createStatement();

        int i = st1.executeUpdate("UPDATE `issue_books` SET `Remarks`='" + remarks + "',`Status`='" + status + "',`Date_of_Ret`='" + currentdDate1 + "' where `BookTitle`='" + title + "' and `StudentID`='" + studentID + "'");

        out.println(i);
        out.println("Book is returned successfully!");

    }//end save fine

%>

           