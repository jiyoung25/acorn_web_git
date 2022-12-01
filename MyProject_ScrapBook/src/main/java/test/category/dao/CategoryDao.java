package test.category.dao;

public class CategoryDao {
	private static CategoryDao dao;
	private CategoryDao() {
	}
	
	static {
		if(dao==null) {
			dao = new CategoryDao();
		}
	}
	public static CategoryDao getInstance() {
		return dao;
	}
	
	
}
