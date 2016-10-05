package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dao
{
  Connection con = null;
  Statement stat = null;
  ResultSet rs = null;
  
  public Dao() throws ClassNotFoundException, SQLException
  { 
    String driver = "com.mysql.jdbc.Driver";
    String username = "root";
    String password = "113095";
    String dbUrl = String.format("jdbc:mysql://%s:%s/%s", new Object[] {
      "localhost", "3306", "staples" });    
    
	Class.forName(driver);
	this.con = DriverManager.getConnection(dbUrl, username, password);
	this.stat = this.con.createStatement();
  }
  
  public void close() throws SQLException
  {
    if (this.con != null) {
        this.con.close();
    }
  }
  
  public boolean execute(String sql) throws SQLException
  {
    return this.stat.execute(sql);
  }
  
  public ResultSet executeQuery(String sql) throws SQLException
  {
	return this.stat.executeQuery(sql);
  }
  
  public void executeUpdate(String sql) throws SQLException
  {
      this.stat.executeUpdate(sql);
  }
}
