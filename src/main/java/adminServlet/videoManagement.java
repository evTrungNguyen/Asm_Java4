package adminServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.SessionUtils;
import common.UploadUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class videoManagement
 */
@WebServlet({ "/videoManagement", "/createVideo", "/totalVideo", "/editVideo", "/updateVideo", "/deleteVideo",
		"/resetVidManage" })
@MultipartConfig
public class videoManagement extends HttpServlet {
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
			VideoDao dao = new VideoDao();
			List<Video> v = dao.findAll();
			req.setAttribute("v", v);

			String uri = req.getRequestURI();
			if (uri.contains("editVideo")) {

				edit(req, resp);

			}
//				else if (uri.contains("update")) {
//				update(req, resp);
//
//			}

			req.setAttribute("adcontent", "/content/adminLayout/videoManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("create")) {
			create(req, resp);
			req.setAttribute("adcontent", "/content/adminLayout/videoManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}
		if (uri.contains("update")) {
			update(req, resp);
			VideoDao dao = new VideoDao();
			List<Video> v = dao.findAll();
			req.setAttribute("v", v);
			req.setAttribute("adcontent", "/content/adminLayout/videoManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}
		if (uri.contains("delete")) {
			delete(req, resp);
			VideoDao dao = new VideoDao();
			List<Video> v = dao.findAll();
			req.setAttribute("v", v);
			req.setAttribute("adcontent", "/content/adminLayout/videoManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}
		if (uri.contains("reset")) {
			reset(req, resp);
			VideoDao dao = new VideoDao();
			List<Video> v = dao.findAll();
			req.setAttribute("v", v);
			req.setAttribute("adcontent", "/content/adminLayout/videoManagement.jsp");
			req.getRequestDispatcher("/content/adminLayout/adLayout.jsp").forward(req, resp);
		}
	}

	private void reset(HttpServletRequest req, HttpServletResponse resp) {
		Video video = new Video();
		req.setAttribute("video", video);

	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("videoId");
		System.out.println(id);
		Video video = new Video();
		try {
			VideoDao dao = new VideoDao();
			dao.delete(id);
//			dao.deleteVidById(id);
			req.setAttribute("video", video);
			req.setAttribute("message", "deleted successfull");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
		}

	}

	private void update(HttpServletRequest req, HttpServletResponse resp) {
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			VideoDao dao = new VideoDao();
			Video oldVideo = dao.findById(video.getVideoId());
			if (req.getPart("cover").getSize() == 0) {
				video.setPoster(oldVideo.getPoster());
			} else {
				video.setPoster(UploadUtils.processUploadField("cover", req, "", video.getVideoId()));
			}

			dao.update(video);
			req.setAttribute("video", video);
			req.setAttribute("message", "updated successfull");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
		}

	}

	private void create(HttpServletRequest req, HttpServletResponse resp) {
		Video video = new Video();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			video.setPoster(UploadUtils.processUploadField("cover", req, "", video.getVideoId()));
			VideoDao dao = new VideoDao();
			dao.insert(video);
			req.setAttribute("message", "inserted successfull");
			req.setAttribute("video", video);

		} catch (Exception e) {
			req.setAttribute("error", "Error: " + e.getMessage());
		}

	}

	private void edit(HttpServletRequest req, HttpServletResponse resp) {
		Video video = new Video();
		VideoDao dao = new VideoDao();
		try {
			video = dao.findById(req.getParameter("idVideo"));
			req.setAttribute("video", video);

		} catch (Exception e) {
			req.setAttribute("error", "Error: " + e.getMessage());
		}

	}

}
