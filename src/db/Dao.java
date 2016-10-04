package db;

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
  
  public Dao()
  { 
    String driver = "com.mysql.jdbc.Driver";
    String username = "root";
    String password = "113095";
    String dbUrl = String.format("jdbc:mysql://%s:%s/%s", new Object[] {
      "localhost", "3306", "staples" });    
    
    try
    {
      Class.forName(driver);
      this.con = DriverManager.getConnection(dbUrl, username, password);
      this.stat = this.con.createStatement();
    }
    catch (Exception e)
    {
      this.con = null;
    }
  }
  
  public void close()
  {
    if (this.con != null) {
      try
      {
        this.con.close();
      }
      catch (Exception localException) {}
    }
  }
  
  public boolean execute(String sql)
  {
    boolean ret = false;
    try
    {
      ret = this.stat.execute(sql);
    }
    catch (Exception localException) {}
    return ret;
  }
  
  public ResultSet executeQuery(String sql)
    throws SQLException
  {
    this.rs = this.stat.executeQuery(sql);
    return this.rs;
  }
  
  public int executeUpdate(String sql)
  {
    try
    {
      this.stat.executeUpdate(sql);
      return 0;
    }
    catch (Exception localException) {}
    return -1;
  }
}
