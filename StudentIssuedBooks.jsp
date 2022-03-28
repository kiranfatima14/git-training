<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
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
        out.println("<br><br>");
        if (request.getParameter("id") != null) {

            String id = request.getParameter("id");
            out.println(id);
            ResultSet rs2 = null;
            int fine = 0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
            Statement st2 = con2.createStatement();

            String sql2 = "SELECT * FROM `issue_books` WHERE StudentID='" + userid + "' and BookID='" + id + "'";
            rs2 = st2.executeQuery(sql2);

            if (rs2 != null) {
                while (rs2.next()) {
                    int bookid = rs2.getInt("BookID");

                    String title = rs2.getString("BookTitle");
                    String Date_of_Issue = rs2.getString("Date_of_Issue");
                    String Date_of_Ret = rs2.getString("Date_of_Ret");
                    out.println("<br> bookid : " + bookid);

                    out.println("<br> Book Title: " + title);
                    session.setAttribute("title", title);
                    out.println("<br> return Date: " + Date_of_Ret);

                    LocalDate currentdDate1 = LocalDate.now();

                    out.println("<br> Current Date: " + currentdDate1);

                    LocalDate returnDate1 = LocalDate.parse(Date_of_Ret);
                    //out.println(currentdDate1.until(returnDate1, ChronoUnit.DAYS));
                    out.println("<br> " + currentdDate1);
                    out.println("<br> " + returnDate1);

                    Period period = Period.between(returnDate1, currentdDate1);
                    int days = period.getDays();
                    out.println("<br> Period :" + days);

                    ///////////////////
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
                    Statement st4 = con4.createStatement();

                    ResultSet rs4 = null;

                    session.setAttribute("bookid", bookid);//create session
                    String sql4 = "SELECT * FROM `booksfine` WHERE BookID='" + bookid + "'";
                    rs4 = st4.executeQuery(sql4);

                    if (rs4 != null) {
                        while (rs4.next()) {
                            String s = rs4.getString("BookID");
                            String a = rs4.getString("amount");
                            fine = Integer.parseInt(a);

                        }
                    }

                    int amount = fine;
                    int totalFine = amount * days;
                    out.println("<br> totalFine: " + totalFine);
                    session.setAttribute("totalFine", totalFine);

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
                    Statement st = conn.createStatement();

                    response.sendRedirect("StudentFinePayment.jsp");
                    ////////////////////////

                }
            }

        }


    %>



    <%     Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = con.createStatement();

        ResultSet rs = null;

        String sql = "SELECT * FROM `issue_books` WHERE StudentID='" + userid + "' and `Status`='issued'";
        rs = st.executeQuery(sql);
        //out.println("Not Search"); 


    %>


    <br>

    <%     try {

            if (rs != null) {
                while (rs.next()) {
                    int bookid = rs.getInt("BookID");

                    String title = rs.getString("BookTitle");
                    String Date_of_Issue = rs.getString("Date_of_Issue");
                    String Date_of_Ret = rs.getString("Date_of_Ret");


    %>

    <div style="float:left; padding: 10px;">

        <h3>ID: <%=bookid%></h3>
        <h3>Title: <%=title%></h3>

        <h3>Date_of_Issue: <%=Date_of_Issue%></h3>
        <h3> Date_of_Return: <%=Date_of_Ret%></h3>


    </div>





    <%
                }

            } else {
                out.println("Not book is issued!");

            }

        } catch (Exception e) {
            out.println(e);
        }
    %>






    <h3 style="color:red;"> Your fine Books</h3>

    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st1 = con1.createStatement();

        ResultSet rs1 = null;

        //query for fine books
        String sql1 = "SELECT issue_books.BookID AS BookID,issue_books.BookTitle AS BookTitle,issue_books.Date_of_Issue AS Date_of_Issue,DATE_FORMAT(issue_books.Date_of_Ret, '%Y-%m-%d') AS Date_of_Ret,booksfine.BookID,booksfine.BookTitle,booksfine.amount"
                + " FROM `issue_books`INNER JOIN booksfine ON issue_books.BookID=booksfine.BookID"
                + " WHERE issue_books.StudentID='" + userid + "' and issue_books.Date_of_Ret<CURDATE() and issue_books.Remarks='ok'";
        rs1 = st1.executeQuery(sql1);

        if (rs1 != null) {
            while (rs1.next()) {
                int bookid = rs1.getInt("BookID");

                String title = rs1.getString("BookTitle");
                String Date_of_Issue = rs1.getString("Date_of_Issue");
                String Date_of_Ret = rs1.getString("Date_of_Ret");


    %>

    <div>
        <h3>Book ID: <%=bookid%></h3>
        <h3>Book Title: <%=title%></h3>
        <h3>Due Date: <%=Date_of_Ret%></h3>	
    </div>		
    <form name="myForm" method="get" action="StudentIssuedBooks.jsp">

        <a href="StudentIssuedBooks.jsp?id=<%=rs1.getInt("BookID")%>">Pay your fine </a>
        <br>


        <%
                }
            }


        %>

















    </form>
</body>
</html>