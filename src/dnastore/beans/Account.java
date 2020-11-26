package dnastore.beans;

public class Account extends Role{
	private String userName;
	private String password;
	private String fullname;
	private String gender;
	private String birthday;
	private String number;
	private byte[] image;
	
	public Account() {
        
	}

	public Account(String userName, String password, String fullname, String gender, String birthday, String number,
			byte[] image, int roleid, String rolename) {
		super(roleid,rolename);
		this.userName = userName;
		this.password = password;
		this.fullname = fullname;
		this.gender = gender;
		this.birthday = birthday;
		this.number = number;
		this.image = image;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	
	
	
	
}
