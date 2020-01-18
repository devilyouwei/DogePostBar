package cslg.cn.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyDB
{
  private static final String database = "post";
  private static final String user = "root";
  private static final String password = "root";
  private Connection connection;
  private Statement statement;
  
  public void openConnection()
    throws SQLException
  {
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/post?useUnicode=true&characterEncoding=utf-8";
      this.connection = DriverManager.getConnection(url, "root", "root");
      this.statement = this.connection.createStatement();
    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
  }
  
  public void closeConnection()
  {
    try
    {
      if (this.statement != null) {
        this.statement.close();
      }
      if (this.connection != null) {
        this.connection.close();
      }
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
  }
  
  ResultSet executeQuery(String sql)
    throws SQLException
  {
    ResultSet rs = this.statement.executeQuery(sql);
    return rs;
  }
  
  void executeUpdate(String sql)
    throws SQLException
  {
    this.statement.executeUpdate(sql);
  }
}
