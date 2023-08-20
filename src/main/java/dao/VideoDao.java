package dao;

import javax.persistence.EntityManager;

import model.Video;

public class VideoDao extends AbstractEntityDao<Video> {
	EntityManager em = JpaUtils.getEntityManager();

	public VideoDao() {
		super(Video.class);

	}

	public Video deleteVidById(String id) {
		try {
			em.getTransaction().begin();
			Video v = em.find(Video.class, id);
			em.remove(v);
			em.getTransaction().commit();
			return v;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
	}

//	public List<Favorite> UserFavorite(String userId) {
//		User user = em.find(User.class, userId);
//		List<Favorite> list = user.getFavorites();
//		return list;
//	}

}
