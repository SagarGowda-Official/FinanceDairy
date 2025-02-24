<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .card {
            width: 100%;
            max-width: 400px;
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
        
        .message1{
        	font-size:small;
        	display:flex;
        	align-items:center;
        	justify-content:center;
        	color:green;
        }
        
        .message2{
        	font-size:small;
        	display:flex;
        	align-items:center;
        	justify-content:center;
        	color:red;
        }
    </style>
</head>
<body>
	<div class="overlay"></div>
    <div class="card p-4 shadow">
        <h2 class="text-center mb-4">Signup</h2>
        
        
        <%String success=(String)session.getAttribute("success");
        	if(success!=null){%>
        	<h3 class="message1"><%=success %></h3>
        <% } %>
        <%String failure=(String)session.getAttribute("failure");
        	if(failure!=null){%>
        	<h3 class="message2"><%=failure %></h3>
        <% } %>
        
        
        <form action="signup" class="form" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="pin" class="form-label">PIN</label>
                <input type="password" class="form-control" id="pin" name="pin" required>
            </div>
            <div class="mb-3">
                <label for="confpin" class="form-label">Confirm Pin</label>
                <input type="password" class="form-control" id="confpin" name="confpin" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
        <div class="mt-3 text-center">
                <p style="text-decoration:none;font-size:small">Already have an account? <a href="Login.jsp">Login here</a></p>
                <a href="Welcome.jsp" class="btn btn-danger btn-custom">Back</a>
            </div>
    </div>
</body>
</html>
