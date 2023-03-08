package chap11;

public class Member {
	private String name;
	private String email;
	public Member(String name, String email) {
		this.name = name;
		this.email = email;
	}
	public Member() {
		this.name = "정효림";
		this.email = "lsd4026@naver.com";
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
