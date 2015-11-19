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
 * Home object for domain model class OrdemServico.
 * @see br.com.digitala.banco.OrdemServico
 * @author Hibernate Tools
 */
public class OrdemServicoHome {

	private static final Log log = LogFactory.getLog(OrdemServicoHome.class);

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

	public void persist(OrdemServico transientInstance) {
		log.debug("persisting OrdemServico instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(OrdemServico instance) {
		log.debug("attaching dirty OrdemServico instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(OrdemServico instance) {
		log.debug("attaching clean OrdemServico instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(OrdemServico persistentInstance) {
		log.debug("deleting OrdemServico instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public OrdemServico merge(OrdemServico detachedInstance) {
		log.debug("merging OrdemServico instance");
		try {
			OrdemServico result = (OrdemServico) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public OrdemServico findById(java.lang.Integer id) {
		log.debug("getting OrdemServico instance with id: " + id);
		try {
			OrdemServico instance = (OrdemServico) sessionFactory
					.getCurrentSession().get(
							"br.com.digitala.banco.OrdemServico", id);
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

	public List<OrdemServico> findByExample(OrdemServico instance) {
		log.debug("finding OrdemServico instance by example");
		try {
			List<OrdemServico> results = (List<OrdemServico>) sessionFactory
					.getCurrentSession()
					.createCriteria("br.com.digitala.banco.OrdemServico")
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
