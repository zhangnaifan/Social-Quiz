package com.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.db.Dao;
import com.model.Message;
import com.model.User;

public class MessageFilter {
	
	public ArrayList<Message> getMessagesOfType(User user, int tp) throws ClassNotFoundException, SQLException {
		ArrayList<Message> tmp, ret = new ArrayList<Message>();
		Dao dao = new Dao();
		
		tmp = dao.getMessages(user.getId());
		
		for (int i = 0; i < tmp.size(); i++) {
			if (tmp.get(i).getType() == tp)
				ret.add(tmp.get(i));
		}

		dao.close();
		return ret;
	}
	
	
}
