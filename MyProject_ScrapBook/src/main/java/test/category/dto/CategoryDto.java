package test.category.dto;

public class CategoryDto {
	private String num;
	private String tab_name;
	private String tab_sub;
	
	public CategoryDto() {
		
	}
	
	public CategoryDto(String num, String tab_name, String tab_sub) {
		super();
		this.num = num;
		this.tab_name = tab_name;
		this.tab_sub = tab_sub;
	}

	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTab_name() {
		return tab_name;
	}
	public void setTab_name(String tab_name) {
		this.tab_name = tab_name;
	}
	public String getTab_sub() {
		return tab_sub;
	}
	public void setTab_sub(String tab_sub) {
		this.tab_sub = tab_sub;
	}
}
