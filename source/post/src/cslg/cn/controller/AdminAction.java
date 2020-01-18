package cslg.cn.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import cslg.cn.model.Post;

public class AdminAction {

	public String login() {
		// ������Ƿ���session���о����Ѿ���¼����S
		String session = (String) ActionContext.getContext().getSession().get("admin");

		// �ж�session�������
		if (session != null && session.equals("true")) {
			ServletActionContext.getRequest().setAttribute("message", "���ĺ��ѹ���Ա�Ѿ�����");
			ServletActionContext.getRequest().setAttribute("url", "post.action");
			return "post";
		}
		return "login";
	}

	public String dologin() {

		String username = new String(ServletActionContext.getRequest().getParameter("username")).trim();
		String password = new String(ServletActionContext.getRequest().getParameter("password")).trim();

		if (username.equals("") || password.equals("")) {
			ServletActionContext.getRequest().setAttribute("message", "�����ݴ���");
			return "error";

		}
		if (username.equals("admin") && password.equals("admin")) {
			ServletActionContext.getRequest().setAttribute("message", "����Ա��½�ɹ�");
			ServletActionContext.getRequest().setAttribute("url", "post.action");
			// ��admin���session
			ActionContext.getContext().getSession().put("admin", "true");
			return "success";
		}

		else {
			ServletActionContext.getRequest().setAttribute("message", "������˺Ŵ���");
			return "error";
		}

	}

	public String logout() {
		ActionContext.getContext().getSession().put("admin", null);
		ServletActionContext.getRequest().setAttribute("message", "���ĺ��ѹ���Ա�Ѿ������˨r(�s���t)�q");
		ServletActionContext.getRequest().setAttribute("url", "/index.jsp");
		return "success";
	}

	public String post() throws SQLException {
		// ��֤����Ա��¼����Ҫ��
		String session = (String) ActionContext.getContext().getSession().get("admin");
		// �ж�session�������
		if (session == null || !session.equals("true")) {
			ServletActionContext.getRequest().setAttribute("message", "�Ƿ����룬���ȵ�¼�q(�s^�t)�r");
			return "noadmin";
		}

		int nowpage;
		if (ServletActionContext.getRequest().getParameter("nowpage") == null)
			nowpage = 0;
		else
			nowpage = Integer.parseInt(ServletActionContext.getRequest().getParameter("nowpage").trim());

		// ҳ��
		Integer countpage = 0;
		// ������
		Integer count = 0;

		MyDB db = new MyDB();
		db.openConnection();
		// ��ȡԼ����Χ������
		String sql = "select * from tie order by create_time desc limit " + nowpage * 10 + ",10;";
		String sqlc = "select count(*) from tie";
		ResultSet rs = db.executeQuery(sql);
		List<Post> posts = new ArrayList<Post>();
		while (rs.next()) {
			Post post = new Post(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getInt(11));
			posts.add(post);
		}
		ResultSet rsc = db.executeQuery(sqlc);
		while (rsc.next()) {
			count = rsc.getInt(1);
		}
		if ((count % 10) == 0) {
			countpage = count / 10;
		} else {
			countpage = count / 10 + 1;
		}
		ArrayList<Integer> page = new ArrayList<Integer>();
		for (int i = 0; i < countpage; i++) {
			page.add(i);
		}
		ServletActionContext.getRequest().setAttribute("nowpage", nowpage);
		ServletActionContext.getRequest().setAttribute("page", page);
		ServletActionContext.getRequest().setAttribute("list", posts);
		return "post";
	}

	public String delete() throws SQLException {
		// ��֤����Ա��¼����Ҫ��
		String session = (String) ActionContext.getContext().getSession().get("admin");
		// �ж�session�������
		if (session == null || !session.equals("true")) {
			ServletActionContext.getRequest().setAttribute("message", "�Ƿ����룬���ȵ�¼�q(�s^�t)�r");
			return "noadmin";
		}

		String id = new String(ServletActionContext.getRequest().getParameter("id")).trim();
		String nowpage = new String(ServletActionContext.getRequest().getParameter("nowpage")).trim();

		if (id == null || Integer.parseInt(id) == 0 || id.equals("")) {
			ServletActionContext.getRequest().setAttribute("message", "���id���Ϸ�����Ϲ����ɾ����");
			ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);
			return "error";
		}

