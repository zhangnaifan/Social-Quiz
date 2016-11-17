package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import org.eclipse.jdt.internal.compiler.util.HashSetOfInt;

import com.db.Dao;
import com.model.Message;
import com.model.User;
import com.model.group;

public class SendOutMessage {
	public void sendout(User fromUser, int QuizId) throws ClassNotFoundException, SQLException {
		Dao dao = new Dao();
		
		HashSetOfInt st = new HashSetOfInt();
		ArrayList<Integer> ids = new ArrayList<Integer>();
		
		for (int i = 0; i < fromUser.getFollowers().size(); i++) {
			int tmp = fromUser.getFollowers().get(i);
			if (st.contains(tmp)) continue;
			st.add(tmp);
			ids.add(tmp);
		}
		
		
		Vector<Integer> groupids = fromUser.getGroups();
		group grp;
		
		for (int i = 0; i < groupids.size(); i++) {
			grp = dao.getGrpById(groupids.get(i));
			for (int j = 0; j < grp.getMemberIds().size(); j++) {
				int tmp = grp.getMemberIds().get(j);
				if (st.contains(tmp)) continue;
				st.add(tmp);
				ids.add(tmp);
			}
		}
		
		Message msg;
		
		for (int i = 0; i < ids.size(); i++) if(ids.get(i) != fromUser.getId()){
			msg = Message.formInviteMessage(fromUser.getId(), ids.get(i), QuizId);
			dao.insertNewMsg(msg);
		}
		dao.close();
	}
	public void sendoutFromGroup(int fromUserId, int groupId, int QuizId) throws ClassNotFoundException, SQLException {
		Dao dao = new Dao();
		
		HashSetOfInt st = new HashSetOfInt();
		ArrayList<Integer> ids = new ArrayList<Integer>();
		
		group grp = dao.getGrpById(groupId);
		for (int j = 0; j < grp.getMemberIds().size(); j++) {
			int tmp = grp.getMemberIds().get(j);
			if (st.contains(tmp)) continue;
			st.add(tmp);
			ids.add(tmp);
		}
		
		Message msg;
		
		for (int i = 0; i < ids.size(); i++) if(ids.get(i) != fromUserId){
			msg = Message.formGroupInviteMessage(fromUserId, ids.get(i), QuizId);
			dao.insertNewMsg(msg);
		}
		dao.close();
	}
}
