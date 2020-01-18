package cslg.cn.controller;

import cslg.cn.model.Post;
import cslg.cn.model.Response;
import cslg.cn.model.Review;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class PostAction
{
  public String list()
  {
    int nowpage = 0;
    if (ServletActionContext.getRequest().getParameter("nowpage") != null) {
      nowpage = Integer.parseInt(ServletActionContext.getRequest().getParameter("nowpage").trim());
    }
    MyDB db = new MyDB();
    List<Post> posts = new ArrayList();
    
    Integer countpage = Integer.valueOf(0);
    
    Integer count = Integer.valueOf(0);
    
    String sql = "select * from tie where is_effect=1 and is_del=0 order by sort asc,last_review desc limit " + 
      nowpage * 10 + ",10";
    
    String sqlc = "select count(*) from tie where is_effect=1 and is_del=0;";
    try
    {
      db.openConnection();
      ResultSet res = db.executeQuery(sql);
      while (res.next())
      {
        Post post = new Post(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), 
          res.getString(5), res.getString(6), res.getInt(7), res.getInt(8), res.getString(9), 
          res.getInt(10), res.getInt(11));
        posts.add(post);
      }
      res = db.executeQuery(sqlc);
      while (res.next()) {
        count = Integer.valueOf(res.getInt(1));
      }
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    if (count.intValue() % 10 == 0) {
      countpage = Integer.valueOf(count.intValue() / 10);
    } else {
      countpage = Integer.valueOf(count.intValue() / 10 + 1);
    }
    ServletActionContext.getRequest().setAttribute("list", posts);
    
    ArrayList<Integer> page = new ArrayList();
    for (int i = 0; i < countpage.intValue(); i++) {
      page.add(Integer.valueOf(i));
    }
    ServletActionContext.getRequest().setAttribute("page", page);
    ServletActionContext.getRequest().setAttribute("count_post", count);
    
    return "list";
  }
  
  public String add()
  {
    String title = new String(ServletActionContext.getRequest().getParameter("title")).trim();
    String content = new String(ServletActionContext.getRequest().getParameter("content")).trim();
    String username = new String(ServletActionContext.getRequest().getParameter("username")).trim();
    if ((title.equals("")) || (content.equals("")))
    {
      ServletActionContext.getRequest().setAttribute("message", "???????????");
      ServletActionContext.getRequest().setAttribute("url", "list.action");
      return "error";
    }
    long create_time = System.currentTimeMillis();
    String post_ip = ServletActionContext.getRequest().getRemoteAddr();
    int sort = 1;
    int count_review = 0;
    long last_review = System.currentTimeMillis();
    int is_del = 0;
    int is_effect = 1;
    
    MyDB db = new MyDB();
    try
    {
      db.openConnection();
      
      String sql = "INSERT INTO tie VALUES (null,'" + title + "','" + content + "','" + create_time + "','" + 
        username + "','" + post_ip + "','" + sort + "','" + count_review + "','" + last_review + "','" + 
        is_del + "','" + is_effect + "');";
      
      db.executeUpdate(sql);
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
      ServletActionContext.getRequest().setAttribute("message", "???????????");
      ServletActionContext.getRequest().setAttribute("url", "list.action");
      return "error";
    }
    String sql;
    ServletActionContext.getRequest().setAttribute("message", "?????");
    ServletActionContext.getRequest().setAttribute("url", "list.action");
    return "success";
  }
  
  public String show()
  {
    Integer id = Integer.valueOf(Integer.parseInt(ServletActionContext.getRequest().getParameter("id")));
    if ((id == null) || (id.intValue() == 0))
    {
      ServletActionContext.getRequest().setAttribute("message", "???????");
      return "error";
    }
    MyDB db = new MyDB();
    try
    {
      String sql = "select * from tie where id=" + id;
      db.openConnection();
      ResultSet res = db.executeQuery(sql);
      while (res.next())
      {
        Post showpost = new Post(res.getInt(1), res.getString(2), res.getString(3), res.getString(4), 
          res.getString(5), res.getString(6), res.getInt(7), res.getInt(8), res.getString(9), 
          res.getInt(10), res.getInt(11));
        ServletActionContext.getRequest().setAttribute("show", showpost);
      }
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
      ServletActionContext.getRequest().setAttribute("message", "??????????????????");
      return "error";
    }
    int nowpage = 0;
    if (ServletActionContext.getRequest().getParameter("nowpage") != null) {
      nowpage = Integer.parseInt(ServletActionContext.getRequest().getParameter("nowpage").trim());
    }
    List<Review> reviews = new ArrayList();
    
    Integer countpage = Integer.valueOf(0);
    
    Integer count = Integer.valueOf(0);
    
    String sql = "select * from ping where is_effect=1 and is_delete=0 and post_id=" + id + 
      " order by create_time asc limit " + nowpage * 10 + ", 10";
    
    String sqlc = "select count(*) from ping where is_effect=1 and is_delete=0 and post_id=" + id;
    try
    {
      db.openConnection();
      ResultSet res = db.executeQuery(sql);
      while (res.next())
      {
        Review review = new Review(res.getInt(1), res.getString(2), res.getString(3), res.getInt(4), 
          res.getInt(5), res.getString(6), res.getInt(7), res.getInt(8));
        
        reviews.add(review);
      }
      for (int i = 0; i < reviews.size(); i++)
      {
        List<Response> responses = new ArrayList();
        
        sql = "select * from huifu where is_effect=1 and is_del=0 and review_id=" + ((Review)reviews.get(i)).getId() + 
          " order by create_time asc";
        res = db.executeQuery(sql);
        while (res.next())
        {
          Response response = new Response(res.getInt(1), res.getString(2), res.getInt(3), 
            res.getString(4), res.getString(5), res.getString(6), res.getInt(7), res.getInt(8));
          
          responses.add(response);
        }
        ((Review)reviews.get(i)).setResponses(responses);
      }
      res = db.executeQuery(sqlc);
      while (res.next()) {
        count = Integer.valueOf(res.getInt(1));
      }
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
      ServletActionContext.getRequest().setAttribute("message", "????????");
      ServletActionContext.getRequest().setAttribute("url", "show.action?id=" + id);
      return "error";
    }
    if (count.intValue() % 10 == 0) {
      countpage = Integer.valueOf(count.intValue() / 10);
    } else {
      countpage = Integer.valueOf(count.intValue() / 10 + 1);
    }
    ServletActionContext.getRequest().setAttribute("list", reviews);
    
    ArrayList<Integer> page = new ArrayList();
    for (int i = 0; i < countpage.intValue(); i++) {
      page.add(Integer.valueOf(i));
    }
    ServletActionContext.getRequest().setAttribute("page", page);
    ServletActionContext.getRequest().setAttribute("count_post", count);
    return "show";
  }
  
  public String review()
  {
    Integer id = Integer.valueOf(Integer.parseInt(ServletActionContext.getRequest().getParameter("post_id")));
    if ((id.intValue() == 0) || (id == null))
    {
      ServletActionContext.getRequest().setAttribute("message", "????????");
      ServletActionContext.getRequest().setAttribute("url", "show.action?id=" + id);
      return "error";
    }
    String content = new String(ServletActionContext.getRequest().getParameter("content")).trim();
    long create_time = System.currentTimeMillis();
    int post_id = id.intValue();
    String ip = ServletActionContext.getRequest().getRemoteAddr();
    int count_response = 0;
    int is_delete = 0;
    int is_effect = 1;
    
    MyDB db = new MyDB();
    try
    {
      db.openConnection();
      
      String sql = "INSERT INTO ping VALUES (null,'" + content + "','" + create_time + "','" + post_id + "','" + 
        count_response + "','" + ip + "','" + is_delete + "','" + is_effect + "');";
      
      db.executeUpdate(sql);
      sql = "UPDATE tie set count_review=count_review+1, last_review='" + System.currentTimeMillis() + "' where id=" + post_id;
      db.executeUpdate(sql);
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
      ServletActionContext.getRequest().setAttribute("message", "????????");
      ServletActionContext.getRequest().setAttribute("url", "show.action?id=" + post_id);
      return "error";
    }
    String sql;
    ServletActionContext.getRequest().setAttribute("message", "?????");
    ServletActionContext.getRequest().setAttribute("url", "show.action?id=" + post_id);
    return "success";
  }
  
  public String response()
  {
    Integer id = Integer.valueOf(Integer.parseInt(ServletActionContext.getRequest().getParameter("review_id")));
    if ((id.intValue() == 0) || (id == null))
    {
      ServletActionContext.getRequest().setAttribute("message", "?????????");
      
      return "error";
    }
    String content = new String(ServletActionContext.getRequest().getParameter("content")).trim();
    long create_time = System.currentTimeMillis();
    int review_id = id.intValue();
    String ip = ServletActionContext.getRequest().getRemoteAddr();
    String to_ip = new String(ServletActionContext.getRequest().getParameter("to_ip")).trim();
    int is_del = 0;
    int is_effect = 1;
    
    MyDB db = new MyDB();
    try
    {
      db.openConnection();
      
      String sql = "INSERT INTO huifu VALUES (null,'" + content + "','" + review_id + "','" + ip + "','" + to_ip + 
        "','" + create_time + "','" + is_effect + "','" + is_del + "');";
      
      db.executeUpdate(sql);
      sql = "UPDATE ping set count_response=count_response+1 where id=" + id;
      db.executeUpdate(sql);
      db.closeConnection();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
      ServletActionContext.getRequest().setAttribute("message", "???????????");
      
      return "error";
    }
    String sql;
    ServletActionContext.getRequest().setAttribute("message", "?????");
    
    return "success";
  }
}
