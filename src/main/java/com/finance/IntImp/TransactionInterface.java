package com.finance.IntImp;

import java.util.ArrayList;

import com.finance.pojoclasses.Transaction;

public interface TransactionInterface {
	public boolean insertTransaction(Transaction t);
	public ArrayList getTransaction(int user);
	public Transaction gettransaction(int user);
	public Transaction getTransactionById(int transaction_id);
	public void deleteTransaction(int transaction_id);
	public boolean updateTransaction(Transaction t);
}
