<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>

        body {
        	background-image: url('<%= request.getContextPath() %>/images/image1.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
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
        
        .container { 
            display: flex; 
            flex-direction: column; 
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .form {
            background: rgba(255, 255, 255, 0.9); 
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .form:hover { 
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }


        .btn1 {
            font-size: small;
        }

        .text {
            font-family: calibri;
        }


        .message1 {
            font-size: small; 
            display: flex;
            justify-content: center;
            font-family: calibri;
            color: green;
        } 
        
        .message2 {
            font-size: small; 
            display: flex;
            justify-content: center;
            font-family: calibri;
            color: red;
        }
        
        .text{
          	color:white;
          }


    </style>
</head>
<body>
	<div class="overlay"></div>
    <div class="container">
    
        <h2 class="text-center text">Welcome to Login Page</h2>
        
        <%String loginsuccess = (String) session.getAttribute("Users");
        if (loginsuccess != null) { %>
            <h3 class="message1"><%= loginsuccess %></h3>
        <% } %>
        <% String loginfailure = (String) session.getAttribute("loginfailure");
        if (loginfailure != null) { %>
            <h3 class="message2"><%= loginfailure %></h3>
        <% } %>
        
        <form class="mt-4 form" action="login" method="POST">
        <h2 class="text-center mb-4">Login</h2>
            <div class="form-group">
                <label for="email">Enter your email</label>
                <input type="text" class="form-control" name="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <label for="password">Enter your PIN:</label>
                <input type="password" class="form-control" name="pin" placeholder="pin" required>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <div style="display:flex; flex:1; font-family:calibri; justify-content:space-between; margin-top:10px;">
                <a href="SignUp.jsp" class="btn1 btn-link">New? Create Account</a>
                <a href="Resetpin.jsp" class="btn1 btn-link">Forgot PIN?</a>
                <a href="Welcome.jsp" class="btn btn-danger btn-custom">Back</a>
            </div>
        </form>
    </div>
</body>
</html>
