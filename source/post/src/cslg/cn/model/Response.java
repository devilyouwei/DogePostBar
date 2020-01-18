package cslg.cn.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Response
{
  private int id;
  private String content;
  private int review_id;
  private String ip;
  private String to_ip;
  private String create_time;
  private int is_effect;
  private int is_del;
  
  public Response(int id, String content, int review_id, String ip, String to_ip, String create_time, int is_effect, int is_del)
  {
    this.id = id;
    this.content = content;
    this.review_id = review_id;
    this.ip = ip;
    this.to_ip = to_ip;
    this.create_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(Long.parseLong(create_time)));
    this.is_effect = is_effect;
    this.is_del = is_del;
  }
  
  public Response() {}
  
  public int getId()
  {
    return this.id;
  }
  
  public void setId(int id)
  {
    this.id = id;
  }
  
  public String getContent()
  {
    return this.content;
  }
  
  public void setContent(String content)
  {
    this.content = content;
  }
  
  public int getReview_id()
  {
    return this.review_id;
  }
  
  public void setReview_id(int review_id)
  {
    this.review_id = review_id;
  }
  
  public String getIp()
  {
    return this.ip;
  }
  
  public void setIp(String ip)
  {
    this.ip = ip;
  }
  
  public String getTo_ip()
  {
    return this.to_ip;
  }
  
  public void setTo_ip(String to_ip)
  {
    this.to_ip = to_ip;
  }
  
  public String getCreate_time()
  {
    return this.create_time;
  }
  
  public void setCreate_time(String create_time)
  {
    this.create_time = create_time;
  }
  
  public int getIs_effect()
  {
    return this.is_effect;
  }
  
  public void setIs_effect(int is_effect)
  {
    this.is_effect = is_effect;
  }
  
  public int getIs_del()
  {
    return this.is_del;
  }
  
  public void setIs_del(int is_del)
  {
    this.is_del = is_del;
  }
}
