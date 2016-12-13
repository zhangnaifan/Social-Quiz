package test.poore;

import java.sql.SQLException;

import com.db.Dao;

public class groupinserter {

	static String form(int i) {
		return String
				.format("insert into group_db values(%d,'groupname%d','%08d',NOW(),'info%d', %d)",
						i, i, i, i, i);
	}

	public static void main(String[] args) throws ClassNotFoundException,
			SQLException {
		// TODO Auto-generated method stub
		Dao dao = new Dao();

		System.out.println("connected");

		// Scanner cin = new Scanner(System.in);

		int n = 40;
		for (int i = 0; i < n; i++) {
			String tmp = form(i);
			System.out.println(tmp);
			dao.execute(tmp);
		}

		dao.close();
	}
}
