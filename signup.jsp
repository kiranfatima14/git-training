

<!DOCTYPE html>
<html>
    <title>Digital Library Management System</title>
    <link rel="stylesheet" href="BootstrapStyle.css" />
    <head>
        <style>
            table{
                padding:10px;
                margin:20px;
            }
            #link{
                padding: 10px;
                margin:20px;
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
                        <li class="nav-item active">
                            <a class="nav-link"  href="signup.jsp">Signup</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link"  href="index.jsp">Login</a>
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
    <br>
    <form name="myForm" method="post" action="signup-process.jsp">


        <table>
            <tr><td></td><td></td></tr>
            <tr><td>Enter Full user name</td><td> <input type="text" name="name"></td></tr>
            <tr><td>Enter user ID</td><td> <input type="text" name="userid"></td></tr>
            <tr><td>Enter password</td><td> <input type="password" name="pw"></td></tr>
            <tr><td>Enter address</td><td> <input type="text" name="address"></td></tr>
            <tr><td>Enter discipline</td><td> <input type="text" name="discipline"></td></tr>
            <tr><td>Enter email</td><td> <input type="text" name="email"></td></tr>
            <tr><td>Enter usertype</td>
                <td><input type="radio" name="usertype" value="Admin">Admin
                    <br><input type="radio" name="usertype" value="Librarian">Librarian
                    <br><input type="radio" name="usertype" value="Student">Student<br></td></tr>







            <tr><td> </td><td> <input type="submit" value="login now!" name="login"></td></tr>

        </table>
    </form>
</div>
<div id="link">
    <a href="index.jsp">singup if you are already registered!</a>
</div>
</body>
</html>