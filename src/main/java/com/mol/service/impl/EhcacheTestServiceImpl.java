package com.mol.service.impl;

import com.mol.service.EhcacheTestService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * Created by usher on 2017/9/4.
 */
@Service
public class EhcacheTestServiceImpl implements EhcacheTestService{
    @Cacheable(value = "myCache", key = "#param")
    public long getTimestamp(String param){
        long currentTimestamp = System.currentTimeMillis();
        return currentTimestamp;
    }
}
