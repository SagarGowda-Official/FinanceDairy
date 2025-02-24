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

@WebServlet("/transaction")
public class AddTransaction extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		Transaction t=new Transaction();
		TransactionInterface ti=new TransactionImplementation();
		Users u=(Users)session.getAttribute("Users");
		t.setUser_id(u.getUser_id());
		int id=t.getUser_id();
		Double amount=Double.parseDouble(req.getParameter("amount"));
		t.setAmount(amount);
		String category=req.getParameter("category");
		t.setCategory(category);
		String type=req.getParameter("type");
		t.setType(type);
		String descrription=req.getParameter("description");
		t.setDescription(descrription);
		boolean result=ti.insertTransaction(t);
		if(result) {
			session.setAttribute("transuccess", "transaction successfull");
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			session.setAttribute("tranfailure", "transaction failure");
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
	}
}
