package br.com.digitala.banco;

// Generated 04/06/2015 11:21:49 by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Transaction;

/**
 * Home object for domain model class Empresa.
 * @see br.com.digitala.banco.Empresa
 * @author Hibernate Tools
 */
public class EmpresaHome extends PersistenciaHome {

	private static final Log log = LogFactory.getLog(EmpresaHome.class);

	public void persist(Empresa transientInstance) {
		log.debug("persisting Empresa instance");
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

	public void attachDirty(Empresa instance) {
		log.debug("attaching dirty Empresa instance");
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

	public void attachClean(Empresa instance) {
		log.debug("attaching clean Empresa instance");
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

	public void delete(Empresa persistentInstance) {
		log.debug("deleting Empresa instance");
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

	public Empresa merge(Empresa detachedInstance) {
		log.debug("merging Empresa instance");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Empresa result = (Empresa) getSessionFactory().getCurrentSession()
					.merge(detachedInstance);
			t.commit();
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Empresa findById(java.lang.Integer id) {
		log.debug("getting Empresa instance with id: " + id);
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			Empresa instance = (Empresa) getSessionFactory().getCurrentSession()
					.get("br.com.digitala.banco.Empresa", id);
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

	public List<Empresa> findByExample(Empresa instance) {
		log.debug("finding Empresa instance by example");
		try {
			Transaction t = getSessionFactory().getCurrentSession().beginTransaction();
			List<Empresa> results;
			
			if (instance != null && instance.getNome() != null) {
				results = (List<Empresa>) getSessionFactory()
						.getCurrentSession()
						.createCriteria("br.com.digitala.banco.Empresa")
						.add(create(instance)).list();
			} else {
				results = (List<Empresa>) getSessionFactory()
						.getCurrentSession()
						.createCriteria("br.com.digitala.banco.Empresa").list();	
			}
			log.debug("find by example successful, result size: "
					+ results.size());
			t.commit();
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
