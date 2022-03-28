<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Books</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />
    <head>
        <style>
            table tr td{
                padding: 5px;
                margin:10px;
            }
            table{
                border: solid yellow;
            }
        </style>
    </head>
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
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            <table width="400px" align="center" border=2>
                <tr>




                    <td align="center" colspan="2"><h3>ADD BOOK DETAILS</h3></td>
                </tr>
                <tr>
                    <td>Title </td>
                    <td><input type="text" name="title" /></td>
                </tr>
                <tr>
                    <td>author </td>
                    <td>
                        <input type="text" name="author">
                    </td>
                </tr>
                <tr>
                    <td>Generation </td>
                    <td>
                        <input type="text" name="generation">
                    </td>
                </tr>

                <tr>
                    <td>pages </td>
                    <td><input type="number" name="pages" /></td>
                </tr>
                <tr>
                    <td>Edition </td>
                    <td>
                        <input type="text" name="edition">
                    </td>
                </tr>
                <tr>
                    <td>Copyrights </td>
                    <td>
                        <input type="text" name="copyrights">
                    </td>
                </tr>

                <tr>
                    <td>Publishers</td>
                    <td>
                        <input type="text" name="publishers">
                    </td>
                </tr>





                <tr>
                    <td>Image Link: </td>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
                <tr>
                    <td>category </td>
                    <td>
                        <input type="text" name="category">
                    </td>
                </tr>

                <td></td>
                <td><input type="submit" value="Submit"></td>
                </tr>
            </table>

        </form><br>

    </body>
</html>