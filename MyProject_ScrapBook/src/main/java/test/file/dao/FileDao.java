package test.file.dao;

public class FileDao {
	private static FileDao dao;
	private FileDao() {
	}
	
	static {
		if(dao==null) {
			dao = new FileDao();
		}
	}
	public static FileDao getInstance() {
		return dao;
	}
	
	
}
