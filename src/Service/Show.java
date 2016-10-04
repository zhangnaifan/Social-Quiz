package Service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import db.Dao;

public class Show extends ActionSupport {
	
	int id;
	
	public String execute(){
		Dao dao = new Dao();
		
		try {
			ResultSet rs = dao.executeQuery("select * from problem where id = " + id + ";");
		} catch (SQLException e) {}
		
		
		
		dao.close();
		return SUCCESS;
	}
}
