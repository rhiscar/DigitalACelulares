package br.com.digitala.banco;

// Generated 04/06/2015 11:21:49 by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class ValorProduto.
 * @see br.com.digitala.banco.ValorProduto
 * @author Hibernate Tools
 */
public class ValorProdutoHome {

	private static final Log log = LogFactory.getLog(ValorProdutoHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(ValorProduto transientInstance) {
		log.debug("persisting ValorProduto instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(ValorProduto instance) {
		log.debug("attaching dirty ValorProduto instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ValorProduto instance) {
		log.debug("attaching clean ValorProduto instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(ValorProduto persistentInstance) {
		log.debug("deleting ValorProduto instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ValorProduto merge(ValorProduto detachedInstance) {
		log.debug("merging ValorProduto instance");
		try {
			ValorProduto result = (ValorProduto) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ValorProduto findById(java.lang.Integer id) {
		log.debug("getting ValorProduto instance with id: " + id);
		try {
			ValorProduto instance = (ValorProduto) sessionFactory
					.getCurrentSession().get(
							"br.com.digitala.banco.ValorProduto", id);
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

	public List<ValorProduto> findByExample(ValorProduto instance) {
		log.debug("finding ValorProduto instance by example");
		try {
			List<ValorProduto> results = (List<ValorProduto>) sessionFactory
					.getCurrentSession()
					.createCriteria("br.com.digitala.banco.ValorProduto")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
