package br.com.digitala.banco;

// Generated 04/06/2015 11:21:49 by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * Home object for domain model class Categoria.
 * @see br.com.digitala.banco.Categoria
 * @author Hibernate Tools
 */
public class CategoriaHome {

	private static final Log log = LogFactory.getLog(CategoriaHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			/*
			return (SessionFactory) new InitialContext().lookup("java:/comp/env/jdbc/digitala");
			
			System.out.println("Indo buscar a sessionfactory pro categoria home: criando tudo a partir do cfg do hibernate");
			
			Configuration configuration = new Configuration();
			Class.forName("com.mysql.jdbc.Driver");
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		    configuration.configure(new File("C:/trabalho/projetos java/DigitalACelulares/src/hibernate.cfg.xml"));
			
		    ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
		    
		    
			return (SessionFactory) configuration.buildSessionFactory(serviceRegistry);
			*/
			Configuration configuration = new Configuration();
	        configuration.configure("hibernate.cfg.xml");
	         
	        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
	        SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

	        return sessionFactory;
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Categoria transientInstance) {
		log.debug("persisting Categoria instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Categoria instance) {
		log.debug("attaching dirty Categoria instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Categoria instance) {
		log.debug("attaching clean Categoria instance");
		try {
			Session session=getSessionFactory().getCurrentSession();
		    Transaction trans=session.beginTransaction();

			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);

			trans.commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Categoria persistentInstance) {
		log.debug("deleting Categoria instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Categoria merge(Categoria detachedInstance) {
		log.debug("merging Categoria instance");
		try {
			Categoria result = (Categoria) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Categoria findById(java.lang.Integer id) {
		log.debug("getting Categoria instance with id: " + id);
		try {
			Categoria instance = (Categoria) sessionFactory.getCurrentSession()
					.get("br.com.digitala.banco.Categoria", id);
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

	public List<Categoria> findByExample(Categoria instance) {
		log.debug("finding Categoria instance by example" + instance);
		System.out.println("criterio de busca de categorias: " + instance);
		try {
			Transaction t = sessionFactory.getCurrentSession().beginTransaction();
			List<Categoria> results;
			if (instance != null && instance.getIdCategoria() != null && instance.getNome() != null && instance.getDescricao() != null) {
				results = (List<Categoria>) sessionFactory
					.getCurrentSession()
					.createCriteria("br.com.digitala.banco.Categoria")
					.add(create(instance)).list();
			} else {
				results = (List<Categoria>) sessionFactory
						.getCurrentSession()
						.createCriteria("br.com.digitala.banco.Categoria")
						.list();
			}
			log.debug("find by example successful, result size: " + results.size());
			t.commit();
			return results;
		} catch (RuntimeException re) {
			re.printStackTrace();
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public static void main(String[] args) {
		Connection conn = null;
		
		File f = new File("D:/Trabalho/projetos_java/DigitalACelulares/src/hibernate.cfg.xml");
		System.out.println(f);
		
		try {
//		    Properties connectionProps = new Properties();
//		    connectionProps.put("user", "digitala");
//		    connectionProps.put("password", "celulares");
//	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/digitala", connectionProps);
			System.setProperty(Context.INITIAL_CONTEXT_FACTORY, "org.apache.naming.java.javaURLContextFactory");
			
			Context initContext = new InitialContext();
			Context webContext = (Context)initContext.lookup("java:/comp/env");

			DataSource ds = (DataSource) webContext.lookup("jdbc/digitala");
			conn = ds.getConnection();

	        
	        
	        
	        
	        Statement st = conn.createStatement();
	        ResultSet rs = st.executeQuery("select * from categoria");
	        
	        while (rs.next()) {
	        	System.out.println("A:" + rs.getString("nome"));
	        }
	        
		    System.out.println("Connected to database");
		} catch (Exception exp) {
			exp.printStackTrace();
		}

	}
}
