package userServlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.EmailUtils;
import common.SessionUtils;
import dao.ShareDao;
import dao.UserDao;
import dao.VideoDao;
import domain.Email;
import model.Share;
import model.User;
import model.Video;

/**
 * Servlet implementation class ShareVideoServlet
 */
@WebServlet("/ShareVideo")
public class ShareVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShareVideoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = (String) SessionUtils.get(req, "username");
		System.out.println(user);
		if (user == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else {
			String videoId = req.getParameter("videoId");
			if (videoId == null) {
				resp.sendRedirect("/SOF3011_ASM/Homepage");
			}

			req.setAttribute("content", "/content/customerLayout/share.jsp");
			req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String user = (String) SessionUtils.get(req, "username");
			User u = new User();
//			u.setUsername(user);
			UserDao udao = new UserDao();
			u = udao.findById(user);
			String emailAddress = req.getParameter("email");
			String videoId = req.getParameter("videoId");

			if (videoId == null) {
				req.setAttribute("error", "Please select video");
			} else {
				Email email = new Email();
				email.setFrom("your_email");
				email.setFromPassword("your_pass");
				email.setTo(emailAddress);
				email.setSubject("Share Video");

				// Mail currently was auto blocked by google. can't sent at the moment

				StringBuilder sb = new StringBuilder();
//				sb.append("Dear Mr....,<br>");
				sb.append("Your friend ").append(u.getFullname())
						.append(" want to share this awesome video with you <br>");
				sb.append("You may want check it out<b> VIEW VIDEO</b>");
//				sb.append("<br>Regards,<br>");
//				sb.append("SIUUUUU");
				email.setContent(sb.toString());
				EmailUtils.send(email);

				ShareDao dao = new ShareDao();
				Share share = new Share();
				share.setEmail(emailAddress);
				share.setUser(u);
				share.setSharedDate(new Date());

				Video video = new Video();
				VideoDao vdao = new VideoDao();
				video = vdao.findById(videoId);
				share.setVideo(video);

				dao.insert(share);

				req.setAttribute("message", "Share successfull");
				req.setAttribute("email", emailAddress);

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", e.getMessage());
		}

		req.setAttribute("content", "/content/customerLayout/share.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);

	}

}
