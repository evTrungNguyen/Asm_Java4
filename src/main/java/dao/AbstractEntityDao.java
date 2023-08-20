package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public abstract class AbstractEntityDao<T> {
	private EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}

	private Class<T> entityClass;

	public AbstractEntityDao(Class<T> cls) {
		this.entityClass = cls;
	}

	public void insert(T entity) {

		try {
			trans.begin();
			em.persist(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(T entity) {

		try {
			trans.begin();
			em.merge(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(Object id) {

		try {
			trans.begin();
			T entity = em.find(entityClass, id);
			em.remove(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public T findById(Object id) {

		T entity = em.find(entityClass, id);
		return entity;
	}

	public List<T> findAll() {

		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			return em.createQuery(cq).getResultList();
		} finally {
			em.close();
		}
	}

	public List<T> findAll(int firstResult, int maxResult) {

		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			Query q = em.createQuery(cq);

			q.setFirstResult(firstResult);
			q.setMaxResults(maxResult);

			return q.getResultList();
		} finally {
			em.close();
		}
	}

	public List<T> Pagination(int page, int size) {
		try {
//			TypedQuery<Users> query = em.createQuery("select u from Users u", Users.class);
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			Query q = em.createQuery(cq);
			q.setFirstResult(page * size);
			q.setMaxResults(size);
			// Truy vấn
			List<T> list = q.getResultList();
			return (ArrayList<T>) list;
		} catch (Exception e) {
			return null;
		}
	}

	public Long count() {

		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			Root<T> rt = cq.from(entityClass);
			cq.select(em.getCriteriaBuilder().count(rt));
			Query q = em.createQuery(cq);
			return (Long) q.getSingleResult();
		} finally {
			em.close();
		}

	}
}
