package br.com.digitala.banco;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class PersistenciaHome {

	private SessionFactory sessionFactory = null;
	
	protected SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				Configuration configuration = new Configuration();
		        configuration.configure("hibernate.cfg.xml");
		         
		        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
		        sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	
		        return sessionFactory;
			} catch (Exception e) {
				throw new IllegalStateException("Could not locate SessionFactory in JNDI");
			}
		} else {
			return sessionFactory;
		}
	}
	
}
