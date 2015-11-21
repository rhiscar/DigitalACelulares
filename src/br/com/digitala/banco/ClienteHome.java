package br.com.digitala.banco;

// Generated 04/06/2015 11:21:49 by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Transaction;

/**
 * Home object for domain model class Cliente.
 * @see br.com.digitala.banco.Cliente
 * @author Hibernate Tools
 */
public class ClienteHome extends PersistenciaHome{

	private static final Log log = LogFactory.getLog(ClienteHome.class);

		public void persist(Cliente transientInstance) {
		log.debug("persisting Cliente instance");
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

	public void attachDirty(Cliente instance) {
		log.debug("attaching dirty Cliente instance");
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

	public void attachClean(Cliente instance) {
		log.debug("attaching clean Cliente instance");
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

	public void delete(Cliente persistentInstance) {
		log.debug("deleting Cliente instance");
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

	public Cliente merge(Cliente detachedInstance) {
		log.debug("merging Cliente instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Cliente result = (Cliente) getSessionFactory().getCurrentSession().merge(detachedInstance);
			t.commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Cliente findById(java.lang.Integer id) {
		log.debug("getting Cliente instance with id: " + id);
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Cliente instance = (Cliente) getSessionFactory().getCurrentSession()
					.get("br.com.digitala.banco.Cliente", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			t.commit();
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Cliente> findByExample(Cliente instance) {
		log.debug("finding Cliente instance by example");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			List<Cliente> results;
			if (instance != null && instance.getNome() != null) {
				results = (List<Cliente>) getSessionFactory().getCurrentSession().createCriteria("br.com.digitala.banco.Cliente").add(create(instance)).list();
			} else {
				results = (List<Cliente>) getSessionFactory().getCurrentSession().createCriteria("br.com.digitala.banco.Cliente").list();
			}
			t.commit();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
