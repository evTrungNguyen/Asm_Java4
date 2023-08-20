package userServlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JpaUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class VideoDetailServlet
 */
@WebServlet("/videoDetail")
public class VideoDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String videoid = req.getParameter("idVideo");
		VideoDao dao = new VideoDao();
		Video vd = new Video();
//		if (videoid != null) {
//
//		} else {
//			vd = dao.findById(req.getParameter("idVideo"));
//
//		}

		vd = dao.findById(videoid);
		req.setAttribute("poster", vd.getPoster());
		req.setAttribute("title", vd.getTitle());
		req.setAttribute("description", vd.getDescription());
		EntityManager em = JpaUtils.getEntityManager();
		Query query = em.createNamedQuery("detail.random4");
		List<Video> list = query.getResultList();
		req.setAttribute("videos", list);
		req.setAttribute("content", "/content/customerLayout/videoDetail.jsp");
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
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
