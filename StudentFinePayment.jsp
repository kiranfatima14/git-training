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
    <title>Digital Library Management System|Student Book Fine Payment </title>
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
                            <a class="nav-link active" href="studentPannel.jsp"> Student Pannel</a>
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
        <div >
            <h1>
                Digital Library Management System|Student Book Fine Payment 
            </h1>
    </center>

<%

    String userid1 = (String) session.getAttribute("userid");
    out.println("<br>"+ "USER ID :" + userid1);
    session.setAttribute("userid", userid1);
//studentName,TotalFine,bookTitle

//String totalFine1=(String)session.getAttribute("totalFine");
//session.setAttribute("totalFine1",totalFine1);
//String total=(String)session.getAttribute("totalFine");
    String t ;
    t = (String) session.getAttribute("totalFine");
    session.setAttribute("totalFine", t);
    out.println("<br>"+"Total:" + t);

//out.println("totalFine1"+session.getAttribute("totalFine"));
    String bookid1 = (String) session.getAttribute("title");
    session.setAttribute("title", bookid1);
    out.println("<br>"+"BOOK ID 1:" + bookid1);

    if (request.getParameter("pay") != null) {

        String StudentName = (String) session.getAttribute("userid");

        String totalFine = (String) session.getAttribute("totalFine");
        String bookid = (String) session.getAttribute("title");

        String bankName = request.getParameter("bankName");
        String accountNo = request.getParameter("accountNo");

        int amount = Integer.parseInt(request.getParameter("amount"));
        LocalDate currentdDate1 = LocalDate.now();

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
        Statement st = conn.createStatement();
        //out.println("<br><br><br> 1=> " + StudentName + " 2=>" + bankName + "-3=>" + accountNo + "-4=>" + amount + "-5=>" + currentdDate1 + "-");
        int i = st.executeUpdate("INSERT INTO `studentaccount`(`title`, `BankName`, `AccountNo`, `BookID`, `Amount`, `Date`) values('" + StudentName + "','" + bankName + "','" + accountNo + "','" + bookid + "','" + amount + "','" + currentdDate1 + "')");

        int up = st.executeUpdate("UPDATE `issue_books` SET `Remarks`='paid' WHERE `BookTitle`='" + bookid + "' and `StudentID`='" + StudentName + "'");

        out.println("<br>"+"Your fine is paid successfully!");

    }
%>



    <hr>
    <form name="myForm" method="post" action="StudentFinePayment.jsp">
        <br>

        <table>
            <tr><td></td><td></td></tr>
            <tr><td>Enter bank Name</td><td> <input type="text" name="bankName"></td></tr>
            <tr><td>Enter Account Number</td><td> <input type="text" name="accountNo"></td></tr>
            <tr><td>Enter Amount</td><td> <input type="number" name="amount"></td></tr>
            <tr><td> </td><td> <input type="submit" value="Pay Now" name="pay"></td></tr>

        </table>
    </form>






    <br>
</div>

</body>
</html>



        </nav>

    <center>
        <div >
            <h1>
                Digital Library Management System|Student Book Fine Payment 
            </h1>
    </center>


    <hr>
    <form name="myForm" method="post" action="StudentFinePayment.jsp">
        <br>

        <table>
            <tr><td></td><td></td></tr>
            <tr><td>Enter bank Name</td><td> <input type="text" name="bankName"></td></tr>
            <tr><td>Enter Account Number</td><td> <input type="text" name="accountNo"></td></tr>
            <tr><td>Enter Amount</td><td> <input type="number" name="amount"></td></tr>
            <tr><td> </td><td> <input type="submit" value="Pay Now" name="pay"></td></tr>

        </table>
    </form>






    <br>
</div>

</body>
</html>


