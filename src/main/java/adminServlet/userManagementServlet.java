package adminServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.SessionUtils;
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class userManagementServlet
 */
@WebServlet({ "/userManagement", "/updateUser", "/userManagement/editUser", "/deleteUser" })
public class userManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = SessionUtils.getLoginedUsername(req);
		System.out.println(user);
		Boolean check = (Boolean) SessionUtils.get(req, "isAdmin");
		System.out.println(check);
		if (user == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else if (user != null && check == null) {
			resp.sendRedirect("/SOF3011_ASM/Homepage");
		} else {
			UserDao dao = new UserDao();
			List<User> list = dao.findAll();
			req.setAttribute("list", list);
			String uri = req.getRequestURI();
			if (uri.contains("editUser")) {

				edit(req, resp);

			}
			req.setAttribute("adcontent", "/content/adminLayout/userManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);

		}

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if (uri.contains("update")) {
			update(req, resp);
			UserDao dao = new UserDao();
			List<User> u = dao.findAll();
			req.setAttribute("list", u);
			req.setAttribute("adcontent", "/content/adminLayout/userManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}
		if (uri.contains("delete")) {
			delete(req, resp);
			UserDao dao = new UserDao();
			List<User> u = dao.findAll();
			req.setAttribute("list", u);
			req.setAttribute("adcontent", "/content/adminLayout/userManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}

	}

	private void update(HttpServletRequest req, HttpServletResponse resp) {
		User user = new User();
		try {
			req.setCharacterEncoding("utf-8");
			BeanUtils.populate(user, req.getParameterMap());
			UserDao dao = new UserDao();
			User oldUser = dao.findById(user.getUsername());
			user.setAdmin(oldUser.getAdmin());
			dao.update(user);
			req.setAttribute("user", user);
			req.setAttribute("message", "updated successfull");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
		}

	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("username");
		System.out.println(id);
		User user = new User();
		try {
			UserDao dao = new UserDao();
			dao.delete(id);
//			dao.deleteVidById(id);
			req.setAttribute("user", user);
			req.setAttribute("message", "deleted successfull");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
		}

	}

	private void edit(HttpServletRequest req, HttpServletResponse resp) {
		User user = new User();
		UserDao dao = new UserDao();
		try {
			user = dao.findById(req.getParameter("username"));
			req.setAttribute("user", user);
			System.out.println(user.getFullname());
		} catch (Exception e) {
			req.setAttribute("error", "Error: " + e.getMessage());
		}

	}
}
