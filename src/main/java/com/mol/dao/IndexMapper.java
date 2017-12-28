package com.mol.dao;

import java.util.Map;

/**
 * Created by usher on 2017/12/23.
 */
public interface IndexMapper {
    Map<String, Integer> getSaleAnalysis();
    int updateInvalidOrder();
}
