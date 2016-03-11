package br.com.digitala.banco;

// Generated 04/06/2015 11:21:49 by Hibernate Tools 3.4.0.CR1

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

/**
 * Home object for domain model class Produto.
 * @see br.com.digitala.banco.Produto
 * @author Hibernate Tools
 */
public class ProdutoHome extends PersistenciaHome {

	private static final Log log = LogFactory.getLog(ProdutoHome.class);

	
	public void persist(Produto transientInstance) {
		log.debug("persisting Produto instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			getSessionFactory().getCurrentSession().persist(transientInstance);
			t.commit();
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Produto instance) {
		log.debug("attaching dirty Produto instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			getSessionFactory().getCurrentSession().saveOrUpdate(instance);
			t.commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Produto instance) {
		log.debug("attaching clean Produto instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			getSessionFactory().getCurrentSession().lock(instance, LockMode.NONE);
			t.commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Produto persistentInstance) {
		log.debug("deleting Produto instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			getSessionFactory().getCurrentSession().delete(persistentInstance);
			t.commit();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Produto merge(Produto detachedInstance) {
		log.debug("merging Produto instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Produto result = (Produto) getSessionFactory().getCurrentSession()
					.merge(detachedInstance);
			t.commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Produto findById(java.lang.Integer id) {
		log.debug("getting Produto instance with id: " + id);
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Produto instance = (Produto) getSessionFactory().getCurrentSession()
					.get("br.com.digitala.banco.Produto", id);
			t.commit();
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Produto> findDestaques() {
		log.debug("finding Produto instance by example");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			List<Produto> results; 
			System.out.println("buscando lista com filtro");
			results = (List<Produto>) getSessionFactory()
				.getCurrentSession()
				.createCriteria("br.com.digitala.banco.Produto")
				.add(Restrictions.eq("destaque", "S")).list();
			t.commit();
			//log.debug("find by example successful, result size: " + results.size());
			System.out.println("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			re.printStackTrace();
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List<Produto> listAll() {
		log.debug("finding Produto instance by example");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			List<Produto> results; 
			System.out.println("buscando lista sem filtro");
			results = (List<Produto>) getSessionFactory()
					.getCurrentSession()
					.createCriteria("br.com.digitala.banco.Produto").list();
			t.commit();
			//log.debug("find by example successful, result size: " + results.size());
			System.out.println("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			re.printStackTrace();
			log.error("find by example failed", re);
			throw re;
		}
	}
}