		if (nowpage == "" || nowpage == null)
			nowpage = "0";
		MyDB db = new MyDB();
		db.openConnection();
		String sql = null;
		sql = "select is_del from tie where id=" + id;
		ResultSet rs = db.executeQuery(sql);
		int is_del = 0;
		while (rs.next()) {
			is_del = rs.getInt(1);
		}
		if (is_del == 1)
			// ��ȡԼ����Χ������
			sql = "update tie set is_del=0 where id=" + id;
		else
			sql = "update tie set is_del=1 where id=" + id;
		db.executeUpdate(sql);

		ServletActionContext.getRequest().setAttribute("message", "ɾ���ɹ���");
		ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);

		return "success";
	}

	public String delforever() throws SQLException {
		// ��֤����Ա��¼����Ҫ��
		String session = (String) ActionContext.getContext().getSession().get("admin");
		// �ж�session�������
		if (session == null || !session.equals("true")) {
			ServletActionContext.getRequest().setAttribute("message", "�Ƿ����룬���ȵ�¼�q(�s^�t)�r");
			return "noadmin";
		}
		String id[] = ServletActionContext.getRequest().getParameterValues("post_id");

		String nowpage = new String(ServletActionContext.getRequest().getParameter("nowpage")).trim();
		if (nowpage == "" || nowpage == null)
			nowpage = "0";
		if (id == null) {
			ServletActionContext.getRequest().setAttribute("message", "���id���Ϸ�����Ϲ����ɾ����");
			ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);
			return "error";
		}
		String sql = "delete from tie where id in(";
		for (int i = 0; i < id.length; i++) {
			if (i == 0)
				sql += id[i];
			else
				sql += "," + id[i];
		}
		sql+=")";
		System.out.println(sql);
		MyDB db = new MyDB();
		db.openConnection();
		db.executeUpdate(sql);
		ServletActionContext.getRequest().setAttribute("message", "�ѳ���ɾ��ѡ�У���Ҳ�ָ������˨r(�s���t)�q");
		ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);
		return "success";
	}

	public String top() throws SQLException {
		// ��֤����Ա��¼����Ҫ��
		String session = (String) ActionContext.getContext().getSession().get("admin");
		// �ж�session�������
		if (session == null || !session.equals("true")) {
			ServletActionContext.getRequest().setAttribute("message", "�Ƿ����룬���ȵ�¼�q(�s^�t)�r");
			return "noadmin";
		}

		String id = new String(ServletActionContext.getRequest().getParameter("id")).trim();
		String nowpage = new String(ServletActionContext.getRequest().getParameter("nowpage")).trim();
		if (id == null || Integer.parseInt(id) == 0 || id.equals("")) {
			ServletActionContext.getRequest().setAttribute("message", "���id���Ϸ�����Ϲ����ɾ����");
			ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);
			return "error";
		}

		if (nowpage == "" || nowpage == null)
			nowpage = "0";

		MyDB db = new MyDB();
		db.openConnection();
		String sql = null;
		sql = "select sort from tie where id=" + id;
		ResultSet rs = db.executeQuery(sql);
		int sort = 0;
		while (rs.next()) {
			sort = rs.getInt(1);
		}
		if (sort == 1)
			sql = "update tie set sort=0 where id=" + id;
		else
			sql = "update tie set sort=1 where id=" + id;
		db.executeUpdate(sql);

		ServletActionContext.getRequest().setAttribute("message", "���ö���");
		ServletActionContext.getRequest().setAttribute("url", "post.action?nowpage=" + nowpage);

		return "success";
	}
}
