package com.finance.IntImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.finance.connection.JdbcConnector;
import com.finance.pojoclasses.Users;

public class UsersImplementation implements UsersInterface {
	
	private Connection con;
	
	public UsersImplementation() {
		this.con=JdbcConnector.reqConnection();
	}
	

	@Override
	public Users insertUsers(Users u) {
		PreparedStatement ps=null;
		String query="insert into users (name,email,pin) values(?,?,?)";
		int res=0;
		try {
			
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPin());
			
			res=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return u;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	@Override
	public boolean insertUser(Users u) {
		PreparedStatement ps=null;
		String query="insert into users (name,email,pin) values(?,?,?)";
		int res=0;
		try {
			
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPin());
			
			res=ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	@Override
	public Users getUsers(String email, String pin) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Users u=null;
		String query="select * from users where email=? and pin=? ";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2,pin);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				u=new Users();
				u.setUser_id(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPin(rs.getString(4));
				u.setDate(rs.getDate(5));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return u;
	}


	@Override
	public boolean updateUsers(Users u) {
		int res=0;
		String query="update users set name=?,email=?,pin=? where user_id=?";
		
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPin());
			ps.setInt(4, u.getUser_id());
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
		
	}

}
