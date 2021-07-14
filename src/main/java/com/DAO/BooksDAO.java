package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BooksDAO {
	
	public boolean addBooks(BookDtls b);
		
	public List<BookDtls> getAllBook();
	
	public BookDtls getBookById(int id);
	
	public boolean updateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();
	
	public List<BookDtls> getRecentBook();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllNewBooks();

	public List<BookDtls> getAllOldBooks();

	public List<BookDtls> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email,String cate, int id);
	
	public List<BookDtls> getBookBySearch(String ch);



	
}
