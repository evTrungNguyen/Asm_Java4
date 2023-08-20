package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import domain.FavoriteReport;
import domain.FavoriteUserReport;
import model.Favorite;

public class FavoriteDao extends AbstractEntityDao<Favorite> {

	public FavoriteDao() {
		super(Favorite.class);

	}

	public boolean checkIfVideoLikeYet(String UserId, String VideoId) {
		boolean check;
		String jpql = "Select count(f.favoriteId) from Favorite f where f.user.username =:UserId and f.video.videoId =:VideoId";
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter("UserId", UserId);
		query.setParameter("VideoId", VideoId);
		Long numLong = query.getSingleResult();
		String num = numLong.toString();
		if (num.matches("1")) {
			check = true;
			return check;
		} else {
			check = false;
			return check;
		}

	}

	public int Unlike(String UserId, String VideoId) {
		String jpql = "Select f.favoriteId from Favorite f where f.user.username =:UserId and f.video.videoId =:VideoId";
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Integer> query = em.createQuery(jpql, Integer.class);
		query.setParameter("UserId", UserId);
		query.setParameter("VideoId", VideoId);
		Integer numInteger = query.getSingleResult();
		int num = numInteger;
		return num;

	}

	public List<FavoriteUserReport> reportFavoriteUsersByVideos(String videoId) {
		String jpql = "select new domain.FavoriteUserReport(f.user.username,f.user.fullname,"
				+ " f.user.email,f.likedDate) from Favorite f where f.video.videoId = :videoId";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteUserReport> list = null;
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}

	public List<FavoriteReport> reportFavoritesByVideos() {
		String jpql = "select new domain.FavoriteReport(f.video.title,count(f),min(f.likedDate),max(f.likedDate)) "
				+ " from Favorite f group by f.video.title ";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteReport> list = null;
		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}

	public List<Favorite> Paging(int page, int size, String id) {
		try {
			EntityManager em = JpaUtils.getEntityManager();
			TypedQuery<Favorite> q = em.createQuery("select f from Favorite f where f.user.username =:id",
					Favorite.class);
			q.setParameter("id", id);
			q.setFirstResult(page * size);
			q.setMaxResults(size);
			// Truy vấn
			List<Favorite> list = q.getResultList();
			return (List<Favorite>) list;
		} catch (Exception e) {
			return null;
		}
	}
}
