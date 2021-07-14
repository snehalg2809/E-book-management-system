package com.DAO;

import com.entity.user;

public interface UserDAO {
	public boolean userRegister(user us);
	
	public user login(String email,String password);
	
	public boolean EditProfile(user us);
	
	public user getUserById(int id);
	
	public boolean EditAddress(user us);
	
	public boolean checkPassword(int id, String ps);
	
	public boolean checkUser(String em);


}
