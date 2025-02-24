package com.finance.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConnector {
	public static Connection reqConnection() {
		String url="jdbc:mysql://localhost:3306/finance";
		String user="root";
		String password="tiger";
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		return con;
	}
}
