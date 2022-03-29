<!DOCTYPE html>
<html>
    <title>Digital Library Management System</title>


    <link rel="stylesheet" href="BootstrapStyle.css" />
    <head>
        <style>
            table{
                border:solid grey;
                padding: 5px;
                margin: 10px;

            }

            tr , td{
                padding: 5px;

            }
            #image{
                padding: 5px;
                margin:5px;
                margin-left:150px;
                margin-top: -280px;

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
                            <a class="nav-link active"  href="signup.jsp">Signup</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active"  href="index.jsp">Login</a>
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

    <h1><center>
            Digital Library Management System  
    </h1></center>
</div>


<br>
<form name="myForm" method="post" action="login.jsp">
    <center>
        <table>
            <tr><td></td><td></td></tr>
            <tr ><td>Enter usertype</td>
                <td><input type="radio" name="usertype" value="Admin">Admin
                    <br><input type="radio" name="usertype" value="Librarian">Librarian
                    <br><input type="radio" name="usertype" value="Student">Student<br></td></tr>

            <tr><td>Enter user ID</td><td> <input type="text" name="userid"></td></tr>
            <tr><td>Enter password</td><td> <input type="password" name="pw"></td></tr><br>
	

            <tr><td> </td><td> <input type="submit" value="login now!" name="login"></td></tr><br>


        </table>

</form>

</div>

<a href="signup.jsp">registered now!</a>
</center>
<div id="image">
    <img src="images/book3d.jpg" alt="book" width="25%">
</div>
</body>
</html>
