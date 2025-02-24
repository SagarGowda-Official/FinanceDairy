package com.finance.IntImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.finance.connection.JdbcConnector;
import com.finance.pojoclasses.Transaction;

public class TransactionImplementation implements TransactionInterface {

	Connection con;
	
public TransactionImplementation() {	
	this.con=JdbcConnector.reqConnection();
}
	
	@Override
	public boolean insertTransaction(Transaction t) {
		PreparedStatement ps=null;
		String query="insert into transactions(user_id,amount,category,type,description) values(?,?,?,?,?)";
		int res=0;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, t.getUser_id());
			ps.setDouble(2, t.getAmount());
			ps.setString(3, t.getCategory());
			ps.setString(4, t.getType());
			ps.setString(5, t.getDescription());
			
			res=ps.executeUpdate();
					
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
			return false;
		}
		
	}

	@Override
	public ArrayList getTransaction(int user_id) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from transactions where user_id=?";
		Transaction t=null;
		ArrayList<Transaction> dairy=new ArrayList<Transaction>();
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, user_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setTransaction_id(rs.getInt(1));
				t.setUser_id(rs.getInt(2));
				t.setAmount(rs.getDouble(3));
				t.setCategory(rs.getString(4));
				t.setType(rs.getString(5));
				t.setDescription(rs.getString(6));
				t.setTransaction_date(rs.getDate(7));
				t.setCreated_at(rs.getDate(8));
				dairy.add(t);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return dairy;
	}


	@Override
	public void deleteTransaction(int transaction_id) {
		try {
	        // Delete transaction
	        String deleteSQL = "DELETE FROM transactions WHERE transaction_id = ?";
	        PreparedStatement pstmt = con.prepareStatement(deleteSQL);
	        pstmt.setInt(1, transaction_id);
	        pstmt.executeUpdate();

	        System.out.println("Transaction deleted and IDs reset successfully.");
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		
	}

	@Override
	public boolean updateTransaction(Transaction t) {
	    String query = "UPDATE transactions SET amount=?, category=?, type=?, description=? WHERE transaction_id=?";
	    int res = 0;
	    
	    try {
	        con.setAutoCommit(false);
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setDouble(1, t.getAmount());
	        ps.setString(2, t.getCategory());
	        ps.setString(3, t.getType());
	        ps.setString(4, t.getDescription());
	        ps.setInt(5, t.getTransaction_id());  // WHERE condition
	        
	        res = ps.executeUpdate();
	        
	        if (res > 0) {
	            con.commit();
	            return true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            con.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return false;
	}

	@Override
	public Transaction gettransaction(int user) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from transactions where user_id=?";
		Transaction t=null;
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, user);
			rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setTransaction_id(rs.getInt(1));
				t.setUser_id(rs.getInt(2));
				t.setAmount(rs.getDouble(3));
				t.setCategory(rs.getString(4));
				t.setType(rs.getString(5));
				t.setDescription(rs.getString(6));
				t.setTransaction_date(rs.getDate(7));
				t.setCreated_at(rs.getDate(8));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return t;
	}
	
	public Transaction getTransactionById(int transaction_id) {
	    String query = "SELECT * FROM transactions WHERE transaction_id=?";
	    Transaction t = null;
	    
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, transaction_id);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            t = new Transaction();
	            t.setTransaction_id(rs.getInt("transaction_id"));
	            t.setUser_id(rs.getInt("user_id"));
	            t.setAmount(rs.getDouble("amount"));
	            t.setCategory(rs.getString("category"));
	            t.setType(rs.getString("type"));
	            t.setDescription(rs.getString("description"));
	            t.setTransaction_date(rs.getDate("transaction_date"));
	            t.setCreated_at(rs.getDate("created_at"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return t;
	}
	

}
