package userServlet;

import java.io.IOException;
import java.util.List;

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

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet({ "/Favorite", "/fvPage" })
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = SessionUtils.getLoginedUsername(req);
		System.out.println(user);
		if (user == null) {
			resp.sendRedirect("/SOF3011_ASM/Login");
		} else {
			UserDao dao = new UserDao();
			FavoriteDao d2 = new FavoriteDao();
			User u = dao.findById(user);
			List<Favorite> list = u.getFavorites();

			String check = null;
			int location = 0;
			check = req.getParameter("location");
			if (check != null) {
				location = Integer.parseInt(req.getParameter("location")) - 1;
			} else {
				location = 0;
			}
			int listSize = list.size();
			int page = listSize / 6;
			if (listSize % 6 != 0) {
				page++;
			}

			req.setAttribute("end", page);
			System.out.println("current location is page: " + location);
			req.setAttribute("videos", d2.Paging(location, 6, user));
			req.setAttribute("content", "/content/customerLayout/favorite.jsp");
			req.getRequestDispatcher("/content/customerLayout/cusLayout.jsp").forward(req, resp);

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
