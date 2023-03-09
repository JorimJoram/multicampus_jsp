package chap12;

public class InstructorDO {
	private String username;
	private String email;
	
	public InstructorDO() {
		
	}
	
	public void setName(String username) {
		this.username = username;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return this.username;
	}
	public String getEmail() {
		return this.email;
	}
}
