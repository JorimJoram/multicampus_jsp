package chap07;

public class loginBean {
	private String id;
	private String passwd;
	public loginBean(){
		
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getId() {
		return this.id;
	}
	public String getPasswd() {
		return this.passwd;
	}
	public boolean checkLogin() {
		final String ID = "wkdgyfla97";
		final String PASSWD = "1234";
		boolean result = false;
		
		if(this.id != null && this.passwd != null) {
			result = ID.equals(this.id) && PASSWD.equals(this.passwd);
		}
		
		return result;
	}
}
