package userServlet;

import java.io.IOException;

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
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String username = SessionUtils.getLoginedUsername(req);
		if (username == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else {
			try {
				UserDao dao = new UserDao();
				User user = dao.findById(username);
				req.setAttribute("user", user);
				req.setAttribute("content", "/content/accountManagement/editProfile.jsp");
				req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				req.setAttribute("error", e.getMessage());
			}
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			User user = new User();
			BeanUtils.populate(user, req.getParameterMap());
			String username = SessionUtils.getLoginedUsername(req);

			UserDao dao = new UserDao();
			User oldUser = dao.findById(username);
			user.setAdmin(oldUser.getAdmin());
			dao.update(user);
			req.setAttribute("message", "Updated successfull");
			req.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}
		req.setAttribute("content", "/content/accountManagement/editProfile.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
	}

}
