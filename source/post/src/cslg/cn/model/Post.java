package cslg.cn.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Post
{
  private int id;
  private String title;
  private String content;
  private String create_time;
  private String username;
  private String post_ip;
  private int sort;
  private int count_review;
  private String last_review;
  private int is_del;
  private int is_effect;
  
  public Post(int id, String title, String content, String create_time, String username, String post_ip, int sort, int count_review, String last_review, int is_del, int is_effect)
  {
    this.id = id;
    this.title = title;
    this.content = content;
    this.create_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(Long.parseLong(create_time)));
    this.username = username;
    this.post_ip = post_ip;
    this.sort = sort;
    this.count_review = count_review;
    this.last_review = last_review;
    this.is_del = is_del;
    this.is_effect = is_effect;
  }
  
  public Post() {}
  
  public int getId()
  {
    return this.id;
  }
  
  public void setId(int id)
  {
    this.id = id;
  }
  
  public String getTitle()
  {
    return this.title;
  }
  
  public void setTitle(String title)
  {
    this.title = title;
  }
  
  public String getContent()
  {
    return this.content;
  }
  
  public void setContent(String content)
  {
    this.content = content;
  }
  
  public String getCreate_time()
  {
    return this.create_time;
  }
  
  public void setCreate_time(String create_time)
  {
    this.create_time = create_time;
  }
  
  public String getUsername()
  {
    return this.username;
  }
  
  public void setUsername(String username)
  {
    this.username = username;
  }
  
  public String getPost_ip()
  {
    return this.post_ip;
  }
  
  public void setPost_ip(String post_ip)
  {
    this.post_ip = post_ip;
  }
  
  public int getSort()
  {
    return this.sort;
  }
  
  public void setSort(int sort)
  {
    this.sort = sort;
  }
  
  public int getCount_review()
  {
    return this.count_review;
  }
  
  public void setCount_review(int count_review)
  {
    this.count_review = count_review;
  }
  
  public int getIs_del()
  {
    return this.is_del;
  }
  
  public void setIs_del(int is_del)
  {
    this.is_del = is_del;
  }
  
  public int getIs_effect()
  {
    return this.is_effect;
  }
  
  public void setIs_effect(int is_effect)
  {
    this.is_effect = is_effect;
  }
  
  public String getLast_review()
  {
    return this.last_review;
  }
  
  public void setLast_review(String last_review)
  {
    this.last_review = last_review;
  }
}
