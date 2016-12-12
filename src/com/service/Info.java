/**
 * 
 */
package com.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;

import com.db.Dao;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author zhang.nf
 *
 */
public class Info extends ActionSupport {
	private static final long serialVersionUID = 5638523825262559663L;

	private String intro;
	private String nickName;
	private String password;
	private String gender;
	private Date birthday;
	private String email;
	private String phoneNum;
	private File file;

	public String execute() throws ClassNotFoundException, SQLException, IOException, NoSuchAlgorithmException {
		Dao dao = new Dao();
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (intro != null && !intro.equals("")) {
			user.setIntro(intro);
		}
		if (nickName != null && !nickName.equals("")) {
			user.setNickName(nickName);
		}
		if (password != null && !password.equals("")) {
			user.setPassword(MD5.MD5password(password));
		}
		if (gender != null && !gender.equals("")) {
			user.setGender(gender);
		}
		if (birthday != null) {
			user.setBirthday(birthday);
		}
		if (email != null && !email.equals("")) {
			user.setEmail(email);
		}
		if (phoneNum != null && !phoneNum.equals("")) {
			user.setPhoneNum(phoneNum);
		}
		if (file != null) {
			FileUploadService fuservice=new FileUploadService();
			fuservice.fileUpload(file, user.getId());
		}

		dao.updateUser(user);
		ActionContext.getContext().getSession().replace("user", user);
		return SUCCESS;
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickname) {
		this.nickName = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
}
