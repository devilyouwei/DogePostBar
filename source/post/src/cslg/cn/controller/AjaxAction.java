package cslg.cn.controller;

import java.sql.SQLException;
import org.apache.struts2.ServletActionContext;
import cslg.cn.controller.MyDB;

public class AjaxAction {

	public String response() {

		String id = new String(ServletActionContext.getRequest().getParameter("post_id")).trim();
		String nowpage = new String(ServletActionContext.getRequest().getParameter("nowpage")).trim();
		String content = new String(ServletActionContext.getRequest().getParameter("content")).trim();
		String to_ip = new String(ServletActionContext.getRequest().getParameter("to_ip")).trim();
		String review_id = new String(ServletActionContext.getRequest().getParameter("review_id")).trim();
		String ip = ServletActionContext.getRequest().getRemoteAddr();
		long create_time = System.currentTimeMillis();
		int is_effect = 1;
		int is_del = 0;

		//nowpage为空即为第一页，0
		if(nowpage==""||nowpage==null) nowpage="0";
		if (content.equals("")) {
			ServletActionContext.getRequest().setAttribute("url", "show.action?id="+id+"&nowpage="+nowpage);
			ServletActionContext.getRequest().setAttribute("message", "空数据错误");
			return "error";
		}

		MyDB db = new MyDB();

		String sql = "";
		try {
			db.openConnection();

			sql = "INSERT INTO huifu VALUES (null,'" + content + "','" + review_id + "','" + ip + "','" + to_ip + "','"
					+ create_time + "','" + is_effect + "','" + is_del + "')";

			db.executeUpdate(sql);
			db.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			ServletActionContext.getRequest().setAttribute("url", "show.action?id="+id+"&nowpage="+nowpage);
			ServletActionContext.getRequest().setAttribute("message", "数据库写入错误");
			return "error";
		}

		ServletActionContext.getRequest().setAttribute("url", "show.action?id="+id+"&nowpage="+nowpage);
		ServletActionContext.getRequest().setAttribute("message", "已回复");
		return "success";
	}

}
