package com.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Violm;

/**
 * A data access object (DAO) providing persistence and search support for Violm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Violm
 * @author MyEclipse Persistence Tools
 */

public class ViolmDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ViolmDAO.class);
	// property constants
	public static final String VIOLKIND = "violkind";
	public static final String DRIVER = "driver";
	public static final String POINTS = "points";
	public static final String FINEJE = "fineje";
	public static final String VIOLLOCA = "violloca";
	public static final String VIOLDES = "violdes";

	protected void initDao() {
		// do nothing
	}

	public void save(Violm transientInstance) {
		log.debug("saving Violm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Violm persistentInstance) {
		log.debug("deleting Violm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Violm findById(java.lang.Long id) {
		log.debug("getting Violm instance with id: " + id);
		try {
			Violm instance = (Violm) getHibernateTemplate().get(
					"com.java.Violm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Violm instance) {
		log.debug("finding Violm instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Violm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Violm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByViolkind(Object violkind) {
		return findByProperty(VIOLKIND, violkind);
	}

	public List findByDriver(Object driver) {
		return findByProperty(DRIVER, driver);
	}

	public List findByPoints(Object points) {
		return findByProperty(POINTS, points);
	}

	public List findByFineje(Object fineje) {
		return findByProperty(FINEJE, fineje);
	}

	public List findByViolloca(Object violloca) {
		return findByProperty(VIOLLOCA, violloca);
	}

	public List findByVioldes(Object violdes) {
		return findByProperty(VIOLDES, violdes);
	}

	public List findAll() {
		log.debug("finding all Violm instances");
		try {
			String queryString = "from Violm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Violm merge(Violm detachedInstance) {
		log.debug("merging Violm instance");
		try {
			Violm result = (Violm) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Violm instance) {
		log.debug("attaching dirty Violm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Violm instance) {
		log.debug("attaching clean Violm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ViolmDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ViolmDAO) ctx.getBean("ViolmDAO");
	}
}