package com.finance.pojoclasses;

import java.sql.Date;

public class Transaction {
	private int transaction_id;
	private int user_id;
	private double amount;
	private String category;
	private String type;
	private String description;
	private Date  transaction_date;
	private Date created_at;
	
	
	@Override
	public String toString() {
		return "Transaction [transaction_id=" + transaction_id + ", user_id=" + user_id + ", balance=" + amount
				+ ", category=" + category + ", type=" + type + ", description=" + description + ", transaction_date="
				+ transaction_date + ", created_at=" + created_at + "]";
	}
	
	
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double balance) {
		this.amount = balance;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getTransaction_date() {
		return transaction_date;
	}
	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
