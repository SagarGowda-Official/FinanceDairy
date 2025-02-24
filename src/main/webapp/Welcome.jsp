<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Bank</title>


    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    

    <style>
        body { 
            background-image: url('<%= request.getContextPath() %>/images/image1.jpg'); 
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            color: white;
            position: relative;
        }


        .overlay {
            position: absolute; 
            top: 0;
            left: 0;
            width: 100%;
            height: 100%; 
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.7); 
        }

        .navbar a {
            color: white;
        }

        .navbar a:hover {
            color: #f39c12; 
        }

        .welcome-container {
            text-align: center;
            padding: 100px 0;
        }

        .welcome-container h1 {
            font-size: 48px;
            font-weight: 600;
        }

        .welcome-container p {
            font-size: 20px;
            margin-bottom: 50px;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.9); 
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            margin-bottom: 30px;
            transition: all 0.3s ease-in-out;
        }

        .card:hover { 
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }

        .card-btn {
            width: 100%;
            font-size: 18px;
            padding: 15px;
            border-radius: 5px;
            text-align: center;
        }

        .btn-login { background-color: #4CAF50; color: white; }
        .btn-signup { background-color: #3498db; color: white; }
        .btn-exit { background-color: #e74c3c; color: white; }

        .card-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            margin-top: 40px;
        }

        .card-container .col-md-4 {
            max-width: 300px;
            width: 100%;
        }
        
       
        
    </style>
</head>
<body>


    <div class="overlay"></div>


    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Finance Diary Manager</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>

    <div class="welcome-container">
        <h1 style="font-family:sans-seriff;">Welcome to Finance Diary Manager</h1>
        <p>Make an entry on all your day-to-day transactions. Let's get started!</p>

        <div class="card-container">

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Login</h5>
                        <a href="Login.jsp" class="btn btn-login card-btn">Login to Your Account</a>
                    </div>
                </div>
            </div>


            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sign Up</h5>
                        <a href="SignUp.jsp" class="btn btn-signup card-btn">Create a New Account</a>
                    </div>
                </div>
            </div>

  
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Exit</h5>
                        <a href="Exit.jsp" class="btn btn-exit card-btn">Exit Finance Diary</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
