package cslg.cn.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Review
{
  private int id;
  private String content;
  private String create_time;
  private int post_id;
  private int count_response;
  private String ip;
  private int is_delete;
  private int is_effect;
  private List<Response> responses;
  
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
  
  public String getCreate_time()
  {
    return this.create_time;
  }
  
  public void setCreate_time(String create_time)
  {
    this.create_time = create_time;
  }
  
  public int getPost_id()
  {
    return this.post_id;
  }
  
  public void setPost_id(int post_id)
  {
    this.post_id = post_id;
  }
  
  public int getCount_response()
  {
    return this.count_response;
  }
  
  public void setCount_response(int count_response)
  {
    this.count_response = count_response;
  }
  
  public String getIp()
  {
    return this.ip;
  }
  
  public void setIp(String ip)
  {
    this.ip = ip;
  }
  
  public int getIs_delete()
  {
    return this.is_delete;
  }
  
  public void setIs_delete(int is_delete)
  {
    this.is_delete = is_delete;
  }
  
  public int getIs_effect()
  {
    return this.is_effect;
  }
  
  public void setIs_effect(int is_effect)
  {
    this.is_effect = is_effect;
  }
  
  public Review(int id, String content, String create_time, int post_id, int count_response, String ip, int is_delete, int is_effect)
  {
    this.id = id;
    this.content = content;
    this.create_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(Long.parseLong(create_time)));
    this.post_id = post_id;
    this.count_response = count_response;
    this.ip = ip;
    this.is_delete = is_delete;
    this.is_effect = is_effect;
  }
  
  public Review() {}
  
  public List<Response> getResponses()
  {
    return this.responses;
  }
  
  public void setResponses(List<Response> responses)
  {
    this.responses = responses;
  }
}
