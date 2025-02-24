<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Goodbye!</title>
    
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

        .message-card {
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.2);
        }

        .btn-close {
            margin-top: 20px;
            background-color: red;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-close:hover {
            background-color: darkred;
        }
        
        h2{
        	color:white;
        }
        
    </style>
</head>
<body>
	<div class="overlay"></div>
    <div class="message-card">
        <h2>Thank You for Using Our Finance Dairy App!</h2>
        <p style="color:white;">You may now close the browser.</p>
        <p style="color:white;">want to go back to APP?</p><a href="Welcome.jsp" class="btn btn-success btn-custom">Click me!</a>
    </div>

</body>
</html>
