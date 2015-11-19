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
 * Home object for domain model class ItemsPedido.
 * @see br.com.digitala.banco.ItemsPedido
 * @author Hibernate Tools
 */
public class ItemsPedidoHome {

	private static final Log log = LogFactory.getLog(ItemsPedidoHome.class);

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

	public void persist(ItemsPedido transientInstance) {
		log.debug("persisting ItemsPedido instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(ItemsPedido instance) {
		log.debug("attaching dirty ItemsPedido instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ItemsPedido instance) {
		log.debug("attaching clean ItemsPedido instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(ItemsPedido persistentInstance) {
		log.debug("deleting ItemsPedido instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ItemsPedido merge(ItemsPedido detachedInstance) {
		log.debug("merging ItemsPedido instance");
		try {
			ItemsPedido result = (ItemsPedido) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public ItemsPedido findById(br.com.digitala.banco.ItemsPedidoId id) {
		log.debug("getting ItemsPedido instance with id: " + id);
		try {
			ItemsPedido instance = (ItemsPedido) sessionFactory
					.getCurrentSession().get(
							"br.com.digitala.banco.ItemsPedido", id);
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

	public List<ItemsPedido> findByExample(ItemsPedido instance) {
		log.debug("finding ItemsPedido instance by example");
		try {
			List<ItemsPedido> results = (List<ItemsPedido>) sessionFactory
					.getCurrentSession()
					.createCriteria("br.com.digitala.banco.ItemsPedido")
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
