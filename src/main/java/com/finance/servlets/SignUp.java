package com.finance.servlets;

import java.io.IOException;

import com.finance.pojoclasses.Users;
import com.finance.IntImp.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")
public class SignUp extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(true);
		Users u=new Users();
		UsersInterface ui=new UsersImplementation();
		String name=req.getParameter("name");
		u.setName(name);
		String email=req.getParameter("email");
		u.setEmail(email);
		String pin=req.getParameter("pin");
		String confirmPin=req.getParameter("confpin");
		
		if(pin.equals(confirmPin)) {
			u.setPin(confirmPin);
			
			boolean status=ui.insertUser(u);
			
			if(status) {
				session.setAttribute("success", "signup successful");
				RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
				rd.forward(req, resp);
			}
			else {
				session.setAttribute("failure", "signup failure");
				RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			session.setAttribute("failure", "Pin doesnt match");
			RequestDispatcher rd=req.getRequestDispatcher("SignUp.jsp");
			rd.forward(req, resp);
		}
	}
}
