package dnastore.beans;

public class Account extends Role{
	private String userName;
	private String password;
	private String email;
	private String fullname;
	private String gender;
	private String birthday;
	private String phone;
	private String adress;
	private byte[] image;
	
	public Account() {
        
	}
	
	public Account(String userName, String password, String email, String fullname, String gender, String birthday,
			String phone, String adress, byte[] image, int roleid, String rolename) {
		super(roleid,rolename);
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.fullname = fullname;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.adress = adress;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	
}
