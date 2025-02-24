<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.finance.IntImp.*" %>
<%@ page import="com.finance.pojoclasses.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Transaction</title>
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
    
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }

        .update-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .btn-custom {
            width: 100%;
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
    <div class="update-form">
        <h3 class="text-center">Update your Diary Entries!</h3>
        
        <%String updatesuccess=(String)session.getAttribute("updatesuccess");
        	if(updatesuccess!=null){%>
        	<h3 class="message1"><%=updatesuccess %></h3>
        <% } %>
        <%String updatefailure=(String)session.getAttribute("updatefailure");
        	if(updatefailure!=null){%>
        	<h3 class="message2"><%=updatefailure %></h3>
        <% } %>
        
        <form action="update" class="form" method="post">
            <div class="form-group">
                <label>Transaction ID</label>
                <input type="number" name="transaction_id" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Amount</label>
                <input type="number" step="0.01" name="amount" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Category</label>
                <input type="text" name="category" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Type</label>
                <select name="type" class="form-control" required>
                	<option value="" disabled selected>Select Type</option>
                    <option name="type" value="Income">Income</option>
                    <option name="type" value="Expenditure">Expenditure</option>
                </select>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="3" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-custom">Update Entry</button>
            <a href="Dashboard.jsp" class="btn btn-secondary btn-custom mt-2">Cancel</a>
        </form>
    </div>
</body>
</html>
