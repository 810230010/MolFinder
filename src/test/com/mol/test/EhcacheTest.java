package com.mol.test;

import com.mol.service.EhcacheTestService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by usher on 2017/9/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class EhcacheTest {
    @Autowired
    private EhcacheTestService ehcacheTestService;
    @Test
    public void ehcacheTest() throws Exception{
        System.out.println(ehcacheTestService.getTimestamp("param"));
        Thread.sleep(2000);
        System.out.println(ehcacheTestService.getTimestamp("param"));
    }
}
