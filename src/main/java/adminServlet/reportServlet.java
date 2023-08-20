package adminServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SessionUtils;
import dao.FavoriteDao;
import dao.ShareDao;
import dao.VideoDao;
import domain.FavoriteReport;
import domain.FavoriteUserReport;
import domain.ShareReport;
import model.Video;

/**
 * Servlet implementation class reportServlet
 */
@WebServlet("/report")
public class reportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String user = SessionUtils.getLoginedUsername(req);
		System.out.println(user);
		Boolean check = (Boolean) SessionUtils.get(req, "isAdmin");
		System.out.println(check);
		if (user == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else if (user != null && check == null) {
			resp.sendRedirect("/SOF3011_ASM/Homepage");
		} else {
			reportFavoritesByVideos(req, resp);
			reportFavoritesUsersByVideos(req, resp);
			shareReport(req, resp);

			req.setAttribute("adcontent", "/content/adminLayout/report.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void reportFavoritesByVideos(HttpServletRequest req, HttpServletResponse resp) {
		try {
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteReport> favlist = dao.reportFavoritesByVideos();
			req.setAttribute("favlist", favlist);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void reportFavoritesUsersByVideos(HttpServletRequest req, HttpServletResponse resp) {
		try {
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.findAll();
			String videoUserId = req.getParameter("videoUserId");
			if (videoUserId == null && vlist.size() > 0) {
				videoUserId = vlist.get(0).getVideoId();
			}
			FavoriteDao dao = new FavoriteDao();
			List<FavoriteUserReport> list = dao.reportFavoriteUsersByVideos(videoUserId);
			req.setAttribute("videoUserId", videoUserId);

			req.setAttribute("vidlist", vlist);
			req.setAttribute("favUserList", list);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void shareReport(HttpServletRequest req, HttpServletResponse resp) {
		try {
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.findAll();
			String videoShareId = req.getParameter("videoShareId");
			if (videoShareId == null && vlist.size() > 0) {
				videoShareId = vlist.get(0).getVideoId();
			}
			ShareDao dao = new ShareDao();
			List<ShareReport> list = dao.ShareReport(videoShareId);
			req.setAttribute("videoShareId", videoShareId);
			req.setAttribute("vid2list", vlist);
			req.setAttribute("shareList", list);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
