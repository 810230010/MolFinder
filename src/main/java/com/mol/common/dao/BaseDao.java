package com.mol.common.dao;

/**
 * Created by Administrator on 2017/7/6.
 */
public interface BaseDao<T, ID>{
    T selectByPrimaryKey(ID id);

    int deleteByPrimaryKey(ID id);

    int insert(T entity);

    int insertSelective(T entity);

    int updateByPrimaryKeySelective(T entity);

    int updateByPrimaryKey(T entity);

}
