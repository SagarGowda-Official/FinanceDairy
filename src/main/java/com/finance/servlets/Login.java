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

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(true);
		Users u;
		UsersInterface ui=new UsersImplementation();
		String email=req.getParameter("email");
		System.out.println(email);
		String pin=req.getParameter("pin");
		System.out.println(pin);
		u=ui.getUsers(email, pin);
		if(u!=null) {
			session.setAttribute("Users", u);
			RequestDispatcher rd=req.getRequestDispatcher("Dashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			session.setAttribute("loginfailure", "login failure");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
	}
}
