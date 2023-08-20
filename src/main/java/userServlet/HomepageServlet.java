package userServlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class HomepageServlet
 */
@WebServlet({ "/Homepage", "/Page" })
public class HomepageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("content", "/content/index.jsp");
		VideoDao dao = new VideoDao();
		String check = null;
		int location = 0;
		check = req.getParameter("location");
		if (check != null) {
			location = Integer.parseInt(req.getParameter("location")) - 1;
		} else {
			location = 0;
		}

		VideoDao udao = new VideoDao();
		List<Video> total = udao.findAll();
		int listSize = total.size();
		int page = listSize / 6;
		if (listSize % 6 != 0) {
			page++;
		}

//			List<Video> list = dao.findAll();
		req.setAttribute("end", page);
		List<Video> list = dao.Pagination(location, 6);
		System.out.println("current location is page: " + location);
		req.setAttribute("videos", list);
		req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
