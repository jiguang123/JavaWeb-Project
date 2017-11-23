package rcm.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rcm.dao.UserDao;
import rcm.entity.User;

public class RegistServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegistServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//�����������ȡ�û���������
		String username = req.getParameter("username");
		String pwd = req.getParameter("pwd");
		User user = new User();
		user.setUserName(username);
		user.setPwd(pwd);
		UserDao dao = new UserDao();
		dao.saveUser(user);//�������û�
		//ת�Ե���¼ҳ�棬���û����Խ��е�¼
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
