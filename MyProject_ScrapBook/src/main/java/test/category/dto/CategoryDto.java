package test.category.dto;

public class CategoryDto {
	private int num;
	private String tab_name;
	private String tab_sub;
	private int roomsize;
	
	public CategoryDto() {
		
	}
	
	public CategoryDto(int num, String tab_name, String tab_sub, int roomsize) {
		super();
		this.num = num;
		this.tab_name = tab_name;
		this.tab_sub = tab_sub;
		this.roomsize = roomsize;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
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
	public int getRoomsize() {
		return roomsize;
	}
	public void setRoomsize(int roomsize) {
		this.roomsize = roomsize;
	}
}
