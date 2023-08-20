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
import domain.ChangePasswordForm;

/**
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(req);
		if (username == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else {
			req.setAttribute("content", "/content/accountManagement/changePassword.jsp");
			req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String username = SessionUtils.getLoginedUsername(req);
			ChangePasswordForm form = new ChangePasswordForm();
			BeanUtils.populate(form, req.getParameterMap());
			req.setAttribute("username", username);
			if (!form.getConfirmPassword().equals(form.getPassword())) {
				req.setAttribute("error", " New Password and Confirm Password does not match");
			} else {
				UserDao dao = new UserDao();
				dao.changePassword(form.getUsername(), form.getCurrentPassword(), form.getPassword());
				req.setAttribute("message", "Password has been changed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}

		req.setAttribute("content", "/content/accountManagement/changePassword.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
	}

}
