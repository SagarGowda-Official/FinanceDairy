<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.finance.IntImp.*" %>
<%@ page import="com.finance.pojoclasses.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passbook</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-color: rgba(0, 0, 0, 0.5);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .passbook-card {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            width: 90%;
            max-width: 1500px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            max-height: 400px;
            overflow-y: auto;
            margin-top: 20px;
        }
        
        .delete-btn{
        	background-color:red;
        	border:none;
        	padding:10px;
        	border-radius:5px;
        	color:white;
        	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
    </style>
</head>
<body>
    <div class="passbook-card">
        <h2>Your Diary Entries</h2>
        
        <%String deletesuccess=(String)session.getAttribute("deletesuccess");
        	if(deletesuccess!=null){%>
        	<h3 class="message1"><%=deletesuccess %></h3>
        <% } %>
        <%String deletefailure=(String)session.getAttribute("deletefailure");
        	if(deletefailure!=null){%>
        	<h3 class="message2"><%=deletefailure %></h3>
        <% } %>
        
        <%
        Users u = (Users) session.getAttribute("Users");
        if (u == null) { 
        %>
            <h3 class="text-danger">User session not found!</h3>
        <%
        } else {
            TransactionInterface ti = new TransactionImplementation();
            ArrayList<Transaction> tr = (ArrayList<Transaction>)ti.getTransaction(u.getUser_id());
        %>

        <div class="table-container">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Transaction ID</th>
                        <th>User ID</th>
                        <th>Amount</th>
                        <th>Category</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Transaction Date</th>
                        <th>Created At</th>
                        <th>Delete Transactions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (tr.isEmpty()) { %>
                    <tr>
                        <td colspan="8" class="text-center">No entries found</td>
                    </tr>
                    <% } else { 
                        for (Transaction t1 : tr) { %>
                    <tr>
                        <td><%= t1.getTransaction_id() %></td>
                        <td><%= t1.getUser_id() %></td>
                        <td><%= t1.getAmount() %></td>
                        <td><%= t1.getCategory() %></td>
                        <td><%= t1.getType() %></td>
                        <td><%= t1.getDescription() %></td>
                        <td><%= t1.getTransaction_date() %></td>
                        <td><%= t1.getCreated_at() %></td>
                        <td>
                            <form action="deleteentry" method="post">
                                 <input type="hidden" name="delete" value="<%= t1.getTransaction_id() %>">
                                 <button type="submit" class="delete-btn">Delete</button>
                            </form>                        
                        </td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>

        <a href="Dashboard.jsp" class="btn btn-primary btn-custom">Back</a>

        <% } %>
    </div>
</body>
</html>
