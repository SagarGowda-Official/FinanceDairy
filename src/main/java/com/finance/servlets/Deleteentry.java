package com.finance.servlets;

import java.io.IOException;

import com.finance.pojoclasses.Transaction;
import com.finance.IntImp.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteentry")
public class Deleteentry extends HttpServlet{
	@SuppressWarnings("unused")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session =req.getSession(false);
		
		if (session == null) {
            session = req.getSession();
        }
		
		int tran_id=Integer.parseInt( req.getParameter("delete"));
		Transaction t1=new Transaction();
		TransactionInterface ti=new TransactionImplementation();
		t1.setTransaction_id(tran_id);
		
		if(t1!=null) {
			ti.deleteTransaction(tran_id);
			session.setAttribute("deletesuccess", "Entry deleted successfully.");
			RequestDispatcher rd=req.getRequestDispatcher("ViewDairy.jsp");
            rd.forward(req, resp);
		}
		else {
			session.setAttribute("deletefailure", "Entry deletion failure");
			RequestDispatcher rd=req.getRequestDispatcher("ViewDairy.jsp");
            rd.forward(req, resp);
		}
	}
}
