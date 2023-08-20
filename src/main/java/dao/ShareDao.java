package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import domain.ShareReport;
import model.Share;

public class ShareDao extends AbstractEntityDao<Share> {

	public ShareDao() {
		super(Share.class);

	}

	public List<ShareReport> ShareReport(String videoId) {
		String jpql = "SELECT new domain.ShareReport(s.user.fullname,s.user.email,"
				+ "s.email,s.sharedDate) from Share s where s.video.videoId =:videoId";
		EntityManager em = JpaUtils.getEntityManager();
		List<ShareReport> list = null;
		try {
			TypedQuery<ShareReport> query = em.createQuery(jpql, ShareReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}
}
