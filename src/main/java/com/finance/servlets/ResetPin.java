package com.finance.servlets;

import java.io.IOException;

import com.finance.pojoclasses.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.finance.IntImp.*;


@WebServlet("/resetpin")
public class ResetPin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession(false);
		Users u=(Users)session.getAttribute("Users");
		String oldPin=u.getPin();
		String email=req.getParameter("email");
		String enterOldPin=req.getParameter("oldpin");
		String pin=req.getParameter("newpin");
		String confirmPin=req.getParameter("confirmnewpin");
		
		UsersInterface ui=new UsersImplementation();
		
		if(oldPin.equals(enterOldPin)) {
			if(pin.equals(confirmPin)) {
				u.setEmail(email);
				u.setPin(confirmPin);
				boolean res=ui.updateUsers(u);
				if(res) {
					session.setAttribute("pinsuccess", "pin changed successfull");
					RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
					rd.forward(req, resp);
				}
				else {
					session.setAttribute("pinfailure", "pin change failure");
					RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
					rd.forward(req, resp);
				}
			}
			else {
				session.setAttribute("pinfailure", "new pin & confirm pin doesnt match");
				RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			session.setAttribute("pinfailure", "invalid old pin");
			RequestDispatcher rd=req.getRequestDispatcher("Resetpin.jsp");
			rd.forward(req, resp);
		}
	}
}
