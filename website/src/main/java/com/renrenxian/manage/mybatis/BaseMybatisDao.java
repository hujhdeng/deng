package com.renrenxian.manage.mybatis;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.renrenxian.common.util.Page;


public abstract class BaseMybatisDao<E,PK extends Serializable> extends MyBatisDao  implements EntityDao<E,PK> {
   
	private static Logger logger = LoggerFactory.getLogger(BaseMybatisDao.class);
	
    public E getById(PK primaryKey) {
        return (E)getSqlSession().selectOne(getFindByPrimaryKeyStatement(), primaryKey);
    }
    
	public void deleteById(PK id) {
		int affectCount = getSqlSession().delete(getDeleteStatement(), id);
	}
	
    public void save(E entity) {
		prepareObjectForSaveOrUpdate(entity);
		int affectCount = getSqlSession().insert(getInsertStatement(), entity);    	
    }
    
	public void update(E entity) {
		prepareObjectForSaveOrUpdate(entity);
		int affectCount = getSqlSession().update(getUpdateStatement(), entity);
	}
	
	
	/**
	 * 用于子类覆盖,在insert,update之前调用
	 * @param o
	 */
    protected void prepareObjectForSaveOrUpdate(E o) {
    			logger.info("prepareObjectForSaveOrUpdate...");
    			// System.out.println("kw...");
    }

    /*public String getMybatisMapperNamesapce() {
        throw new RuntimeException("not yet implement");
    }*/
    
    public abstract String getMybatisMapperNamesapce();
    
    public String getFindByPrimaryKeyStatement() {
        return getMybatisMapperNamesapce()+".getById";
    }

    public String getInsertStatement() {
        return getMybatisMapperNamesapce()+".insert";
    }

    public String getUpdateStatement() {
    		return getMybatisMapperNamesapce()+".updateById";
    }

    public String getDeleteStatement() {
    		return getMybatisMapperNamesapce()+".deleteById";
    }
    
    public String getFindStatement() {
    		return getMybatisMapperNamesapce()+".findAll";
    }
    
    public String getFindPageStatement() {
    		return getMybatisMapperNamesapce()+".findPage";
    }
    
    
	public List<E> findAll() {
		// throw new UnsupportedOperationException();
		String statementName = getFindStatement();
		return getSqlSession().selectList(statementName);
	}

	
	public boolean isUnique(E entity, String uniquePropertyNames) {
		throw new UnsupportedOperationException();
	}
	
	
	// ArrayList 有序的
	public List<E> find(List<WhereWrapper> whereList, List<SortWrapper> sortList){
		String statementName = getFindStatement();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("whereList", whereList);
		map.put("sortList", sortList);
		return getSqlSession().selectList(statementName, toParameterMap(map));
	}
	
	
	public Page<E> findPage(Page<E> page, List<WhereWrapper> whereList, List<SortWrapper> sortList){
		
		String statementName = getFindPageStatement();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("whereList", whereList);
		map.put("sortList", sortList);
		String countStatementName = getFindPageStatement()+"Count";
		
		return selectPage(page, statementName,countStatementName,toParameterMap(map));
		
	}
	
	
	public void flush() {
		//ignore
	}
	
}
