package userServlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SessionUtils;
import dao.FavoriteDao;
import dao.UserDao;
import model.Favorite;
import model.User;
import model.Video;

/**
 * Servlet implementation class LikeVideoServlet
 */
@WebServlet({ "/LikeVideo", "/UnlikeVideo" })
public class LikeVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeVideoServlet() {
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
		String videoId = req.getParameter("videoId");
		FavoriteDao fdao = new FavoriteDao();
		boolean check = true;
		check = fdao.checkIfVideoLikeYet(user, videoId);
		if (user == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else {
			if (videoId == null) {
				resp.sendRedirect("/SOF3011_ASM/Homepage");
			}
			String uri = req.getRequestURI();
			if (uri.contains("LikeVideo")) {
				System.out.println("gia tri check la" + check);
				if (check == true) {
					req.setAttribute("error", "You already like this video");
				} else {
					try {
						Favorite favorite = new Favorite();
						Video video = new Video();
						video.setVideoId(videoId);
						User u = new User();
						UserDao udao = new UserDao();
						u = udao.findById(user);
						favorite.setUser(u);
						System.out.println("nguoi dung " + u.getUsername());
						favorite.setLikedDate(new Date());
						favorite.setVideo(video);
						System.out.println("video  " + video.getVideoId());
						fdao.insert(favorite);
						req.setAttribute("message", "video has been add to your favorite");
					} catch (Exception e) {
						req.setAttribute("error", e.getMessage());
					}
				}
//				req.setAttribute("content", "/content/index.jsp");
//				req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
				req.getRequestDispatcher("/Homepage").forward(req, resp);
			} else if (uri.contains("UnlikeVideo")) {
				try {
//					FavoriteDao fdao = new FavoriteDao();
					System.out.println("day la id can xoa trong favorite " + fdao.Unlike(user, videoId));
					fdao.delete(fdao.Unlike(user, videoId));
					req.setAttribute("message", "video has been remove from your favorite");
				} catch (Exception e) {
					req.setAttribute("error", e.getMessage());
				}
//				req.setAttribute("content", "/content/index.jsp");
//				req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
				req.getRequestDispatcher("/Favorite").forward(req, resp);
			}
			{
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
