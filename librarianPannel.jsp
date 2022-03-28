
<!DOCTYPE html>
<html>
    <head>
        <style>
            li a, .dropbtn {
                display: inline-block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;

            }

            li a:hover, .dropdown:hover .dropbtn {
                background-color: red;
            }

            li.dropdown {
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .dropdown-content a:hover {background-color: #f1f1f1;}

            .dropdown:hover .dropdown-content {
                display: block;
            }
        </style>
    </head>
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
                        <li class="dropdown">
                            <a class="nav-link active" href="javascript:void(0)" class="dropbtn">Books</a>
                            <div class="dropdown-content">
                                <a href="addBooks.jsp">Add Books</a>
                                <a href="BooksList.jsp">View Books</a>
                                <a href="BookFine.jsp">Book Fine</a>
                                <a href="BookReceived.jsp">Received Book</a>
                                <a href="BookIssue.jsp">issue Book</a>
                            </div>
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
                <h1>Digital Library Management System | Admin Pannel </h1>
            </center>
        </div>
    <center>
        <div id="image">
            <img src="images/openbook.jpg" alt="openbook" width="30%">
            </center>
        </div> 

    </body>
</html>