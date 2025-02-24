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

@WebServlet("/updateuser")
public class Updateuser extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Users u=(Users)session.getAttribute("Users");
		UsersInterface ui=new UsersImplementation();
		int user_id=u.getUser_id();
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		u.setName(name);
		u.setEmail(email);
		u.setUser_id(user_id);
		boolean res=ui.updateUsers(u);
		if(res){
			session.setAttribute("userupdatesuccess", "User info updated successfully.");
            RequestDispatcher rd=req.getRequestDispatcher("Updateuser.jsp");
            rd.forward(req, resp);
		}
		else {
			session.setAttribute("userupdatefailure", "User info update failure.");
            RequestDispatcher rd=req.getRequestDispatcher("Updateuser.jsp");
            rd.forward(req, resp);
		}
	}
}
