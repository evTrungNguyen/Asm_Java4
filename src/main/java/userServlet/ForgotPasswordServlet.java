package userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.EmailUtils;
import dao.UserDao;
import domain.Email;
import model.User;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("content", "/content/accountManagement/forgotPassword.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String emailAddress = req.getParameter("email");
			String username = req.getParameter("username");
			UserDao dao = new UserDao();
			User user = dao.findByUsernameAndEmail(username, emailAddress);
			if (user == null) {
				req.setAttribute("error", "Username or email are incorrect");
			} else {
				Email email = new Email();
				email.setFrom("your_email");
				email.setFromPassword("your_pass");
				email.setTo(emailAddress);
				email.setSubject("Recover");

				// Mail currently was auto blocked by google. can't sent at the moment

				StringBuilder sb = new StringBuilder();
//				sb.append("Dear ").append(username).append(",<br>");
//				sb.append("Thanks for using our services.<br> ");
				sb.append("Curr pass is  <b> ").append(user.getPassword()).append("</b>");
//				sb.append("<br>Sincerely,<br>");
//				sb.append("SIUUUUU");
				email.setContent(sb.toString());
				EmailUtils.send(email);
				req.setAttribute("message", "Your password have been sent to your Email.");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}

		req.setAttribute("content", "/content/accountManagement/forgotPassword.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
//		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FORGOT_PASSWORD_PAGE);
	}

}
