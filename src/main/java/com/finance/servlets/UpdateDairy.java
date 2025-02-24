package com.finance.servlets;

import java.io.IOException;

import com.finance.pojoclasses.Transaction;
import com.finance.pojoclasses.Users;
import com.finance.IntImp.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateDairy extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        int tranid = Integer.parseInt(req.getParameter("transaction_id"));
        double amount = Double.parseDouble(req.getParameter("amount"));
        String category = req.getParameter("category");
        String type = req.getParameter("type");
        String description = req.getParameter("description");

        Users u = (Users) session.getAttribute("Users");
        if (u == null) {
            session.setAttribute("updatefailure", "User session not found!");
            resp.sendRedirect("UpdateDairy.jsp");
            return;
        }

        TransactionInterface ti = new TransactionImplementation();
        Transaction existingTransaction = ti.getTransactionById(tranid);

        if (existingTransaction == null) {
            session.setAttribute("updatefailure", "Invalid Transaction ID!");
            resp.sendRedirect("UpdateDairy.jsp");
            return;
        }

        Transaction t = new Transaction();
        t.setTransaction_id(tranid);
        t.setAmount(amount);
        t.setCategory(category);
        t.setType(type);
        t.setDescription(description);

        boolean success = ti.updateTransaction(t);

        if (success) {
            session.setAttribute("updatesuccess", "Transaction updated successfully.");
            RequestDispatcher rd=req.getRequestDispatcher("UpdateDairy.jsp");
            rd.forward(req, resp);
        } else {
            session.setAttribute("updatefailure", "Update failed. Try again.");
            RequestDispatcher rd=req.getRequestDispatcher("UpdateDairy.jsp");
            rd.forward(req, resp);
        }

    }
}
