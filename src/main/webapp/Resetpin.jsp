<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Your Pin?</title>

    <!-- Bootstrap 4 CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Optional: Custom styles for the form -->
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
    	
    
        .forgot-pin-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .forgot-pin-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form{
		background-color: #fff;
	    padding: 30px;
	    border-radius: 10px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
	    transition: all 0.3s ease-in;
	}
	.form:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
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
    </style>
</head>
<body>
	<div class="overlay"></div>
    <div class="container">
        <div class="forgot-pin-container">
            <h2>Forgot Your Pin?</h2>
			<%String pinsuccess = (String) session.getAttribute("pinsuccess");
	        if (pinsuccess != null) { %>
	            <h3 class="message1"><%= pinsuccess %></h3>
	        <% } %>
	        
	        <% String pinfailure = (String) session.getAttribute("pinfailure");
	        if (pinfailure != null) { %>
	            <h3 class="message2"><%= pinfailure %></h3>
	        <% } %>
            <!-- Form to collect the user's information for resetting the pin -->
            <form class="form" action="resetpin" method="POST">

                <div class="form-group">
                    <label for="phoneNumber">Email</label>
                    <input type="tel" class="form-control" id="Email" name="email" required placeholder="Enter your registered phone number">
                </div>
				
				<div class="form-group">
                    <label for="newPin">Old Pin</label>
                    <input type="password" class="form-control" id="newPin" name="oldpin" required placeholder="Enter your new pin">
                </div>
				
                <div class="form-group">
                    <label for="newPin">New Pin</label>
                    <input type="password" class="form-control" id="newPin" name="newpin" required placeholder="Enter your new pin">
                </div>

                <div class="form-group">
                    <label for="confirmNewPin">Confirm New Pin</label>
                    <input type="password" class="form-control" id="confirmNewPin" name="confirmnewpin" required placeholder="Confirm your new pin">
                </div>

                <button type="submit" class="btn btn-primary btn-block">Reset Pin</button>
            </form>

            <div class="mt-3 text-center">
                <form action="logout" method="post" >Remember pin? <button type="submit" class="btn btn-primary btn-custom">login here</button></form>
                <form action="logout" method="post" ><button style="margin-top:10px;" type="submit" class="btn btn-primary btn-custom">BACK</button></form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 4 JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
