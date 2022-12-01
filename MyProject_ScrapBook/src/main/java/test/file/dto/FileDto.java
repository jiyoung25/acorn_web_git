package test.file.dto;

public class FileDto {
	private int num;
	private String writer;
	private String category;
	private String title;
	private String file_comment;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private String regdate;
	
	private int startRowNum;
	private int endRowNum;
	
	FileDto(){
		
	}

	public FileDto(int num, String writer, String category, String title, String file_comment, String orgFileName,
			String saveFileName, long fileSize, String regdate, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.file_comment = file_comment;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFile_comment() {
		return file_comment;
	}

	public void setFile_comment(String file_comment) {
		this.file_comment = file_comment;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
}
