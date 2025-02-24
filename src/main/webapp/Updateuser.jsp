<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Details</title>

    <!-- Bootstrap CSS -->
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

        /* Card Styling */
        .update-card {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            text-align: left;
        }

        .btn-custom {
            width: 100%;
            margin-top: 10px;
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
    <div class="update-card form">
        <h2>Update Details</h2>
        
        <%String userupdatesuccess = (String) session.getAttribute("userupdatesuccess");
        if (userupdatesuccess != null) { %>
            <h3 class="message1"><%= userupdatesuccess %></h3>
        <% } %>
        
        <% String userupdatefailure = (String) session.getAttribute("userupdatefailure");
        if (userupdatefailure != null) { %>
            <h3 class="message2"><%= userupdatefailure %></h3>
        <% } %>

        <form action="updateuser" method="POST">
            <div class="form-group">
                <label for="name">Update Name:</label>
                <input type="text" class="form-control" name="name" placeholder="Enter new name">
            </div>

            <div class="form-group">
                <label for="mail">Update Email:</label>
                <input type="email" class="form-control" name="email" placeholder="Enter new email">
            </div>
            <button type="submit" class="btn btn-primary btn-custom">Update</button>
            <a href="Dashboard.jsp" class="btn btn-secondary btn-custom">Back</a>
        </form>
    </div>

</body>
</html>
