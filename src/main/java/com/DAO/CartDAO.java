package com.DAO;
import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int uid);

	public boolean removeBooks(int bid , int uid,int cid);

}
