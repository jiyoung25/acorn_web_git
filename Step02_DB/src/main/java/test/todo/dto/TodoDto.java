package test.todo.dto;

import java.sql.Date;

public class TodoDto {
	private int num;
	private String content;
	private Date regDate;
	
	public TodoDto() {
		
	}
	
	public TodoDto(int num, String content, Date regDate) {
		super();
		this.num = num;
		this.content = content;
		this.regDate = regDate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	} 
	
}
