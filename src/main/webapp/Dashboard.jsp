<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.finance.pojoclasses.Users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: rgba(0, 0, 0, 0.5);
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
        }
        .dropdown-item{
        	color:black  !important;
        }
   
        .form-label{
        	font-family:sans-seriff;
        }
        
        .container-form {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
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
        
        .drop{
        	background-color:white;
        	color:blue;
        
        }
        
        .dropdown{
        	margin-right:1100px;
        }

		.uinfo{
			width:200px;
		}
		
		.logout{
			margin-right:200px;
		}
		
		.container-form {
            transition: all 0.3s ease-in-out;
        }

        .container-form:hover { 
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }
		
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
        <%Users u=(Users)session.getAttribute("Users"); %>
            <a class="navbar-brand" href="#">Welcome <%=u.getName()%></a>
            <div class="dropdown">
                <button class="drop btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Your Diary
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="ViewDairy.jsp">View Diary</a></li>
                    <li><a class="dropdown-item" href="UpdateDairy.jsp">Update Diary</a></li>
                    <li><a class="dropdown-item" href="Updateuser.jsp">Update Your Info</a></li>
                    <li><a class="dropdown-item" href="Resetpin.jsp">Reset PIN</a></li>
                </ul>
            </div>	 
           <form action="logout" method="post"><button class="btn btn-danger logout ms-auto">Logout</button></form>
           
        </div>
    </nav>
    
    <div class="container-form">
        <h2 style="font-family:sans-seriff;" class="text-center mb-4">Add Entries To Your Finance Diary!</h2>
        
        <%String transuccess=(String)session.getAttribute("transuccess");
        	if(transuccess!=null){%>
        	<h3 class="message1"><%=transuccess %></h3>
        <% } %>
        <%String tranfailure=(String)session.getAttribute("tranfailure");
        	if(tranfailure!=null){%>
        	<h3 class="message2"><%=tranfailure %></h3>
        <% } %>
        
        <form class="form" action="transaction" method="post">
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" required>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" class="form-control" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label>Type</label>
                <select name="type" class="form-control" required>
                	<option value="" disabled selected>Select Type</option>
                    <option name="type" value="Income">Income</option>
                    <option name="type" value="Expenditure">Expenditure</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-custom w-100">Submit</button>
        </form>
    </div>
</body>
</html>
