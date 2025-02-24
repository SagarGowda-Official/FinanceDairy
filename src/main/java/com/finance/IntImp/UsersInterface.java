package com.finance.IntImp;

import com.finance.pojoclasses.Users;

public interface UsersInterface {
	public boolean insertUser(Users u);
	public Users insertUsers(Users u);
	public Users getUsers(String email,String pin);
	public boolean updateUsers(Users u);
}
