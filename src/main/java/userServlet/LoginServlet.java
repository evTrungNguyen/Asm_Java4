package userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.CookieUtils;
import common.SessionUtils;
import dao.UserDao;
import domain.LoginForm;
import model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = CookieUtils.get("username", req);
		String ad = CookieUtils.get("isAdmin", req);
		if (username == null) {
			req.setAttribute("content", "/content/customerLayout/login.jsp");
			req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);

		} else {
			SessionUtils.add(req, "username", username);
			SessionUtils.add(req, "isLogin", true);
			SessionUtils.add(req, "isAdmin", ad);
			req.getRequestDispatcher("/Homepage").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			LoginForm form = new LoginForm();
			BeanUtils.populate(form, req.getParameterMap());
			UserDao dao = new UserDao();
			User user = dao.findById(form.getUsername());
			boolean isAdmin = user.getAdmin();
			if (user != null && user.getPassword().equals(form.getPassword())) {
				if (isAdmin == true) {
					SessionUtils.add(req, "isAdmin", true);
				}
				if (form.isRemember()) {
					CookieUtils.add("username", form.getUsername(), 24, resp);
					CookieUtils.add("password", form.getPassword(), 24, resp);
					if (isAdmin == true) {
						CookieUtils.add("isAdmin", "true", 24, resp);
					}
				} else {
					CookieUtils.add("username", form.getUsername(), 0, resp);
					CookieUtils.add("password", form.getPassword(), 0, resp);
				}
				SessionUtils.add(req, "username", user.getUsername());
				SessionUtils.add(req, "isLogin", true);
				req.getRequestDispatcher("/Homepage").forward(req, resp);

			} else {
				req.setAttribute("error", "invalid username or password");
				req.setAttribute("content", "/content/customerLayout/login.jsp");
				req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
			}

		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
		}

	}

}
