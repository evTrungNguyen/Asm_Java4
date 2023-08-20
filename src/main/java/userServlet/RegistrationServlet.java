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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String user = SessionUtils.getLoginedUsername(req);
		System.out.println(user);
		if (user != null) {
			resp.sendRedirect("/SOF3011_ASM/Homepage");
		} else {
			req.setAttribute("content", "/content/accountManagement/registration.jsp");
			req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		User user = new User();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			UserDao dao = new UserDao();
			dao.insert(user);
			req.setAttribute("message", "success");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}
		req.setAttribute("user", user);
		req.setAttribute("content", "/content/accountManagement/registration.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
//		PageInfo.prepareAndForwardSite(req, resp, PageType.SITE_REGISTRATION_PAGE);

	}

}
